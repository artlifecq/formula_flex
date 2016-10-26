package com.game.engine2D
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.config.MapConfig;
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine2D.controller.CameraFrontController;
	import com.game.engine2D.core.AsyncMapTexture;
	import com.game.engine2D.scene.CameraOrthographicLens;
	import com.game.engine2D.scene.SceneCamera;
	import com.game.engine2D.scene.SceneCameraTarget;
	import com.game.engine2D.scene.SceneRender;
	import com.game.engine2D.scene.SceneSmallLayer;
	import com.game.engine2D.scene.layers.SceneInteractiveLayer;
	import com.game.engine2D.scene.layers.SceneRenderLayer;
	import com.game.engine2D.scene.layers.SceneZoneMapLayer;
	import com.game.engine2D.scene.map.vo.MapTile;
	import com.game.engine2D.scene.render.RenderSet;
	import com.game.engine2D.scene.render.RenderUnit;
	import com.game.engine2D.utils.MaterialUtils;
	import com.game.engine2D.utils.SceneUtil;
	import com.game.engine2D.vo.BaseObj;
	import com.game.engine2D.vo.PoolFrontMesh;
	import com.game.engine2D.vo.ShowContainer;
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.manager.GameScene3DManager;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.scene.render.vo.ISceneCameraTarget;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.containers.View3DAsset;
	import away3d.core.math.Plane3D;
	import away3d.events.Event;
	import away3d.filters.Filter3DBase;
	import away3d.lights.DirectionalLight;
	import away3d.lights.LightBase;
	
	import gs.TweenLite;
	
	import org.client.load.loader.multi.DobjLoadManager;
	import org.client.mainCore.ds.DHash;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	
	public class Scene extends ObjectContainer3D
	{
		private static const floor:Function = Math.floor;
		private static var _current:Scene;
		public static function get scene():Scene
		{
			return _current;
		}
		public var sceneConfig:SceneConfig;
		public var mapConfig:MapConfig;
		public var sceneCamera:SceneCamera;
		public var sceneRender:SceneRender;
		public var sceneSmallMapLayer:SceneSmallLayer;
		public var sceneZoneMapLayer:SceneZoneMapLayer;
		public var sceneInteractiveLayer:SceneInteractiveLayer;
		public var sceneRenderLayer:SceneRenderLayer;
		public var sceneStarlingLayer:starling.display.Sprite;
		public var sceneStageLayer:flash.display.Sprite;
		public var customLayer:starling.display.Sprite;
		
		private var _viewAsset:View3DAsset;
		private var _mainChar : ISceneCameraTarget;
		private var _view:View3D;
		private var _scene3d:GameScene3D;
		private var _scenePos:Point = new Point(int.MIN_VALUE, int.MIN_VALUE);
		private var _cameraTarget:SceneCameraTarget;/**虚拟目标，跟镜头绑定的，导致镜头移动的参照 */
		private var _cameraOffsetX:Number = 0;
		private var _cameraOffsetY:Number = 0;
		private var _direction:DirectionalLight;
		private var _filter3ds:Vector.<Filter3DBase> = new Vector.<Filter3DBase>();
		private var _cameraInit:Boolean = false;
		
		public function Scene($width:Number, $height:Number, name : String, view : View3D, viewDistance : int=1, areaMapLayer : int=0)
		{
			if(_current != null) {   
				throw new Error("单例!");   
			}
			_current = this;
			_view = view;
			var len2d : CameraOrthographicLens = new CameraOrthographicLens(1000);
			len2d.far = 3000;
			len2d.near = -500;
			_view.camera.lens = len2d;
			
			//场景引擎配置
			sceneConfig = new SceneConfig($width,$height);
			
			sceneSmallMapLayer = new SceneSmallLayer(this);
			addChild(sceneSmallMapLayer);
			
			sceneCamera = new SceneCamera(this,len2d);
			sceneRender = new SceneRender(this);
			
			sceneZoneMapLayer = new SceneZoneMapLayer(this);
			addChild(sceneZoneMapLayer);
			
			sceneInteractiveLayer = new SceneInteractiveLayer(this);
			
			sceneRenderLayer = new SceneRenderLayer(sceneCamera);
			addChild(sceneRenderLayer);
			
			customLayer = new starling.display.Sprite();
			sceneStageLayer = new flash.display.Sprite();
			sceneStarlingLayer = new starling.display.Sprite();
			
			//初始化GameScene3D			
			_scene3d = GameScene3DManager.createScene(name, _view, viewDistance, areaMapLayer);
			_scene3d.glow = true;
			_scene3d.phantom = true;
			_scene3d.heat = true;
			_scene3d.sceneMapLayer.mousePickerDisabled = false;
			_scene3d.shadowLevel = 2;
			_view.scene.addChild(this);
			_view.mouseEnabled = true;
			_view.mouseChildren = true;
			_view.filters3d = _filter3ds;
			
//			_cameraTarget = PoolContainer.create();
//			this.addChild(_cameraTarget);
//			Camera2DController.initcontroller(_view.camera,_cameraTarget);
			
			//添加starling stage最下层
			Starling.current.stage.addChildAt(sceneStarlingLayer, 0);
			Starling.current.stage.addChildAt(customLayer, 1);
			
			//添加2d stage最下层
			Starling.current.nativeStage.addChildAt(sceneStageLayer, 0);
			//调一下尺寸
			reSize(sceneConfig.width, sceneConfig.height);
		}
		
		public function get directionalLight():DirectionalLight
		{
			if (!_direction)
				initLight();
			return _direction;
		}
		
		public function localToGlobal(p:Point, result:Point = null):Point
		{
			result ||= new Point();
			result.x = p.x + _scenePos.x;
			result.y = p.y + _scenePos.y;
			return result;
		}
		
		public function globalToLocal(p:Point, result:Point = null):Point
		{
			result ||= new Point();
			result.x = p.x - _scenePos.x;
			result.y = p.y - _scenePos.y;
			return result;
		}
		
		public function get gameScene3d():GameScene3D
		{
			return _scene3d;
		}
		
		public function get view3d():View3D
		{
			return _view;
		}
		
		public function get cameraTarget() : SceneCameraTarget
		{
			if (_cameraTarget == null)
			{
				_cameraTarget = new SceneCameraTarget();
				_view.scene.addChild(_cameraTarget);
			}
			return _cameraTarget;
		}
		
		public function cameraRun():void
		{
			sceneCamera.run(GlobalConfig2D.cameraTween);
			cameraTarget.x = sceneCamera.posX + _cameraOffsetX;
			cameraTarget.y = sceneCamera.posY + _cameraOffsetY;
		}
		
		public function cameraOffset(offsetX:Number, offsetY:Number):void
		{
			offsetX = isNaN(offsetX) ? 0 : offsetX;
			offsetY = isNaN(offsetY) ? 0 : offsetY;
			
			_cameraOffsetX = offsetX;
			_cameraOffsetY = offsetY;
		}
		
		//角色**********************************************************************************************************
		/**
		 * 场景主角
		 */
		public function set mainChar(value:ISceneCameraTarget):void
		{
			//设置主角
			if(value)
			{
				_mainChar = value;
				
				if(_mainChar is SceneCharacter)
				{
					(_mainChar as SceneCharacter).canRemoved = false;
					(_mainChar as SceneCharacter).isMainChar = true;
					//强制主角渲染一遍
					(_mainChar as SceneCharacter).updateNow = true;
				}
				
				//摄像机锁定
				cameraLookAt(value);
				
				cameraTarget.x = _mainChar.pos.x;
				cameraTarget.y = _mainChar.pos.y;
			}
		}

		override public function get x():Number{return _scenePos.x;}
		override public function get y():Number{return _scenePos.y;}
		
		override public function set x(value:Number):void
		{
			value = value >> 0;
			if(_scenePos.x != value)
			{
				customLayer.x = sceneStageLayer.x = value;
				_scenePos.x = value;
				sceneSmallMapLayer.drawSmallMapTranslate();
			}
		}
		
		override public function set y(value:Number):void
		{
			value = value >> 0;
			if(_scenePos.y != int(value))
			{
				customLayer.y = sceneStageLayer.y = value;
				_scenePos.y = value;
				sceneSmallMapLayer.drawSmallMapTranslate();
			}
		}
		
		public function addFilter3ds(value:Filter3DBase):void
		{
			if (_filter3ds.indexOf(value) == -1)
			{
				_filter3ds.push(value);
				_view.filters3d = _filter3ds;
			}
		}
		
		public function removeFilter3ds(value:Filter3DBase):void
		{
			var index:int = _filter3ds.indexOf(value);
			if (index != -1)
			{
				_filter3ds.splice(index, 1);
			}
		}
		
		/**
		 * 重置大小
		 * @param $width
		 * @param $height
		 */
		public function reSize($width:Number, $height:Number):void
		{
			sceneConfig.width = $width*sceneCamera.scale;
			sceneConfig.height = $height*sceneCamera.scale;
			sceneSmallMapLayer.drawSmallMapScale();
			//更新摄像机范围
			sceneCamera.updateRangeXY();
			//立即更新摄像机位置
			updateCameraNow();
			//强制刷新地图
			if (sceneZoneMapLayer)
				sceneZoneMapLayer.strongLoadMap = true;
		}

		/**
		 * 执行切换场景
		 * @param $mapID
		 * @param $mapConfigData
		 * @param $zoneMapUrl
		 * @param $awdMapUrl
		 * @param $onComplete
		 * @param $on3DComplete
		 * @param $isDisposeMapConfig
		 * @param $onCompleteParams
		 * 
		 */
		public function switchScene(
			$mapID:int, 
			$mapConfigData:MapConfig,
			$zoneMapUrl:String,
			$awdMapUrl:String = null,
			$onComplete:Function=null,
			$on3DComplete:Function=null,
			$isDisposeMapConfig:Boolean=true,
			$onCompleteParams:Array=null):void
		{
			//禁用交互
			disableInteractiveHandle();
			//停止渲染
			sceneRender.stopRender();
			//释放
			destory($isDisposeMapConfig);
			
			$mapConfigData.mapID = $mapID;
			$mapConfigData.zoneMapUrl = $zoneMapUrl;
			newOnComplete($mapConfigData);
			
			//完成处理
			//-------------------------------------------------
			//地图配置加载完毕
			function newOnComplete($mapConfig:MapConfig):void
			{
				//更新配置
				mapConfig = $mapConfig;
				
				sceneSmallMapLayer.smallMaterial = MaterialUtils.default1x1Texture;
				
				if ($awdMapUrl)
				{
					_scene3d.switchScene($awdMapUrl, onScene3DComplete);
				}
				else
				{
					enableInteractiveHandle();
					//开始渲染
					sceneRender.startRender(false);//注意此处应该给false,否则地图加载优先级会以旧的角色坐标计算
					initLight();
					if($onComplete!=null)
					{
						$onComplete.apply(null,$onCompleteParams);
					}
				}
				
				function onScene3DComplete(gameScene3D:GameScene3D):void
				{
					init3DAwd();
					//开始渲染
					sceneRender.startRender(false);//注意此处应该给false,否则地图加载优先级会以旧的角色坐标计算
					
					//执行原来回调
					if($on3DComplete != null)
					{
						$on3DComplete(gameScene3D);
					}
					if($onComplete != null)
					{
						
						$onComplete.apply(null,$onCompleteParams);
					}
				}
			}
		}
		
		/** init 2.5D */
		private function init3DAwd():void
		{
			_viewAsset =  _scene3d.sceneMapLayer.view3DAsset;
			
			var lights : Vector.<LightBase> = _scene3d.sceneMapLayer.lights;
			for each (var light:LightBase in lights) 
			{
				if (light is DirectionalLight)
				{
					_direction = light as DirectionalLight;
					break;
				}
			}

			GlobalConfig.use25DMap = _viewAsset.cameraMode2D;
			if (_viewAsset.cameraMode2D)
			{
				disableInteractiveHandle();
				initLight();
//				initCamera();
				_view.camera.lens.near = -100000;
				_view.camera.lens.far = 100000;
				GlobalConfig.MAP_2D_CAMERA_ANGLE = 0;
				GlobalConfig2D.MapZoneClass = PoolFrontMesh;
				var angle:Number = (_viewAsset.cameraMode2DAngle*Math.PI)/180.0;
				var plane:Plane3D = new Plane3D(0,Math.cos(angle),-Math.sin(angle));
				_direction.planarShadowPlane = plane;
			}
		}
		
		private function initCamera():void
		{
			if (_cameraInit)return;
			_cameraInit = true;
			
			CameraFrontController.initcontroller(_view.camera, cameraTarget);
			CameraFrontController.LOCK_DISTANCE = 90000;
		}
		
		private function initLight():void
		{
			if (!_direction)
			{
				_direction = new DirectionalLight(-0.29,-0.85,0.44);
				_direction.castsShadows = false;
				_direction.castsPlanarShadows = true;
				_direction.planarShadowAlpha = 0.3;
				this.view3d.scene.addChild(_direction);
			}
		}
		
		public function drawSmallMap():void
		{
			var mapTexture:AsyncMapTexture = mapConfig.smallMapTexture;
			if (mapConfig && mapTexture){
				if (mapTexture.loadComplete){
					onLoaderComplete(null);
				}
				else{
					mapTexture.addEventListener(Event.COMPLETE, onLoaderComplete);
				}
			}
		}
		
		private function onLoaderComplete(e:Event):void
		{
			var mapTexture:AsyncMapTexture = mapConfig.smallMapTexture;
			if (e)
				mapTexture.removeEventListener(Event.COMPLETE, onLoaderComplete);
			sceneSmallMapLayer.smallMapTexture = mapTexture;
		}
		
		
		//***********************************************通过RenderUnit查找角色***********************************************************
		public function getSceneObjByAp(ap:RenderUnit):BaseObj
		{
			var len:int = sceneRenderLayer.baseObjList.length;
			var bo:BaseObj;
			var list:Array = [];
			while(len-->0)
			{
				bo = sceneRenderLayer.baseObjList[len];
				if(bo)
				{
					if(bo is SceneCharacter)
					{
						if((bo as SceneCharacter).avatar.hasRenderUnit(ap))
						{
							return bo;
						}
					}
					else if(bo is RenderSet)
					{
						if((bo as RenderSet).hasRenderUnit(ap))
						{
							return bo;
						}
					}
					else if(bo is RenderUnit)
					{
						if(bo == ap)
						{
							return bo;
						}
					}
				}
			}
			return null;
		}
		
		//***********************************************创建|添加\移除\查找角色***********************************************************
		private var _sceneObjMap:DHash = new DHash();
		private var _sceneCharacterList:Vector.<SceneCharacter> = new Vector.<SceneCharacter>;
		private var _renderUnitList:Vector.<RenderUnit> = new Vector.<RenderUnit>;
		/**
		 * @private
		 * 场景所有角色集合
		 */
		public function get sceneCharacterList():Vector.<SceneCharacter>
		{
			return _sceneCharacterList;
		}
		
		public function get renderUnitList():Vector.<RenderUnit>
		{
			return _renderUnitList;
		}
		
		/**
		 * @private
		 * 场景所有角色集合
		 */
		public function get sceneObjList():Vector.<BaseObj>
		{
			return sceneRenderLayer.baseObjList;
		}

		/**
		 * 向场景中添加角色
		 * @param $sc
		 */
		public function addSceneObj($bo:BaseObj,$parent:ObjectContainer3D=null):void
		{
			sceneRenderLayer.addBaseObj($bo,$parent);
			////////////////////////////////////////////
			var index:int;
			if ($bo is SceneCharacter)
			{
				index = _sceneCharacterList.indexOf($bo as SceneCharacter);
				if (index == -1)//别重复添加...日...会死人的...
				{
					_sceneCharacterList.push($bo as SceneCharacter);
				}
			}
			////////////////////////////////////////////
			if ($bo is RenderUnit)
			{
				index = _renderUnitList.indexOf($bo as RenderUnit);
				if (index == -1)//别重复添加...日...会死人的...
				{
					_renderUnitList.push($bo as RenderUnit);
				}
			}
			//需要添加的对象和key的对应关系唯一
			_sceneObjMap.addForValue($bo,$bo.id + "_" + $bo.type);
		}
		
		/**
		 * 从场景中移除角色
		 * @param $sc
		 * @param $recycle 是否池回收
		 */
		public function removeSceneObj($bo:BaseObj, $recycle:Boolean=true):void
		{
			sceneRenderLayer.removeBaseObj($bo, $recycle);
			////////////////////////////////////////////
			var index:int = _sceneCharacterList.indexOf($bo as SceneCharacter);
			if (index != -1 && $bo.canRemoved)
			{
				_sceneCharacterList.splice(index,1);
			}
			////////////////////////////////////////////
			index = _renderUnitList.indexOf($bo as RenderUnit);
			if (index != -1 && $bo.canRemoved)
			{
				_renderUnitList.splice(index,1);
			}
			
			//
			if ($bo && $bo.canRemoved)
			{
				_sceneObjMap.removeForValue($bo);
			}
		}
		
		/**
		 * 从场景中移除所有可以移除的角色
		 * @param $sc
		 * @param $recycle 是否池回收
		 */
		public function removeAllSceneObj($recycle:Boolean=true):void
		{
			var list:Vector.<BaseObj> = sceneObjList;
			var len:int = list.length;
			while(len-->0)
			{
				if(list.length > len)
				{
					removeSceneObj(list[len],$recycle);
				}
			}
		}
		
		/**
		 * 从场景中移除所有角色
		 * @param $sc
		 * @param $recycle 是否池回收
		 */
		public function removeSceneObjByType($type:String,$recycle:Boolean=true):void
		{
			var list:Array = sceneRenderLayer.getBaseObjByType($type);
			var len:int = list.length;
			while (len-- > 0)
			{
				removeSceneObj(list[len]);
			}
		}
		
		/**
		 * 从场景中移除角色(通过ID和类型)
		 * @param $id
		 * @param $type
		 * @param $recycle 是否池回收
		 */
		public function removeSceneObjByID($id:Number, $type:String, $recycle:Boolean=true):void
		{
			sceneRenderLayer.removeBaseObjByID($id, $type, $recycle);
			//
			var $bo:BaseObj = _sceneObjMap.getValue($id + "_" +$type);
			if ($bo is SceneCharacter)
			{
				var index:int = _sceneCharacterList.indexOf($bo as SceneCharacter);
				if (index != -1)
				{
					_sceneCharacterList.splice(index,1);
				}
			}
			//
			_sceneObjMap.removeForKey($id + "_" +$type);
		}
		/**
		 * 从场景中查找角色
		 * @parm $id 角色ID
		 * @parm $type 角色类型
		 */
		public function getSceneObjByID($id:Number, $type:String):BaseObj
		{
			var bo:BaseObj = _sceneObjMap.getValue($id + "_" +$type);
			if (bo && bo.usable)//不可用的,还它要的引用干毛?
			{
				return bo;
			}
			else//不可用的,干掉,干掉,干掉!!!
			{
				_sceneObjMap.removeForKey($id + "_" +$type);
			}
			return null;
		}
		/**
		 * 从场景中查找角色
		 * @parm $type 角色类型
		 */
		public function getSceneObjsByType($type:String):Array
		{
			return sceneRenderLayer.getBaseObjByType($type);
		}
		
		//释放**********************************************************************************************************
		/**
		 * @private
		 * 释放
		 * 此函数发生在切换场景时
		 * 规则：
		 * 		1.暂停并移除所有的小地图和切片地图加载
		 * 		2.释放所有地图数据
		 * 		3.移除所有角色，但不包括主角 和 鼠标点击效果虚拟角色（同时会将相应未加载完毕的换装取消加载，将加载完毕的换装添加进延时卸载缓存中）
		 */	
		public function destory($isDisposeMapConfig:Boolean=true):void
		{
			//小地图
			//------------------------------------
			//停止上一个场景小地图的加载11111111111111(如果其他地方也在使用此地址则也会同时停止掉)
			if(mapConfig!=null && mapConfig.smallMapUrl!=null && mapConfig.smallMapUrl!="")
			{
				DobjLoadManager.cancelLoadByUrl(mapConfig.smallMapUrl);
			}
			if(mapConfig)
			{
				if(mapConfig.smallMapTexture)
				{
					mapConfig.smallMapTexture.dispose();
					mapConfig.smallMapTexture = null;
				}
				if($isDisposeMapConfig)
				{
					mapConfig.dispose();
				}
			}
			//释放小地图
			//sceneSmallMapTexture.disposeTexture();
			//------------------------------------
			//地图切片
			//------------------------------------
			if (sceneZoneMapLayer)sceneZoneMapLayer.dispose();
			//------------------------------------
			//换装
			//------------------------------------
			var list:Array = _sceneObjMap.getValues();
			for(var i:int=list.length;i>0;i--)
			{
				var bObj:BaseObj = list[i];
				removeSceneObj(bObj);
			}
			sceneRenderLayer.dispose();
			TweenLite.killTweensOf(_current);
			
			/*if (_cameraTarget)
			{
				if (_cameraTarget.parent)
					_cameraTarget.parent.removeChild(_cameraTarget);
				_cameraTarget.dispose();
				_cameraTarget = null;
			}*/
		}
		
		/**
		 * 开始场景鼠标和键盘监听 
		 * 
		 */		
		public function enableInteractiveHandle():void 
		{
			sceneInteractiveLayer.enableInteractiveHandle();
		}
		
		/**
		 * 停止场景鼠标和键盘监听 
		 * 
		 */		
		public function disableInteractiveHandle():void 
		{
			sceneInteractiveLayer.disableInteractiveHandle();
		}
		
		/**
		 * 在换装上 通过精切的像素碰撞 获取 指定像素点下 的角色(可包含主角)
		 * @param $p 鼠标相对于scene的坐标位置 
		 * return
		 * 
		 */		
		public function getScFromAvatarUnderPointByPixel32($p:Point):SceneCharacter 
		{
			//注意顺序
			var list:Vector.<SceneCharacter> = sceneCharacterList;
			//注意顺序
			var len:int = sceneObjList.length;
			for(var i:int=len-1; i>=0; i--)
			{
				var sc:SceneCharacter = sceneObjList[i] as SceneCharacter;
				if(!sc) continue;
				if(!sc.visible) continue;
				if(!sc.mouseEnabled) continue;
				if(!sc.avatar.mouseEnabled) continue;
				
				//如果该角色鼠标感应区包含点击点，则将继续精确事件判断
				if(sc.containsPoint($p, false))
				{
					if(sc.avatar.hitPoint($p))
					{
						return sc;
					}
				}	
			}
			
			return null;
		}
		/**
		 * 在自定义容器上 通过精切的像素碰撞 获取 指定像素点下 的角色(可包含主角)
		 * @param $p 鼠标相对于scene的坐标位置 
		 * return 格式为：[通过点击自定义显示容器查找的SceneCharacter*]
		 * 
		 */		
		public function getScFromShowContainerUnderPoint($p:Point):SceneCharacter 
		{
			//得到逻辑格坐标
			var tileX:int = floor($p.x/SceneConfig.TILE_WIDTH);
			var tileY:int = floor($p.y/SceneConfig.TILE_HEIGHT);
			
			//如果位于地图之外，则直接返回
			var mapTile:MapTile = SceneUtil.getMapTile(tileX, tileY);
			//guoqing.wen 事件临时注释
			//if(mapTile==null) return null;
			
			//获取鼠标下的名字
			var stageXY:Point = this.sceneStarlingLayer.localToGlobal($p);
			var len:int = sceneObjList.length;
			for(var i:int=0; i<len; i++)
			{
				var sc:SceneCharacter = sceneObjList[i] as SceneCharacter;
				if(sc && sc.mouseEnabled)
				{
					var showContainer:ShowContainer = sc.showContainer;
					if(showContainer!=null && showContainer.containerMosEnabled)//这里没有做更详细的分析， 里面可以给每个自容器加一个鼠标可用标识
					{
						if(showContainer.hitTest(stageXY))
						{
							return sc;
						}
					}
				}
			}
			return null;
		}
		
		/**
		 * 摄像机锁定角色
		 */
		public function cameraLookAt($sc:ISceneCameraTarget):void
		{
			sceneCamera.lookAt($sc);
		}
		/**
		 * 立即更新摄像机位置（无缓动）
		 */
		public function updateCameraNow():void
		{
			sceneCamera.run(-1);
			if (sceneZoneMapLayer)sceneZoneMapLayer.strongLoadMap = true;
		}
		
		public function get mouseX():Number
		{
			var value:int = Stage3DLayerManager.stage.mouseX - _scenePos.x;
			return value;
		}

		public function get mouseY():Number
		{
			var value:int = Stage3DLayerManager.stage.mouseY - _scenePos.y;
			return value;
		}
	}
}