package com.editor.manager
{
	import com.editor.cfg.AvatarFileResConfig;
	import com.editor.cfg.AvatarResConfig;
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.EffectAnimationConfig;
	import com.editor.cfg.EffectResConfig;
	import com.editor.cfg.GlobalConfig;
	import com.editor.cfg.GlobalSettingConfig;
	import com.editor.cfg.ProjectConfig;
	import com.editor.cfg.TabelFieldHelper;
	import com.editor.data.ConfigDesc;
	import com.editor.data.FuncTagInfo;
	import com.editor.data.InternalTabelName;
	import com.editor.data.RenderUnitID;
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleActionType;
	import com.editor.data.RoleData;
	import com.editor.data.TabelData;
	import com.editor.data.TabelFieldData;
	import com.editor.data.map.ClientMapAreaData;
	import com.editor.data.map.ClientMapCameraPropertyData;
	import com.editor.data.map.ClientMapTimeOfTheDayData;
	import com.editor.data.map.EditorClientMapData;
	import com.editor.data.map.MapAreaTypeEnum;
	import com.editor.enum.FeaturesType;
	import com.editor.events.ConfigDataEvent;
	import com.editor.events.ConfigListEvent;
	import com.editor.events.MapEvent;
	import com.editor.events.SceneEntityEvent;
	import com.editor.scene.SceneRole;
	import com.editor.story.data.StoryConfig;
	import com.game.engine3D.controller.CameraController;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.utils.PathFinderUtil;
	
	import flash.geom.Vector3D;
	
	import mx.controls.Alert;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 数据管理
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-29 下午2:30:12
	 *
	 */
	public class DataManager
	{
		private static var _instance : DataManager;

		public static function getInstance() : DataManager
		{
			if (!_instance)
				_instance = new DataManager();
			return _instance;
		}

		public function DataManager()
		{
			EventManager.addEvent(ConfigListEvent.CONFIG_SELECTED, onSelectedConfigData);
			EventManager.addEvent(ConfigDataEvent.CONFIG_DATA_CHANGE, onDataChange);
		}

		public function readProjectData() : void
		{
			var tabel : TabelData;
			var hasData : Boolean;
			////////
			var avatarResConfigPath : String = ProjectConfig.avatarResConfigPath;
			if (avatarResConfigPath)
			{
				tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarResConfigName);
				if (tabel)
				{
					hasData = DataStructuresManager.getInstance().loadTableConfigData(tabel, avatarResConfigPath, AvatarResConfig);
					if (!hasData)
						Alert.show("打开配置表" + avatarResConfigPath + "失败！", "提示");
				}
			}
			////////
			var effectAnimationCfgPath : String = ProjectConfig.effectAnimationCfgPath;
			if (effectAnimationCfgPath)
			{
				tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.EffectAnimationConfigName);
				if (tabel)
				{
					hasData = DataStructuresManager.getInstance().loadTableConfigData(tabel, effectAnimationCfgPath, EffectAnimationConfig);
					if (!hasData)
						Alert.show("打开配置表" + effectAnimationCfgPath + "失败！", "提示");
				}
			}
			////////
			readGlobalSettingData();

			////////
			var storyCfgPath : String = ProjectConfig.storyCfgPath;
			if (storyCfgPath)
			{
				tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.XXXStoryConfigName);
				if (tabel)
				{
					hasData = DataStructuresManager.getInstance().loadTableConfigData(tabel, storyCfgPath, StoryConfig);
					if (!hasData)
						Alert.show("打开配置表" + storyCfgPath + "失败！", "提示");
				}
			}
		}

		public function readGlobalSettingData() : void
		{
			var globalSettingCfgPath : String = ProjectConfig.globalSettingPath;
			if (globalSettingCfgPath)
			{
				var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.GlobalSettingConfigName);
				if (tabel)
				{
					var hasData : Boolean = DataStructuresManager.getInstance().loadTableConfigData(tabel, globalSettingCfgPath, GlobalSettingConfig);
					if (!hasData)
						Alert.show("打开配置表" + globalSettingCfgPath + "失败！", "提示");
					//初始没有的数据
					var desc : ConfigDesc = tabel.getConfigDesc();
					var datas : Array = ConfigData.getCfgByFieldValue(desc, "key", "DEFAULT_SETTING");
					if (datas.length == 0)
						ConfigData.create(desc, ["key", "name"], ["DEFAULT_SETTING", "默认设置"], tabel.dataConstructor);
				}
			}
		}

		public function saveProjectData() : void
		{
			DataStructuresManager.getInstance().saveTable();

			saveCustomConfig();
			saveMonsterConfig();
			saveEffectAnimationConfig();
			saveAvatarResConfig();
			saveGlobalSettingConfig();
		}

		private function saveCustomConfig() : void
		{
			var tabels : Array = DataStructuresManager.getInstance().getTabelsByFeature(FeaturesType.CUSTOM_TYPE);
			for each (var tabel : TabelData in tabels)
			{
				var cfgPath : String = ProjectConfig.getSceneMonsterCfgPath(tabel.mFileDire, SceneManager.getInstance().mapId);
				DataStructuresManager.getInstance().saveTabelConfigData(tabel, cfgPath);
			}
		}

		private function saveMonsterConfig() : void
		{
			if (SceneBlockManager.getInstance().saveBlockSceneMonster())
			{
				return;
			}
			var tabels : Array = DataStructuresManager.getInstance().getTabelsByFeature(FeaturesType.DECORATE_TYPE);
			for each (var tabel : TabelData in tabels)
			{
				if (tabel.mFileDire)
				{
					var cfgPath : String = ProjectConfig.getSceneMonsterCfgPath(tabel.mFileDire, SceneManager.getInstance().mapId);
					DataStructuresManager.getInstance().saveTabelConfigData(tabel, cfgPath);
				}
			}
		}

		public function saveEffectAnimationConfig() : void
		{
			try
			{
				var effectAnimationCfgPath : String = ProjectConfig.effectAnimationCfgPath;
				if (effectAnimationCfgPath)
				{
					var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.EffectAnimationConfigName);
					if (tabel)
					{
						DataStructuresManager.getInstance().saveTabelConfigData(tabel, effectAnimationCfgPath);
					}
				}
			}
			catch (e : Error)
			{
				Alert.show("保存特效动画配置时发生错误！" + "\n" + e.message + "\n" + e.getStackTrace(), "错误");
			}
		}

		public function saveAvatarResConfig() : void
		{
			try
			{
				var avatarResConfigPath : String = ProjectConfig.avatarResConfigPath;
				if (avatarResConfigPath)
				{
					var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarResConfigName);
					if (tabel)
					{
						DataStructuresManager.getInstance().saveTabelConfigData(tabel, avatarResConfigPath);
					}
				}
			}
			catch (e : Error)
			{
				Alert.show("保存换装资源配置时发生错误！" + "\n" + e.message + "\n" + e.getStackTrace(), "错误");
			}
		}

		public function saveGlobalSettingConfig() : void
		{
			try
			{
				var globalSettingCfgPath : String = ProjectConfig.globalSettingPath;
				if (globalSettingCfgPath)
				{
					var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.GlobalSettingConfigName);
					if (tabel)
					{
						DataStructuresManager.getInstance().saveTabelConfigData(tabel, globalSettingCfgPath);
					}
				}
			}
			catch (e : Error)
			{
				Alert.show("保存全局设置配置时发生错误！" + "\n" + e.message + "\n" + e.getStackTrace(), "错误");
			}
		}

		public function saveStoryConfig() : void
		{
			try
			{
				var storyCfgPath : String = ProjectConfig.storyCfgPath;
				if (storyCfgPath)
				{
					var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.XXXStoryConfigName);
					if (tabel)
					{
						DataStructuresManager.getInstance().saveTabelConfigData(tabel, storyCfgPath);
					}
				}
			}
			catch (e : Error)
			{
				Alert.show("保存剧情配置时发生错误！" + "\n" + e.message + "\n" + e.getStackTrace(), "错误");
			}
		}

		public function createDataSetParams(funcInfo : FuncTagInfo, data : ConfigData, position : Vector3D = null) : Boolean
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(funcInfo.tabelName);
			if (!tabel)
				return false;
			var configDesc : ConfigDesc = tabel.getConfigDesc();
			configDesc.selectedData = data;
			if (!position)
				position = SceneRoleManager.getInstance().targetPos;
			var sceneField : TabelFieldData = tabel.getField(TabelFieldData.SCENE_FIELD);
			if (sceneField)
			{
				data[sceneField.mFieldName] = SceneManager.getInstance().mapId;
			}

			var mapData : EditorClientMapData;
			if (data is ClientMapTimeOfTheDayData)
			{
				mapData = SceneManager.getInstance().mapData;
				if (mapData)
				{
					mapData.timeOfTheDayData = data as ClientMapTimeOfTheDayData;
					SceneTimeOfTheDayManager.updateSceneTransform();
				}
			}
			else if (data is ClientMapCameraPropertyData)
			{
				mapData = SceneManager.getInstance().mapData;
				if (mapData)
				{
					mapData.cameraPropertyData = data as ClientMapCameraPropertyData;
					EditorCameraManager.updateProperty();
				}
			}
			else if (data is ClientMapAreaData)
			{
				var mapAreaData : ClientMapAreaData = data as ClientMapAreaData;
				if (mapAreaData.mType == MapAreaTypeEnum.CAMERA_PROPERTY)
				{
					mapAreaData.mCameraXDeg = CameraController.lockedOnPlayerController.xDeg;
					mapAreaData.mCameraYDeg = CameraController.lockedOnPlayerController.yDeg;
					mapAreaData.mCameraDistance = CameraController.lockedOnPlayerController.distance;
				}
			}
			else if (data is EditorClientMapData)
			{
				mapData = data as EditorClientMapData;
				mapData.name = mapData.name + "_new_scene";
				SceneManager.getInstance().enterScene(mapData.name, mapData);
			}

			if (funcInfo.featureType == FeaturesType.DECORATE_TYPE || funcInfo.subFeatureType == FeaturesType.DECORATE_TYPE)
			{
                var p : Vector3D = position.clone();
                p.y = position.z;
                p.z = 0;
                if (PathFinderUtil.isSolid(SceneManager.getInstance().mainDistrict, p)) {
                    Alert.show("该区域不能安置！", "提示");
                    return false;
                }
				EventManager.dispatchEvent(SceneEntityEvent.CREATE_SCENE_ENTITY, funcInfo, data, position);
			}
            return true;
		}

		public function removeData(funcInfo : FuncTagInfo, data : ConfigData) : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(funcInfo.tabelName);
			if (!tabel)
				return;

			if (funcInfo.featureType == FeaturesType.DECORATE_TYPE || funcInfo.subFeatureType == FeaturesType.DECORATE_TYPE)
			{
				EventManager.dispatchEvent(SceneEntityEvent.REMOVE_SCENE_ENTITY, funcInfo, data);
			}
		}

		public function submitData(data : ConfigData) : void
		{
			if (data is ClientMapAreaData)
			{
				var mapAreaData : ClientMapAreaData = data as ClientMapAreaData;
				if (mapAreaData.mType == MapAreaTypeEnum.CAMERA_PROPERTY)
				{
					mapAreaData.mCameraXDeg = CameraController.lockedOnPlayerController.xDeg;
					mapAreaData.mCameraYDeg = CameraController.lockedOnPlayerController.yDeg;
					mapAreaData.mCameraDistance = CameraController.lockedOnPlayerController.distance;
				}
			}
		}

		public function changeData(data : ConfigData, fieldName : String = null) : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			if (!tabel)
				return;
			var datas : Array;
			if (tabel.name == InternalTabelName.MapTimeOfTheDayConfigName)
			{
				SceneTimeOfTheDayManager.updateSceneTransform();
			}
			if (tabel.name == InternalTabelName.MapCameraPropertyConfigName)
			{
				EditorCameraManager.updateProperty();
			}
			else if (tabel.name == InternalTabelName.GlobalSettingConfigName)
			{
				GlobalSettingManager.update();
			}
			else if (tabel.name == InternalTabelName.MapDataConfigName)
			{
				var mapName : String = SceneManager.getInstance().currMapName;
				if (fieldName == "mapRes")
				{
					SceneManager.getInstance().loadSceneMap((data as EditorClientMapData).mMapRes);
				}
				else if (fieldName == "miniMapRes")
				{
					var miniMapName : String = GlobalConfig.getMiniMapFileName(/*(data as EditorClientMapData).mMapRes, */(data as EditorClientMapData).mMiniMapRes);
					SceneManager.getInstance().mainScene.loadMiniMap(mapName, miniMapName, (data as EditorClientMapData).miniMapRect, SceneManager.getInstance().onMiniMapComplete);
				}
				else if (fieldName == "radarMapRes")
				{
					var radarMapName : String = GlobalConfig.getRadarMapFileName(/*(data as EditorClientMapData).mMapRes,*/ (data as EditorClientMapData).mRadarMapRes);
					SceneManager.getInstance().mainScene.loadRadarMap(mapName, radarMapName, (data as EditorClientMapData).radarMapRect, SceneManager.getInstance().onRadarMapComplete);
				}
				EventManager.dispatchEvent(MapEvent.MINI_MAP_CORRECT_CHANGE);
			}
			else if (tabel.name == InternalTabelName.AvatarResConfigName)
			{
				AvatarManager.callEquipmentChange(SceneRoleManager.getInstance().scenePreviewEntity);
				SceneRoleManager.getInstance().updatePreviewState();
			}
			else if (tabel.name == InternalTabelName.MapDataAreaConfigName)
			{
				datas = DataStructuresManager.getInstance().getCorrelationDatas(tabel, data);
				for each (data in datas)
				{
					EventManager.dispatchEvent(SceneEntityEvent.SCENE_ENTITY_CHANGE_DATA, data);
				}
			}
			else if (tabel.mFeatureType == FeaturesType.DECORATE_TYPE)
			{
				datas = DataStructuresManager.getInstance().getCorrelationDatas(tabel, data);
				for each (data in datas)
				{
					EventManager.dispatchEvent(SceneEntityEvent.SCENE_ENTITY_CHANGE_DATA, data);
				}
			}
			else
			{
				var rootTabel : TabelData = DataStructuresManager.getInstance().getRootTabel(tabel);
				var featureType : String = rootTabel ? rootTabel.mFeatureType : null;
				if (featureType == FeaturesType.DECORATE_TYPE)
				{
					datas = DataStructuresManager.getInstance().getCorrelationDatas(tabel, data);
					for each (data in datas)
					{
						EventManager.dispatchEvent(SceneEntityEvent.SCENE_ENTITY_CHANGE_DATA, data);
					}
				}
			}
		}

		public function onSelectedConfigData(configData : ConfigData) : void
		{
			if (!configData)
				return;
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(configData.tabelName);
			if (!tabel)
				return;
			var configDesc : ConfigDesc = tabel.getConfigDesc();
			if (!configDesc)
				return;
			if (configDesc.selectedData != configData)
			{
				configDesc.selectedData = configData;
				for each (var field : TabelFieldData in tabel.fields)
				{
					if (field.mLinkTabel && field.linkEnable)
					{
						var linkTabel : TabelData = DataStructuresManager.getInstance().getTabelById(field.mLinkTabel);
						if (linkTabel)
						{
							var linkConfigDesc : ConfigDesc = linkTabel.getConfigDesc();
							if (linkConfigDesc)
							{
								var fieldName : String = configDesc.getLinkIdFieldNameHasValue(field.mFieldName, configData);
								var datas : Array = ConfigData.getCfgByFieldValue(linkConfigDesc, linkTabel.majorKeyField.mFieldName, configData[fieldName]);
								if (datas.length > 0)
								{
									onSelectedConfigData(datas[0]);
								}
							}
						}
					}
				}
				selectedResource(configData);
				EventManager.dispatchEvent(ConfigListEvent.SELECTED_CONFIG_DATA, configData);
			}
			EventManager.dispatchEvent(ConfigListEvent.CLICK_CONFIG_DATA, configData);
		}

		private function onDataChange(data : ConfigData, fieldName : String = null) : void
		{
			if (!fieldName)
				return;
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			if (!tabel)
				return;
			tabel.desc.removeFieldValueFromCache(fieldName);

			if (tabel.mFeatureType == FeaturesType.TRAIL_TYPE || tabel.mSubFeatureType == FeaturesType.TRAIL_TYPE)
			{
				var fieldData : TabelFieldData = tabel.getFieldByFieldName(fieldName);
				if (fieldData)
				{
					if (fieldData.name == TabelFieldData.MATCH_TERRAIN_FIELD)
					{
						TrailManager.getInstance().changeClingGround(data);
					}
				}
			}

			DataStructuresManager.getInstance().changeDataFromBuiltInTabel(tabel, data);
			//DataStructuresManager.getInstance().setBuiltInTabelFromId(tabel, data, fieldName);
			selectedResource(data);
		}

		private function selectedResource(data : ConfigData) : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			if (tabel)
			{
				for each (var field : TabelFieldData in tabel.fields)
				{
					var value : String = data[field.mFieldName];
					var mapResCfg : EditorClientMapData = getValidMapRes(value);
					if (mapResCfg)
					{
						if (data is EditorClientMapData) {
                            //var asset : MapConfigVO = new MapConfigVO();
                            //asset.width = 8400;
                            //asset.height = 5600;
                            //asset.zoneMapUrl = "C:/xunqinji/xqj/client_res/res/map/xqj_scene01_smyw_2d/#.jpg";
                            //asset.gridCol = Math.ceil(asset.width / asset.zoneGridSize);
                            //asset.gridRow = Math.ceil(asset.height / asset.zoneGridSize);
                            //Scene2DManager.current.startRender(asset);
							SceneManager.getInstance().enterScene(value, mapResCfg, mapResCfg.id);
                        }
						else {
							//SceneManager.getInstance().enterScene(value, mapResCfg, data.id);
                        }
						break;
					}
					var effectResCfg : EffectResConfig = validEffectRes(value);
					if (effectResCfg)
					{
						AvatarPreviewManager.setRes(null, null, null, null, effectResCfg.mRes);
						break;
					}
					var avatarResCfg : AvatarFileResConfig = validAvatarRes(value);
					if (avatarResCfg)
					{
						var bodyRes : String = avatarResCfg.mRes;
						var hair : String = avatarResCfg.mHairRes;
						var weaponRes : String = avatarResCfg.mWeaponRes;
						var mountRes : String = avatarResCfg.mMountRes;
						var animatRes : String = avatarResCfg.mAnimatRes;
						var effectRes : String = null;
						var bodyEffectResIDs : Array = null;
						var bodyEffectBindBones : Array = null;
						var bodyMethodTypeEffectResID : String = null;
						var weaponEffectResIDs : Array = null;
						var weaponEffectBindBones : Array = null;

						if (tabel.mFeatureType == FeaturesType.AVATAR_RESOURCE_TYPE)
						{
							if (field.name == TabelFieldData.AVATAR_WEAPON_RES_FIELD)
							{
								bodyRes = TabelFieldHelper.getAvatarWeaponRes(data);
								weaponRes = null;
								hair = null;
								mountRes = null;
								animatRes = null;
								effectRes = null;
								bodyEffectResIDs = TabelFieldHelper.getEffectRes(data);
								bodyEffectBindBones = TabelFieldHelper.getEffectBindNode(data);
							}
							else
							{
								weaponRes = null;
								hair = null;
								mountRes = null;
								effectRes = null;
								bodyEffectResIDs = TabelFieldHelper.getEffectRes(data);
								bodyEffectBindBones = TabelFieldHelper.getEffectBindNode(data);
								bodyMethodTypeEffectResID = TabelFieldHelper.getEffectMethodTypeRes(data);
							}
						}
						AvatarPreviewManager.setRes(bodyRes, hair, weaponRes, mountRes, effectRes, weaponEffectResIDs, weaponEffectBindBones, //
							animatRes, bodyEffectResIDs, bodyEffectBindBones, bodyMethodTypeEffectResID);
						break;
					}
				}
			}
		}

		private function validAvatarRes(value : String) : AvatarFileResConfig
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarFileResConfigName);
			var configDesc : ConfigDesc = tabel ? tabel.getConfigDesc() : null;
			if (!configDesc)
				return null;
			for each (var data : AvatarFileResConfig in configDesc.cacheDic)
			{
				if (data.mRes == value)
					return data;
			}
			return null;
		}

		public function getValidMapRes(value : String) : EditorClientMapData
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapDataConfigName);
			var configDesc : ConfigDesc = tabel ? tabel.getConfigDesc() : null;
			if (!configDesc)
				return null;
			for each (var data : EditorClientMapData in configDesc.cacheDic)
			{
				if (data.name == value)
					return data;
			}
			return null;
		}

		private function validEffectRes(value : String) : EffectResConfig
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.EffectResConfigName);
			var configDesc : ConfigDesc = tabel ? tabel.getConfigDesc() : null;
			if (!configDesc)
				return null;
			for each (var data : EffectResConfig in configDesc.cacheDic)
			{
				if (data.mRes == value)
					return data;
			}
			return null;
		}

		public function cancelSelect() : void
		{
			var tabels : Array = DataStructuresManager.getInstance().getTabels();
			for each (var tabel : TabelData in tabels)
			{
				var configDesc : ConfigDesc = tabel.getConfigDesc();
				configDesc.selectedData = null;
				EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, tabel.name);
			}
			//SceneManager.getInstance().clearSelected();
		}

		public function dataValidate(dataField : String, data : ConfigData) : Object
		{
			if (!data)
				return null;
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			if (!tabel)
				return null;
			var field : TabelFieldData;
			var configDesc : ConfigDesc;
			var mMotion : String;
			var mSceneRes : String;
			var animatDuration : int;
			var mBreakableFrameTime : int;
			var mHitFrameTime : int;
			var mThrowDelayTime : int;
			var mCastTime : int;

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_HURT_DELAY_TIME_FIELD);
			if (field)
			{
				var mHurtDelayTime : int = TabelFieldHelper.getHurtDelayTime(tabel.name, data);
				mThrowDelayTime = TabelFieldHelper.getThrowDelayTime(tabel.name, data);
				mHitFrameTime = TabelFieldHelper.getHitFrameTime(tabel.name, data);
				if (mThrowDelayTime > 0 && mHurtDelayTime < mThrowDelayTime)
				{
					return {valid: false, tips: "投掷延迟时间：" + mThrowDelayTime};
				}
				else if (mHurtDelayTime < mHitFrameTime)
				{
					return {valid: false, tips: "判定帧时间：" + mHitFrameTime};
				}
				else
				{
					return {valid: true, tips: "投掷延迟时间：" + mThrowDelayTime + "，判定帧时间：" + mHitFrameTime};
				}
			}

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_RELEASE_DELAY_TIME_FIELD);
			if (field)
			{
				var mReleaseDelayTime : int = TabelFieldHelper.getReleaseDelayTime(tabel.name, data);
				mThrowDelayTime = TabelFieldHelper.getThrowDelayTime(tabel.name, data);
				mHitFrameTime = TabelFieldHelper.getHitFrameTime(tabel.name, data);
				if (mThrowDelayTime > 0 && mReleaseDelayTime > mThrowDelayTime)
				{
					return {valid: false, tips: "投掷延迟时间：" + mThrowDelayTime};
				}
				else if (mReleaseDelayTime > mHitFrameTime)
				{
					return {valid: false, tips: "判定帧时间：" + mHitFrameTime};
				}
				else
				{
					return {valid: true, tips: "投掷延迟时间：" + mThrowDelayTime + "，判定帧时间：" + mHitFrameTime};
				}
			}

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_CAST_TIME_FIELD);
			if (field) //检查延迟生效是否合法
			{
				mMotion = TabelFieldHelper.getOnceMotion(data);
				animatDuration = AvatarManager.getAnimationDuration(mMotion);

				mBreakableFrameTime = TabelFieldHelper.getBreakableFrameTime(tabel.name, data);
				mBreakableFrameTime = mBreakableFrameTime > 0 ? mBreakableFrameTime : animatDuration;
				mCastTime = TabelFieldHelper.getCastTime(tabel.name, data);
				if (mCastTime < mBreakableFrameTime)
				{
					return {valid: false, tips: "可打断帧时间：" + mBreakableFrameTime};
				}
				else
				{
					var hardTime : int = mCastTime - animatDuration;
					if (hardTime < 0)
						hardTime = 0;
					return {valid: true, tips: "可打断帧时间：" + mBreakableFrameTime + "，硬直时间：" + hardTime};
				}
			}

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_HIT_FRAME_TIME_FIELD);
			if (field)
			{
				mMotion = TabelFieldHelper.getOnceMotion(data);
				animatDuration = AvatarManager.getAnimationDuration(mMotion);

				mBreakableFrameTime = TabelFieldHelper.getBreakableFrameTime(tabel.name, data);
				mBreakableFrameTime = mBreakableFrameTime > 0 ? mBreakableFrameTime : animatDuration;

				mHitFrameTime = TabelFieldHelper.getHitFrameTime(tabel.name, data);
				if (mHitFrameTime > mBreakableFrameTime)
				{
					return {valid: false, tips: "可打断帧时间：" + mBreakableFrameTime};
				}
				else
				{
					return {valid: true, tips: "可打断帧时间：" + mBreakableFrameTime};
				}
			}

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_BREAKABLE_FRAME_TIME_FIELD);
			if (field)
			{
				mMotion = TabelFieldHelper.getOnceMotion(data);
				animatDuration = AvatarManager.getAnimationDuration(mMotion);
				mBreakableFrameTime = TabelFieldHelper.getBreakableFrameTime(tabel.name, data);
				if (mBreakableFrameTime > animatDuration)
				{
					return {valid: false, tips: "动画持续时间：" + animatDuration};
				}
				else
				{
					return {valid: true, tips: "动画持续时间：" + animatDuration};
				}
			}

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_CAROM_START_FRAME_TIME_FIELD);
			if (field)
			{
				mMotion = TabelFieldHelper.getOnceMotion(data);
				animatDuration = AvatarManager.getAnimationDuration(mMotion);
				mBreakableFrameTime = TabelFieldHelper.getBreakableFrameTime(tabel.name, data);
				mBreakableFrameTime = mBreakableFrameTime > 0 ? mBreakableFrameTime : animatDuration;
				var mCaromStartTime : int = TabelFieldHelper.getCaromStartFrameTime(tabel.name, data);
				if (mCaromStartTime > mBreakableFrameTime)
				{
					return {valid: false, tips: "可打断帧时间：" + mBreakableFrameTime};
				}
				else
				{
					return {valid: true, tips: "可打断帧时间：" + mBreakableFrameTime};
				}
			}

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_THROW_DELAY_TIME_FIELD);
			if (field)
			{
				mMotion = TabelFieldHelper.getOnceMotion(data);
				animatDuration = AvatarManager.getAnimationDuration(mMotion);
				mBreakableFrameTime = TabelFieldHelper.getBreakableFrameTime(tabel.name, data);
				mBreakableFrameTime = mBreakableFrameTime > 0 ? mBreakableFrameTime : animatDuration;
				mThrowDelayTime = TabelFieldHelper.getThrowDelayTime(tabel.name, data);
				if (mThrowDelayTime > mBreakableFrameTime)
				{
					return {valid: false, tips: "可打断帧时间：" + mBreakableFrameTime};
				}
				else
				{
					return {valid: true, tips: "可打断帧时间：" + mBreakableFrameTime};
				}
			}

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_SOAR_FRAME_TIME_FIELD);
			if (field)
			{
				mMotion = TabelFieldHelper.getOnceMotion(data);
				animatDuration = AvatarManager.getAnimationDuration(mMotion);
				mBreakableFrameTime = TabelFieldHelper.getBreakableFrameTime(tabel.name, data);
				mBreakableFrameTime = mBreakableFrameTime > 0 ? mBreakableFrameTime : animatDuration;
				var mSoarTime : int = TabelFieldHelper.getSoarFrameTime(tabel.name, data);
				if (mSoarTime > mBreakableFrameTime)
				{
					return {valid: false, tips: "可打断帧时间：" + mBreakableFrameTime};
				}
				else
				{
					return {valid: true, tips: "可打断帧时间：" + mBreakableFrameTime};
				}
			}

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_DEST_SCENE_EFFECT_FIELD);
			if (field)
			{
				mSceneRes = TabelFieldHelper.getDestSceneEffect(data, false);
				if (mSceneRes != null)
				{
					if (mSceneRes)
					{
						return {valid: true, tips: "有效的目标动画"};
					}
					else
					{
						return {valid: false, tips: "目标动画必须设置为场景动画"};
					}
				}
			}
			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_DEST_RIDING_SCENE_EFFECT_FIELD);
			if (field)
			{
				mSceneRes = TabelFieldHelper.getDestSceneEffect(data, true);
				if (mSceneRes != null)
				{
					if (mSceneRes)
					{
						return {valid: true, tips: "有效的目标动画"};
					}
					else
					{
						return {valid: false, tips: "目标动画必须设置为场景动画"};
					}
				}
			}

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_FLY_SCENE_EFFECT_FIELD);
			if (field)
			{
				mSceneRes = TabelFieldHelper.getFlySceneEffect(data, false);
				if (mSceneRes != null)
				{
					if (mSceneRes)
					{
						return {valid: true, tips: "有效的飞行动画"};
					}
					else
					{
						return {valid: false, tips: "飞行动画必须设置为场景动画"};
					}
				}
			}
			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_FLY_RIDING_SCENE_EFFECT_FIELD);
			if (field)
			{
				mSceneRes = TabelFieldHelper.getFlySceneEffect(data, true);
				if (mSceneRes != null)
				{
					if (mSceneRes)
					{
						return {valid: true, tips: "有效的飞行动画"};
					}
					else
					{
						return {valid: false, tips: "飞行动画必须设置为场景动画"};
					}
				}
			}

			var mRoleRes : String;
			var mRoleReses : Array;
			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_STATE_ROLE_EFFECT_FIELD);
			if (field)
			{
				mRoleReses = TabelFieldHelper.getSpellStateRoleEffects(data, false);
				if (mRoleReses != null)
				{
					for each (mRoleRes in mRoleReses)
					{
						if (!mRoleRes)
						{
							return {valid: false, tips: "技能状态动画必须设置为角色动画"};
						}
					}
					return {valid: true, tips: "有效的技能状态动画"};
				}
			}
			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_STATE_RIDING_ROLE_EFFECT_FIELD);
			if (field)
			{
				mRoleReses = TabelFieldHelper.getSpellStateRoleEffects(data, true);
				if (mRoleReses != null)
				{
					for each (mRoleRes in mRoleReses)
					{
						if (!mRoleRes)
						{
							return {valid: false, tips: "技能状态动画必须设置为角色动画"};
						}
					}
					return {valid: true, tips: "有效的技能状态动画"};
				}
			}

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.AVATAR_MOTION_FIELD);
			if (field)
			{
				mMotion = TabelFieldHelper.getOnceMotion(data);
				if (mMotion)
				{
					var role : SceneRole = SceneRoleManager.getInstance().previewEntity;
					var ru : RenderUnit3D = (role && role.avatar) ? role.avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true) : null;
					if (ru && ru.renderUnitData)
					{
						if (ru.renderUnitData.hasAnimation(RoleActionType.getActionType(mMotion, Boolean((role.data as RoleData).avatarInfo.mountResID))))
							return {valid: true, tips: "有效的换装动作"};
						else
							return {valid: false, tips: "无效的换装动作"};
					}
					else
					{
						return {valid: false, tips: "没有选择预览角色，无法判断换装动作是否有效"};
					}
				}
				else
				{
					return {valid: false, tips: "无换装动作"};
				}
			}

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.ENTITY_SIZE_RADIUS_FIELD);
			if (field)
			{
				var mRadius : int = TabelFieldHelper.getEntityRadius(tabel.name, data);
				var radius : int = AvatarManager.getRadius();
				if (mRadius != radius)
					return {valid: false, tips: "角色半径：" + radius};
				else
					return {valid: true, tips: "角色半径：" + radius};
			}

			field = DataStructuresManager.getInstance().getCorrelationFieldByFieldName(tabel, dataField, TabelFieldData.SPELL_KEEP_SPACING_FIELD);
			if (field)
			{
				var keepSpacing : int = TabelFieldHelper.getKeepSpacing(tabel.name, data);
				var releaseRange : int = TabelFieldHelper.getReleaseRange(tabel.name, data);
				if (releaseRange > 0)
				{
					if (keepSpacing > releaseRange)
						return {valid: false, tips: "施法范围：" + releaseRange};
					else
						return {valid: true, tips: "施法范围：" + releaseRange};
				}
				var hurtRange : int = TabelFieldHelper.getHurtRange(tabel.name, data);
				if (keepSpacing > hurtRange)
					return {valid: false, tips: "伤害范围：" + hurtRange};
				else
					return {valid: true, tips: "伤害范围：" + hurtRange};
			}

			//////////////////////////////////////表链接最后判断////////////////////////////////////
			field = tabel.getFieldByFieldName(dataField);
			var linkTabel : TabelData;
			if (field)
			{
				if (field.isKey)
				{
					configDesc = tabel.getConfigDesc();
					var datas : Array = configDesc ? ConfigData.getCfgByFieldValue(configDesc, field.mFieldName, data[field.mFieldName]) : null;
					if (datas && datas.length > 0)
					{
						if (datas.length > 1)
						{
							return {valid: false, tips: "主键数据重复"};
						}
						if (field.mLinkTabel && field.linkEnable)
						{
							linkTabel = DataStructuresManager.getInstance().getTabelById(field.mLinkTabel);
							if (linkTabel)
							{
								configDesc = linkTabel.getConfigDesc();
								if (configDesc && ConfigData.getCfgByFieldValue(configDesc, linkTabel.majorKeyField.mFieldName, data[field.mFieldName]).length > 0)
								{
									return {valid: true, tips: "有效的主键链接数据"};
								}
								return {valid: false, tips: "主键链接的数据未找到"};
							}
							return {valid: false, tips: "主键链接的表未找到"};
						}
						return {valid: true, tips: "有效的主键数据"};
					}
					return {valid: false, tips: "主键数据未找到"};
				}
				else if (field.mLinkTabel && field.linkEnable)
				{
					linkTabel = DataStructuresManager.getInstance().getTabelById(field.mLinkTabel);
					if (linkTabel)
					{
						configDesc = linkTabel.getConfigDesc();
						var cfgDatas : Array = ConfigData.getCfgByFieldValue(configDesc, linkTabel.majorKeyField.mFieldName, data[field.mFieldName], true);
						if (configDesc && cfgDatas.length > 0)
						{
							var isExists : Boolean = true;
							for each (var cfgData : ConfigData in cfgDatas)
							{
								if (cfgData == null)
								{
									isExists = false;
									break;
								}
							}
							if (isExists)
							{
								return {valid: true, tips: "有效的链接数据"};
							}
							return {valid: false, tips: "包含未找到的链接数据"};
						}
						return {valid: false, tips: "链接的数据未找到"};
					}
					return {valid: false, tips: "链接的表未找到"};
				}
			}
			return null;
		}
	}
}
