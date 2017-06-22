package com.game.engine2D
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.config.MapConfig;
	import com.game.engine2D.config.MapResInfo;
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
	import com.game.engine2D.scene.render.RenderSet;
	import com.game.engine2D.scene.render.RenderUnit;
	import com.game.engine2D.tools.SceneCache;
	import com.game.engine2D.vo.BaseObj;
	import com.game.engine2D.vo.ShowContainer;
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.manager.GameScene3DManager;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.scene.render.vo.ISceneCameraTarget;
	import com.game.engine3D.vo.BaseObj3D;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.containers.View3DAsset;
	import away3d.core.math.Plane3D;
	import away3d.core.pick.PickingCollisionVO;
	import away3d.events.Event;
	import away3d.filters.Filter3DBase;
	import away3d.filters.GlowFilter3D;
	import away3d.filters.HeatFilter3D;
	import away3d.filters.OutlineGlowFilter3D;
	import away3d.lights.DirectionalLight;
	import away3d.lights.LightBase;
	
	import gs.TweenLite;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	
	public class Scene extends ObjectContainer3D
	{
		/** 场景阴影灯1 */
		public static const SCENE_SHADOW_DIRECTIONAL_NAME : String = "SCENE_SHADOW_DIRECTIONAL_LIGHT";
		/** 场景阴影灯2 */
		public static const SCENE_SHADOW_MODEL_DIRECTIONAL_NAME : String = "SCENE_SHADOW_MODEL_DIRECTIONAL_LIGHT";
		/** 场景实体灯 */
		public static const SCENE_ENTITY_DIRECTIONAL_NAME : String = "SCENE_ENTITY_DIRECTIONAL_LIGHT";
		/** 场景实体LightPicker */
		public static const SCENE_ENTITY_LIGHT_PICKER_NAME : String = "SCENE_ENTITY_LIGHT_PICKER";
		
		public function get mapConfig():MapConfig
		{
			return _mapConfig;
		}
		
		public function set mapConfig(value:MapConfig):void
		{
			_mapConfig = value;
		}
		private static const floor:Function = Math.floor;
		private static var _current:Scene;
		public static function get scene():Scene
		{
			return _current;
		}
		public var sceneConfig:SceneConfig;
		private var _mapConfig:MapConfig;
		public var sceneCamera:SceneCamera;
		public var sceneRender:SceneRender;
		public var sceneSmallMapLayer:SceneSmallLayer;
		public var sceneZoneMapLayer:SceneZoneMapLayer;
		public var sceneInteractiveLayer:SceneInteractiveLayer;
		public var sceneRenderLayer:SceneRenderLayer;
		public var customLayer:starling.display.Sprite;
		public var sceneStarlingLayer:starling.display.Sprite;
		public var sceneStageLayer:flash.display.Sprite;
		public var sceneHeadLayer:starling.display.Sprite;
		public var sceneNameLayer:starling.display.Sprite;
		
		private var _viewAsset:View3DAsset;
		private var _mainChar : ISceneCameraTarget;
		private var _view:View3D;
		private var _screenView:View3D;
		private var _scene3d:GameScene3D;
		private var _scenePos:Point = new Point(int.MIN_VALUE, int.MIN_VALUE);
		
		private var _cameraTarget:ObjectContainer3D;/**虚拟目标，跟镜头绑定的，导致镜头移动的参照 */
		private var _cameraOffsetX:Number = 0;
		private var _cameraOffsetY:Number = 0;
		
		private var _direction:DirectionalLight;
		private var _directionModel:DirectionalLight;
		
		private var _planarShadowAlpha:Number = 0.3;
		private var _filter3ds:Vector.<Filter3DBase> = new Vector.<Filter3DBase>();
		private var _filter3dScreens:Vector.<Filter3DBase> = new Vector.<Filter3DBase>();
		/** 热扭曲滤镜  **/
		private var _heatFilter : HeatFilter3D;
		/** 发光滤镜  **/
		private var _glowFilter : GlowFilter3D;
		/** 外发光滤镜  **/
		private var _outlineGlowFilter : OutlineGlowFilter3D;
		private var _cameraInit:Boolean = false;
		private var _cameraOrthographicLens:CameraOrthographicLens;
		
		public function Scene($width:Number, $height:Number, name : String, view : View3D, viewDistance : int=1, areaMapLayer : int=0, view3dEvent:Boolean = true)
		{
			if(_current != null) {   
				throw new Error("单例!");   
			}
			_current = this;
			_view = view;
			_screenView = Stage3DLayerManager.screenView;
			_cameraOrthographicLens = new CameraOrthographicLens(1000);
			_cameraOrthographicLens.viewportScale = 1.15;
			
			//场景引擎配置
			sceneConfig = new SceneConfig($width,$height);
			
			sceneSmallMapLayer = new SceneSmallLayer(this);
			addChild(sceneSmallMapLayer);
			
			sceneCamera = new SceneCamera(this,_cameraOrthographicLens);
			sceneRender = new SceneRender(this);
			
			sceneZoneMapLayer = new SceneZoneMapLayer(this);
			addChild(sceneZoneMapLayer);
			
			sceneInteractiveLayer = new SceneInteractiveLayer(this);
			
			sceneRenderLayer = new SceneRenderLayer(sceneCamera);
			addChild(sceneRenderLayer);
			
			customLayer = new starling.display.Sprite();
			sceneStageLayer = new flash.display.Sprite();
			sceneStarlingLayer = new starling.display.Sprite();
			
			sceneHeadLayer = new starling.display.Sprite();
			sceneNameLayer = new starling.display.Sprite();
			sceneStarlingLayer.addChild(sceneHeadLayer);
			sceneStarlingLayer.addChild(sceneNameLayer);
			
			//初始化GameScene3D			
			_scene3d = GameScene3DManager.createScene(name, _view, viewDistance, areaMapLayer);
			_scene3d.glow = view3dEvent;
			_scene3d.phantom = view3dEvent;
			_scene3d.heat = view3dEvent;
			_scene3d.sceneMapLayer.mousePickerDisabled = !view3dEvent;
			_scene3d.shadowLevel = 2;
			_view.scene.addChild(this);
			_view.mouseEnabled = view3dEvent;
			_view.mouseChildren = view3dEvent;
			_view.filters3d = _filter3ds;
			_screenView.filters3d = _filter3dScreens;
			//初始化camera
			_view.camera.lens = _cameraOrthographicLens;
			
			//添加starling stage最下层
			Starling.current.stage.addChildAt(sceneStarlingLayer, 0);
			Starling.current.stage.addChildAt(customLayer, 1);
			
			//添加2d stage最下层
			Starling.current.nativeStage.addChildAt(sceneStageLayer, 0);
			//调一下尺寸
			reSize(sceneConfig.width, sceneConfig.height);
			
//			_heatFilter = new HeatFilter3D();
//			_glowFilter = new GlowFilter3D();
//			_outlineGlowFilter = new OutlineGlowFilter3D(4, 1);
//			resetViewFilters();
		}
		
		/**
		 *置灰场景 
		 * 
		 */
		public function addGrayScene():void
		{
			_view.colorFilter.adjustSaturation(-1);
		}
		
		public function removeGrayScene():void
		{
			_view.colorFilter.reset();
		}
		
		public function get directionalLight():DirectionalLight
		{
			if (!_direction)
				initLight();
			return _direction;
		}
		
		public function get directionalModelLight():DirectionalLight
		{
			if (!_directionModel)
				initLight();
			return _directionModel;
		}
		
		public function set planarShadowAlpha(value:Number):void
		{
			_planarShadowAlpha = value;
			if (_direction)
				_direction.planarShadowAlpha = value;
			if (_directionModel)
				_directionModel.planarShadowAlpha = value;
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
		
		final public function get gameScene3d():GameScene3D
		{
			return _scene3d;
		}
		
		final public function get view3d():View3D
		{
			return _view;
		}
		
		public function get cameraTarget() : ObjectContainer3D
		{
			if (_cameraTarget == null)
			{
				_cameraTarget = new ObjectContainer3D();
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
				_view.filters3d = _filter3ds;
			}
		}
		
		public function addScreenFilter3ds(value:Filter3DBase):void
		{
			if (_filter3dScreens.indexOf(value) == -1)
			{
				_filter3dScreens.push(value);
				_screenView.filters3d = _filter3dScreens;
			}
		}
		
		public function removeScreenFilter3ds(value:Filter3DBase):void
		{
			var index:int = _filter3dScreens.indexOf(value);
			if (index != -1)
			{
				_filter3dScreens.splice(index, 1);
				_screenView.filters3d = _filter3dScreens;
			}
		}
		
		private function resetViewFilters() : void
		{
			_filter3dScreens.length = 0;
			//glow必须放在之前
			_filter3dScreens.push(_glowFilter);
			
			_filter3dScreens.push(_heatFilter);
			if (_outlineGlowFilter)
				_filter3dScreens.push(_outlineGlowFilter);
			
			_screenView.filters3d = _filter3dScreens;
		}
		
		public function setUIOutlineGlowFilter(value : OutlineGlowFilter3D) : void
		{
			if (_outlineGlowFilter == value)
			{
				return;
			}
			if (_outlineGlowFilter)
			{
				_outlineGlowFilter.dispose();
			}
			_outlineGlowFilter = value;
			resetViewFilters();
		}
		
		/**
		 * 重置大小
		 * @param $width
		 * @param $height
		 */
		public function reSize($width:Number, $height:Number):void
		{
			if ($width <= 1 || $height <= 1)
				return;
			sceneConfig.width = $width*sceneCamera.scale;
			sceneConfig.height = $height*sceneCamera.scale;
			sceneSmallMapLayer.drawSmallMapScale();
			//更新摄像机范围
			sceneCamera.updateRangeXY();
			//立即更新摄像机位置
			updateCameraNow();
			//强制刷新地图
			if (sceneZoneMapLayer)
			{
				sceneZoneMapLayer.strongLoadMap = true;
			}
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
			$mapResInfo:MapResInfo,
			$zoneMapUrl:String,
			$awdMapUrl:String = null,
			$onComplete:Function=null,
			$on3DComplete:Function=null,
			$isDisposeMapConfig:Boolean=true,
			$onCompleteParams:Array=null):void
		{
//			MapTitleController.changeMap($mapResInfo);
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
					//开始缓存
					SceneCache.startCountShare();
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
			
			if (_direction && _direction.parent)
				_direction.parent.removeChild(_direction);
			if (_directionModel && _directionModel.parent)
				_directionModel.parent.removeChild(_directionModel);
			_direction = _scene3d.sceneMapLayer.getObj(SCENE_SHADOW_DIRECTIONAL_NAME) as DirectionalLight;
			_directionModel = _scene3d.sceneMapLayer.getObj(SCENE_SHADOW_MODEL_DIRECTIONAL_NAME) as DirectionalLight;
			
			if (!_direction)
			{
				var lights : Vector.<LightBase> = _scene3d.sceneMapLayer.lights;
				for each (var light:LightBase in lights) 
				{
					if (light is DirectionalLight && DirectionalLight(light).castsPlanarShadows)
					{
						_direction = light as DirectionalLight;
						break;
					}
				}
			}
			else
			{
				var direction:DirectionalLight = _scene3d.sceneMapLayer.getObj(SCENE_ENTITY_DIRECTIONAL_NAME) as DirectionalLight;
				if (direction)
					direction.castsPlanarShadows = false;
				if (_direction)
					_direction.castsPlanarShadows = true;
			}
			
			if (_directionModel == null)
			{
				_directionModel = _direction;
			}
			
			GlobalConfig.use2DMap = _viewAsset.cameraMode2D;
			if (_viewAsset.cameraMode2D)
			{
				disableInteractiveHandle();
				initLight();
				initCamera();
				var angle:Number = (_viewAsset.cameraMode2DAngle*Math.PI)/180.0;
				var plane:Plane3D = new Plane3D(0,Math.cos(angle),-Math.sin(angle));
				_direction.planarShadowPlane = plane;
				_direction.planarShadowAlpha = _planarShadowAlpha;
				_directionModel.planarShadowPlane = plane;
				_directionModel.planarShadowAlpha = _planarShadowAlpha;
			}
		}
		
		private function initCamera():void
		{
			_cameraOrthographicLens.near = -CameraFrontController.LOCK_NEAR_FAR;
			_cameraOrthographicLens.far = CameraFrontController.LOCK_NEAR_FAR;
			if (_cameraInit)return;
			_cameraInit = true;
			_cameraTarget = new SceneCameraTarget();
			this.addChild(_cameraTarget);
			CameraFrontController.initcontroller(_view.camera, _cameraTarget);
		}
		
		private function initLight():void
		{
			if (!_direction)
			{
				_direction = new DirectionalLight(-0.29,-0.85,0.44);
				_direction.castsShadows = false;
				_direction.castsPlanarShadows = true;
				_direction.planarShadowAlpha = 0.3;
				_direction.name = "you are shot!";
			}
			if (!_directionModel)
			{
				_directionModel = _direction;
			}
			_view.scene.addChild(_direction);
			_view.scene.addChild(_directionModel);
		}
		
		public function drawSmallMap():void
		{
			var mapTexture:AsyncMapTexture = mapConfig.smallMapTexture;
			if (mapConfig && mapTexture)
			{
				if (mapTexture.loadComplete)
				{
					onLoaderComplete(null);
				}
				else
				{
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
			var len:int = sceneRenderLayer.Debnug_call_GetBaseObjList().length;
			var bo:BaseObj;
			var list:Array = [];
			if (!ap)return null;
			while(len-->0)
			{
				bo = sceneRenderLayer.Debnug_call_GetBaseObjList()[len];
				if(bo)
				{
					if(bo is SceneCharacter)
					{
						if(ap.renderSet)
						{
							if((bo as SceneCharacter).hasBaseObj(ap.renderSet))
							{
								return bo;
							}
						}else
						{
							if((bo as SceneCharacter).avatar.hasRenderUnit(ap))
							{
								return bo;
							}
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
		//		private var _sceneObjMap:DHash = new DHash();
		private var _sceneObjTypeDic:Dictionary = new Dictionary();
		
		private var _isSceneCharListUpdate:Boolean = false;
		private var _sceneCharacterList:Vector.<SceneCharacter> = new Vector.<SceneCharacter>;
		
		private var _isRenderUntiListUpdate:Boolean = false;
		private var _renderUnitList:Vector.<RenderUnit> = new Vector.<RenderUnit>;
		/**
		 * @private
		 * 场景所有角色集合
		 */
		public function get sceneCharacterList():Vector.<SceneCharacter>
		{
			if(_isSceneCharListUpdate)
			{
				_isSceneCharListUpdate = false;
				_sceneCharacterList.length = 0;
				var vec:Vector.<BaseObj> = sceneRenderLayer.Debnug_call_GetBaseObjList();
				var len:int = vec.length;
				var bo:BaseObj;
				while(len-->0)
				{
					bo = vec[len];
					if(bo && bo is SceneCharacter)
					{
						_sceneCharacterList.push(bo); 
					}
				}
			}
			return _sceneCharacterList;
		}
		
		public function get renderUnitList():Vector.<RenderUnit>
		{
			if(_isRenderUntiListUpdate)
			{
				_isRenderUntiListUpdate = false;
				
				_renderUnitList.length = 0;
				var vec:Vector.<BaseObj> = sceneRenderLayer.Debnug_call_GetBaseObjList();
				var len:int = vec.length;
				var bo:BaseObj;
				while(len-->0)
				{
					bo = vec[len];
					if(bo && bo is RenderUnit)
					{
						_renderUnitList.push(bo); 
					}
				}
			}
			return _renderUnitList;
		}
		
		/**
		 * @private
		 * 场景所有角色集合
		 */
		public function get sceneObjList():Vector.<BaseObj>
		{
			return sceneRenderLayer.Debnug_call_GetBaseObjList();
		}
		
		private function getDicByType(type:String):Dictionary
		{
			var dic:Dictionary = _sceneObjTypeDic[type];
			if(dic == null)
			{
				dic = new Dictionary();
				_sceneObjTypeDic[type] = dic;
			}
			return dic;
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
				_isSceneCharListUpdate = true;
			}
			////////////////////////////////////////////
			if ($bo is RenderUnit)
			{
				_isRenderUntiListUpdate = true;
			}
			//需要添加的对象和key的对应关系唯一
			//			_sceneObjMap.addForValue($bo,$bo.id + "_" + $bo.type);
			addSceneObjDic($bo);
		}
		
		
		private function getSceneObjInDic(id:Number, type:String):BaseObj
		{
			var dic:Dictionary = getDicByType(type);
			return dic[id];
		}
		
		private function addSceneObjDic($bo:BaseObj):void
		{
			
			var dic:Dictionary = getDicByType($bo.type);
			dic[$bo.id] = $bo;
		}
		
		private function removeSceneObjDic(id:Number, type:String):void
		{
			
			var dic:Dictionary = getDicByType(type);
			delete dic[id];
		}
		
		/**
		 * 从场景中移除角色
		 * @param $sc
		 * @param $recycle 是否池回收
		 */
		public function removeSceneObj($bo:BaseObj, $recycle:Boolean=true):void
		{
			//先做个判断
			if(!$bo || !$bo.canRemoved)
			{
				return;
			}
			//
			var index:int = -1;
			if ($bo is SceneCharacter)
			{
				//				trace("-------------------name:"  + ($bo as SceneCharacter).name);
				_isSceneCharListUpdate = true;
			}
			if ($bo)
			{
				removeSceneObjDic($bo.id, $bo.type)
			}
			//
			if ($bo is RenderUnit)
			{
				_isRenderUntiListUpdate = true;
			}
			sceneRenderLayer.removeBaseObj($bo, $recycle);
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
//		public function removeSceneObjByType($type:String,$recycle:Boolean=true):void
//		{
//			var list:Array = sceneRenderLayer.getBaseObjByType($type);
//			var len:int = list.length;
//			while (len-- > 0)
//			{
//				removeSceneObj(list[len]);
//			}
//		}
		
		/**
		 * 从场景中移除角色(通过ID和类型)
		 * @param $id
		 * @param $type
		 * @param $recycle 是否池回收
		 */
		public function removeSceneObjByID($id:Number, $type:String, $recycle:Boolean=true):void
		{
			//			var $bo:BaseObj = _sceneObjMap.getValue($id + "_" +$type);
			var $bo:BaseObj = getSceneObjInDic($id ,$type);
			if ($bo is SceneCharacter)
			{
				_isSceneCharListUpdate = true;
			}
			//
			//			_sceneObjMap.removeForKey($id + "_" +$type);
			removeSceneObjDic($id,$type);
			sceneRenderLayer.removeBaseObjByID($id, $type, $recycle);
		}
		/**
		 * 从场景中查找角色
		 * @parm $id 角色ID
		 * @parm $type 角色类型
		 */
		public function getSceneObjByID($id:Number, $type:String):BaseObj
		{
			//			var bo:BaseObj = _sceneObjMap.getValue($id + "_" +$type);
			var bo:BaseObj = getSceneObjInDic($id ,$type);
			
			if (bo && bo.usable)//不可用的,还它要的引用干毛?
			{
				return bo;
			}
			else//不可用的,干掉,干掉,干掉!!!
			{
				//				_sceneObjMap.removeForKey($id + "_" +$type);
				removeSceneObjByID($id, $type);
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
		
		/**
		 * 释放
		 * 此函数发生在切换场景时
		 * 规则：
		 * 	1.暂停并移除所有的小地图和切片地图加载
		 * 	2.释放所有地图数据
		 * 	3.移除所有角色，但不包括主角 和 鼠标点击效果虚拟角色（同时会将相应未加载完毕的换装取消加载，将加载完毕的换装添加进延时卸载缓存中）
		 */	
		public function destory($isDisposeMapConfig:Boolean=true):void
		{
			if(mapConfig)
			{
				if($isDisposeMapConfig)
				{
					if(mapConfig.smallMapTexture)
					{
						mapConfig.smallMapTexture.dispose();
						mapConfig.smallMapTexture = null;
					}
					mapConfig.dispose();
				}
			}
			//释放小地图
			//sceneSmallMapTexture.disposeTexture();
			//地图切片
			if (sceneZoneMapLayer)
				sceneZoneMapLayer.dispose();
			//换装
			//			var list:Array = _sceneObjMap.getValues();
			//			for(var i:int=list.length - 1;i >= 0;i--)
			//			{
			//				var bObj:BaseObj = list[i];
			//				removeSceneObj(bObj);
			//			}
			
			for each (var type:int in _sceneObjTypeDic) 
			{
				var dic:Dictionary = _sceneObjTypeDic[type];
				dic = new Dictionary();
			}
			
			_sceneCharacterList.length = 0;
			_isSceneCharListUpdate = true;
			_renderUnitList.length = 0;
			if (sceneRenderLayer)
				sceneRenderLayer.dispose();
			if (_scene3d)
				_scene3d.clear();
//			if (_view)
//				_view.filters3d = _filter3ds;
//			if (_screenView)
//				_screenView.filters3d = _filter3dScreens;
			TweenLite.killTweensOf(_current);
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
		public function getScFromAvatarUnderPointByPixel32($p:Point, $pickVO:PickingCollisionVO):SceneCharacter 
		{
			//注意顺序
			var list:Vector.<SceneCharacter> = sceneCharacterList;
			//注意顺序
			var len:int = list.length;
			for(var i:int=len-1; i>=0; i--)
			{
				var sc:SceneCharacter = list[i] as SceneCharacter;
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
				else if ($pickVO && sc.hasRenderUintEntity($pickVO.entity))
				{
					return sc;
				}
			}
			
			return null;
		}
		
		public function getScFromAvatar3DUnderPoint($pickVO:PickingCollisionVO):SceneCharacter 
		{
			if($pickVO == null)return null;
			var entity:ObjectContainer3D = ObjectContainer3D($pickVO.entity);
			var baseObjList:Vector.<BaseObj3D> = _scene3d.sceneRenderLayer.baseObjList;
			var len:int = baseObjList.length;
			for(var i:int=len-1; i>=0; i--)
			{
				var sc:SceneCharacter3D = baseObjList[i] as SceneCharacter3D;
				if(!sc) continue;
				if(!sc.visible) continue;
				if(!sc.mouseEnabled) continue;
				if(sc.hasRenderUintEntity(entity))
					return sc.parentChar;
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
			
			//获取鼠标下的名字
			var stageXY:Point = this.sceneStarlingLayer.localToGlobal($p);
			var list:Vector.<BaseObj> = sceneObjList;
			var len:int = list.length;
			for(var i:int=0; i<len; i++)
			{
				var sc:SceneCharacter = list[i] as SceneCharacter;
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
		
		public function getAllScFromAvatarUnderPointByMouse($p:Point):Array 
		{
			var $pickVO:PickingCollisionVO = _view.mousePicker.getViewCollision($p.x,$p.y,_view);
			//注意顺序
			var list:Vector.<SceneCharacter> = sceneCharacterList;
			//注意顺序
			var len:int = list.length;
			var scArr:Array = new Array();
			
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
						scArr.push(sc);
					}
				}	
				else if ($pickVO && sc.hasRenderUintEntity($pickVO.entity))
				{
					scArr.push(sc);
				}
			}
			
			return scArr;
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
