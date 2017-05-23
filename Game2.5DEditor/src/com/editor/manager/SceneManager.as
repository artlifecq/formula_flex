package com.editor.manager
{
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.GlobalConfig;
	import com.editor.cfg.ProjectConfig;
	import com.editor.cfg.TabelFieldHelper;
	import com.editor.data.ConfigDesc;
	import com.editor.data.EnumAreaMapType;
	import com.editor.data.InternalTabelName;
	import com.editor.data.RoleStateType;
	import com.editor.data.TabelData;
	import com.editor.data.TabelFieldData;
	import com.editor.data.map.ClientMapAreaData;
	import com.editor.data.map.ClientMapCameraPropertyData;
	import com.editor.data.map.ClientMapTimeOfTheDayData;
	import com.editor.data.map.EditorClientMapData;
	import com.editor.data.map.MapAreaTypeEnum;
	import com.editor.enum.FeaturesType;
	import com.editor.enum.GameScene3DType;
	import com.editor.events.ConfigListEvent;
	import com.editor.events.MapEvent;
	import com.editor.events.MapFileListEvent;
	import com.editor.scene.SceneRole;
	import com.editor.story.controller.StoryPreviewController;
	import com.editor.ui.AreaMapView;
	import com.editor.utils.FileUtil;
	import com.game.engine2D.Scene;
	import com.game.engine2D.config.MapConfig;
	import com.game.engine3D.controller.CameraController;
	import com.game.engine3D.core.AreaMap;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.pathFinding.HeightMapHelperProxy;
	import com.game.engine3D.utils.PathFinderUtil;
	import com.game.engine3D.vo.AreaMapData;
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.engine3D.vo.SceneMapData;
	import com.game.engine3D.vo.map.ClientMapData;
	import com.game.mainCore.core.manager.LayerManager;
	
	import flash.display.BitmapData;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import mx.controls.Alert;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.events.Event;
	import away3d.pathFinding.DistrictWithPath;
	import away3d.tools.utils.Bounds;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 场景管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:26:37
	 *
	 */
	public class SceneManager
	{
		private static var _instance : SceneManager;

		public static function getInstance() : SceneManager
		{
			if (!_instance)
			{
				_instance = new SceneManager();
			}
			return _instance;
		}

        private var _scene : Scene;
		public function get scene():Scene
		{
			return _scene;
		}
		private var _mainScene : GameScene3D;
        private var _view3D : View3D;
		private var _currMapName : String = null;
		private var _currMapRes : String = null;
		private var _mapId : int = 0;
		private var _mapData : EditorClientMapData;
		private var _previewMap : Boolean;
        
		private var _xyzMode : int = HeightMapHelperProxy.MODE_XY;
//        private var _xyzMode : int = HeightMapHelper.MODE_XY;

		public function SceneManager()
		{
		}

		public function get currMapName() : String
		{
			return _currMapName;
		}

		public function get currMapRes() : String
		{
			return _currMapRes;
		}

		public function get mapId() : int
		{
			return _mapId;
		}

		public function clearSelected() : void
		{
			_mapId = 0;
			_currMapName = null;
			_currMapRes = null;
		}

		public function setup() : void
		{
            this._view3D = Stage3DLayerManager.getView();
            var w : int = LayerManager.stage.stageWidth;
            var h : int = LayerManager.stage.stageHeight;
            this._scene = new Scene(w, h, GameScene3DType.MAIN_SCENE, this._view3D, 4000, 4);
            this._mainScene = this._scene.gameScene3d;
			_mainScene.cameraNear = 100;

			SpellFightManager.getInstance().init();
			SceneRoleManager.getInstance().initScenePreview();
            _mainScene.sceneMapLayer.xyzMode = this._xyzMode;
			_mainScene.sceneMapLayer.showDistrictWireframe = true;
			_mainScene.sceneMapLayer.mousePickerMovable = true;
			EventManager.addEvent(ConfigListEvent.CLICK_CONFIG_DATA, onConfigClick);
			EventManager.addEvent(MapEvent.MINI_MAP_UPDATE_MONSTER_AREA, updateMapDataAreas);
            
		}
        
        public function addChild(obj : ObjectContainer3D) : void {
            this._mainScene.view.scene.addChild(obj);
        }

		private function onConfigClick(data : ConfigData) : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			if (!tabel)
			{
				return;
			}
		}

		public function get mainScene() : GameScene3D
		{
			return _mainScene;
		}

		public function get mainDistrict() : DistrictWithPath
		{
			return _mainScene.sceneMapLayer.district;
		}
        
        public function get xyzMode() : int {
            return this._xyzMode;
        }
        
        public function get view3D() : View3D {
            return this._view3D;
        }

		public function addSceneObjToMainScene(obj : BaseObj3D, clingGround : Boolean = false) : void
		{
			mainScene.addSceneObj(obj, null, false);
			if (clingGround)
				obj.clingGroundCalculate = mainScene.clingGround;
		}
        
		public function addMainRoleToMainScene(obj : BaseObj3D, clingGround : Boolean = true) : void
		{
			mainScene.addSceneObj(obj, null, true, false);
			if (clingGround)
				obj.clingGroundCalculate = mainScene.clingGround;
		}
        
		public function removeSceneObjFromMainScene(obj : BaseObj3D) : void
		{
			mainScene.removeSceneObj(obj);
		}

		private function clearScene() : void
		{
			CameraController.lockedOnPlayerController.checkBlock = false;
			SceneTimeOfTheDayManager.clear();
			Stage3DLayerManager.stage3DProxy.removeEventListener(Event.ENTER_FRAME, onLoop);
			mainScene.clear();
			CameraController.closeOperate();
			_currMapRes = null;
			_currMapName = null;
		}

		/**
		 * 进入场景 
		 * @param mapName
		 * @param mapData
		 * @param mapId
		 * 
		 */		
		public function enterScene(mapName : String, mapData : EditorClientMapData, mapId : int = 0) : void
		{
			if (_mapId != mapId)
			{
				_mapId = mapId;
				_previewMap = mapId == 0;
				createSceneDecorate();
			}
			if (!mainScene.isLoading)
			{
				if (_currMapName != mapName)
				{
					clearScene();
					_currMapName = mapName;
					_mapData = mapData;
					var mapDataUrl : String = GlobalConfig.getMapDataPath(mapName);
					var mapDataFile : File = FileUtil.pathValid(mapDataUrl) ? new File(mapDataUrl) : null;
					if (mapDataFile && mapDataFile.exists)
					{
						var mapDataFileUrl : String = GlobalConfig.getMapDataFilePath(mapName);
						if (SceneBlockManager.getInstance().isSceneBlock(mapId))
						{
							mapDataFileUrl = GlobalConfig.getBlockData(mapName);
						}
						mainScene.loadMapData(mapName, mapDataFileUrl, onMapDataComplete, null, true);
					}
					else
					{
						Alert.show("地图数据" + mapDataUrl + "不存在！", "提示");
					}
				}
			}
		}

		public function loadSceneMap(mapRes : String) : void
		{
			if (_currMapRes == mapRes)
			{
				return;
			}
			clearScene();
			loadScene(mapRes);
		}

		private function loadScene(mapRes : String) : void
		{
			_currMapRes = mapRes;
			var mapUrl : String = GlobalConfig.getMapUrl(mapRes);
			var mapFile : File = FileUtil.pathValid(mapUrl) ? new File(mapUrl) : null;
			if (mapFile && mapFile.exists)
			{
				var mapFileUrl : String = GlobalConfig.getMapFilePath(mapRes);
				if (SceneBlockManager.getInstance().isSceneBlock(mapId))
				{
					mapFileUrl = GlobalConfig.getBlockPath(mapRes);
				}
                // 先加载地图配置文件
                var mapConfigByteArray : ByteArray = FileUtil.readFile(new File(GlobalConfig.mapPath + "/" + mapRes + "_2d/map.cfg"));
                mapConfigByteArray.endian = Endian.LITTLE_ENDIAN;
                var mapConfig : MapConfig = new MapConfig();
                mapConfig.zoneMapUrl = "file://" + GlobalConfig.mapPath + "/" + mapRes + "_2d/#.jpg";
                mapConfig.gridH = mapConfigByteArray.readInt();
                mapConfig.gridV = mapConfigByteArray.readInt();
                mapConfig.width = mapConfig.gridH * 50;
                mapConfig.height = mapConfig.gridV * 50;
                this._scene.switchScene(1, mapConfig,null, mapConfig.zoneMapUrl, mapFileUrl, this.onCfgCmp, this.enterSceneSuccessed, false, null);
				EventManager.dispatchEvent(MapFileListEvent.SELECTED_MAP_ID, mapRes);
			}
			else
			{
				Alert.show("地图" + mapUrl + "不存在！", "提示");
			}
		}
        
        private function onCfgCmp() : void {
            Scene.scene.updateCameraNow();
            //强制刷新下切片图
            Scene.scene.sceneZoneMapLayer.strongLoadMap = true;
            
            Scene.scene.sceneRender.startRender(true);
            
            trace(this._view3D.camera.lens.far, this._view3D.camera.lens.near);
            trace("isSoild(2700, 0, -1400):" ,PathFinderUtil.isSolid(SceneManager.getInstance().mainDistrict, new Vector3D(2700, -1400, 0)));
            trace("isSoild(3469, 0, -1313):" ,PathFinderUtil.isSolid(SceneManager.getInstance().mainDistrict, new Vector3D(3469, -1313, 0)));
            trace("isSoild(2865, 0, -1512):" ,PathFinderUtil.isSolid(SceneManager.getInstance().mainDistrict, new Vector3D(2865, -1512, 0)));
            trace("isSoild(2799, 0, -1753):" ,PathFinderUtil.isSolid(SceneManager.getInstance().mainDistrict, new Vector3D(2799, -1753, 0)));
            trace("isSoild(0, 0, 0):" ,PathFinderUtil.isSolid(SceneManager.getInstance().mainDistrict, new Vector3D(0, 0, 0)));
        }

		private function enterSceneSuccessed(scene : GameScene3D) : void
		{
            var role : SceneRole = SceneRoleManager.getInstance().targetPlayer;
            role.setGroundXY(2700, -1400);
            //role.avatar.lightPicker = this.mainScene.entityLightPicker;

			DataStructuresManager.getInstance().dispatchSceneIdChangeEvent();

			loadCustomTabel();
			createSceneDecorate();

			Stage3DLayerManager.stage3DProxy.addEventListener(Event.ENTER_FRAME, onLoop);
			SceneRoleManager.getInstance().targetPlayer.startRender();
			AvatarManager.callEquipmentChange(SceneRoleManager.getInstance().targetPlayer);
			SceneRoleManager.getInstance().targetPlayer.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”

			Stage3DLayerManager.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);

			CameraController.openOperate();
			CameraController.update();
			EditorCameraManager.updateProperty();

			EventManager.dispatchEvent(MapEvent.SCENE_MAP_LOAD_COMPLETE);

			Stage3DLayerManager.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);

			if (_mapData)
			{
				BGMManager.playMusic(_mapData.mBgSoundRes);
			}
		}

		protected function onKeyDown(event : KeyboardEvent) : void
		{
			switch (event.keyCode)
			{
				case Keyboard.ESCAPE:
				{
					StoryPreviewController.esc();
					break;
				}
				case Keyboard.SPACE:
				{
					StoryPreviewController.pause();
					break;
				}
			}
		}

		private function onMapDataComplete(sceneMapData : SceneMapData) : void
		{
			if (_mapData)
			{
				sceneMapData.mapData.position = 0;
				_mapData.readFrom(sceneMapData.mapData);
				loadScene(_mapData.mMapRes);

				var miniMapUrl : String = GlobalConfig.getMiniMapFileName(_mapData.mMiniMapRes);
				mainScene.loadMiniMap(_currMapName, miniMapUrl, _mapData.miniMapRect, onMiniMapComplete);
				var radarMapUrl : String = GlobalConfig.getRadarMapFileName(_mapData.mRadarMapRes);
				mainScene.loadRadarMap(_currMapName, radarMapUrl, _mapData.radarMapRect, onRadarMapComplete);
			}
		}

		public function get clientMapData() : ClientMapData
		{
			if (mainScene.sceneMapLayer.sceneMapData)
			{
				return mainScene.sceneMapLayer.sceneMapData.clientMapData;
			}
			return null;
		}

		public function get miniMapData() : BitmapData
		{
			if (mainScene.sceneMapLayer.sceneMapData)
			{
				return mainScene.sceneMapLayer.sceneMapData.miniMapData;
			}
			return null;
		}

		public function get radarMapData() : BitmapData
		{
			if (mainScene.sceneMapLayer.sceneMapData)
			{
				return mainScene.sceneMapLayer.sceneMapData.radarMapData;
			}
			return null;
		}

		public var cameraOpen : Boolean = true;

		/**
		 * 暂时的
		 * @param e
		 *
		 */
		private function onMouseMove(e : MouseEvent) : void
		{
			if (e.target is View3D)
			{
				if (!cameraOpen)
				{
					CameraController.openOperate();
					CameraController.update();
					cameraOpen = true;
				}
			}
			else
			{
				if (cameraOpen)
				{
					CameraController.closeOperate();
					cameraOpen = false;
				}
			}
		}

		private function onLoop(e : Event) : void
		{
		}

		public function onMiniMapComplete(scene : GameScene3D) : void
		{
			if (_mapData)
			{
				_mapData.miniMapRect.setTo(0, 0, miniMapData.width, miniMapData.height);
			}
			EventManager.dispatchEvent(MapEvent.MINI_MAP_LOAD_COMPLETE);
		}

		public function onRadarMapComplete(scene : GameScene3D) : void
		{
			if (_mapData)
			{
				_mapData.radarMapRect.setTo(0, 0, radarMapData.width, radarMapData.height);
			}
			EventManager.dispatchEvent(MapEvent.RADAR_MAP_LOAD_COMPLETE);
		}

		private function loadCustomTabel() : void
		{
			//如果是地图块，没有这些表
			if (SceneBlockManager.getInstance().isSceneBlock(mapId))
			{
				return;
			}
			var tabels : Array;
			var tabel : TabelData;
			////////
			var sceneField : TabelFieldData;
			tabels = DataStructuresManager.getInstance().getTabelsByFeature(FeaturesType.CUSTOM_TYPE);
			for each (tabel in tabels)
			{
				sceneField = DataStructuresManager.getInstance().getCorrelationField(tabel, TabelFieldData.SCENE_FIELD);
				if (!tabel.builtInFieldName && !sceneField)
					DataStructuresManager.getInstance().clearTableConfigData(tabel);
			}
			if (_mapId)
			{
				for each (tabel in tabels)
				{
					sceneField = DataStructuresManager.getInstance().getCorrelationField(tabel, TabelFieldData.SCENE_FIELD);
					if (!tabel.builtInFieldName && !sceneField)
					{
						var cfgPath : String = ProjectConfig.getSceneMonsterCfgPath(tabel.mFileDire, _mapId);
						if (cfgPath)
						{
							var hasData : Boolean = DataStructuresManager.getInstance().loadTableConfigData(tabel, cfgPath);
							if (!hasData)
							{
								DataStructuresManager.getInstance().createTempletTableFile(tabel, cfgPath);
								hasData = DataStructuresManager.getInstance().loadTableConfigData(tabel, cfgPath);
								if (!hasData)
									Alert.show("打开配置表" + cfgPath + "失败！", "提示");
							}
						}
					}
				}
			}
		}

		private function createSceneDecorate() : void
		{
			if (mainScene.isLoading)
				return;
			mainScene.sceneMapLayer.useFog = _mapId == 0;
			mainScene.useRingDepthOfFieldFilter = _mapId == 0;
			////////
			TrailManager.getInstance().clear();

			var info : String;
			var infos : Array = [];
			var tabels : Array;
			var tabel : TabelData;
			var configDesc : ConfigDesc;
			var mScene : int;
			////////
			DecorateEntitiesManager.getInstance().clear();
			var sceneField : TabelFieldData;
			tabels = DataStructuresManager.getInstance().getTabelsByFeature(FeaturesType.DECORATE_TYPE);
			for each (tabel in tabels)
			{
				if (tabel.mFileDire)
				{
					sceneField = DataStructuresManager.getInstance().getCorrelationField(tabel, TabelFieldData.SCENE_FIELD);
					if (!tabel.builtInFieldName && !sceneField)
						DataStructuresManager.getInstance().clearTableConfigData(tabel);
				}
			}
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapTimeOfTheDayConfigName);
			if (tabel)
			{
				createMapTimeOfTheDay();
			}
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapCameraPropertyConfigName);
			if (tabel)
			{
				createMapCameraProperty();
			}

			if (_mapId)
			{
				for each (tabel in tabels)
				{
					sceneField = DataStructuresManager.getInstance().getCorrelationField(tabel, TabelFieldData.SCENE_FIELD);
					if (!tabel.builtInFieldName && !sceneField)
					{
						if (tabel.name == InternalTabelName.MapDataAreaConfigName)
						{
							createMapDataAreas();
						}
						else
						{
							if (tabel.mFileDire)
							{
								//如果是地图块，没有这些表
								var isBlock : Boolean = SceneBlockManager.getInstance().isSceneBlock(_mapId);
								var cfgPath : String = ProjectConfig.getSceneMonsterCfgPath(tabel.mFileDire, _mapId);
								if (cfgPath && !DataStructuresManager.getInstance().isFeaturesTabelByPath(cfgPath))
								{
									if (isBlock && tabel.mSubFeatureType != FeaturesType.SCENE_BLOCK_DECORATE_TYPE)
									{
										continue;
									}
									var hasData : Boolean = DataStructuresManager.getInstance().loadTableConfigData(tabel, cfgPath);
									if (!hasData)
									{
										DataStructuresManager.getInstance().createTempletTableFile(tabel, cfgPath);
										hasData = DataStructuresManager.getInstance().loadTableConfigData(tabel, cfgPath);
										if (!hasData)
											Alert.show("打开配置表" + cfgPath + "失败！", "提示");
									}
								}
							}
							else
							{
							}
						}
					}
					configDesc = tabel.getConfigDesc();

					for each (var cfg : ConfigData in configDesc.cacheDic)
					{
						if (sceneField)
							mScene = TabelFieldHelper.getScene(tabel.name, cfg);
						else
							mScene = _mapId;
						if (mScene == _mapId)
						{
							info = DecorateEntitiesManager.getInstance().initAddArea(cfg);
							if (info)
								infos.push(info);
						}
					}
				}
			}
			DecorateEntitiesManager.getInstance().setMouseEnabledByFuncTag(null);
			////////
			EventManager.dispatchEvent(MapEvent.MINI_MAP_UPDATE_MONSTER_AREA, null);

			if (infos.length > 0)
				Alert.show("以下实体在不可放置的区域内！\n" + infos.join("\n"), "提示");
		}

		private function createMapDataAreas() : void
		{
			if (_mapData)
			{
				////////
				var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapDataAreaConfigName);
				var configDesc : ConfigDesc = tabel.getConfigDesc();
				configDesc.clear();
				var areaCount : int = _mapData.areaDatas.length;
				for (var i : int = 0; i < areaCount; i++)
				{
					var areaData : ClientMapAreaData = _mapData.areaDatas[i];
					areaData.toTabel(tabel);
				}

				updateMapDataAreas(null);
				EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, tabel.name);
			}
		}

		private function updateMapDataAreas(data : ConfigData) : void
		{
			var areaData : ClientMapAreaData;
			var points : Vector.<Point>;
			var areaMapData : AreaMapData;
			var cameraAreaMap : AreaMap = SceneManager.getInstance().mainScene.getAreaMap(EnumAreaMapType.CAMERA_AREA);
			var type1AreaMap : AreaMap = SceneManager.getInstance().mainScene.getAreaMap(EnumAreaMapType.TYPE_1_AREA);
			var type2AreaMap : AreaMap = SceneManager.getInstance().mainScene.getAreaMap(EnumAreaMapType.TYPE_2_AREA);
			var type3AreaMap : AreaMap = SceneManager.getInstance().mainScene.getAreaMap(EnumAreaMapType.TYPE_3_AREA);
			if (data)
			{
				if (data is ClientMapAreaData)
				{
					areaData = ClientMapAreaData(data);
					cameraAreaMap.removeFlag(255, areaData.id);
					type1AreaMap.removeFlag(255, areaData.id);
					type2AreaMap.removeFlag(255, areaData.id);
					type3AreaMap.removeFlag(255, areaData.id);
					points = areaData.getPoints();
					areaMapData = new AreaMapData(points, 255, areaData.id, areaData);
					if (areaData.mType == MapAreaTypeEnum.CAMERA_PROPERTY)
					{
						cameraAreaMap.addFlag(areaMapData);
					}
					else
					{
						if (areaData.mType == MapAreaTypeEnum.OBSTACLE || areaData.mType == MapAreaTypeEnum.DYNAMIC_OBSTACLE //
							|| areaData.mType == MapAreaTypeEnum.ATHLETICS || areaData.mType == MapAreaTypeEnum.SPELL_FORBID)
						{
							type1AreaMap.addFlag(areaMapData);
						}
						else if (areaData.mType == MapAreaTypeEnum.SAFE)
						{
							type2AreaMap.addFlag(areaMapData);
						}
						else if (areaData.mType == MapAreaTypeEnum.STALL)
						{
							type3AreaMap.addFlag(areaMapData);
						}
					}
				}
			}
			else
			{
				cameraAreaMap.clear();
				type1AreaMap.clear();
				type2AreaMap.clear();
				type3AreaMap.clear();
                if (_mapData) {
 				    var areaCount : int = _mapData.areaDatas.length;
				    for (var i : int = 0; i < areaCount; i++)
				    {
					    areaData = _mapData.areaDatas[i];
					    points = areaData.getPoints();
					    areaMapData = new AreaMapData(points, 255, areaData.id, areaData);
					    if (areaData.mType == MapAreaTypeEnum.CAMERA_PROPERTY)
					    {
						    cameraAreaMap.addFlag(areaMapData);
					    }
					    else
					    {
						    if (areaData.mType == MapAreaTypeEnum.OBSTACLE || areaData.mType == MapAreaTypeEnum.DYNAMIC_OBSTACLE //
							    || areaData.mType == MapAreaTypeEnum.ATHLETICS || areaData.mType == MapAreaTypeEnum.SPELL_FORBID)
						    {
							    type1AreaMap.addFlag(areaMapData);
						    }
						    else if (areaData.mType == MapAreaTypeEnum.SAFE)
						    {
							    type2AreaMap.addFlag(areaMapData);
						    }
						    else if (areaData.mType == MapAreaTypeEnum.STALL)
						    {
							    type3AreaMap.addFlag(areaMapData);
						    }
					    }
				    }                   
                }

			}

			if (AreaMapView.window)
				AreaMapView.window.updateAreaMap();
		}

		private function createMapTimeOfTheDay() : void
		{
			if (_mapData)
			{
				////////
				var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapTimeOfTheDayConfigName);
				var configDesc : ConfigDesc = tabel.getConfigDesc();
				configDesc.clear();

				var timeOfTheDayData : ClientMapTimeOfTheDayData = _mapData.timeOfTheDayData;
				if (timeOfTheDayData)
					ConfigData.create(configDesc, null, null, tabel.dataConstructor, false, timeOfTheDayData);

				SceneTimeOfTheDayManager.initScene(mainScene);
				EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, tabel.name);
			}
		}

		private function createMapCameraProperty() : void
		{
			if (_mapData)
			{
				////////
				var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapCameraPropertyConfigName);
				var configDesc : ConfigDesc = tabel.getConfigDesc();
				configDesc.clear();

				var cameraPropertyData : ClientMapCameraPropertyData = _mapData.cameraPropertyData;
				if (cameraPropertyData)
					ConfigData.create(configDesc, null, null, tabel.dataConstructor, false, cameraPropertyData);

				EditorCameraManager.updateProperty();
				EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, tabel.name);
			}
		}

		public function get mapData() : EditorClientMapData
		{
			return _mapData;
		}
		
		public static function containerBounds(oC:ObjectContainer3D, sceneBased:Boolean = true) : Vector.<Number> {
			Bounds.getObjectContainerBounds(oC, sceneBased);
			return Vector.<Number>([Bounds.minX, Bounds.minY, Bounds.minZ, Bounds.maxX, Bounds.maxY, Bounds.maxZ]);
		}
	}
}
