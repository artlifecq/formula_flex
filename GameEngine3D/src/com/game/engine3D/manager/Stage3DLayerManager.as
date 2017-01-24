package com.game.engine3D.manager
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.core.StarlingLayer;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.system.Capabilities;
	
	import away3d.arcane;
	import away3d.cameras.lenses.OrthographicOffCenterLens;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.core.managers.Stage3DManager;
	import away3d.core.managers.Stage3DProxy;
	import away3d.core.math.Matrix3DUtils;
	import away3d.core.math.Plane3D;
	import away3d.core.pick.PickingCollisionVO;
	import away3d.core.pick.PickingType;
	import away3d.core.pick.RaycastPicker;
	import away3d.entities.EntityLayerType;
	import away3d.events.Stage3DEvent;
	import away3d.lights.DirectionalLight;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.tools.utils.Bounds;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;

	use namespace arcane;

	/**
	 *
	 * Stage3D层管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:42:33
	 *
	 */
	public class Stage3DLayerManager
	{
		/** 游戏帧频 */
		private static var _frameRate : int = 60;
		/** 每刷一帧所需时间(注意要用Number类型) */
		private static var _stepTime : Number = 1000 / _frameRate;
		/** 舞台 **/
		private static var _stage : Stage;
		/** 3D舞台 **/
		private static var _stage3DProxy : Stage3DProxy;
		/** 视口对象 **/
		private static var _views : Vector.<View3D>;
		/** 视口对象 在starling view之上，用来显示ui上面的3d对象**/
		private static var _screenView : View3D;
		private static var _screenLight : DirectionalLight;
		private static var _screenLightPicker : StaticLightPicker;
		/** starling对象 **/
		private static var _starlingView2D : Starling;
		private static var _starlingLayerCount : int = 0;
		private static var _useScreenView : Boolean;
		private static var _helperPoint : Point = new Point();
		/**
		 * starling层
		 */
		private static var _starlingLayer : StarlingLayer;

		/** 安装完成 **/
		private static var _setupCompleteFunc : Function;
		private static var _setupCompleted : Boolean;
		/** 截获2D层鼠标事件 **/
		private static var _view2DCaptureEventFunc : Function;
		/**
		 * 是否能够渲染
		 */
		private static var _renderable : Boolean;
		/** 3D场景父容器 **/
		private static var _viewContainer : DisplayObjectContainer;
		private static var _viewCount : int;
		private static var _viewAntiAlias : int = 2;
		private static var _screenAntiAlias : int = 2;
		private static var _errorChecking : Boolean = false;

		/**
		 * 布局相关
		 */
		private static var _viewX : int = 0;
		private static var _viewY : int = 0;
		private static var _viewMarginTop : int = 0;
		private static var _viewMarginBottom : int = 0;
		private static var _viewMarginLeft : int = 0;
		private static var _viewMarginRight : int = 0;
		private static var _viewWidth : int = 0;
		private static var _viewHeight : int = 0;

		private static var _screenViewMarginTop : int = 0;
		private static var _screenViewMarginBottom : int = 0;
		private static var _screenViewMarginLeft : int = 0;
		private static var _screenViewMarginRight : int = 0;
		private static var _screenViewWidth : int = 0;
		private static var _screenViewHeight : int = 0;

		private static var _screenViewInternalScale : Number = 0;

		public function Stage3DLayerManager()
		{
		}

		/**
		 * 安装
		 * @param stage
		 * @param viewContainer
		 * @param setupComplete
		 * @param viewCount
		 * @param starlingLayerCount
		 * @param onStarlingEventCapture
		 * @param useScreenView
		 *
		 */
		public static function setup(stage : Stage, viewContainer : DisplayObjectContainer, setupComplete : Function, viewCount : int = 1, starlingLayerCount : int = 0, onStarlingEventCapture : Function = null, useScreenView : Boolean = true) : void
		{
			_stage = stage;
			//将黄色焦点框隐藏掉
			_stage.stageFocusRect = false;
			_stage.scaleMode = StageScaleMode.NO_SCALE;
			_stage.align = StageAlign.TOP_LEFT;
			_stage.quality = StageQuality.LOW;
			_stage.frameRate = _frameRate;
			_stage.focus = _stage;

			_viewContainer = viewContainer;
			_setupCompleteFunc = setupComplete;
			_viewCount = viewCount;
			_view2DCaptureEventFunc = onStarlingEventCapture;
			_starlingLayerCount = starlingLayerCount;
			_useScreenView = useScreenView;
			_renderable = false;
			_setupCompleted = false;
			_stage3DProxy = Stage3DManager.getInstance(stage).getFreeStage3DProxy();
			_stage3DProxy.antiAlias = _screenAntiAlias;
			_stage3DProxy.color = stage.color;
			_stage3DProxy.addEventListener(Stage3DEvent.CONTEXT3D_CREATED, onContextCreated);
		}

		/**
		 * 创建成功
		 */
		private static function onContextCreated(e : Stage3DEvent) : void
		{
			_views = new Vector.<View3D>();
			for (var i : int = 0; i < _viewCount; i++)
			{
				var view : View3D = new View3D();
				view.stage3DProxy = _stage3DProxy;
				view.mousePicker = PickingType.RAYCAST_BEST_HIT;
				view.antiAlias = _viewAntiAlias;
				_viewContainer.addChildAt(view, 0);
				view.mousePicker.layerMask = EntityLayerType.TERRAIN | EntityLayerType.DEFAULT;
				view.visible = true;

				if (_viewCount != 0)
					view.layeredView = true;

				//guoqing.wen add
				view.entityCollector.collectPlanarShadow = GlobalConfig.use2DMap;
				view.lodEnabled = !GlobalConfig.use2DMap;

				_views.push(view);
			}
			if (_starlingLayerCount > 0)
			{
				_starlingView2D = new Starling(StarlingLayer, _stage, _stage3DProxy, _stage3DProxy.viewPort, _stage3DProxy.stage3D);
				_starlingView2D.addEventListener(starling.events.Event.ROOT_CREATED, starlingViewCreated);
				_starlingView2D.start();
			}

			if (_useScreenView)
			{
				_screenView = new View3D();
				_screenView.stage3DProxy = _stage3DProxy;
				_screenView.layeredView = true;
//				_screenView.camera.lens.near = 1;
//				_screenView.camera.lens.far = 12000;
//				_screenView.camera.position = new Vector3D(0, 0, -1000);
				_screenView.camera.lens = new OrthographicOffCenterLens(0, 1000, 0, 1000);
				_screenView.mouseEnabled = false;
				_screenView.mouseChildren = false;
				_viewContainer.addChild(_screenView);
				_screenView.visible = false;

				_screenLight = new DirectionalLight(0.345, -0.379, 0.857);
				_screenLight.ambient = 0.5;
				_screenLight.ambientColor = 0xcdd2ea;
				_screenLight.diffuse = 1;
				_screenLight.color = 0xffffff;
				_screenLight.specular = 1;
				_screenLight.castsPlanarShadows = true;
				_screenLight.castsShadows = false;
				_screenLight.planarShadowAlpha = 0.3;
				var plane:Plane3D = new Plane3D(0,Math.cos(GlobalConfig.mapCameraRadian),Math.sin(GlobalConfig.mapCameraRadian));
				_screenLight.planarShadowPlane = plane;
				_screenLightPicker = new StaticLightPicker([_screenLight]);
				_screenView.scene.addChild(_screenLight);
			}

			if (_starlingLayerCount == 0)
			{
				stage3DCreated();
			}
		}

		private static function starlingViewCreated(e : starling.events.Event) : void
		{
			_starlingLayer = _starlingView2D.root as StarlingLayer;
			_starlingLayer.initLayer(_starlingLayerCount);
			stage3DCreated();
		}

		private static function stage3DCreated() : void
		{
			if (_setupCompleted)
				return;
			_stage3DProxy.context3D.enableErrorChecking = _errorChecking;
			_stage.addEventListener(flash.events.Event.RESIZE, handleScreenSize);
			_stage3DProxy.addEventListener(away3d.events.Event.ENTER_FRAME, rendering);
			if (_screenView)
				_screenView.visible = true;
			if (_setupCompleteFunc != null)
				_setupCompleteFunc();
			handleScreenSize(null);
			_setupCompleted = true;
		}

		public static function get screenAntiAlias() : int
		{
			return _screenAntiAlias;
		}

		/**
		 * 最大值是4
		 * @param value
		 *
		 */
		public static function set screenAntiAlias(value : int) : void
		{
			_screenAntiAlias = value;
			_stage3DProxy.antiAlias = _screenAntiAlias;
		}

		public static function get viewAntiAlias() : int
		{
			return _viewAntiAlias;
		}

		/**
		 * 最大值是4
		 * @param value
		 *
		 */
		public static function set viewAntiAlias(value : int) : void
		{
			_viewAntiAlias = value;
			if (_views)
			{
				for each (var view : View3D in _views)
				{
					view.antiAlias = _viewAntiAlias;
				}
			}
		}

		public static function set errorChecking(value : Boolean) : void
		{
			_errorChecking = value;
			if (_setupCompleted && _stage3DProxy && _stage3DProxy.context3D)
			{
				_stage3DProxy.context3D.enableErrorChecking = _errorChecking;
			}
		}

		public static function get errorChecking() : Boolean
		{
			return _errorChecking;
		}

		/**
		 * 屏幕适配
		 */
		private static function handleScreenSize(e : flash.events.Event) : void
		{
			if (!_views)
				return;
			var width : Number = _viewWidth || _stage.stageWidth;
			var height : Number = _viewHeight || _stage.stageHeight;
			if (GlobalConfig.use2DMap)
			{
				if (width % 2 == 1)
					width = width - 1;
				if (height % 2 == 1)
					height = height - 1;
			}
			//设置坐标
			_stage3DProxy.x = _viewX;
			_stage3DProxy.y = _viewY;
			_stage3DProxy.width = width;
			_stage3DProxy.height = height;
			for each (var view : View3D in _views)
			{
				view.x = _viewMarginLeft;
				view.y = _viewMarginTop;
				view.width = (width) - _viewMarginRight;
				view.height = (height) - _viewMarginBottom;
			}
			if (_starlingView2D)
			{
				_starlingView2D.stage.stageWidth = width;
				_starlingView2D.stage.stageHeight = height
				_starlingView2D.viewPort.width = _starlingView2D.stage.stageWidth;
				_starlingView2D.viewPort.height = _starlingView2D.stage.stageHeight;
				_starlingView2D.viewPort = _starlingView2D.viewPort;
			}

			if (_screenView)
			{
				_screenView.width = (_screenViewWidth || _stage.stageWidth) - _screenViewMarginRight;
				_screenView.height = (_screenViewHeight || _stage.stageHeight) - _screenViewMarginBottom;
				_screenView.x = _screenViewMarginLeft;
				_screenView.y = _screenViewMarginTop;

				(_screenView.camera.lens as OrthographicOffCenterLens).maxX = _screenView.width;
				(_screenView.camera.lens as OrthographicOffCenterLens).maxY = _screenView.height;

//				_screenViewInternalScale = 10000 / _stage.stageHeight;
//				var numChildren : int = _screenView.scene.numChildren;
//				for (var i : int = 0; i < numChildren; i++)
//				{
//					var screenObj : ObjectContainer3D = _screenView.scene.getChildAt(i);
//					if (screenObj is ScreenElement3D)
//					{
//						(screenObj as ScreenElement3D).internalScale = _screenViewInternalScale;
//					}
//				}
			}
		}

		public static function resizeView(x : int = 0, y : int = 0, width : int = 0, height : int = 0, marginLeft : int = 0, marginRight : int = 0, marginTop : int = 0, marginBottom : int = 0) : void
		{
			_viewX = x;
			_viewY = y;
			_viewWidth = width;
			_viewHeight = height;
			_viewMarginLeft = marginLeft;
			_viewMarginRight = marginRight;
			_viewMarginTop = marginTop;
			_viewMarginBottom = marginBottom;
			handleScreenSize(null);
		}

		public static function resizeScreenView(width : int = 0, height : int = 0, marginLeft : int = 0, marginRight : int = 0, marginTop : int = 0, marginBottom : int = 0) : void
		{
			_screenViewWidth = width;
			_screenViewHeight = height;
			_screenViewMarginLeft = marginLeft;
			_screenViewMarginRight = marginRight;
			_screenViewMarginTop = marginTop;
			_screenViewMarginBottom = marginBottom;
			handleScreenSize(null);
		}

		/**
		 * 开始渲染，开始摇滚了@L.L.M.Sunny
		 * @param e
		 *
		 */
		private static function rendering(e : away3d.events.Event) : void
		{
			if (!_renderable)
				return;

			_stage3DProxy.mouse3DManager.enabled = true;
			if (_starlingView2D)
			{
				_starlingView2D.nextFrame(false);
				if (_starlingView2D.touchProcessor.capturedEvent || hitTestStarling(_stage.mouseX, _stage.mouseY))
				{
					_stage3DProxy.mouse3DManager.cleanQuenedEvents();
					_stage3DProxy.mouse3DManager.enabled = false;
					if (_view2DCaptureEventFunc != null)
						_view2DCaptureEventFunc();
				}
			}

			if (_views)
			{
				for each (var view : View3D in _views)
				{
					view.render();
				}
			}

			if (_starlingView2D)
			{
				_starlingView2D.render();
			}

			if (_screenView && _screenView.visible)
				_screenView.render();
		}

		public static function startRender() : void
		{
			_renderable = true;
		}

		public static function stopRender() : void
		{
			_renderable = false;
		}

		public static function getPickPositonByMousePositon(view : View3D, mouseX : int, mouseY : int) : Vector3D
		{
			if (view == null)
				return null;

			var vo : PickingCollisionVO = view.mousePicker.getViewCollision(mouseX, mouseY, view);
			if (vo == null || vo.entity == null)
				return null;
			var scenePosition : Vector3D = Matrix3DUtils.transformVector(vo.entity.sceneTransform, vo.localPosition);
			return scenePosition;
		}

		/**
		 * 根据当前屏幕坐标点得到场景实际的坐标点
		 * @param posx
		 * @param posy
		 * @return
		 *
		 */
		public static function getScenePositonByMousePositon(view : View3D, mouseX : int, mouseY : int, height : Number) : Vector3D
		{
			if (view == null)
				return null;
			var rayCastPicker : RaycastPicker = view.mousePicker as RaycastPicker;
			if (rayCastPicker == null)
				return null;
			var pickPosition : Vector3D = rayCastPicker.getXZPlaneCollison(mouseX, mouseY, height, view);
			return pickPosition;
		}

		/**
		 * 获得3D场景中的最大矩形
		 * @return 矩形
		 */
		public static function getSceneBounds(view : View3D) : Vector.<Number>
		{
			var min : Vector3D = new Vector3D(Infinity, Infinity, Infinity);
			var max : Vector3D = new Vector3D(-Infinity, -Infinity, -Infinity);

			var ctr : int = 0;
			var ocCount : int = view.scene.numChildren;

			// Get all scene child container bounds		
			while (ctr < ocCount)
			{
				var oc : ObjectContainer3D = view.scene.getChildAt(ctr++);
				Bounds.getObjectContainerBounds(oc);
				if (Bounds.minX < min.x)
					min.x = Bounds.minX;
				if (Bounds.minY < min.y)
					min.y = Bounds.minY;
				if (Bounds.minZ < min.z)
					min.z = Bounds.minZ;
				if (Bounds.maxX > max.x)
					max.x = Bounds.maxX;
				if (Bounds.maxY > max.y)
					max.y = Bounds.maxY;
				if (Bounds.maxZ > max.z)
					max.z = Bounds.maxZ;
			}
			return Vector.<Number>([min.x, min.y, min.z, max.x, max.y, max.z]);
		}

		/**
		 * 更新摄像机的景深
		 *
		 */
		public static function updateDefaultCameraFarPlane(view : View3D) : void
		{
			var bounds : Vector.<Number> = getSceneBounds(view);
			if (Math.abs(bounds[0]) == Infinity || Math.abs(bounds[1]) == Infinity || Math.abs(bounds[2]) == Infinity || Math.abs(bounds[3]) == Infinity || Math.abs(bounds[4]) == Infinity || Math.abs(bounds[5]) == Infinity)
			{
				view.camera.lens.far = 100000;
			}
			else
			{
				var vec : Vector3D = new Vector3D(bounds[3] - bounds[0], bounds[4] - bounds[1], bounds[5] - bounds[2]);
				var objRadius : Number = vec.length / 2;
				vec.x = (vec.x * 0.5) + bounds[0];
				vec.y = (vec.y * 0.5) + bounds[1];
				vec.z = (vec.z * 0.5) + bounds[2];

				// Far plane is distance from camera position to scene bounds center + the radius of the scene bounds
				view.camera.lens.far = Vector3D.distance(view.camera.position, vec) + objRadius;
			}
		}

		public static function get isRenderable() : Boolean
		{
			return _renderable;
		}

		/** 舞台 **/
		public static function get stage() : Stage
		{
			return _stage;
		}

		/** starling对象 **/
		public static function get starlingView2D() : Starling
		{
			return _starlingView2D;
		}

		/** starling层 **/
		public static function get starlingLayer() : StarlingLayer
		{
			return _starlingLayer;
		}

		/**
		 * 鼠标当前是否与starling层有碰撞
		 * @author wewell@163.com
		 *
		 */
		public static function hitTestStarling(stageX : Number, stageY : Number) : Boolean
		{
			if (_starlingLayerCount == 0)
				return false;
			_helperPoint.x = stageX;
			_helperPoint.y = stageY;
			var target : DisplayObject = _starlingView2D.stage.hitTest(_helperPoint);
			if (!target || target == _starlingView2D.stage)
				return false;
			return !target.touchAcross;
		}

		/** 视口对象 **/
		public static function getView(index : int = 0) : View3D
		{
			if (_views && index > -1 && index < _views.length)
				return _views[index];
			return null;
		}

		/** 视口对象 仅用于界面上显示3D对象 **/
		public static function get screenView() : View3D
		{
			return _screenView;
		}

		public static function get screenLight() : DirectionalLight
		{
			return _screenLight;
		}

		public static function get screenLightPicker() : StaticLightPicker
		{
			return _screenLightPicker;
		}

		/** 3D舞台 **/
		public static function get stage3DProxy() : Stage3DProxy
		{
			return _stage3DProxy;
		}

		public static function get screenViewInternalScale() : Number
		{
			return _screenViewInternalScale;
		}

		/**
		 * 驱动信息
		 * @return
		 *
		 */
		public static function get driverInfo() : String
		{
			if (_stage3DProxy && _stage3DProxy.context3D)
				return _stage3DProxy.context3D.driverInfo;
			return "n/a (no view)";
		}

		public static function fullScreen() : void
		{
			_stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		}

		public static function get isWindows() : Boolean
		{
			return Capabilities.os.indexOf("Windows") == 0;
		}

		public static function get isOpenGL() : Boolean
		{
			return driverInfo.indexOf("OpenGL") == 0;
		}

		public static function set frameRate(value : int) : void
		{
			_frameRate = value;
			//重新计算
			_stepTime = 1000 / _frameRate;
			if (_stage)
				_stage.frameRate = _frameRate;
		}

		public static function get frameRate() : int
		{
			return _frameRate;
		}
	}
}
