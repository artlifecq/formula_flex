package com.game.engine2D
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.events.SceneEvent;
	import com.game.engine2D.events.SceneEventAction_char;
	import com.game.engine2D.scene.layers.SceneRenderLayer;
	import com.game.engine2D.scene.render.RenderSet;
	import com.game.engine2D.scene.render.RenderUnit;
	import com.game.engine2D.utils.SceneUtil;
	import com.game.engine2D.utils.Transformer;
	import com.game.engine2D.vo.BaseCharacter;
	import com.game.engine2D.vo.BaseObj;
	import com.game.engine2D.vo.HeadBindableContainer;
	import com.game.engine2D.vo.PoolContainer;
	import com.game.engine2D.vo.PoolMesh;
	import com.game.engine2D.vo.ShowContainer;
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.mainCore.libCore.utils.ZMath;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.PlanarContainer3D;
	import away3d.materials.TextureMaterial;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.client.mainCore.utils.DisplayUtil;
	
	import starling.display.Image;
	
	/**
	 * 场景角色
	 * @author Carver
	 */	
	public class SceneCharacter extends BaseCharacter
	{
		public function SceneCharacter(parameters : Array = null)
		{
			super(parameters);	
		}
		/**
		 * 用于绑定角色复杂数据的动态类 
		 */		
		private var _userData:Object;
		
		/**
		 * @private 
		 * 换装
		 */
		public function get avatar():RenderSet
		{
			return _renderSet;
		}
		
		public function get avatar3D():RenderSet3D
		{
			if (_avatar3D)
				return _avatar3D.avatar;
			return null;
		}
		
		public function get character3D():SceneCharacter3D
		{
			return _avatar3D;
		}
		
		/**
		 * 用于绑定角色复杂数据的动态类 
		 */		
		public function get userData():Object
		{
			return _userData;
		}
		
		public function get nativeContainer():Sprite
		{
			if (_nativeContainer == null){
				addNativeContainer();
			}
			return _nativeContainer;
		}
		
		public function get avatarShadow():PoolMesh
		{
			return _avatarShadow;
		}
		
		//=============================================自定义显示容器相关===================================================
		/**
		 * @private
		 * 自定义显示容器
		 */		
		protected var _showContainer:ShowContainer;
		/**
		 * 自定义显示容器
		 */		
		public function get showContainer():ShowContainer
		{
			return _showContainer;
		}
		
		public function get headBindableContainer():HeadBindableContainer
		{
			return _headBindableContainer;
		}
		
		/**
		 * showContainer是否启用鼠标
		 */	
		public var containerMosEnabled:Boolean = true;
		
		/**
		 * @private
		 * 是否启用容器
		 */
		private var _useContainer:Boolean;
		/*** 
		 * 获取是否启用容器
		 * */
		public function get useContainer():Boolean{return _useContainer;}
		/**
		 * 启用自定义容器
		 * @param $parentContainer 父容器
		 */
		public function enableContainer():void
		{
			_useContainer = true;
			if(_nativeContainer && _nativeContainer.parent == null)
			{
				Scene.scene.sceneStageLayer.addChild(_nativeContainer);
			}
			if(_showContainer==null)
			{
				_showContainer = ShowContainer.create();
			}
			if(_headBindableContainer && _headBindableContainer)
			{
				_headBindableContainer.addChild(_showContainer);
			}
		}
		/**
		 * 禁用自定义容器
		 * @parm $dispose 是否销毁数据
		 */
		public function disableContainer($disposeData:Boolean=true):void
		{
			_useContainer = false;
			if(_showContainer!=null)
			{
				ShowContainer.recycle(_showContainer);
				//Fun.clearChildren(_showContainer,false,false);//这个是否等待player自动GC会更好呢，有时间测试下,并且这种递归清除会造成如果子元素是POOL的子类可能会出问题111111111111111111111111111
				_showContainer = null;
			}
			if (_nativeContainer)
			{
				DisplayUtil.removeForParent(_nativeContainer);
				if($disposeData)
				{
					_nativeContainer.removeChildren();
					_nativeContainer = null;
					_nativeContainerOffset = null;
				}
			}
		}
		protected var _nativeContainerOffset:Point;//2d容器
		protected var _nativeContainer:Sprite;//2d容器
		protected var _headBindableContainer:HeadBindableContainer;//starling容器用来添加头顶HeadFace
		protected var _avatarContainer:PoolContainer;//avatar部件容器
		protected var _avatarShadow:PoolMesh;//阴影
		protected var _avatar3D:SceneCharacter3D;//3d模型
		/**
		 * 角色所在场景
		 */
		public var scene:Scene;
		private var _renderSet:RenderSet;
		private var _shadow:Image;
		/**
		 * 处于遮挡内
		 * 做了针对非Scene.scene.sceneAvatarLayer内的兼容处理
		 */	
		final public function get isInMask():Boolean{return _sceneAvatarLayer==Scene.scene.sceneRenderLayer && SceneUtil.isMask(tile_x, tile_y)};
		/**
		 * 处于障碍内
		 */	
		final public function get isInSolid():Boolean{return SceneUtil.isSolid(tile_x, tile_y);};
		/**
		 * 处于孤岛内
		 */	
		final public function get isInIsland():Boolean{return SceneUtil.isIsland(tile_x, tile_y);};
		
		protected var _sceneAvatarLayer:SceneRenderLayer;
		//***********************************************一些状态**********************************************************
		/**
		 * 角色状态
		 */	
		private var _status:uint = 0;
		
		override public function set layerType(value:uint):void
		{
			if (_layerType != value)
			{
				_layerType = value;
				avatar.layerType = value;
			}
		}
		
		//*******************************************IDisplayable接口基本参数*******************************************	
		/*** 显示偏移量x */	
		final override public function set offsetX(value:Number):void
		{
			value >>= 0;
			super.offsetX = value;
			_renderSet.offsetX = value;
			if(_showContainer)
				_showContainer.x = value;
			if(_nativeContainer)
				_nativeContainer.x = _nativeContainerOffset.x + value;
		}
		
		/*** 显示偏移量y */	
		final override public function set offsetY(value:Number):void
		{
			value >>= 0;
			super.offsetY = value;
			_renderSet.offsetY = value;
			if(_showContainer)
				_showContainer.y = value;
			if(_nativeContainer)
				_nativeContainer.y = _nativeContainerOffset.y + value;
		}
		
		public function containsPoint($point:Point, b:Boolean) : Boolean
		{
			if(!mouseEnabled)return false;
			if(!visible)return false;
			$point = $point.clone();
			$point.setTo($point.x - _x, $point.y - _y);
			return avatar.hitRectPoint($point);
		}
		
		override public function set visible(value:Boolean):void
		{
			if(_visible != value)//值不同再去给换装赋值变化,节省性能
			{
				super.visible = value;
				this.avatar.visible = value;
				if(_nativeContainer)_nativeContainer.visible = value;
				if(_headBindableContainer)_headBindableContainer.headVisible = value;
				if(_avatar3D)_avatar3D.visible = value;
				if(_showContainer)
				{
					if(value)
					{
						if(!_showContainer.parent && _headBindableContainer && _useContainer)
						{
							_headBindableContainer.addChild(_showContainer);
						}
					}
					else
					{
						if (_showContainer.parent)_showContainer.parent.removeChild(_showContainer);
					}
				}
			}
		}
		
		override public function set alpha(value:Number):void
		{
			if(alpha == value || value < 0 || value > 1.0)return;
			super.alpha = value;
			if (_renderSet)_renderSet.alpha = value;
			if (_baseObjList)
			{
				var i:int = _baseObjList.length;
				while(i-- > 0)
				{
					_baseObjList[i].alpha = value;
				}
			}
			if (_avatarShadow)_avatarShadow.alpha = value;
			if (_nativeContainer)_nativeContainer.alpha = value;
			if (_avatar3D)_avatar3D.alpha = value;
			if (_headBindableContainer)
				_headBindableContainer.alpha = value;
		}
		
		override public function set colorTransform(value:ColorTransform):void
		{
			if (colorTransform == value)return;
			super.colorTransform = value;
			if (_renderSet)_renderSet.colorTransform = value;
			if (_baseObjList)
			{
				var i:int = _baseObjList.length;
				while(i-- > 0)
				{
					_baseObjList[i].colorTransform = value;
				}
			}
		}
		
		final override public function set x(value:Number):void
		{
			if(_x != value)
			{
				super.x = value;
				this.finalShowX = value;
				_renderSet.finalShowX = value;
				value = value >> 0;
				if(_graphicDis)_graphicDis.x = value;
				if(_nativeContainer){
					_nativeContainer.x = value;
					_nativeContainerOffset.x = _offsetX + value;
				}
			}
		}
		
		override public function set y(value:Number):void
		{
			if(_y != value)
			{
				super.y = value;
				this.finalShowY = value;
				_renderSet.finalShowY = value;
				value = value >> 0;
				if(_graphicDis)_graphicDis.y = value;
				if(_nativeContainer){
					_nativeContainer.y = value;
					_nativeContainerOffset.y = _offsetX + value;
				}
				if(_avatar3D){
					_avatar3D.zOffset = GlobalConfig.get2DMapDepth(value);
				}
				if(_graphicDis){
					_graphicDis.z = PlanarContainer3D.transformPlanarRotation(-value);
				}
			}
		}
		
		override public function set z(value:Number):void
		{
			if(_z != value)
			{
				_z = value;
				value = value >> 0;
				if(_graphicDis)_graphicDis.z = value;
			}
		}
		
		override public function set finalShowY(value:Number):void
		{
			super.finalShowY = value;
			var $baseObj:BaseObj3D;
			var offset:Number = value << 7;//value*128
			for (var i:int = _baseObj3DList.length - 1; i >= 0 ; i--) 
			{
				$baseObj = _baseObj3DList[i];
				$baseObj.zOffset = offset;
			}
			for (i = _baseObjList.length - 1; i >= 0 ; i--) 
			{
				_baseObjList[i].finalShowY = value;
			}
		}
		
		/**
		 * 是否在可视范围内 
		 * @param value
		 */		
		final override public function set isInViewDistance(value:Boolean):void
		{
			super.isInViewDistance = value;
			_renderSet.isInViewDistance = value;
			//
			var i:uint=0;
			var bo:BaseObj;
			var $baseObj:BaseObj3D;
			for(i=0;i<_baseObjList.length;i++)
			{
				bo = _baseObjList[i];
				bo.isInViewDistance = value;
			}
			for (i = 0; i < _baseObj3DList.length; i++) 
			{
				$baseObj = _baseObj3DList[i];
				$baseObj.isInViewDistance = value;
			}
			if(_avatar3D){
				_avatar3D.isInViewDistance = value;
			}
		}
		
		override public function set enableShadow(value:Boolean):void
		{
			_enableShadow = value;
			_renderSet.enableShadow = _enableShadow;
			if (_avatar3D)
				_avatar3D.castsShadows = _isDrawShadow && _enableShadow;
		}
		
		override public function set planarRenderLayer(value:uint):void
		{
			_planarRenderLayer = value;
			if (_avatar3D)
				_avatar3D.planarRenderLayer = value;
			if (_renderSet)
				_renderSet.planarRenderLayer = value;
		}
		
		override public function set isDrawShadow(value:Boolean):void
		{
			_isDrawShadow = value;
			_renderSet.isDrawShadow = _isDrawShadow;
			if (_avatar3D)
				_avatar3D.castsShadows = _isDrawShadow && _enableShadow;
			//如果允许有阴影...那么添加一个默认小黑圈阴影
			if(!_isDrawShadow && enableShadow)
			{
				var shadowTexture:TextureMaterial = GlobalConfig2D.shadowTexture;
				if(_graphicDis && _avatarShadow == null && shadowTexture)
				{
					_avatarShadow = PoolMesh.create(_renderSet);
					_avatarShadow.material = shadowTexture;
					_avatarShadow.x = - (GlobalConfig2D.shadowWidth>>1);
					_avatarShadow.y = - (GlobalConfig2D.shadowHeight>>1);
					_avatarShadow.visible = this.visible;
					_avatarShadow.alpha = this.alpha;
					_avatarShadow.run();
					_avatarShadow.depth = -200;
					_graphicDis.addChild(_avatarShadow);
				}
			}
			else
			{
				PoolMesh.recycle(_avatarShadow);
				_avatarShadow = null;
			}
		}
		
		override public function set smooth(value:Boolean):void
		{
			_smooth = value;
			if (_renderSet)
				_renderSet.smooth = value;
		}
		
		override public function set depthEnable(value:Boolean):void
		{
			_depthEnable = value;
			if (_renderSet)
				_renderSet.depthEnable = value;
		}
		
		override public function set depth(value:int):void
		{
			_depth = value;
			if (_renderSet)
				_renderSet.depth = value;
		}
		
		/**
		 * 是否在可视范围内 
		 * @param value
		 */		
		override public function set needRender(value:Boolean):void
		{
			if(_needRender != value)
			{
				super.needRender = value;
				_renderSet.needRender = value;
			}
		}
		
		//一些标志***********************************************
		/**
		 * 资源加载优先级
		 */	
		public var loadPriority:int = 0;
		
		//***********************************************复写BaseCharacter***********************************************
		/*** 像素坐标x*/	
		final override public function set show_x($value:Number):void
		{
			super.show_x = $value;
			if(_shadow!=null)
			{
				_shadow.x = this.x+GlobalConfig2D.shadowOffsetX;
			}
		}
		
		/**显示像素y*/
		final override public function set show_y($value:Number):void
		{
			super.show_y = $value;
			if(_shadow!=null)
			{
				_shadow.y = this.y+GlobalConfig2D.shadowOffsetY;
			}
		}
		
		override public function set mouseEnabled(value:Boolean):void
		{
			if(_mouseEnabled != value)
			{
				_mouseEnabled = value;
				_renderSet.mouseEnabled = value;
				if (_avatar3D)
					_avatar3D.mouseEnabled = value;
				updateNow = true;
			}
		}
		
		override public function set parent(value:ObjectContainer3D):void
		{
			super.parent = value;
			if(value is SceneRenderLayer)
			{
				_sceneAvatarLayer = value as SceneRenderLayer;
			}
		}
		
		/**
		 * @private
		 * 是否与某个点发生碰撞
		 * @param $checkMouseEnabled 是否判断鼠标响应
		 */
		override public function hitPoint($p:Point):Boolean
		{
			if(!mouseEnabled)return false;
			if(!visible)return false;
			return avatar.hitPoint($p);
		}
		
		/**
		 * 是否与某个矩形发生碰撞
		 * @param $rect
		 * @param $checkMouseEnabled 是否判断鼠标响应
		 */
		override public function hitRect($rect:Rectangle):Boolean
		{
			if(!mouseEnabled)return false;
			if(!visible)return false;
			return avatar.hitRect($rect);
		}
		
		/*** 设置阴影偏移量x */	
		public function set shadowOffsetX(value:Number):void
		{
			_renderSet.shadowOffsetX = value;
		}
		
		/*** 设置阴影偏移量y */	
		public function set shadowOffsetY(value:Number):void
		{
			_renderSet.shadowOffsetY = value;
		}
		
		override public function set forceEnableBlendMode($value:Boolean):void
		{
			_renderSet.forceEnableBlendMode = $value;
			//
			var len:int = _baseObjList.length;
			while(len-->0)
			{
				var bo:BaseObj = _baseObjList[len];
				bo.forceEnableBlendMode = $value;
			}
		}
		
		/**
		 * @private
		 * 重置
		 * 
		 */	
		override public function reSet($parameters:Array):void
		{
			super.reSet(null);
			//数据是一个新的OBJ
			_userData = {};
			//创建换装（用池创建）
			_renderSet = RenderSet.create();
			
			_avatarContainer = PoolContainer.create();
			_headBindableContainer = HeadBindableContainer.create();
			_graphicDis = PoolContainer.create();
			_graphicDis.addChild(_avatarContainer);
			_graphicDis.name = "SceneCharacter";
			_renderSet.parent = _avatarContainer;
			_headBindableContainer.bind(_graphicDis,_graphicDis);
			
			enableMask = true;
			//------------------------------------
			type = $parameters[0];
			id = $parameters[1];
			scene = $parameters[2];
			tile_x = $parameters[3];
			tile_y = $parameters[4];
			var hasAvatar3D:Boolean = $parameters[5];
			if (hasAvatar3D)
			{
				_avatar3D = SceneCharacter3D.create(type,id);
				_avatar3D.parentChar = this;
			}
			if (scene)
			{
				if (_avatar3D)
					scene.gameScene3d.addSceneObj(_avatar3D,_graphicDis);
				scene.sceneStarlingLayer.addChild(_headBindableContainer);
			}
		}
		
		//-----------------------------------------------------------2d对象-----------------------------------------------------------
		protected var _displayObjList:Vector.<DisplayObject> = null;
		//
		public function addDisplayObj($baseObj:DisplayObject,$depthIndex:int=0):void
		{
			if (_nativeContainer == null)
			{
				addNativeContainer();
			}
			if (_displayObjList == null) _displayObjList = new Vector.<DisplayObject>();
			_displayObjList.push($baseObj);
			_nativeContainer.addChild($baseObj);
		}
		//
		public function removeDisplayObj($baseObj:DisplayObject):void
		{
			if(_displayObjList)
			{
				var index:int = _displayObjList.indexOf($baseObj);
				if(index != -1)
				{
					_displayObjList.splice(index,1);
					DisplayUtil.removeForParent($baseObj);
				}
			}
		}
		
		private function addNativeContainer():void
		{
			_nativeContainer = new Sprite();
			if (_graphicDis)
			{
				_nativeContainer.x = _graphicDis.x;
				_nativeContainer.y = _graphicDis.y;
			}
			_nativeContainerOffset = new Point();
			Scene.scene.sceneStageLayer.addChild(_nativeContainer);
		}
		//-----------------------------------------------------------2d对象-----------------------------------------------------------
		
		//-----------------------------------------------------------其它BaseObj-----------------------------------------------------------
		protected var _baseObjList:Vector.<BaseObj> = new Vector.<BaseObj>();
		//
		public function get numBaseObj():uint
		{
			return _baseObjList.length;
		}
		
		public function addBaseObj($baseObj:BaseObj,$depthIndex:int=0):void
		{
			_baseObjList.push($baseObj);
			$baseObj.parent = _avatarContainer as ObjectContainer3D;
			$baseObj.isMainChar = isMainChar;
			$baseObj.finalShowX = this.finalShowX;
			$baseObj.finalShowY = this.finalShowY;
		}
		
		public function hasBaseObj($baseObj:BaseObj):Boolean
		{
			if(_baseObjList)
			{
				var index:int = _baseObjList.indexOf($baseObj);
				if(index != -1)
				{
					return true;
				}
			}
			return false;
		}
		//
		public function removeBaseObj($baseObj:BaseObj):void// 上层要重写下。。。
		{
			if(_baseObjList)
			{
				var index:int = _baseObjList.indexOf($baseObj);
				if(index != -1)
				{
					removeBaseObjAt(index);
				}
			}
		}
		
		private function removeBaseObjAt(index:int):void// 上层要重写下。。。
		{
			if(_baseObjList && index != -1)
			{
				var bo:BaseObj = _baseObjList[index];
				if(bo is RenderSet)
				{
					RenderSet.recycle(bo as RenderSet);
				}
				else if(bo is RenderUnit)
				{
					RenderUnit.recycle(bo as RenderUnit);
				}
				else
				{
					bo.destroy();
				}
				_baseObjList.splice(index,1);
			}
		}
		
		public function removeBaseObjByID($id:Number,$type:String):void
		{
			var len:int = _baseObjList.length;
			while(len-->0)
			{
				var bo:BaseObj = _baseObjList[len];
				if(bo.id == $id && bo.type == $type)
				{
					removeBaseObj(bo);
				}
			}
		}
		
		public function getBaseObjByID($id:Number,$type:String):BaseObj
		{
			var len:int = _baseObjList.length;
			while(len-->0)
			{
				var bo:BaseObj = _baseObjList[len];
				if(bo.id == $id && bo.type == $type)
				{
					return bo;
				}
			}
			return null;
		}
		
		public function get avatarNumChildren():uint
		{
			return _avatarContainer.numChildren;
		}
		
		//--------------------------------------------------------------------------------------------------------------------------------
		
		//-----------------------------------------------------------其它BaseObj-----------------------------------------------------------
		protected var _baseObj3DList:Vector.<BaseObj3D> = new Vector.<BaseObj3D>();
		public function get numBaseObj3D():uint
		{
			return _baseObj3DList.length;
		}
		
		public function hasRenderUintEntity(entity:ObjectContainer3D):Boolean
		{
			var len:int = _baseObj3DList.length;
			while(len-->0)
			{
				var bo:BaseObj3D = _baseObj3DList[len];
				if(bo is RenderUnit3D)
				{
					var container3D:ObjectContainer3D = RenderUnit3D(bo).graphicDis;
					if (container3D && container3D.contains(entity))
						return true;
				}
				else if(bo is RenderSet3D && RenderSet3D(bo).hasEntity(entity))
				{
					return true;
				}
			}
			return false;
		}
		
		public function addBaseObj3D($baseObj:BaseObj3D, autoRecycle:Boolean = false):void
		{
			$baseObj.parent = _avatarContainer as ObjectContainer3D;
			$baseObj.isInViewDistance = true;
			$baseObj.mouseEnable = this.mouseEnabled;
			$baseObj.startRender();
			_baseObj3DList.push($baseObj);
			if (autoRecycle && $baseObj is RenderUnit3D)
				RenderUnit3D($baseObj).setPlayCompleteCallBack(removeBaseObj3D);
			//$baseObj.graphicDis.zOffset = this.finalShowY<<7;
			$baseObj.zOffset = this.finalShowY<<7;
		}
		
		public function removeAllBaseObj3D():void
		{
			while(_baseObj3DList.length>0)
			{
				removeBaseObj3DAt(0);
			}
		}
		
		public function removeBaseObj3D($baseObj:BaseObj3D):void
		{
			var index:int = _baseObj3DList.indexOf($baseObj);
			if(index != -1)
			{
				removeBaseObj3DAt(index);
			}
		}
		
		public function removeBaseObj3DAt(index:int):void
		{
			if(index >= 0 && index < _baseObj3DList.length)
			{
				var bo:BaseObj3D = _baseObj3DList[index];
				if(bo is RenderUnit3D)
				{
					RenderUnit3D.recycle(bo as RenderUnit3D);
				}
				else
				{
					bo.destroy();
				}
				bo.stopRender();
				bo.isInViewDistance = false;
				bo = null;
				_baseObj3DList.splice(index,1);
			}
		}
		
		public function removeBaseObj3DByID($id:Number,$type:String):void
		{
			var len:int = _baseObj3DList.length;
			while(len-->0)
			{
				var bo:BaseObj3D = _baseObj3DList[len];
				if(bo.id == $id && bo.type == $type)
				{
					removeBaseObj3DAt(len);
				}
			}
		}
		
		public function getBaseObj3DByID($id:Number,$type:String):BaseObj3D
		{
			var len:int = _baseObj3DList.length;
			while(len-->0)
			{
				var bo:BaseObj3D = _baseObj3DList[len];
				if(bo.id == $id && bo.type == $type)
				{
					return bo;
				}
			}
			return null;
		}
		
		//--------------------------------------------------------------------------------------------------------------------------------
		/**
		 * @private
		 * 释放
		 * 
		 */	
		override public function dispose():void
		{
			//标识正在释放中
			disposing = true;
			
			TweenLite.killTweensOf(this);
			_needRender = true;
			_enableShadow = false;
			_isDrawShadow = false;
			alpha = 1;
			loadPriority = 0;
			canRemoved = true;
			_visible = true;
			shadowOffsetX = 0;
			shadowOffsetY = 0;
			offsetX = 0;
			offsetY = 0;
			x = 0;
			y = 0;
			mouseEnabled = false;
			//=============================================================================
			RenderSet.recycle(_renderSet);//回收avatar
			if (_avatar3D)
			{
				scene.gameScene3d.removeSceneObj(_avatar3D);
				SceneCharacter3D.recycle(_avatar3D);
			}
			//=============================================================================
			_sceneAvatarLayer = null;
			_parent = null;
			_renderSet = null;
			_avatar3D = null;
			scene = null;
			_status = 0;
			_logicAngle = 0;
			//注意这个一定要清楚
			_userData = null;
			//禁用container
			disableContainer(true);
			
			var len:int = _baseObjList.length;
			while(len--)
			{
				removeBaseObjAt(0);
			}
			_baseObjList.length = 0;
			
			len = _baseObj3DList.length;
			while(len--)
			{
				removeBaseObj3DAt(0);
			}
			_baseObj3DList.length = 0;
			
			if (_displayObjList)
			{
				while(_displayObjList.length)
				{
					DisplayUtil.removeForParent(_displayObjList.pop());
				}
				_displayObjList.length = 0;
			}
			_baseObjList.length = 0;
			
			if(_shadow!=null)
			{
				if(_shadow.parent!=null)
				{
					_shadow.parent.removeChild(_shadow);
				}
				_shadow = null;
			}
			if (_avatarShadow)
				PoolMesh.recycle(_avatarShadow);
			_avatarShadow = null;
			//
			if (_nativeContainer)
			{
				DisplayUtil.removeAllChild(_nativeContainer);
				DisplayUtil.removeForParent(_nativeContainer);
				_nativeContainer = null;
				_nativeContainerOffset = null;
			}
			if (_avatarContainer)
				PoolContainer.recycle(_avatarContainer);
			_avatarContainer = null;
			if (_headBindableContainer)
				HeadBindableContainer.recycle(_headBindableContainer);
			_headBindableContainer = null;
			if(_showContainer)
				ShowContainer.recycle(_showContainer);
			_showContainer = null;
			if (_graphicDis)
				PoolContainer.recycle(_graphicDis as PoolContainer);
			_graphicDis = null;
			//
			super.dispose();
		}
		
		//移动与状态相关**********************************************************************************************************
		/**
		 * 面向像素点(注意不会改变换装方向，只是改变角色数据)
		 * @param $piexl_x
		 * @param $piexl_y
		 */		
		public function faceTo($piexl_x:Number, $piexl_y:Number):void 
		{
			//面向目标(注意这里要做不重合判断)
			if(x==$piexl_x && y==$piexl_y)
			{
				return;
			}
			var angle:Number = ZMath.getTowPointsAngle(new Point(x, y),new Point($piexl_x, $piexl_y));
			setAngle(angle);
		}
		
		/**
		 * 面向逻辑点
		 * @param $tile_x
		 * @param $tile_y
		 */		
		public function faceToTile($tile_x:Number, $tile_y:Number):void 
		{
			var piexl:Point = Transformer.transTilePoint2PixelPoint(new Point($tile_x, $tile_y));
			faceTo(piexl.x, piexl.y);
		}
		
		/**
		 * 设置角色像素点
		 * @param $piexl_x
		 * @param $piexl_y
		 */		
		public function setXY($piexl_x:Number, $piexl_y:Number):void 
		{
			x = $piexl_x;
			y = $piexl_y;
		}
		
		/**
		 * 设置角色逻辑格
		 * @param $tile_x
		 * @param $tile_y
		 */		
		public function setTileXY($tile_x:Number, $tile_y:Number):void 
		{
			tile_x = $tile_x;
			tile_y = $tile_y;
		}
		
		/**
		 * 设置状态
		 */		
		public function setStatus($status:uint):void 
		{
			_status = $status;
			if (_avatar3D)
				_avatar3D.playCharStatus($status);
			//派发角色状态改变事件
			EventManager.dispatchEvent(SceneEvent.CHAR, SceneEventAction_char.CHAR_STATUS_CHANGED,this);
		}
		
		/**
		 * 获取状态
		 */		
		public function get status():uint 
		{
			return _status;
		}
		
		/**
		 * 设置角度
		 * @param $angle
		 */		
		public function setAngle($angle:Number):void 
		{
			logicAngle = Transformer.transAngle2LogicAngle($angle);
		}
		
		/**
		 * 设置逻辑角度
		 * @param $logicAngle
		 */		
		override public function set logicAngle($logicAngle:uint):void 
		{
			if(_logicAngle != $logicAngle)
			{
				_logicAngle = $logicAngle;
				if (_avatar3D)
					_avatar3D.logicAngle = $logicAngle;
				//派发角色状态改变事件
				EventManager.dispatchEvent(SceneEvent.CHAR, SceneEventAction_char.CHAR_LOGICANGLE_CHANGED,this);
			}
		}
		
		/**
		 * @private
		 * 获取逻辑角度显示优先级
		 */		
		public function get logicAnglePRI():int 
		{
			switch (_logicAngle)
			{
				case 7:
					return 2;
					break;
				case 2:
					return 3;
					break;
				case 6:
					return 4;
					break;
				case 3:
					return 5;
					break;
				case 5:
					return 6;
					break;
				case 4:
					return 7;
					break;
				default:
					return _logicAngle;
					break;
			}
			
			return 0;
		}
		
		
		/**
		 * 对整个换装的每一项执行函数
		 * @param $fun 第一个参数是参数sceneCharacter, 第二个参数是RenderUnit
		 * 
		 */		
		public function forEachAvatarAps($fun:Function):void
		{
			avatar.forEachRenderUnit($fun,this);
		}
		
		public function forEachAvatar3DAps($fun:Function):void
		{
			if (_avatar3D)
				_avatar3D.forEachRenderUnit($fun, [this], false);
			var len:int = _baseObj3DList.length;
			while(len-->0)
			{
				var bo:BaseObj3D = _baseObj3DList[len];
				if(bo is RenderUnit3D)
				{
					$fun.apply(null,[this,bo]);
				}
				else if(bo is RenderSet3D)
				{
					RenderSet3D(bo).forEachRenderUnit($fun,[this]);
				}
			}
		}
		
		/**
		 * @private
		 * 运行换装逻辑单步
		 * @parma $frame 帧 为0则走渲染计时计算的帧，否则选择此参数指定的帧
		 */	
		final override public function run(gTime:uint):void
		{
			//更新换装
			this.avatar.run(gTime);
			
			var i:uint = 0;
			if(_baseObjList)
			{
				for(i=0;i<_baseObjList.length;i++)
				{
					var bo:BaseObj = _baseObjList[i];
					bo.run(gTime);//更新换装 
				}
			}
			
			if(_baseObj3DList)
			{
				for(i=0;i<_baseObj3DList.length;i++)
				{
					var bo3D:BaseObj3D = _baseObj3DList[i];
					bo3D.run(gTime);//更新换装 
				}
			}
			//改变回去
			updateNow = false;
		}
		
		override public function set isMainChar(value:Boolean):void
		{
			_isMainChar = value;
			if(_renderSet)
			{
				_renderSet.isMainChar = value;
			}
		}
	}
}