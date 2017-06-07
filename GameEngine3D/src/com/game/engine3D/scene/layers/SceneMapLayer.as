package com.game.engine3D.scene.layers
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.events.MapLoadEvent;
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.events.SceneEventAction3D;
	import com.game.engine3D.manager.InputManger;
	import com.game.engine3D.manager.SceneMapDataManager;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.pathFinding.HeightMapHelperProxy;
	import com.game.engine3D.vo.MapPointSet;
	import com.game.engine3D.vo.MapTextureLoader;
	import com.game.engine3D.vo.SceneMapData;
	
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	import away3d.Away3D;
	import away3d.animators.IAnimator;
	import away3d.animators.IAnimatorOwner;
	import away3d.audio.SoundBox;
	import away3d.cameras.lenses.PerspectiveLens;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.PlanarContainer3D;
	import away3d.containers.View3DAsset;
	import away3d.core.base.Geometry;
	import away3d.core.base.SubGeometryBase;
	import away3d.core.base.SubMesh;
	import away3d.core.partition.PlanarPartition3D;
	import away3d.core.partition.QuadTreePartition3D;
	import away3d.core.pick.PickingColliderType;
	import away3d.entities.EntityLayerType;
	import away3d.entities.Mesh;
	import away3d.entities.SparticleMesh;
	import away3d.events.AssetEvent;
	import away3d.events.AssetProgressEvent;
	import away3d.events.LoaderEvent;
	import away3d.events.MouseEvent3D;
	import away3d.events.ParserEvent;
	import away3d.events.Stage3DEvent;
	import away3d.filters.Filter3DBase;
	import away3d.library.assets.AssetType;
	import away3d.library.assets.IAsset;
	import away3d.lights.LightBase;
	import away3d.lights.PointLight;
	import away3d.loaders.AssetLoader;
	import away3d.loaders.ResourceBundleInstance;
	import away3d.loaders.parsers.AWD2Parser;
	import away3d.log.Log;
	import away3d.materials.MaterialBase;
	import away3d.materials.SinglePassMaterialBase;
	import away3d.materials.lightpickers.LightPickerBase;
	import away3d.materials.methods.EffectMethodBase;
	import away3d.materials.methods.FogByHeightMethod;
	import away3d.materials.methods.FogMethod;
	import away3d.materials.methods.RimLightMethod;
	import away3d.pathFinding.DistrictWithPath;
	import away3d.pathFinding.HeightMapHelper;
	import away3d.pathFinding.PointsSet;
	import away3d.pathFinding.PointsSetType;
	import away3d.plant.PlantGroup;
	import away3d.primitives.SkyBox;
	import away3d.weather.Weather;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 场景地图层
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 下午2:17:33
	 *
	 */
	public class SceneMapLayer extends ObjectContainer3D
	{
		/**
		 * 场景
		 */
		private var _scene3D : GameScene3D;
		/** 地图资源加载器 **/
		private var _loader : AssetLoader;
		/** 灯光选择 **/
		private var _lightPickerMap : HashMap;
		private var _mapObjectsLightPicker : LightPickerBase;
		/** 导航片信息 **/
		private var _district : DistrictWithPath;
		private var _showDistrictWireframe : Boolean;
		/** 材质列表 **/
		private var _materials : Vector.<MaterialBase> = new Vector.<MaterialBase>();
		/** 粒子列表 **/
		//private var _particles : Vector.<ParticleGroup> = new Vector.<ParticleGroup>();
		/** 鼠标能选中的资源列表 **/
		private var _mousePickerList : Vector.<ObjectContainer3D> = new Vector.<ObjectContainer3D>();
		private var _mousePickerMovable : Boolean = false;

		/** 场景地板高度映射辅助表 **/
		private var _heightMapHelper : HeightMapHelper;
		private var _fogMethodsMap : HashMap;
		private var _useFog : Boolean;
		private var _fogByHeightMethodsMap : HashMap;
		private var _useFogByHeight : Boolean;
		private var _rimMethodsMap : HashMap;
		private var _useRim : Boolean;
		
		private var _animatorRandom : int = 5000;
		/** 灯，包含顶灯 **/
		private var _lights : Vector.<LightBase>;
		private var _useLight : Boolean;
		private var _castsShadows : Boolean;
		private var _plantCastsShadows : Boolean;
		private var _animatorMap : HashMap;
		private var _objMap : HashMap;
		private var _rootObjectByName : HashMap;
		private var _skyBox : SkyBox;
		private var _weather : Weather;
		private var _cameraNear : int = 0;
		private var _cameraFar : int = 0;

		/** 地图网格加载完成 **/
		private var _nevMeshReady : Boolean;
		/** 地图材质加载完成 **/
		private var _mapResourceReady : Boolean;
		private var _sceneMapData : SceneMapData;
		private var _mapUrl : String;
		private var _priority : int;

		/** 地图加载完成回调 **/
		private var _onDataErrorHandler : Function = null;
		private var _onDataCompleteHandler : Function = null;
		private var _onMapCompleteHandler : Function = null;
		private var _onMapLoadErrorHandler : Function = null;
		private var _onMapParseErrorHandler : Function = null;
		private var _navMeshCompleteHandler : Function;

		private var _isLoaded : Boolean;
		private var _obstaclePointsMap : Dictionary = new Dictionary();
		private var _obstaclePointsSetMap : Dictionary = new Dictionary();
		private var _plantGroups : Vector.<PlantGroup> = new Vector.<PlantGroup>();
		private var _mousePickerDisabled : Boolean = false; //是否禁用所有鼠标事件
		private var _view3DAsset : View3DAsset;

		private var _quadTree : QuadTreePartition3D;
		
		private var _planarPartition : PlanarPartition3D;
        
        private var _xyzMode : int = HeightMapHelperProxy.MODE_XZ;

		public function SceneMapLayer(scene : GameScene3D)
		{
			super();
			_scene3D = scene;
			_isLoaded = false;
			_lightPickerMap = new HashMap();
			_fogMethodsMap = new HashMap();
			_useFog = true;
			_fogByHeightMethodsMap = new HashMap();
			_useFogByHeight = true;
			_rimMethodsMap = new HashMap();
			_useRim = true;
			_lights = new Vector.<LightBase>();
			_useLight = true;
			_castsShadows = true;
			_plantCastsShadows = false;
			_showDistrictWireframe = false;
			_sceneMapData = null;
			_animatorMap = new HashMap();
			_objMap = new HashMap();
			_rootObjectByName = new HashMap();
			this.partition = _quadTree = new QuadTreePartition3D(5);
			_quadTree.ignoreEntityUpdate = true;
		}

		/**
		 * View3DAsset
		 * @return
		 *
		 */
		public function get view3DAsset() : View3DAsset
		{
			return _view3DAsset;
		}

		public function get mousePickerDisabled() : Boolean
		{
			return _mousePickerDisabled;
		}

		public function set mousePickerDisabled(value : Boolean) : void
		{
			_mousePickerDisabled = value;
		}

		public function loadData(mapName : String, mapDataUrl : String, completeHandler : Function = null, errorHandler : Function = null, useBitmapData : Boolean = false) : void
		{
			if (_sceneMapData)
				return;
			_onDataCompleteHandler = completeHandler;
			_onDataErrorHandler = errorHandler;
			_sceneMapData = null;
			SceneMapDataManager.addMapData(this, mapName, mapDataUrl, onDataCompleteHandler, onDataErrorHandler, useBitmapData);
		}

		public function get mapUrl() : String
		{
			return _mapUrl;
		}

		public function get sceneMapData() : SceneMapData
		{
			return _sceneMapData;
		}

		public function loadMiniMap(mapName : String, miniMapUrl : String, rect : Rectangle = null, completeHandler : Function = null) : void
		{
			if (!_sceneMapData)
				return;
			SceneMapDataManager.addMiniMap(mapName, miniMapUrl, rect, completeHandler, onMiniMapErrorHandler);
		}

		public function loadRadarMap(mapName : String, radarMapUrl : String, rect : Rectangle = null, completeHandler : Function = null) : void
		{
			if (!_sceneMapData)
				return;
			SceneMapDataManager.addRadarMap(mapName, radarMapUrl, rect, completeHandler, onRadarMapErrorHandler);
		}

		private function onDataCompleteHandler(sceneMapData : SceneMapData) : void
		{
			_sceneMapData = sceneMapData;
			if (_onDataCompleteHandler != null)
				_onDataCompleteHandler(sceneMapData);
		}

		private function onDataErrorHandler(sceneMapData : SceneMapData) : void
		{
			if (_onDataErrorHandler != null)
				_onDataErrorHandler(sceneMapData);
			EventManager.dispatchEvent(MapLoadEvent.MAP_DATA_ERROR);
		}

		private function onMiniMapErrorHandler(loader : MapTextureLoader) : void
		{
			EventManager.dispatchEvent(MapLoadEvent.MAP_MINI_MAP_ERROR);
		}

		private function onRadarMapErrorHandler(loader : MapTextureLoader) : void
		{
			EventManager.dispatchEvent(MapLoadEvent.MAP_RADAR_MAP_ERROR);
		}

		/**
		 * 开始加载地图
		 */
		public function loadMap(mapUrl : String, completeHandler : Function, loadErrorHandler : Function = null, parseErrorHandler : Function = null, priority : int = 100) : void
		{
			_mapUrl = mapUrl;
			_onMapCompleteHandler = completeHandler;
			_onMapLoadErrorHandler = loadErrorHandler;
			_onMapParseErrorHandler = parseErrorHandler;
			_priority = priority;

			_heightMapHelper = HeightMapHelper.getInstance(1024, 1024);
			_mousePickerList = new Vector.<ObjectContainer3D>();
			
			trace("开始加载地图：" + mapUrl);
			_loader = new AssetLoader(); //AssetLoader不可以复用。。。@L.L.M.Sunny 20150618
			addLoaderEvents();
			_loader.load(new URLRequest(mapUrl), null, null, new AWD2Parser(), _priority);
		}

		private function onAssetComplete(e : AssetEvent) : void
		{
			if (e.type == AssetEvent.ASSET_COMPLETE)
			{
				var obj : IAsset = e.asset as IAsset;
				_objMap.add(obj.name, obj);
				switch (e.asset.assetType)
				{
					case AssetType.LIGHT_PICKER:
						addLightPicker(obj as LightPickerBase);
						break;
					case AssetType.LIGHT:
						if (obj is PointLight && (obj as PointLight).parent) 
						{
							// nothing							
						} 
						else
						{
							addLight(obj as LightBase);
							addMapObject(obj as ObjectContainer3D);
						}
						break;
					case AssetType.MATERIAL:
						if (obj is SinglePassMaterialBase)
							_materials.push(obj as SinglePassMaterialBase);
						break;
					case AssetType.EFFECTS_METHOD:
						if (obj is RimLightMethod)
						{
							addRimMethod(obj as RimLightMethod);
						}
						else if (obj is FogByHeightMethod)
						{
							addFogByHeightMethod(obj as FogByHeightMethod);
						}
						else if (obj is FogMethod)
						{
							addFogMethod(obj as FogMethod);
						}
						break;
					case AssetType.MESH:
						if (!(obj as ObjectContainer3D).parent)
						{
							addMapObject(obj as ObjectContainer3D);
						}
						objTransformPlanared(obj as ObjectContainer3D);
						addMousePicker(obj as ObjectContainer3D);
						break;
					case AssetType.PROPERTY_ANIMATOR_CONTAINER:
					case AssetType.CONTAINER:
					case AssetType.COMPOSITE_ANIMATOR_GROUP:
					case AssetType.KEY_FRAME_OBJECT_CONTAINER:
					case AssetType.EVENTS_ANIMATOR_CONTAINER:
					case AssetType.CAMERAS_ACTIVE_CONTROL_GROUP:
					case AssetType.RESOURCE_BUNDLE_INSTANCE:
					case AssetType.RIBBON:
					case AssetType.HALOSET:
						if (!(obj as ObjectContainer3D).parent)
						{
							addMapObject(obj as ObjectContainer3D);
						}
						objTransformPlanared(obj as ObjectContainer3D);
						//加大ResourceBundleInstance动画随机大小
						if (obj.assetType == AssetType.RESOURCE_BUNDLE_INSTANCE)
						{
							(obj as ResourceBundleInstance).animatorRandom = -_animatorRandom;
						}
						break;
					case AssetType.SPARTICLE_MESH:
						var particle : SparticleMesh = obj as SparticleMesh;
						if (!particle.parent || !(particle.parent is IAnimatorOwner))
						{
							particle.animator.start(-Math.random() * _animatorRandom);
						}
						if (!(obj as ObjectContainer3D).parent)
						{
							addMapObject(obj as ObjectContainer3D);
						}
						
						//暂时这么写
						objTransformPlanared(obj as ObjectContainer3D);
						break;
					case AssetType.SOUND_BOX:
						if (!(obj as SoundBox).parent)
						{
							addMapObject(obj as ObjectContainer3D);	
							(obj as SoundBox).animator.start();
						}
						break;
					case AssetType.SKYBOX:
						_skyBox = SkyBox(obj);
						if (!(obj as ObjectContainer3D).parent)
						{
							addMapObject(obj as ObjectContainer3D);
						}
						break;
					case AssetType.WEATHER:
						_weather = Weather(obj);
						if (!(obj as ObjectContainer3D).parent)
						{
							addMapObject(obj as ObjectContainer3D);
						}
						break;
					case AssetType.CAMERA:
						if (!(obj as ObjectContainer3D).parent)
						{
							addMapObject(obj as ObjectContainer3D);
						}
						break;
					case AssetType.PLANT_GROUP:
						var plantGroup : PlantGroup = obj as PlantGroup;
						_plantGroups.push(plantGroup);
						if (!(obj as ObjectContainer3D).parent)
						{
							addMapObject(obj as ObjectContainer3D);
						}
						break;
					case AssetType.DISTRICT:
						_district = obj as DistrictWithPath;
						_district.showWireframe = _showDistrictWireframe;
						_district.radiusForEntity = GlobalConfig.radiusForEntity;
						addMapObject(_district);
						generateDistrictNavMesh();
						break;
					case AssetType.GEOMETRY:
						for each (var subGeometry : SubGeometryBase in Geometry(obj).subGeometries)
						{
							subGeometry.vertexData;
						}
						break;
					case AssetType.ANIMATOR:
						IAnimator(obj).start(-Math.random() * _animatorRandom);
						_animatorMap.add(obj.name, obj);
						break;
					case AssetType.VIEW_3D:
						var view3DAsset : View3DAsset = obj as View3DAsset;
						_scene3D.view.colorlookupTable = view3DAsset.colorlookupTable;
						_cameraNear = view3DAsset.cameraNear;
						_cameraFar = view3DAsset.cameraFar;
						if (_scene3D.view.camera)
						{
							if (_scene3D.view.camera.lens is PerspectiveLens)
							{
								PerspectiveLens(_scene3D.view.camera.lens).fieldOfView = view3DAsset.cameraFieldOfView;
							}
//							if (view3DAsset.cameraOcclusionNear != 0)
//							{
//								Away3D.OCCLUSION_NEAR = view3DAsset.cameraOcclusionNear;
//							}
//							if (view3DAsset.cameraOcclusionMiddle != 0)
//							{
//								Away3D.OCCLUSION_MIDDLE = view3DAsset.cameraOcclusionMiddle;
//							}
						}
						Away3D.LOD_SCOPES = view3DAsset.lodScopes;
						if (view3DAsset.cameraMode2D)
						{
							GlobalConfig.mapCameraAngle = -view3DAsset.cameraMode2DAngle;
							PlanarContainer3D.planarRotationX = GlobalConfig.mapCameraAngle;
//							PlanarContainer3D.updatePlanarRotation(GlobalConfig.mapCameraAngle);
							
							_quadTree = null;
							_planarPartition ||= new PlanarPartition3D();
							this.partition = _planarPartition;
						}
						_view3DAsset = view3DAsset;
						_scene3D.view.screenSpaceShadowMaskRenderer.blurXGussianA = view3DAsset.blurXGussianA;
						_scene3D.view.screenSpaceShadowMaskRenderer.blurXGussianL = view3DAsset.blurXGussianL;
						_scene3D.view.screenSpaceShadowMaskRenderer.blurXSize = view3DAsset.blurXSize;
						_scene3D.view.screenSpaceShadowMaskRenderer.blurYGussianA = view3DAsset.blurYGussianA;
						_scene3D.view.screenSpaceShadowMaskRenderer.blurYGussianL = view3DAsset.blurYGussianL;
						_scene3D.view.screenSpaceShadowMaskRenderer.blurYSize = view3DAsset.blurYSize;
						_scene3D.view.screenSpaceShadowMaskRenderer.enable = view3DAsset.enableScreenSpaceShadow;
						_scene3D.view.screenSpaceShadowMaskRenderer.quality = view3DAsset.quality;
						
						Away3D.GAMMA_CORRECTION = view3DAsset.gammaCorrection;
						Away3D.GAMMA_VALUE = view3DAsset.gammaValue;
						
						break;
					case AssetType.FILTER_3D:
						_scene3D.addFilter3D(obj as Filter3DBase);
						break;
					default:
						break;
				}
			}
		}

		public function addObstaclePoints(mapPointSets : Vector.<MapPointSet>, onMeshComplete : Function = null) : void
		{//L.l("添加固定阻挡区域：");
			if (!mapPointSets || mapPointSets.length == 0)
				return;
			_nevMeshReady = false;
			_navMeshCompleteHandler = onMeshComplete;
			for each (var mapPointSet : MapPointSet in mapPointSets)
			{
				var name : String = mapPointSet.name;
				var points : Vector.<Vector3D> = mapPointSet.points;
				_obstaclePointsMap[name] = points;
				if (!_district)
					continue;
				var pointsSet : PointsSet = _obstaclePointsSetMap[name];
				_obstaclePointsSetMap[name] = null;
				delete _obstaclePointsSetMap[name];
				if (pointsSet)
					_district.removeInternalPointsSet(pointsSet);
				pointsSet = new PointsSet(PointsSetType.BLOCK, _district);
				pointsSet.points = points;
				_district.addInternalPointsSet(pointsSet);
				_obstaclePointsSetMap[name] = pointsSet;
			}
			if (_district)
				_district.generateNavMesh(onNavMeshGenerate);
		}

		public function removeObstaclePoints(names : Array, onMeshComplete : Function = null) : void
		{
			if (!names || names.length == 0)
				return;
			_nevMeshReady = false;
			_navMeshCompleteHandler = onMeshComplete;
			for each (var name : String in names)
			{
				_obstaclePointsMap[name] = null;
				delete _obstaclePointsMap[name];
				if (!_district)
					continue;
				var pointsSet : PointsSet = _obstaclePointsSetMap[name];
				_obstaclePointsSetMap[name] = null;
				delete _obstaclePointsSetMap[name];
				if (pointsSet)
					_district.removeInternalPointsSet(pointsSet);
			}
			if (_district)
				_district.generateNavMesh(onNavMeshGenerate);
		}

		private function generateDistrictNavMesh() : void
		{
			if (!_district)
				return;
			for (var name : String in _obstaclePointsMap)
			{
				var points : Vector.<Vector3D> = _obstaclePointsMap[name];
				var pointsSet : PointsSet = new PointsSet(PointsSetType.BLOCK, _district);
				pointsSet.points = points;
				_district.addInternalPointsSet(pointsSet);
				_obstaclePointsSetMap[name] = pointsSet;
			}
			_district.generateNavMesh(generateNavMeshComplete);
		}
		
		private function objTransformPlanared(obj : ObjectContainer3D) : void
		{
			if (obj && _view3DAsset && _view3DAsset.cameraMode2D && GlobalConfig.transformPlanared)
			{
				obj.z = GlobalConfig.transform2dValue(obj.y);
				//trace("objTransformPlanared:",obj.name);
			}
		}

		private function addMousePicker(o : ObjectContainer3D) : void
		{
			if (_mousePickerDisabled)
				return;
			var m : Mesh = o as Mesh;
			if (m)
			{
				if ((m.layerType & EntityLayerType.BLOCK) || (m.layerType & EntityLayerType.HALO_BLOCK))
				{
					m.pickingCollider = PickingColliderType.AS3_BEST_HIT;
				}
				if ((m.layerType & EntityLayerType.TERRAIN) || (m.layerType & EntityLayerType.MOUSE_TRIGGER))
				{
					m.pickingCollider = PickingColliderType.AS3_BEST_HIT;
					m.mouseEnabled = true;
					_mousePickerList.push(o);
					o.addEventListener(MouseEvent3D.MOUSE_UP, handleMouseUpEvent3D);
					o.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
					o.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
					o.addEventListener(MouseEvent3D.RIGHT_MOUSE_UP, handleRightMouseUpEvent3D);
					o.addEventListener(MouseEvent3D.RIGHT_MOUSE_DOWN, handleRightMouseDownEvent3D);
					if (_mousePickerMovable)
						o.addEventListener(MouseEvent3D.MOUSE_MOVE, handleMouseMoveEvent3D);
				}
				else if (_view3DAsset && _view3DAsset.cameraMode2D)
				{
					m.z = GlobalConfig.transform2dValue(m.y);
				}
			}
		}

		public function set mousePickerMovable(value : Boolean) : void
		{
			if (_mousePickerMovable == value)
				return;
			_mousePickerMovable = value;
			if (_mousePickerList)
			{
				for each (var o : ObjectContainer3D in _mousePickerList)
				{
					if (_mousePickerMovable)
						o.addEventListener(MouseEvent3D.MOUSE_MOVE, handleMouseMoveEvent3D);
					else
						o.removeEventListener(MouseEvent3D.MOUSE_MOVE, handleMouseMoveEvent3D);
				}
			}
		}

		public function setFogDistance(minDist : Number, maxDist : Number) : void
		{
			var fogMethods : Array = getFogMethods();
			for each (var fogMethod : FogMethod in fogMethods)
			{
				fogMethod.minDistance = minDist;
				fogMethod.maxDistance = maxDist;
			}
		}

		public function addMapObject(obj : ObjectContainer3D) : void
		{
			this.addChild(obj);
			_rootObjectByName.add(obj.name, obj);
		}

		public function setMapObjectsLightPicker(lightPicker : LightPickerBase) : void
		{
			_mapObjectsLightPicker = lightPicker;
			var objs : Array = _objMap.getValues();
			for each (var obj : IAsset in objs)
			{
				if (obj is Mesh)
				{
					var subMeshes : Vector.<SubMesh> = (obj as Mesh).subMeshes;
					var subLen : int = subMeshes.length;
					for (var i : int = 0; i < subLen; i++)
					{
						subMeshes[i].material.lightPicker = _mapObjectsLightPicker;
					}
				}
			}
		}

		private function onNavMeshGenerate() : void
		{
			_nevMeshReady = true;
			onNavMeshComplete();
		}

		private function generateNavMeshComplete() : void
		{
			onNavMeshGenerate();
			if (_nevMeshReady && _mapResourceReady)
				onMapComplete();
		}

		private function handleMouseUpEvent3D(e : MouseEvent3D) : void
		{
			if (InputManger.getInstance().isOperateLocked)
			{
				return;
			}
			var position : Vector3D = e.scenePosition;
			//派发事件
			//function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
			EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction3D.SCENE_MAP_MOUSE_UP, e, position, null, null);
		}

		private function handleMouseDownEvent3D(e : MouseEvent3D) : void
		{
			if (InputManger.getInstance().isOperateLocked)
			{
				return;
			}
			var position : Vector3D = e.scenePosition;
			//派发事件
			//function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
			EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction3D.SCENE_MAP_MOUSE_DOWN, e, position, null, null);
		}
		
		private function handleRightMouseUpEvent3D(e : MouseEvent3D) : void
		{
			if (InputManger.getInstance().isOperateLocked)
			{
				return;
			}
			var position : Vector3D = e.scenePosition;
			//派发事件
			//function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
			EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction3D.SCENE_MAP_RIGHT_MOUSE_UP, e, position, null, null);
		}
		
		private function handleRightMouseDownEvent3D(e : MouseEvent3D) : void
		{
			if (InputManger.getInstance().isOperateLocked)
			{
				return;
			}
			var position : Vector3D = e.scenePosition;
			//派发事件
			//function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
			EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction3D.SCENE_MAP_RIGHT_MOUSE_DOWN, e, position, null, null);
		}

		private function handleMouseMoveEvent3D(e : MouseEvent3D) : void
		{
			if (InputManger.getInstance().isOperateLocked)
			{
				return;
			}
			var position : Vector3D = e.scenePosition;
			//派发事件
			//function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
			EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction3D.SCENE_MAP_MOUSE_MOVE, e, position, null, null);
		}

		public function get isLoaded() : Boolean
		{
			return _isLoaded;
		}

		private function onResourceComplete(ev : LoaderEvent) : void
		{
			_isLoaded = true;
			_cameraNear = _cameraNear > 0 ? _cameraNear : 100;
			_cameraFar = _cameraFar > 0 ? _cameraFar : 12000;
			_scene3D.cameraNear = _cameraNear;
			_scene3D.cameraFar = _cameraFar;
			if (_quadTree)
				_quadTree.reBuildQuadTree();
			EventManager.dispatchEvent(MapLoadEvent.MAP_RESOURCE_COMPLETE);
			Stage3DLayerManager.stage3DProxy.addEventListener(Stage3DEvent.INIT_FRAME, onInitFrame);
		}

		private function onInitFrame(ev : Stage3DEvent) : void
		{
			Stage3DLayerManager.stage3DProxy.removeEventListener(Stage3DEvent.INIT_FRAME, onInitFrame);
			validateCastsShadows();
			generateHeightMap();
			_mapResourceReady = true;
			if ((_nevMeshReady || !_district) && _mapResourceReady)
				onMapComplete();
		}

		public function set castsShadows(value : Boolean) : void
		{
			if (_castsShadows == value)
				return;
			_castsShadows = value;
			validateCastsShadows();
		}

		public function set plantCastsShadows(value : Boolean) : void
		{
			if (_plantCastsShadows == value)
				return;
			_plantCastsShadows = value;
			validateCastsShadows();
		}

		private function validateCastsShadows() : void
		{
			for each (var plantGroup : PlantGroup in _plantGroups)
			{
				plantGroup.merge();
				plantGroup.castsShadows = _castsShadows && _plantCastsShadows;
			}
		}

		public function get castsShadows() : Boolean
		{
			return _castsShadows;
		}

		public function get plantCastsShadows() : Boolean
		{
			return _plantCastsShadows;
		}
		
		public function get plantGroups() : Vector.<PlantGroup>
		{
			return _plantGroups;
		}

		private function generateHeightMap() : void
		{
			if (_heightMapHelper && _district)
			{
				_heightMapHelper.generateHeightMap(_scene3D.view, _district.min, _district.max);
				updateDistrictWithHeightMap();
			}
		}

		private function onParseError(ev : ParserEvent) : void
		{
			Log.error(GlobalConfig.DEBUG_HEAD + " " + "地图解析错误：" + _mapUrl);
			trace(ev.message);
			clear();
			if (_onMapParseErrorHandler != null)
			{
				_onMapParseErrorHandler(this);
			}
			EventManager.dispatchEvent(MapLoadEvent.MAP_PARSE_ERROR);
		}

		private function onLoadError(ev : LoaderEvent) : void
		{
			Log.error(GlobalConfig.DEBUG_HEAD + " " + "地图加载错误：" + _mapUrl);
			clear();
			if (_onMapLoadErrorHandler != null)
			{
				_onMapLoadErrorHandler(this);
			}
			EventManager.dispatchEvent(MapLoadEvent.MAP_LOAD_ERROR);
		}

		private function onLoadProgress(e : AssetProgressEvent) : void
		{
			EventManager.dispatchEvent(MapLoadEvent.MAP_LOAD_PROGRESS, e.progress);
		}

		private function onParseProgress(e : AssetProgressEvent) : void
		{
			EventManager.dispatchEvent(MapLoadEvent.MAP_PARSE_PROGRESS, e.progress);
		}

		/**
		 * 地图加载完成
		 */
		private function onMapComplete() : void
		{
			if (_onMapCompleteHandler != null)
			{
				_onMapCompleteHandler(this);
			}
			EventManager.dispatchEvent(MapLoadEvent.MAP_LOAD_COMPLETE);
		}

		private function onNavMeshComplete() : void
		{
			if (_navMeshCompleteHandler != null)
			{
				_navMeshCompleteHandler(this);
				_navMeshCompleteHandler = null;
			}
		}

		private function addLoaderEvents() : void
		{
			if (!_loader)
				return;
			_loader.addEventListener(LoaderEvent.RESOURCE_COMPLETE, onResourceComplete);
			_loader.addEventListener(AssetEvent.ASSET_COMPLETE, onAssetComplete);
//			_loader.addEventListener(AssetEvent.ANIMATION_SET_COMPLETE, onAssetComplete);
//			_loader.addEventListener(AssetEvent.ANIMATION_STATE_COMPLETE, onAssetComplete);
//			_loader.addEventListener(AssetEvent.ANIMATION_NODE_COMPLETE, onAssetComplete);
//			_loader.addEventListener(AssetEvent.STATE_TRANSITION_COMPLETE, onAssetComplete);
//			_loader.addEventListener(AssetEvent.TEXTURE_COMPLETE, onAssetComplete);
//			_loader.addEventListener(AssetEvent.CONTAINER_COMPLETE, onAssetComplete);
//			_loader.addEventListener(AssetEvent.GEOMETRY_COMPLETE, onAssetComplete);
//			_loader.addEventListener(AssetEvent.MATERIAL_COMPLETE, onAssetComplete);
//			_loader.addEventListener(AssetEvent.MESH_COMPLETE, onAssetComplete);
//			_loader.addEventListener(AssetEvent.ENTITY_COMPLETE, onAssetComplete);
//			_loader.addEventListener(AssetEvent.SKELETON_COMPLETE, onAssetComplete);
//			_loader.addEventListener(AssetEvent.SKELETON_POSE_COMPLETE, onAssetComplete);

			_loader.addEventListener(LoaderEvent.LOAD_ERROR, onLoadError);
			_loader.addEventListener(ParserEvent.PARSE_ERROR, onParseError);
			_loader.addEventListener(AssetProgressEvent.LOAD_PROGRESS, onLoadProgress);
			_loader.addEventListener(AssetProgressEvent.PARSE_PROGRESS, onParseProgress);
		}

		private function removeLoaderEvents() : void
		{
			if (!_loader)
				return;
			_loader.removeEventListener(LoaderEvent.RESOURCE_COMPLETE, onResourceComplete);
			_loader.removeEventListener(AssetEvent.ASSET_COMPLETE, onAssetComplete);
//			_loader.removeEventListener(AssetEvent.ANIMATION_SET_COMPLETE, onAssetComplete);
//			_loader.removeEventListener(AssetEvent.ANIMATION_STATE_COMPLETE, onAssetComplete);
//			_loader.removeEventListener(AssetEvent.ANIMATION_NODE_COMPLETE, onAssetComplete);
//			_loader.removeEventListener(AssetEvent.STATE_TRANSITION_COMPLETE, onAssetComplete);
//			_loader.removeEventListener(AssetEvent.TEXTURE_COMPLETE, onAssetComplete);
//			_loader.removeEventListener(AssetEvent.CONTAINER_COMPLETE, onAssetComplete);
//			_loader.removeEventListener(AssetEvent.GEOMETRY_COMPLETE, onAssetComplete);
//			_loader.removeEventListener(AssetEvent.MATERIAL_COMPLETE, onAssetComplete);
//			_loader.removeEventListener(AssetEvent.MESH_COMPLETE, onAssetComplete);
//			_loader.removeEventListener(AssetEvent.ENTITY_COMPLETE, onAssetComplete);
//			_loader.removeEventListener(AssetEvent.SKELETON_COMPLETE, onAssetComplete);
//			_loader.removeEventListener(AssetEvent.SKELETON_POSE_COMPLETE, onAssetComplete);
			_loader.removeEventListener(LoaderEvent.LOAD_ERROR, onLoadError);
			_loader.removeEventListener(ParserEvent.PARSE_ERROR, onParseError);
			_loader.removeEventListener(AssetProgressEvent.LOAD_PROGRESS, onLoadProgress);
			_loader.removeEventListener(AssetProgressEvent.PARSE_PROGRESS, onParseProgress);
		}

		public function getAnimatorByName($name : String) : IAnimator
		{
			return _animatorMap.getValue($name);
		}

		public function getObj(name : String) : IAsset
		{
			return _objMap.getValue(name);
		}

		public function get rootObjectByName() : HashMap
		{
			return _rootObjectByName;
		}

		/**
		 * 通过x,z查找地图上指定点的Y高度
		 * @param x x坐标
		 * @param z z坐标
		 * @return y坐标
		 */
		public function queryHeightAt(x : Number, z : Number) : Number
		{
			if (_heightMapHelper)
				return _heightMapHelper.queryHeightAt(x, z);
			return 0;
		}

		/**
		 * 地图宽高属性
		 * @return
		 */
		public function get heightMapHelper() : HeightMapHelper
		{
			return _heightMapHelper;
		}

		/**
		 * 获得地图区域
		 * @return 地图区域
		 */
		public function get district() : DistrictWithPath
		{
			return _district;
		}

		public function get lights() : Vector.<LightBase>
		{
			return _lights;
		}

		public function get skyBox() : SkyBox
		{
			return _skyBox;
		}

		public function get weather() : Weather
		{
			return _weather;
		}

		/**
		 * 地图场景灯光
		 * @return 场景灯光
		 */
		public function getLightPickerByName(name : String) : LightPickerBase
		{
			if (!name)
				return null;
			return _lightPickerMap.getValue(name) as LightPickerBase;
		}

		public function getLightPicker(index : int) : LightPickerBase
		{
			var pickers : Array = _lightPickerMap.getValues();
			if (pickers.length > 0 && index > -1 && index < pickers.length)
				return pickers[index] as LightPickerBase;
			return null;
		}

		public function get nevMeshReady() : Boolean
		{
			return _nevMeshReady;
		}

		/**
		 * 添加需要监控（开关）的方法
		 * @param method
		 *
		 */
		private function addFogMethod(method : FogMethod) : void
		{
			if (!_fogMethodsMap.containsKey(method.name))
			{
				_fogMethodsMap.add(method.name, method);
				method.disabled = !_useFog;
			}
		}

		public function set useFog(value : Boolean) : void
		{
			if (_useFog == value)
				return;
			_useFog = value;
			_fogMethodsMap.eachValue(updateFogMethodDisable);
		}

		public function getFogMethodByName($name : String) : FogMethod
		{
			return _fogMethodsMap.getValue($name) as FogMethod;
		}

		public function getFogMethods() : Array
		{
			return _fogMethodsMap.getValues();
		}

		private function updateFogMethodDisable(effectMethod : EffectMethodBase) : void
		{
			effectMethod.disabled = !_useFog;
		}

		private function addRimMethod(method : RimLightMethod) : void
		{
			if (!_rimMethodsMap.containsKey(method.name))
			{
				_rimMethodsMap.add(method.name, method);
				method.disabled = !_useRim;
			}
		}

		public function set useRim(value : Boolean) : void
		{
			if (_useRim == value)
				return;
			_useRim = value;
			_rimMethodsMap.eachValue(updateRimMethodDisable);
		}

		private function updateRimMethodDisable(effectMethod : EffectMethodBase) : void
		{
			effectMethod.disabled = !_useRim;
		}

		private function addLightPicker(lightPicker : LightPickerBase) : void
		{
			_lightPickerMap.add(lightPicker.name, lightPicker);
		}

		private function addFogByHeightMethod(method : FogByHeightMethod) : void
		{
			if (!_fogByHeightMethodsMap.containsKey(method.name))
			{
				_fogByHeightMethodsMap.add(method.name, method);
				method.disabled = !_useFogByHeight;
			}
		}

		public function set useFogByHeight(value : Boolean) : void
		{
			if (_useFogByHeight == value)
			{
				return;
			}
			_useFogByHeight = value;
			_fogByHeightMethodsMap.eachValue(updateFogByHeightDisable);
		}

		public function getFogByHeightMethodByName($name : String) : FogByHeightMethod
		{
			return _fogByHeightMethodsMap.getValue($name);
		}

		private function updateFogByHeightDisable(effectMethod : EffectMethodBase) : void
		{
			effectMethod.disabled = !_useFogByHeight;
		}

		private function addLight(light : LightBase) : void
		{
			if (!light)
				return;
			if (_lights.indexOf(light) == -1)
			{
				_lights.push(light);
			}
		}

		public function set useLight(value : Boolean) : void
		{
			_useLight = value; //TODO 暂时不需要实现
		}

		public function set showDistrictWireframe(value : Boolean) : void
		{
			_showDistrictWireframe = value;
			if (_district)
			{
				_district.showWireframe = _showDistrictWireframe;
				if (_mapResourceReady)
				{
					updateDistrictWithHeightMap();
				}
			}
		}

		public function get showDistrictWireframe() : Boolean
		{
			return _showDistrictWireframe;
		}
        
        public function set xyzMode(value : int) : void {
            this._xyzMode = value;
        }

		public function get cameraNear() : int
		{
			return _cameraNear;
		}

		public function get cameraFar() : int
		{
			return _cameraFar;
		}
		
		public function get animatorRandom() : int
		{
			return _animatorRandom;
		}
		
		public function set animatorRandom(value : int) : void
		{
			_animatorRandom = value;
		}

		private function updateDistrictWithHeightMap() : void
		{
			if (!_showDistrictWireframe)
				return;
			if (_heightMapHelper && _district)
			{
				HeightMapHelperProxy.traslateVector3Ds(_heightMapHelper,_district.boundPointsSet.points, this._xyzMode);
				_district.boundPointsSet.updateWireFrame();
				for (var j : int = 0; j < _district.internalPointsSets.length; j++)
				{
					var ps : PointsSet = _district.internalPointsSets[j];
					HeightMapHelperProxy.traslateVector3Ds(_heightMapHelper,ps.points, this._xyzMode);
					ps.updateWireFrame();
				}
			}
		}
		
		public function setLayerVisible(value:Boolean):void
		{
			this.visible = value;
			
			var animators:Array = _animatorMap.getValues();
			for each (var animator:IAnimator in animators) 
			{
				if (animator)
				{
					if (value)
						animator.start(-Math.random() * _animatorRandom);
					else
						animator.stop();
				}
			}
		}

		public function clear() : void
		{
			while (this.numChildren > 0)
			{
				var child : ObjectContainer3D = getChildAt(0);
				this.removeChildAt(0);
				child.dispose();
			}

			_nevMeshReady = false;
			_mapResourceReady = false;
			_fogMethodsMap.clear();
			_rimMethodsMap.clear();
			_animatorMap.clear();
			_objMap.clear();
			_rootObjectByName.clear();

			var name : String;
			for (name in _obstaclePointsMap)
			{
				_obstaclePointsMap[name] = null;
				delete _obstaclePointsMap[name];
			}
			for (name in _obstaclePointsSetMap)
			{
				_obstaclePointsSetMap[name] = null;
				delete _obstaclePointsSetMap[name];
			}
			_plantGroups.length = 0;

			if (_mousePickerList)
			{
				for each (var o : ObjectContainer3D in _mousePickerList)
				{
					o.removeEventListener(MouseEvent3D.MOUSE_UP, handleMouseUpEvent3D);
					o.removeEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
					o.removeEventListener(MouseEvent3D.RIGHT_MOUSE_UP, handleRightMouseUpEvent3D);
					o.removeEventListener(MouseEvent3D.RIGHT_MOUSE_DOWN, handleRightMouseDownEvent3D);
					if (_mousePickerMovable)
						o.removeEventListener(MouseEvent3D.MOUSE_MOVE, handleMouseMoveEvent3D);
				}
				_mousePickerList.length = 0;
				_mousePickerList = null;
			}

			if (_materials)
			{
				for each (var material : MaterialBase in _materials)
				{
					material.dispose();
				}
				_materials.length = 0;
			}

			for each (var light : LightBase in _lights)
			{
				if (light.parent)
				{
					light.parent.removeChild(light);
				}
				light.dispose();
			}
			_lights.length = 0;

			var lightPickers : Array = _lightPickerMap.getValues();
			for each (var lightPicker : LightPickerBase in lightPickers)
			{
				lightPicker.dispose();
			}
			_lightPickerMap.clear();

			if (_mapObjectsLightPicker)
			{
				_mapObjectsLightPicker.dispose();
				_mapObjectsLightPicker = null;
			}
			if (_skyBox)
			{
				_skyBox.dispose();
				_skyBox = null;
			}
			if (_weather)
			{
				_weather.dispose();
				_weather = null;
			}
			removeLoaderEvents();
			if (_sceneMapData)
			{
				_sceneMapData.removeErrorHandler(onDataErrorHandler);
				_sceneMapData.removeMiniMapErrorHandler(onMiniMapErrorHandler);
				_sceneMapData.removeRadarMapErrorHandler(onRadarMapErrorHandler);
				SceneMapDataManager.removeMapData(this, _sceneMapData.mapName);
				_sceneMapData = null;
			}
			if (_loader)
			{
				_loader.stop();
				_loader.disposeGPUResource();
				_loader = null;
			}

			_heightMapHelper = null;
			
			if (_district)
			{
				_district.dispose();
				_district = null;
			}
			_scene3D.view.colorlookupTable = null;
			_onDataCompleteHandler = null;
			_onDataErrorHandler = null;
			_onMapCompleteHandler = null;
			_onMapLoadErrorHandler = null;
			_onMapParseErrorHandler = null;
			_navMeshCompleteHandler = null;
			_mapUrl = null;
			_priority = 0;
			_cameraNear = 0;
			_cameraFar = 0;
			_isLoaded = false;
		}

		public function destroy() : void
		{
			clear();
			dispose();
		}
	}
}
