package com.game.engine3D.core
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.scene.SceneRender3D;
	import com.game.engine3D.scene.layers.SceneMapLayer;
	import com.game.engine3D.scene.layers.SceneRenderLayer;
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.BaseEntity;
	import com.game.engine3D.scene.render.vo.MethodData;
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.engine3D.vo.BaseObjSyncInfo;
	import com.game.engine3D.vo.BaseRole;
	import com.game.engine3D.vo.CameraObjSyncInfo;
	import com.game.engine3D.vo.MapTextureLoader;
	
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	
	import away3d.cameras.Camera3D;
	import away3d.cameras.lenses.OrthographicOffCenterLens;
	import away3d.cameras.lenses.PerspectiveLens;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.enum.ShadowMapMethodType;
	import away3d.enum.ShadowMapperType;
	import away3d.filters.Filter3DBase;
	import away3d.filters.GlowFilter3D;
	import away3d.filters.GodRayFilter3D;
	import away3d.filters.HeatFilter3D;
	import away3d.filters.OutlineGlowFilter3D;
	import away3d.filters.PhantomFilter3D;
	import away3d.filters.RingDepthOfFieldFilter3D;
	import away3d.lights.DirectionalLight;
	import away3d.lights.LightBase;
	import away3d.materials.lightpickers.LightPickerBase;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.materials.methods.FogMethod;
	import away3d.materials.methods.ShadingMethodBase;
	import away3d.utils.SoundUtil;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.DHash;
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *
	 * 游戏3D场景
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:26:37
	 *
	 */
	public class GameScene3D extends ObjectContainer3D
	{
		/**默认的近平面*/
		public static const DEFAULT_CAMERA_NEAR:int = 100;
		/**默认的远平面*/
		public static const DEFAULT_CAMERA_FAR:int = 12000;
		/**
		 * 主角同步位置点光灯光名
		 */
		public static var MAIN_CHAR_SYNC_POS_LIGHT_NAME : String = "MAIN_CHAR_SYNC_POS_LIGHT";
		/**
		 * 实体区域方向光灯光名
		 */
		public static var ENTITY_AREA_DIRECTIONAL_LIGHT_NAME : String = "ENTITY_AREA_DIRECTIONAL_LIGHT";
		/**
		 * 场景区域方向光灯光名
		 */
		public static var SCENE_AREA_DIRECTIONAL_LIGHT_NAME : String = "SCENE_AREA_DIRECTIONAL_LIGHT";
		/**
		 * 场景实体（玩家、英雄等）灯光拾取器名
		 */
		public static var SCENE_ENTITY_LIGHT_PICKER_NAME : String = "SCENE_ENTITY_LIGHT_PICKER";
		/**
		 * 区域图尺寸
		 */
		public static var AREA_MAP_SIZE : uint = 1024;
		
		/** 残影滤镜  **/
		private var _phantomFilter : PhantomFilter3D;
		/** 热扭曲滤镜  **/
		private var _heatFilter : HeatFilter3D;
		/** 发光滤镜  **/
		private var _glowFilter : GlowFilter3D;
		/** 外发光滤镜  **/
		private var _outlineGlowFilter : OutlineGlowFilter3D;
		/** 美术通过引擎工具设置的滤镜  **/
		private var _sceneArtFilters : Vector.<Filter3DBase>;
		private var _viewFilters : Vector.<Filter3DBase>;
		private var _useRingDepthOfFieldFilter : Boolean = true;
		private var _useGodRayFilter : Boolean = true;
		private var _ringDepthOfFieldFilter3D : RingDepthOfFieldFilter3D;
		
		private var _sceneName : String;
		private var _glow : Boolean = true;
		private var _phantom : Boolean = true;
		private var _heat : Boolean = true;
		private var _blur : Boolean = false;
		/**
		 * 地图层
		 */
		private var _sceneMapLayer : SceneMapLayer;
		private var _shadowMethods : Vector.<ShadingMethodBase>;
		/** 实体区域方向光顶灯 **/
		private var _entityAreaDirectionalLight : DirectionalLight;
		/** 场景区域方向光顶灯 **/
		private var _sceneAreaDirectionalLight : DirectionalLight;
		/** 主角同步位置点光灯 **/
		private var _mainCharSyncPosLight : LightBase;
		private var _mainCharSyncLightDirection : Vector3D;
		private var _internalLightPicker : LightPickerBase;
		/** 默认软级联阴影 **/
		private var _shadowLevel : int = 4;
		private var _lightFarPlane : Number = 0;
		private var _lightRange : Number = 3;
		private var _lightNumSamples : int = 7;
		private var _areaMaps : Vector.<AreaMap>;
		/**
		 * 角色换装层
		 */
		private var _sceneRenderLayer : SceneRenderLayer;
		private var _sceneObjMap : DHash;
		private var _sceneRoleList : Vector.<BaseRole>;
		private var _renderUnitList : Vector.<RenderUnit3D>;
		/**
		 *
		 * 场景渲染器
		 */
		public var sceneRender : SceneRender3D;
		private var _viewDistance : Number;
		private var _view : View3D;
		private var _camera : Camera3D;
		private var _cameraNear : int;
		private var _cameraFar : int;
		private var _cameraFarMin:int;
		private var _cameraTarget : ObjectContainer3D;
		private var _mainChar : BaseRole;
		private var _isLoading : Boolean;
		
		/** 空的光照对象 **/
		private var _lightNullObject : ObjectContainer3D;
		
		private var _disableShadowLevel : Boolean;
		
		public function GameScene3D(name : String, view : View3D, viewDistance : int = 1000, areaMapLayer : int = 0, viewFilter : Function = null)
		{
			super();
			_sceneName = name;
			_isLoading = false;
			
			_sceneObjMap = new DHash();
			_sceneRoleList = new Vector.<BaseRole>();
			_renderUnitList = new Vector.<RenderUnit3D>();
			
			_sceneMapLayer = new SceneMapLayer(this);
			addChild(_sceneMapLayer);
			
			_sceneRenderLayer = new SceneRenderLayer(this, viewFilter);
			addChild(_sceneRenderLayer);
			_shadowMethods = new Vector.<ShadingMethodBase>();
			
			if (areaMapLayer > 0)
			{
				_areaMaps = new Vector.<AreaMap>();
				for (var i : int = 0; i < areaMapLayer; i++)
				{
					var areaMap : AreaMap = new AreaMap(AREA_MAP_SIZE, AREA_MAP_SIZE);
					_areaMaps.push(areaMap);
				}
			}
			
			//创建场景渲染器
			sceneRender = new SceneRender3D(this);
			_view = view;
			_camera = _view.camera;
			_viewDistance = viewDistance;
			
			if (_camera.lens is PerspectiveLens)
			{
				(_camera.lens as PerspectiveLens).fieldOfView = 45;
			}
			else if (_camera.lens is OrthographicOffCenterLens)
			{
				
			}
			
			cameraNear = DEFAULT_CAMERA_NEAR;
			cameraFar = DEFAULT_CAMERA_FAR;
			_camera.position = new Vector3D(0, 200, -1000);
			_camera.rotationX = 0;
			_camera.rotationY = 0;
			_camera.rotationZ = 0;
			_sceneArtFilters = new Vector.<Filter3DBase>();
			_viewFilters = new Vector.<Filter3DBase>();
			_phantomFilter = new PhantomFilter3D(0.95, 0.7);
			_heatFilter = new HeatFilter3D();
			_glowFilter = new GlowFilter3D();
			resetViewFilters();
		}
		
		public function get isLoading() : Boolean
		{
			return _isLoading;
		}
		
		public function get disableShadowLevel() : Boolean
		{
			return _disableShadowLevel;
		}
		
		/**
		 * 禁用shadow level设置
		 * @param value
		 *
		 */
		public function set disableShadowLevel(value : Boolean) : void
		{
			_disableShadowLevel = value;
		}
		
		public function setOutlineGlowFilter(value : OutlineGlowFilter3D) : void
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
		
		/** 滤镜  **/
		public function get ringDepthOfFieldFilter3D() : RingDepthOfFieldFilter3D
		{
			return _ringDepthOfFieldFilter3D;
		}
		
		/** 场景区域方向光顶灯 **/
		public function get sceneAreaDirectionalLight() : DirectionalLight
		{
			return _sceneAreaDirectionalLight;
		}
		
		/** 实体区域方向光顶灯 **/
		public function get entityAreaDirectionalLight() : DirectionalLight
		{
			return _entityAreaDirectionalLight;
		}
		
		/** 主角同步位置点光灯 **/
		public function get mainCharSyncPosLight() : LightBase
		{
			return _mainCharSyncPosLight;
		}
		
		public function get mainCharSyncLightDirection() : Vector3D
		{
			return _mainCharSyncLightDirection;
		}
		
		public function get shadowLevel() : int
		{
			return _shadowLevel;
		}
		
		/**
		 * 0:不启用阴影
		 * 1:硬非级联阴影
		 * 2:硬级联阴影
		 * 3:软非级联阴影
		 * 4:软级联阴影
		 * 5:最高品质的阴影
		 * @param value
		 *
		 */
		public function set shadowLevel(value : int) : void
		{
			if (_shadowLevel == value)
				return;
			_shadowLevel = value;
			validateShadow();
			validateAreaDirectionalLight();
		}
		
		private function validateShadow() : void
		{
			if (!_entityAreaDirectionalLight || GlobalConfig.use2DMap || _disableShadowLevel)
			{
				return;
			}
			switch (_shadowLevel)
			{
				case 0:
				{
					_entityAreaDirectionalLight.castsShadows = false;
					break;
				}
				case 1:
				{
					_entityAreaDirectionalLight.depthMapSize = 1024;
					_entityAreaDirectionalLight.castsShadows = true;
					_entityAreaDirectionalLight.shadowMapMethodType = ShadowMapMethodType.HARD;
					_entityAreaDirectionalLight.shadowMapperType = ShadowMapperType.DIRECTIONAL;
					if (_view && _view.screenSpaceShadowMaskRenderer.enable)
					{
						_view.screenSpaceShadowMaskRenderer.quality = 0.5;
					}
					break;
				}
				case 2:
				{
					_entityAreaDirectionalLight.depthMapSize = 1024;
					_entityAreaDirectionalLight.castsShadows = true;
					_entityAreaDirectionalLight.shadowMapMethodType = ShadowMapMethodType.HARD;
					_entityAreaDirectionalLight.shadowMapperType = ShadowMapperType.CASCADE;
					if (_view && _view.screenSpaceShadowMaskRenderer.enable)
					{
						_view.screenSpaceShadowMaskRenderer.quality = 0.65;
					}
					break;
				}
				case 3:
				{
					_entityAreaDirectionalLight.depthMapSize = 1024;
					_entityAreaDirectionalLight.castsShadows = true;
					_entityAreaDirectionalLight.shadowMapMethodType = ShadowMapMethodType.SOFT;
					_entityAreaDirectionalLight.shadowMapperType = ShadowMapperType.DIRECTIONAL;
					_lightRange = 2;
					_lightNumSamples = 7;
					if (_view && _view.screenSpaceShadowMaskRenderer.enable)
					{
						_view.screenSpaceShadowMaskRenderer.quality = 0.8;
					}
					break;
				}
				case 4:
				{
					_entityAreaDirectionalLight.depthMapSize = 1024;
					_entityAreaDirectionalLight.castsShadows = true;
					_entityAreaDirectionalLight.shadowMapMethodType = ShadowMapMethodType.SOFT;
					_entityAreaDirectionalLight.shadowMapperType = ShadowMapperType.CASCADE;
					_lightRange = 3;
					_lightNumSamples = 11;
					if (_view && _view.screenSpaceShadowMaskRenderer.enable)
					{
						_view.screenSpaceShadowMaskRenderer.quality = 1.0;
					}
					break;
				}
				case 5:
				{
					_entityAreaDirectionalLight.depthMapSize = 2048;
					_entityAreaDirectionalLight.castsShadows = true;
					_entityAreaDirectionalLight.shadowMapMethodType = ShadowMapMethodType.SOFT;
					_entityAreaDirectionalLight.shadowMapperType = ShadowMapperType.CASCADE;
					_lightRange = 4;
					_lightNumSamples = 17;
					if (_view && _view.screenSpaceShadowMaskRenderer.enable)
					{
						_view.screenSpaceShadowMaskRenderer.quality = 1.0;
					}
					break;
				}
			}
		}
		
		public function set cameraNear(value : int) : void
		{
			_cameraNear = value;
			_view.camera.lens.near = _cameraNear;
		}
		
		public function set cameraFar(value : int) : void
		{
			if (value <= 0)
			{
				return;
			}
			_cameraFar = value;
			_view.camera.lens.far = Math.max(_cameraFar,_cameraFarMin);
		}
		
		/**最小的远平面值*/
		public function set cameraFarMin(value:int):void
		{
			_cameraFarMin = value;
			cameraFar = _cameraFar;
		}
		
		public function get blur() : Boolean
		{
			return _blur;
		}
		
		public function set blur(value : Boolean) : void
		{
			if (_blur == value)
				return;
			_blur = value;
			resetViewFilters();
		}
		
		public function get heat() : Boolean
		{
			return _heat;
		}
		
		public function set heat(value : Boolean) : void
		{
			if (_heat == value)
				return;
			_heat = value;
			resetViewFilters();
		}
		
		public function get phantom() : Boolean
		{
			return _phantom;
		}
		
		public function set phantom(value : Boolean) : void
		{
			if (_phantom == value)
				return;
			_phantom = value;
			resetViewFilters();
		}
		
		public function get glow() : Boolean
		{
			return _glow;
		}
		
		public function set glow(value : Boolean) : void
		{
			if (_glow == value)
				return;
			_glow = value;
			resetViewFilters();
		}
		
		public function get useRingDepthOfFieldFilter() : Boolean
		{
			return _useRingDepthOfFieldFilter;
		}
		
		public function set useRingDepthOfFieldFilter(value : Boolean) : void
		{
			if (_useRingDepthOfFieldFilter == value)
				return;
			_useRingDepthOfFieldFilter = value;
			resetViewFilters();
		}
		
		public function get useGodRayFilter() : Boolean
		{
			return _useGodRayFilter;
		}
		
		public function set useGodRayFilter(value : Boolean) : void
		{
			if (_useGodRayFilter == value)
				return;
			_useGodRayFilter = value;
			resetViewFilters();
		}
		
		public function addFilter3D(value : Filter3DBase) : void
		{
			if (value is RingDepthOfFieldFilter3D)
			{
				_ringDepthOfFieldFilter3D = value as RingDepthOfFieldFilter3D;
			}
			_sceneArtFilters.push(value);
			resetViewFilters();
		}
		
		private function resetViewFilters() : void
		{
			_viewFilters.length = 0;
			if (_glow) //glow必须放在之前
				_viewFilters.push(_glowFilter);
			if (_heat)
				_viewFilters.push(_heatFilter);
			if (_phantom)
				_viewFilters.push(_phantomFilter);
			if (_outlineGlowFilter)
				_viewFilters.push(_outlineGlowFilter);
			for each (var filter3D : Filter3DBase in _sceneArtFilters)
			{
				if (filter3D is RingDepthOfFieldFilter3D)
				{
					if (_useRingDepthOfFieldFilter)
					{
						_viewFilters.push(filter3D);
					}
				}
				else if (filter3D is GodRayFilter3D)
				{
					if (_useGodRayFilter)
					{
						_viewFilters.push(filter3D);
					}
				}
				else
				{
					_viewFilters.push(filter3D);
				}
			}
			_view.filters3d = _viewFilters;
		}
		
		public function get lightRange() : Number
		{
			return _lightRange;
		}
		
		public function set lightRange(value : Number) : void
		{
			if (_lightRange == value)
				return;
			_lightRange = value;
			validateAreaDirectionalLight();
		}
		
		public function get lightNumSamples() : int
		{
			return _lightNumSamples;
		}
		
		public function set lightNumSamples(value : int) : void
		{
			if (_lightNumSamples == value)
				return;
			_lightNumSamples = value;
			validateAreaDirectionalLight();
		}
		
		public function get lightFarPlane() : Number
		{
			return _lightFarPlane;
		}
		
		public function set lightFarPlane(value : Number) : void
		{
			if (_lightFarPlane == value)
				return;
			_lightFarPlane = value;
			validateAreaDirectionalLight();
		}
		
		private function validateAreaDirectionalLight() : void
		{
			if (_disableShadowLevel || GlobalConfig.use2DMap)
			{
				return;
			}
			if (!_entityAreaDirectionalLight)
			{
				return;
			}
			
			_entityAreaDirectionalLight.range = _lightRange;
			_entityAreaDirectionalLight.numSamples = _lightNumSamples;
			
			if (_entityAreaDirectionalLight.shadowMapperType == ShadowMapperType.CASCADE)
			{
				_entityAreaDirectionalLight.farPlane = clamp(5000, 15000, _lightFarPlane * 8);
			}
			else
			{
				_entityAreaDirectionalLight.farPlane = clamp(1200, 5000, _lightFarPlane * 3);
			}
			EventManager.dispatchEvent(SceneEvent.VALIDATE_AREA_DIRECTIONALLIGHT);
		}
		
		private function clamp(min : Number, max : Number, value : Number) : Number
		{
			if (value < min)
			{
				return min;
			}
			else if (value > max)
			{
				return max;
			}
			else
			{
				return value;
			}
		}
		
		/**
		 * 场景主角
		 */
		public function set mainChar(value : BaseRole) : void
		{
			_mainChar = value;
			if (_mainChar)
			{
				_mainChar.canRemoved = false;
				_mainChar.isMainChar = true;
			}
		}
		
		public function get mainChar() : BaseRole
		{
			return _mainChar;
		}
		
		public function get sceneName() : String
		{
			return _sceneName;
		}
		
		/** 视口对象 **/
		public function get view() : View3D
		{
			return _view;
		}
		
		/** 摄像机对象 **/
		public function get camera() : Camera3D
		{
			return _view ? _view.camera : null;
		}
		
		/**
		 * @private
		 * 场景所有角色集合
		 */
		public function get sceneObjList() : Vector.<BaseObj3D>
		{
			return _sceneRenderLayer.baseObjList;
		}
		
		/**
		 * @private
		 * 场景所有角色集合
		 */
		public function get sceneRoleList() : Vector.<BaseRole>
		{
			return _sceneRoleList;
		}
		
		public function get renderUnitList() : Vector.<RenderUnit3D>
		{
			return _renderUnitList;
		}
		
		/**
		 * 向场景中添加角色
		 * @param obj
		 */
		public function addSceneObj(obj : BaseObj3D, parent : ObjectContainer3D = null, needInViewDist : Boolean = true, renderLimitable : Boolean = false) : void
		{
			if (!obj)
			{
				trace("====================添加了空对象到场景！");
				return;
			}
			if (!obj.type || isNaN(obj.id))
			{
				trace("====================添加的场景对象id或type未设置, id:" + obj.id + ",type:" + obj.type);
				return;
			}
			var oldObj : BaseObj3D = _sceneObjMap.getValue(obj.id + "_" + obj.type);
			if (oldObj == obj)
			{
				return;
			}
			if (oldObj)
			{
				trace("====================移除已经存在的对象, id:" + oldObj.id + ",type:" + oldObj.type);
				removeSceneObj(oldObj, true);
			}
			
			obj.sceneName = _sceneName;
			if (obj is RenderUnit3D)
			{
				(obj as RenderUnit3D).lightPicker = entityLightPicker;
			}
			else if (obj is RenderSet3D)
			{
				(obj as RenderSet3D).lightPicker = entityLightPicker;
			}
			else if (obj is BaseEntity)
			{
				(obj as BaseEntity).avatar.lightPicker = entityLightPicker;
			}
			addFogMethods(obj);
			_sceneRenderLayer.addBaseObj(obj, parent, needInViewDist, renderLimitable);
			////////////////////////////////////////////
			var index : int;
			if (obj is BaseRole)
			{
				index = _sceneRoleList.indexOf(obj as BaseRole);
				if (index == -1)
					_sceneRoleList.push(obj as BaseRole);
			}
			////////////////////////////////////////////
			if (obj is RenderUnit3D)
			{
				index = _renderUnitList.indexOf(obj as RenderUnit3D);
				if (index == -1)
					_renderUnitList.push(obj as RenderUnit3D);
			}
			//需要添加的对象和key的对应关系唯一
			_sceneObjMap.addForValue(obj, obj.id + "_" + obj.type);
		}
		
		private function addFogMethods(obj : BaseObj3D) : void
		{
			if (_sceneMapLayer)
			{
				var fogMethods : Array = _sceneMapLayer.getFogMethods();
				for each (var fogMethod : FogMethod in fogMethods)
				{
					if (obj is RenderUnit3D)
					{
						RenderUnit3D(obj).addMethod(new MethodData(fogMethod));
					}
					else if (obj is RenderSet3D)
					{
						RenderSet3D(obj).addMethod(new MethodData(fogMethod));
					}
					else if (obj is BaseEntity)
					{
						BaseEntity(obj).avatar.addMethod(new MethodData(fogMethod));
					}
				}
			}
		}
		
		/**
		 * 从场景中移除角色
		 * @param obj
		 * @param recycle 是否池回收
		 */
		public function removeSceneObj(obj : BaseObj3D, recycle : Boolean = true) : void
		{
			////////////////////////////////////////////
			if (!obj)
			{
				return;
			}
			//先做个判断
			if (!obj.canRemoved)
			{
				trace("不能移除该场景对象, ID:" + obj.id + ",type:" + obj.type);
				return;
			}
			var index : int = _sceneRoleList.indexOf(obj as BaseRole);
			if (index != -1)
				_sceneRoleList.splice(index, 1);
			////////////////////////////////////////////
			index = _renderUnitList.indexOf(obj as RenderUnit3D);
			if (index != -1)
				_renderUnitList.splice(index, 1);
			//
			_sceneObjMap.removeForValue(obj);
			_sceneRenderLayer.removeBaseObj(obj, recycle);
		}
		
		/**
		 * 从场景中移除所有可以移除的角色
		 * @param recycle 是否池回收
		 */
		public function removeAllSceneObj(recycle : Boolean = true) : void
		{
			var list : Vector.<BaseObj3D> = sceneObjList;
			var len : int = list.length;
			while (len-- > 0)
			{
				if (list.length > len)
				{
					removeSceneObj(list[len], recycle);
				}
			}
		}
		
		/**
		 * 从场景中移除所有角色
		 * @param type
		 * @param $recycle 是否池回收
		 */
		public function removeSceneObjByType(type : String, recycle : Boolean = true) : void
		{
			var list : Array = _sceneRenderLayer.getBaseObjByType(type);
			var len : int = list.length;
			while (len-- > 0)
			{
				removeSceneObj(list[len]);
			}
		}
		
		/**
		 * 从场景中移除角色(通过ID和类型)
		 * @param id
		 * @param type
		 * @param recycle 是否池回收
		 */
		public function removeSceneObjByID(id : Number, type : String, recycle : Boolean = true) : void
		{
			var obj : BaseObj3D = _sceneObjMap.getValue(id + "_" + type);
			if (!obj)
			{
				trace("移除不存在的对象, id:" + id + ",type:" + type);
			}
			removeSceneObj(obj, recycle);
		}
		
		/**
		 * 从场景中查找角色
		 * @parm id 角色ID
		 * @parm type 角色类型
		 */
		public function getSceneObjByID(id : Number, type : String) : BaseObj3D
		{
			var obj : BaseObj3D = _sceneObjMap.getValue(id + "_" + type);
			if (obj && obj.usable)
			{
				return obj;
			}
			else
			{
				_sceneObjMap.removeForKey(id + "_" + type);
			}
			return null;
		}
		
		/**
		 *根据id和对象更新 
		 * @param id
		 * @param obj
		 * 
		 */
		public function updateSceneObjID(id:Number,obj:BaseObj3D):void
		{
			var key:String=_sceneObjMap.getKey(obj);
			if(key){
				_sceneObjMap.removeForKey(key);
			}
			_sceneObjMap.addForKey(id+"_"+obj.type,obj);
		}
		
		/**
		 * 从场景中查找角色
		 * @parm type 角色类型
		 */
		public function getSceneObjsByType(type : String) : Array
		{
			return _sceneRenderLayer.getBaseObjByType(type);
		}
		
		public function get entityLightPicker() : LightPickerBase
		{
			if (_sceneMapLayer)
			{
				var lightPicker : LightPickerBase = _sceneMapLayer.getLightPickerByName(SCENE_ENTITY_LIGHT_PICKER_NAME);
				if (!lightPicker)
					lightPicker = _sceneMapLayer.getLightPicker(0);
				if (!lightPicker)
				{
					if (!_internalLightPicker && _entityAreaDirectionalLight)
					{
						_internalLightPicker = new StaticLightPicker([_entityAreaDirectionalLight]);
						_internalLightPicker.name = "internalLightPicker";
					}
					lightPicker = _internalLightPicker;
				}
				return lightPicker;
			}
			return null;
		}
		
		public function get viewDistance() : Number
		{
			return _viewDistance;
		}
		
		public function set viewDistance(value : Number) : void
		{
			_viewDistance = value;
		}
		
		/**
		 * 获得虚拟的空的光照对象
		 * @return 光照对象
		 */
		private function get lightNullObject() : ObjectContainer3D
		{
			if (_lightNullObject == null)
			{
				_lightNullObject = new ObjectContainer3D();
				_view.scene.addChild(_lightNullObject);
			}
			return _lightNullObject;
		}
		
		public function getCameraTarget() : ObjectContainer3D
		{
			if (_cameraTarget == null)
			{
				_cameraTarget = new ObjectContainer3D();
				_cameraTarget.name = "cameraTarget";
				_view.scene.addChild(_cameraTarget);
			}
			return _cameraTarget;
		}
		
		public function clearAreaMap(index : int) : void
		{
			var areaMap : AreaMap = getAreaMap(index);
			if (areaMap)
				areaMap.clear();
		}
		
		public function clearAllAreaMap() : void
		{
			if (_areaMaps)
			{
				for each (var areaMap : AreaMap in _areaMaps)
				{
					areaMap.clear();
				}
			}
		}
		
		public function clear() : void
		{
			_isLoading = false;
			if (_internalLightPicker)
			{
				_internalLightPicker.dispose();
				_internalLightPicker = null;
			}
			if (_entityAreaDirectionalLight)
			{
				_entityAreaDirectionalLight.dispose();
				_entityAreaDirectionalLight = null;
			}
			if (_sceneAreaDirectionalLight)
			{
				_sceneAreaDirectionalLight.dispose();
				_sceneAreaDirectionalLight = null;
			}
			
			_mainCharSyncLightDirection = null;
			//停止渲染
			sceneRender.stopRender();
			clearAllAreaMap();
			if (_mainChar)
			{
				_mainChar.removeSyncInfo(_cameraTarget);
				_mainChar.removeSyncInfo(_mainCharSyncPosLight);
				_mainChar.avatar.lightPicker = null;
			}
			if (_mainCharSyncPosLight)
			{
				_mainCharSyncPosLight.dispose();
				_mainCharSyncPosLight = null;
			}
			_sceneMapLayer.clear();
			
			var baseObjList : Array = _sceneObjMap.getValues();
			for (var i : int = baseObjList.length - 1; i > 0; i--)
			{
				var baseObj : BaseObj3D = baseObjList[i];
				if (baseObj is RenderUnit3D)
				{
					(baseObj as RenderUnit3D).lightPicker = null;
				}
				else if (baseObj is RenderSet3D)
				{
					(baseObj as RenderSet3D).lightPicker = null;
				}
				else if (baseObj is BaseEntity)
				{
					(baseObj as BaseEntity).avatar.lightPicker = null;
				}
				removeSceneObj(baseObj);
			}
			
			_sceneRenderLayer.clear();
			TweenLite.killTweensOf(_scene);
			
			//clear sceneArtFilters
			_ringDepthOfFieldFilter3D = null;
			_sceneArtFilters.length = 0;
			resetViewFilters();
		}
		
		public function get sceneRenderLayer() : SceneRenderLayer
		{
			return _sceneRenderLayer;
		}
		
		public function get sceneMapLayer() : SceneMapLayer
		{
			return _sceneMapLayer;
		}
		
		public function getAreaMap(index : int) : AreaMap
		{
			if (_areaMaps && index >= 0 && index < _areaMaps.length)
				return _areaMaps[index];
			return null;
		}
		
		public function loadMapData(mapName : String, mapDataUrl : String, completeHandler : Function = null, errorHandler : Function = null, useBitmapData : Boolean = false) : void
		{
			_isLoading = true;
			_sceneMapLayer.loadData(mapName, mapDataUrl, completeHandler, errorHandler, useBitmapData);
		}
		
		/**
		 * 切换场景
		 * @param mapUrl
		 * @param mapDataUrl
		 * @param completeHandler
		 * @param mapDataCompleteHandler
		 *
		 */
		public function switchScene(mapUrl : String, completeHandler : Function = null, priority : int = 100) : void
		{
			_isLoading = true;
			var gameScene3D : GameScene3D = this;
			_sceneMapLayer.loadMap(mapUrl, onMapComplete, null, null, priority);
			//地图配置加载完毕
			function onMapComplete(layer : SceneMapLayer) : void
			{
				callMapCompleted(layer);
			}
			function callMapCompleted(layer : SceneMapLayer) : void
			{
				_entityAreaDirectionalLight = _sceneMapLayer.getObj(ENTITY_AREA_DIRECTIONAL_LIGHT_NAME) as DirectionalLight;
				if (!_entityAreaDirectionalLight)
				{
					var lights : Vector.<LightBase> = _sceneMapLayer.lights;
					for each (var light : LightBase in lights)
					{
						if (light is DirectionalLight)
						{
							_entityAreaDirectionalLight = DirectionalLight(light);
							break;
						}
					}
				}
				
				//场景顶灯
				_sceneAreaDirectionalLight = _sceneMapLayer.getObj(SCENE_AREA_DIRECTIONAL_LIGHT_NAME) as DirectionalLight;
				if (!_sceneAreaDirectionalLight)
					_sceneAreaDirectionalLight = _entityAreaDirectionalLight;
				//开始渲染
				sceneRender.startRender();
				var baseObjList : Array = _sceneObjMap.getValues();
				for (var i : int = baseObjList.length - 1; i > 0; i--)
				{
					var baseObj : BaseObj3D = baseObjList[i];
					if (baseObj is RenderUnit3D)
					{
						(baseObj as RenderUnit3D).lightPicker = entityLightPicker;
					}
					else if (baseObj is RenderSet3D)
					{
						(baseObj as RenderSet3D).lightPicker = entityLightPicker;
					}
					else if (baseObj is BaseEntity)
					{
						(baseObj as BaseEntity).avatar.lightPicker = entityLightPicker;
					}
				}
				
				if (_mainChar)
				{
					_mainChar.addSyncInfo(new CameraObjSyncInfo(_mainChar,getCameraTarget(), true));//这个是用来把镜头的虚拟对象与主角关联起来，实现同步
					
					_mainCharSyncPosLight = _sceneMapLayer.getObj(MAIN_CHAR_SYNC_POS_LIGHT_NAME) as LightBase;//永远跟着主角的一盏灯
					if (_mainCharSyncPosLight)
					{
						var syncInfo : BaseObjSyncInfo = new BaseObjSyncInfo(_mainCharSyncPosLight, true);
						syncInfo.setOffset(0, _mainCharSyncPosLight.y - _sceneMapLayer.queryHeightAt(_mainCharSyncPosLight.x, _mainCharSyncPosLight.z), 0);
						_mainChar.addSyncInfo(syncInfo);
						_mainCharSyncLightDirection = new Vector3D(_mainCharSyncPosLight.rotationX, _mainCharSyncPosLight.rotationY, _mainCharSyncPosLight.rotationZ);
					}
					_mainChar.avatar.lightPicker = entityLightPicker;
				}
				if (layer.district && _areaMaps)
				{
					for each (var areaMap : AreaMap in _areaMaps)
					{
						areaMap.setBounds(layer.district.min, layer.district.max);
					}
				}
				validateShadow();
				validateAreaDirectionalLight();
				_isLoading = false;
				if (completeHandler != null)
					completeHandler(gameScene3D);
			}
		}
		
		public function loadMiniMap(mapName : String, miniMapUrl : String, rect : Rectangle = null, completeHandler : Function = null) : void
		{
			var gameScene3D : GameScene3D = this;
			_sceneMapLayer.loadMiniMap(mapName, miniMapUrl, rect, onMiniMapComplete);
			function onMiniMapComplete(loader : MapTextureLoader) : void
			{
				if (completeHandler != null)
					completeHandler(gameScene3D);
			}
		}
		
		public function loadRadarMap(mapName : String, radarMapUrl : String, rect : Rectangle = null, completeHandler : Function = null) : void
		{
			var gameScene3D : GameScene3D = this;
			_sceneMapLayer.loadRadarMap(mapName, radarMapUrl, rect, onRadarMapComplete);
			function onRadarMapComplete(loader : MapTextureLoader) : void
			{
				if (completeHandler != null)
					completeHandler(gameScene3D);
			}
		}
		
		/**
		 * 附着地面
		 * @param baseObj
		 *
		 */
		public function clingGround(x : Number, z : Number) : Number
		{
			if (sceneMapLayer)
				return sceneMapLayer.queryHeightAt(x, z);
			return 0;
		}
		
		override public function dispose() : void
		{
			clear();
			_sceneName = null;
			if (_areaMaps)
			{
				for each (var areaMap : AreaMap in _areaMaps)
				{
					areaMap.dispose();
				}
				_areaMaps.length = 0;
				_areaMaps = null;
			}
			if (_sceneMapLayer)
			{
				_sceneMapLayer.destroy();
				_sceneMapLayer = null;
			}
			if (_sceneRenderLayer)
			{
				_sceneRenderLayer.destroy();
				_sceneRenderLayer = null;
			}
			_sceneObjMap = null;
			_sceneRoleList = null;
			_renderUnitList = null;
			sceneRender = null;
			if (_view)
			{
				_view.filters3d = null;
				_view = null;
			}
			if (_sceneArtFilters)
			{
				_sceneArtFilters.length = 0;
				_sceneArtFilters = null;
			}
			if (_viewFilters)
			{
				_viewFilters.length = 0;
				_viewFilters = null;
			}
			if (_phantomFilter)
			{
				_phantomFilter.dispose();
				_phantomFilter = null;
			}
			if (_heatFilter)
			{
				_heatFilter.dispose();
				_heatFilter = null;
			}
			if (_glowFilter)
			{
				_glowFilter.dispose();
				_glowFilter = null;
			}
			if (_outlineGlowFilter)
			{
				_outlineGlowFilter.dispose();
				_outlineGlowFilter = null;
			}
			if (_ringDepthOfFieldFilter3D) {
				_ringDepthOfFieldFilter3D.dispose();
				_ringDepthOfFieldFilter3D = null;
			}
			_mainChar = null;
			if (_lightNullObject)
			{
				if (_lightNullObject.parent)
					_lightNullObject.parent.removeChild(_lightNullObject);
				_lightNullObject.dispose();
				_lightNullObject = null;
			}
			if (_cameraTarget)
			{
				if (_cameraTarget.parent)
					_cameraTarget.parent.removeChild(_cameraTarget);
				_cameraTarget.dispose();
				_cameraTarget = null;
			}
			if (parent)
				parent.removeChild(this);
			super.dispose();
		}
		
		public function destroy() : void
		{
			dispose();
		}
	}
}
