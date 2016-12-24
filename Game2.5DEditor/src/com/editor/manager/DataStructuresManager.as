package com.editor.manager
{
	import com.editor.cfg.AvatarFileResConfig;
	import com.editor.cfg.AvatarResConfig;
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.EffectAnimationConfig;
	import com.editor.cfg.EffectResConfig;
	import com.editor.cfg.GlobalConfig;
	import com.editor.cfg.GlobalSettingConfig;
	import com.editor.cfg.MapFileResConfig;
	import com.editor.cfg.ProjectConfig;
	import com.editor.data.ConfigDesc;
	import com.editor.data.InternalTabelID;
	import com.editor.data.InternalTabelName;
	import com.editor.data.TabelData;
	import com.editor.data.TabelFieldData;
	import com.editor.data.map.ClientMapAreaData;
	import com.editor.data.map.ClientMapCameraBokehDepth;
	import com.editor.data.map.ClientMapCameraPropertyData;
	import com.editor.data.map.ClientMapTimeOfTheDayData;
	import com.editor.data.map.EditorClientMapData;
	import com.editor.enum.FeaturesType;
	import com.editor.events.ConfigListEvent;
	import com.editor.events.FuncTagEvent;
	import com.editor.story.data.StoryConfig;
	import com.editor.ui.ConfigEditView;
	import com.editor.utils.FileUtil;

	import flash.filesystem.File;
	import flash.utils.Dictionary;

	import mx.controls.Alert;

	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 数据结构管理
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-17 下午2:30:12
	 *
	 */
	public class DataStructuresManager
	{
		private static var _instance : DataStructuresManager;

		public static function getInstance() : DataStructuresManager
		{
			if (!_instance)
				_instance = new DataStructuresManager();
			return _instance;
		}

		private var _selectedTabel : TabelData;
		private var _selectedFiled : TabelFieldData;
		private var _tabels : Array;

		public function DataStructuresManager()
		{
			_tabels = [];
			EventManager.addEvent(FuncTagEvent.UPDATE_FUNC_TAGS, loadTables);
		}

		public function loadConfig(xml : XML) : void
		{
			_tabels.length = 0;
			TabelData.UID = 0;
			createInternalTabels();
			var tabel : TabelData;
			var field : TabelFieldData;
			var fields : Array;
			for each (var tabelItem : XML in xml.tabel.item)
			{
				var id : int = int(tabelItem.@id);
				var name : String = tabelItem.@name;
				var filePath : String = tabelItem.@filePath;
				var fileDire : String = tabelItem.@fileDire;
				var featureType : String = tabelItem.@featureType;
				var subFeatureType : String = tabelItem.@subFeatureType;
				var funcTag : String = tabelItem.@funcTag;
				var order : String = tabelItem.@order;
				var majorKey : String = tabelItem.@majorKey;

				fields = [];
				for each (var fieldItem : XML in tabelItem.field)
				{
					field = new TabelFieldData(fieldItem.@name, fieldItem.@fieldName, fieldItem.@fieldExpression, fieldItem.@linkTabel, fieldItem.@fieldLabel, fieldItem.@parentTabelField, fieldItem.@dataProvidedField, fieldItem.@defaultValue);
					field.tabelName = name;
					fields.push(field);
					TabelFieldData.setInternalField(field);
				}

				tabel = addTabel(name, id, filePath, fileDire, featureType, subFeatureType, funcTag, order, fields, majorKey);
				if (id > TabelData.UID)
					TabelData.UID = id;
				for each (field in fields)
				{
					tabel.setFieldInputType(field);
				}
			}
			_tabels.sortOn(["id"], Array.NUMERIC);

			EventManager.dispatchEvent(FuncTagEvent.UPDATE_FUNC_TAGS);
		}

		private function createInternalTabels() : void
		{
			var tabel : TabelData;
			var field : TabelFieldData;
			var fields : Array;
			var configDesc : ConfigDesc;

			///////////////////////////////////////////////////////////
			fields = [];
			field = new TabelFieldData("res", "res", "", 0, "", "", "", "");
			field.tabelName = InternalTabelName.AvatarFileResConfigName;
			fields.push(field);
			TabelFieldData.setInternalField(field);
			DataStructuresManager.getInstance().addTabel(InternalTabelName.AvatarFileResConfigName, InternalTabelID.AvatarFileResConfigID, "", "", "", "", "", "", fields, "res");
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarFileResConfigName);
			tabel.isInternal = true;
			tabel.dataConstructor = AvatarFileResConfig;
			var avatarPath : String = GlobalConfig.avatarPath;
			tabel.mFileDire = avatarPath;
			tabel.setFieldInputType(field);

			///////////////////////////////////////////////////////////
			fields = [];
			field = new TabelFieldData(TabelFieldData.AVATAR_BODY_RES_FIELD, "res", "", 0, "", "", "", "");
			field.tabelName = InternalTabelName.AvatarResConfigName;
			fields.push(field);
			TabelFieldData.setInternalField(field);

			field = new TabelFieldData(TabelFieldData.DATA_PROVIDED_FIELD_FIELD, "dialogFaceMask", "dialogFaceMaskX=dialogFaceMaskY=dialogFaceMaskS=dialogFaceMaskR", 0, "", "", "", "");
			field.tabelName = InternalTabelName.AvatarResConfigName;
			fields.push(field);

			field = new TabelFieldData(TabelFieldData.DATA_PROVIDED_FIELD_FIELD, "headFaceMask", "headFaceMaskX=headFaceMaskY=headFaceMaskS=headFaceMaskR", 0, "", "", "", "");
			field.tabelName = InternalTabelName.AvatarResConfigName;
			fields.push(field);

			field = new TabelFieldData("idleEffect", "idleEffect", "", 0, "待机特效", "", "", "");
			field.tabelName = InternalTabelName.AvatarResConfigName;
			field.mLinkTabel = InternalTabelID.EffectResConfigID;
			fields.push(field);

			DataStructuresManager.getInstance().addTabel(InternalTabelName.AvatarResConfigName, InternalTabelID.AvatarResConfigID, "", "", "", "", "", "", fields, TabelFieldData.AVATAR_BODY_RES_FIELD);
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarResConfigName);
			tabel.isInternal = true;
			tabel.dataConstructor = AvatarResConfig;
			configDesc = tabel.getConfigDesc();
			AvatarResConfig.setFieldLabelsAndTips(configDesc);

			///////////////////////////////////////////////////////////
			fields = [];
			field = new TabelFieldData("res", "res", "", 0, "", "", "", "");
			field.tabelName = InternalTabelName.EffectResConfigName;
			fields.push(field);
			TabelFieldData.setInternalField(field);
			DataStructuresManager.getInstance().addTabel(InternalTabelName.EffectResConfigName, InternalTabelID.EffectResConfigID, "", "", "", "", "", "", fields, "res");
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.EffectResConfigName);
			tabel.isInternal = true;
			tabel.dataConstructor = EffectResConfig;
			tabel.setFieldInputType(field);

			///////////////////////////////////////////////////////////
			DataStructuresManager.getInstance().addTabel(InternalTabelName.MapFileResConfigName, InternalTabelID.MapFileResConfigID, "", "", "", "", "", "", null, "res");
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapFileResConfigName);
			tabel.isInternal = true;
			tabel.dataConstructor = MapFileResConfig;
			configDesc = tabel.getConfigDesc();
			MapFileResConfig.setFieldLabelsAndTips(configDesc);

			///////////////////////////////////////////////////////////
			DataStructuresManager.getInstance().addTabel(InternalTabelName.MapDataConfigName, InternalTabelID.MapDataConfigID, "", "", "", "", "", "", null, TabelFieldData.NAME_FIELD);
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapDataConfigName);
			tabel.isInternal = true;
			tabel.dataConstructor = EditorClientMapData;
			configDesc = tabel.getConfigDesc();
			EditorClientMapData.setFieldLabelsAndTips(configDesc);

			//////////////////ClientMapAreaData///////////////////////
			tabel = addTabel(InternalTabelName.MapDataAreaConfigName, InternalTabelID.MapDataAreaConfigID, "", "", "", "", "", "", null, "");
			tabel.isInternal = true;
			tabel.dataConstructor = ClientMapAreaData;
			tabel.mSubFeatureType = FeaturesType.DECORATE_TYPE;
			field = tabel.addField(TabelFieldData.AREA_BLOCK_FIELD);
			field.mFieldName = "area";
			configDesc = tabel.getConfigDesc();
			ClientMapAreaData.setFieldLabelsAndTips(configDesc);

			//////////////////ClientMapTimeOfTheDayData///////////////////////
			tabel = addTabel(InternalTabelName.MapTimeOfTheDayConfigName, InternalTabelID.MapTimeOfTheDayConfigID);
			tabel.isInternal = true;
			tabel.dataConstructor = ClientMapTimeOfTheDayData;
			configDesc = tabel.getConfigDesc();
			configDesc.fieldLabels["mainCharSyncPosLightAmbientLevelFrom"] = "主角环境光强度0";
			configDesc.fieldTips["mainCharSyncPosLightAmbientLevelFrom"] = "主角同步位置灯环境光强度（白天）";

			configDesc.fieldLabels["mainCharSyncPosLightAmbientLevelTo"] = "主角环境光强度1";
			configDesc.fieldTips["mainCharSyncPosLightAmbientLevelTo"] = "主角同步位置灯环境光强度（夜晚）";

			configDesc.fieldLabels["mainCharSyncPosLightAmbientColorFrom"] = "主角环境光颜色0";
			configDesc.fieldTips["mainCharSyncPosLightAmbientColorFrom"] = "主角同步位置灯环境光颜色（白天）";
			configDesc.formatMapping["mainCharSyncPosLightAmbientColorFrom"] = "color";

			configDesc.fieldLabels["mainCharSyncPosLightAmbientColorTo"] = "主角环境光颜色1";
			configDesc.fieldTips["mainCharSyncPosLightAmbientColorTo"] = "主角同步位置灯环境光颜色（夜晚）";
			configDesc.formatMapping["mainCharSyncPosLightAmbientColorTo"] = "color";

			//====================
			configDesc.fieldLabels["mainCharSyncPosLightDiffuseLevelFrom"] = "主角漫反射强度0";
			configDesc.fieldTips["mainCharSyncPosLightDiffuseLevelFrom"] = "主角同步位置灯漫反射强度（白天）";

			configDesc.fieldLabels["mainCharSyncPosLightDiffuseLevelTo"] = "主角漫反射强度1";
			configDesc.fieldTips["mainCharSyncPosLightDiffuseLevelTo"] = "主角同步位置灯漫反射强度（夜晚）";

			configDesc.fieldLabels["mainCharSyncPosLightDiffuseColorFrom"] = "主角漫反射颜色0";
			configDesc.fieldTips["mainCharSyncPosLightDiffuseColorFrom"] = "主角同步位置灯漫反射颜色（白天）";
			configDesc.formatMapping["mainCharSyncPosLightDiffuseColorFrom"] = "color";

			configDesc.fieldLabels["mainCharSyncPosLightDiffuseColorTo"] = "主角漫反射颜色1";
			configDesc.fieldTips["mainCharSyncPosLightDiffuseColorTo"] = "主角同步位置灯漫反射颜色（夜晚）";
			configDesc.formatMapping["mainCharSyncPosLightDiffuseColorTo"] = "color";

			//====================
			configDesc.fieldLabels["sceneAreaDirectionalLightAmbientLevelFrom"] = "场景环境光强度0";
			configDesc.fieldTips["sceneAreaDirectionalLightAmbientLevelFrom"] = "场景区域方向灯环境光强度（白天）";

			configDesc.fieldLabels["sceneAreaDirectionalLightAmbientLevelTo"] = "场景环境光强度1";
			configDesc.fieldTips["sceneAreaDirectionalLightAmbientLevelTo"] = "场景区域方向灯环境光强度（夜晚）";

			configDesc.fieldLabels["sceneAreaDirectionalLightAmbientColorFrom"] = "场景环境光颜色0";
			configDesc.fieldTips["sceneAreaDirectionalLightAmbientColorFrom"] = "场景区域方向灯环境光颜色（白天）";
			configDesc.formatMapping["sceneAreaDirectionalLightAmbientColorFrom"] = "color";

			configDesc.fieldLabels["sceneAreaDirectionalLightAmbientColorTo"] = "场景环境光颜色1";
			configDesc.fieldTips["sceneAreaDirectionalLightAmbientColorTo"] = "场景区域方向灯环境光颜色（夜晚）";
			configDesc.formatMapping["sceneAreaDirectionalLightAmbientColorTo"] = "color";

			//====================
			configDesc.fieldLabels["sceneAreaDirectionalLightDiffuseLevelFrom"] = "场景漫反射强度0";
			configDesc.fieldTips["sceneAreaDirectionalLightDiffuseLevelFrom"] = "场景区域方向灯漫反射强度（白天）";

			configDesc.fieldLabels["sceneAreaDirectionalLightDiffuseLevelTo"] = "场景漫反射强度1";
			configDesc.fieldTips["sceneAreaDirectionalLightDiffuseLevelTo"] = "场景区域方向灯漫反射强度（夜晚）";

			configDesc.fieldLabels["sceneAreaDirectionalLightDiffuseColorFrom"] = "场景漫反射颜色0";
			configDesc.fieldTips["sceneAreaDirectionalLightDiffuseColorFrom"] = "场景区域方向灯漫反射颜色（白天）";
			configDesc.formatMapping["sceneAreaDirectionalLightDiffuseColorFrom"] = "color";

			configDesc.fieldLabels["sceneAreaDirectionalLightDiffuseColorTo"] = "场景漫反射颜色1";
			configDesc.fieldTips["sceneAreaDirectionalLightDiffuseColorTo"] = "场景区域方向灯漫反射颜色（夜晚）";
			configDesc.formatMapping["sceneAreaDirectionalLightDiffuseColorTo"] = "color";

			//====================
			configDesc.fieldLabels["skyFogColorFrom"] = "天空雾颜色0";
			configDesc.fieldTips["skyFogColorFrom"] = "天空雾颜色（白天）";
			configDesc.formatMapping["skyFogColorFrom"] = "color";

			configDesc.fieldLabels["skyFogColorTo"] = "天空雾颜色1";
			configDesc.fieldTips["skyFogColorTo"] = "天空雾颜色（夜晚）";
			configDesc.formatMapping["skyFogColorTo"] = "color";

			configDesc.fieldLabels["skyFogRatioFrom"] = "天空雾比例0";
			configDesc.fieldTips["skyFogRatioFrom"] = "天空雾比例（白天）";

			configDesc.fieldLabels["skyFogRatioTo"] = "天空雾比例1";
			configDesc.fieldTips["skyFogRatioTo"] = "天空雾比例（夜晚）";

			//====================
			configDesc.fieldLabels["fogColorFrom"] = "环境雾颜色0";
			configDesc.fieldTips["fogColorFrom"] = "环境雾颜色（白天）";
			configDesc.formatMapping["fogColorFrom"] = "color";

			configDesc.fieldLabels["fogColorTo"] = "环境雾颜色1";
			configDesc.fieldTips["fogColorTo"] = "环境雾颜色（夜晚）";
			configDesc.formatMapping["fogColorTo"] = "color";

			configDesc.fieldLabels["fogMinDistanceFrom"] = "环境雾最小深度0";
			configDesc.fieldTips["fogMinDistanceFrom"] = "环境雾最小深度（白天）";

			configDesc.fieldLabels["fogMinDistanceTo"] = "环境雾最小深度1";
			configDesc.fieldTips["fogMinDistanceTo"] = "环境雾最小深度（夜晚）";

			configDesc.fieldLabels["fogMaxDistanceFrom"] = "环境雾最大深度0";
			configDesc.fieldTips["fogMaxDistanceFrom"] = "环境雾最大深度（白天）";

			configDesc.fieldLabels["fogMaxDistanceTo"] = "环境雾最大深度1";
			configDesc.fieldTips["fogMaxDistanceTo"] = "环境雾最大深度（夜晚）";

			configDesc.fieldLabels["plantColorTransformFrom"] = "植物颜色变换0";
			configDesc.fieldTips["plantColorTransformFrom"] = "植物颜色变换（白天）";

			configDesc.fieldLabels["plantColorTransformTo"] = "植物颜色变换1";
			configDesc.fieldTips["plantColorTransformTo"] = "植物颜色变换（夜晚）";

			configDesc.fieldLabels["nightLostGroupRatio"] = "夜晚消失组比例";
			configDesc.fieldTips["nightLostGroupRatio"] = "夜晚消失组比例";

			configDesc.fieldLabels["nightToMornTime"] = "夜晚到白天时间";
			configDesc.fieldTips["nightToMornTime"] = "夜晚到白天时间";

			configDesc.fieldLabels["mornToNightTime"] = "白天到夜晚时间";
			configDesc.fieldTips["mornToNightTime"] = "白天到夜晚时间";

			//////////////////ClientMapCameraPropertyData///////////////////////
			tabel = addTabel(InternalTabelName.MapCameraPropertyConfigName, InternalTabelID.MapCameraPropertyConfigID);
			tabel.isInternal = true;
			tabel.dataConstructor = ClientMapCameraPropertyData;
			configDesc = tabel.getConfigDesc();
			ClientMapCameraPropertyData.setFieldLabelsAndTips(configDesc);

			//////////////////ClientMapCameraBokehDepth///////////////////////
			tabel = addTabel(InternalTabelName.MapCameraBokehDepthName, InternalTabelID.MapCameraBokehDepthConfigID);
			tabel.isInternal = true;
			tabel.dataConstructor = ClientMapCameraBokehDepth;
			configDesc = tabel.getConfigDesc();

			//story
			DataStructuresManager.getInstance().addTabel(InternalTabelName.XXXStoryConfigName, InternalTabelID.XXXStoryConfigID);
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.XXXStoryConfigName);
			tabel.isInternal = true;
			tabel.dataConstructor = StoryConfig;

			///////////////////////////////////////////////////////////
			DataStructuresManager.getInstance().addTabel(InternalTabelName.EffectAnimationConfigName, InternalTabelID.EffectAnimationConfigID, "", "", "", "", "", "", [new TabelFieldData("res", "res", "", 0, "", "", "", "")], "res");
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.EffectAnimationConfigName);
			tabel.isInternal = true;
			tabel.dataConstructor = EffectAnimationConfig;

			///////////////////////////////////////////////////////////
			fields = [];
			field = new TabelFieldData("key", "key", "", 0, "", "", "", "");
			field.tabelName = InternalTabelName.GlobalSettingConfigName;
			fields.push(field);

			DataStructuresManager.getInstance().addTabel(InternalTabelName.GlobalSettingConfigName, InternalTabelID.GlobalSettingConfigID, "", "", "", "", "", "", fields, "key");
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.GlobalSettingConfigName);
			tabel.isInternal = true;
			tabel.dataConstructor = GlobalSettingConfig;
			configDesc = tabel.getConfigDesc();
			GlobalSettingConfig.setFieldLabelsAndTips(configDesc);
		}

		public function saveConfig(xml : XML) : void
		{
			xml.appendChild(<tabel/>);
			for each (var tabel : TabelData in _tabels)
			{
				if (tabel.isInternal)
					continue;
				var tabelItem : XML = <item id={tabel.id} name={tabel.name} filePath={tabel.mFilePath} fileDire={tabel.mFileDire} majorKey={tabel.majorKey} featureType={tabel.mFeatureType} subFeatureType={tabel.mSubFeatureType} funcTag={tabel.mFuncTag} order={tabel.mOrder}/>;
				var majorKey : String = "";
				for each (var field : TabelFieldData in tabel.fields)
				{
					if (field.isInternal)
						continue;
					tabelItem.appendChild(<field name={field.name} fieldName={field.mFieldName} fieldExpression={field.mFieldExpression} linkTabel={field.mLinkTabel} fieldLabel={field.mFieldLabel} parentTabelField={field.mParentTabelField} dataProvidedField={field.mDataProvidedField} defaultValue={field.mDefaultValue}/>);
				}
				xml.tabel.appendChild(tabelItem);
			}
		}

		public function getTabelList() : Array
		{
			var datas : Array = [];
			for each (var tabel : TabelData in _tabels)
			{
				if (tabel.isInternal)
					continue;
				datas.push(tabel);
			}
			return datas;
		}

		public function loadTables() : void
		{
			ConfigEditView.closeAll();
			var infos : Array = [];
			for each (var tabel : TabelData in _tabels)
			{
				if (tabel.mFileDire)
					continue;
				if (tabel.tabelFilePath)
				{
					var hasData : Boolean = loadTableConfigData(tabel, tabel.tabelFilePath);
					if (!hasData)
						infos.push(tabel.tabelFilePath);
				}
			}
			if (infos.length > 0)
				Alert.show("打开配置表失败！\n" + infos.join("\n"), "提示");
		}

		public function createTempletTableFile(tabel : TabelData, cfgPath : String) : void
		{
			var modelFilePath : String = tabel.tabelFilePath;
			if (FileUtil.pathValid(modelFilePath))
			{
				var modelFile : File = new File(modelFilePath);
				if (modelFile && modelFile.exists && !modelFile.isDirectory)
				{
					var modelStr : String = FileUtil.readTextFile(modelFile);
					var configDesc : ConfigDesc = new ConfigDesc();
					configDesc.allowSameNameField = true;
					var info : String = FileUtil.parseTextData(modelStr, ConfigData, configDesc);
					if (info)
						Alert.show(modelFilePath + "信息：" + info, "提示");
					configDesc.cacheDic = new Dictionary();

					try
					{
						if (FileUtil.pathValid(cfgPath))
						{
							var cfgFile : File = new File(cfgPath);
							if (cfgFile && !cfgFile.exists)
							{
								var data : String = FileUtil.getTextDataFromDatas(configDesc);
								FileUtil.writeToFile(cfgFile.nativePath, data, "GB2312");
							}
						}
					}
					catch (e : Error)
					{
						Alert.show("从模板创建表发生错误：" + cfgPath, "提示");
					}
				}
			}
		}

		private function initTabelConfigDesc(tabel : TabelData) : ConfigDesc
		{
			var configDesc : ConfigDesc = tabel.getConfigDesc();
			var majorKeyField : TabelFieldData = tabel.majorKeyField;
			configDesc.majorKey = majorKeyField ? majorKeyField.mFieldName : "";
			for each (var field : TabelFieldData in tabel.fields)
			{
				var label : String = configDesc.fieldLabels[field.mFieldName];
				var newLabel : String = TabelFieldData.getFieldLabel(field.name);
				if (label)
				{
					var labelLen : int = label.length;
					var currIndex : int = -1;
					var newStr : String = "";
					for (var i : int = 0; i < labelLen; i++)
					{
						var labelChar : String = label.charAt(i);
						var index : int = newLabel.search(labelChar);
						if (index != -1 && (currIndex == -1 || index == currIndex + 1))
						{
							currIndex = index;
							newStr += labelChar;
						}
						else if (currIndex >= 0)
						{
							break;
						}
					}
					configDesc.fieldLabels[field.mFieldName] = newStr;
				}
				else
				{
					if (newLabel == field.name)
						configDesc.fieldLabels[field.mFieldName] = field.mFieldLabel;
					else
						configDesc.fieldLabels[field.mFieldName] = newLabel;
				}
				if (field.mLinkTabel && field.linkEnable)
				{
					var correlatTabel : TabelData = getTabelById(int(field.mLinkTabel));
					if (correlatTabel && !correlatTabel.isInternal)
					{
						if (!correlatTabel.mFilePath && !correlatTabel.mFileDire) //非加载的表数据
						{
							correlatTabel.builtInTabelId = tabel.id;
							correlatTabel.builtInFieldName = field.name;
							configDesc.builtInTables.push(correlatTabel);
						}
					}
				}
			}
			return configDesc;
		}

		public function loadTableConfigData(tabel : TabelData, cfgPath : String, dataClass : Class = null) : Boolean
		{
			try
			{
				if (!dataClass)
					dataClass = ConfigData;
				tabel.clearData();
				if (FileUtil.pathValid(cfgPath))
				{
					var cfgFile : File = new File(cfgPath);
					if (cfgFile && cfgFile.exists && !cfgFile.isDirectory)
					{
						var configDesc : ConfigDesc = initTabelConfigDesc(tabel);
						var builtInTables : Array = configDesc.builtInTables;

						var sameFileTabelData : TabelData = getSameFileTable(tabel);
						if (sameFileTabelData)
						{
							configDesc.setRawData(sameFileTabelData.getConfigDesc());
						}
						else
						{
							var cfgStr : String = FileUtil.readTextFile(cfgFile);
							var info : String = FileUtil.parseTextData(cfgStr, dataClass, configDesc);
							if (info)
								Alert.show(cfgPath + "信息：" + info, "提示");
						}
						TabelFieldData.setTabelFieldTips(tabel);
						checkNecessaryData(tabel);

						EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, tabel.name);

						for each (var builtInTabel : TabelData in builtInTables)
						{
							createBuiltInTableConfigData(tabel, builtInTabel);
						}
						return true;
					}
				}
			}
			catch (e : Error)
			{
				Alert.show("打开配置表" + cfgPath + "时发生错误！" + "\n" + e.message + "\n" + e.getStackTrace(), "错误");
				throw e;
			}
			return false;
		}

		private function getSameFileTable(currTabel : TabelData) : TabelData
		{
			if (currTabel.mFilePath)
			{
				for each (var tabel : TabelData in _tabels)
				{
					if (tabel != currTabel && tabel.mFilePath == currTabel.mFilePath)
					{
						return tabel;
					}
				}
			}
			return null;
		}

		/**
		 * 检查必要的数据
		 * @param tabel
		 *
		 */
		private function checkNecessaryData(tabel : TabelData) : void
		{
			if (tabel.name == InternalTabelName.AvatarResConfigName)
			{
				var configDesc : ConfigDesc = tabel.getConfigDesc();
				var avatarFileResConfigTabel : TabelData = getTabel(InternalTabelName.AvatarFileResConfigName);
				var avatarFileResConfigDesc : ConfigDesc = avatarFileResConfigTabel.getConfigDesc();
				var cfgResult : Array;
				for each (var avatarFileResData : AvatarFileResConfig in avatarFileResConfigDesc.cacheDic)
				{
					cfgResult = ConfigData.getCfgByFieldValue(configDesc, configDesc.majorKey, avatarFileResData.mRes);
					if (cfgResult.length == 0)
					{
						ConfigData.create(configDesc, [configDesc.majorKey, "dialogFaceMask", "headFaceMask"], [avatarFileResData.mRes, "0=0=1", "0=0=1"], AvatarResConfig);
					}
				}
				for each (var avatarResData : AvatarResConfig in configDesc.cacheDic)
				{
					cfgResult = ConfigData.getCfgByFieldValue(avatarFileResConfigDesc, avatarFileResConfigDesc.majorKey, avatarResData.mRes);
					if (cfgResult.length == 0)
					{
						ConfigData.remove(configDesc, avatarResData.id);
					}
				}
			}
		}

		/**
		 * 创建内建表配置数据
		 *
		 */
		private function createBuiltInTableConfigData(tabel : TabelData, correlatTabel : TabelData) : void
		{
			trace("[" + tabel.name + "]创建内建表[" + correlatTabel.name + "]");
			correlatTabel.clearData();
			var configDesc : ConfigDesc = initTabelConfigDesc(correlatTabel);
			correlatTabel.initDescFields(configDesc);
			var builtInTables : Array = configDesc.builtInTables;
			var builtInField : TabelFieldData = tabel.getField(correlatTabel.builtInFieldName);
			var tabelConfigDesc : ConfigDesc = tabel.getConfigDesc();
			var fieldIndexes : Array = tabelConfigDesc.getSameFieldIndexes(builtInField.mFieldName);
			var fieldIndexesLen : int = fieldIndexes ? fieldIndexes.length : 0;
			var datas : Array = FileUtil.dictToArray(tabelConfigDesc.cacheDic);
			FileUtil.sortDatas(datas);

			var data : ConfigData;
			var tabelFieldName : String;
			var tabelFieldValue : String;
			var i : int;
			var cfg : ConfigData;
			var builtInLinkIdFieldName : String;
			if (fieldIndexesLen > 1) //列遍历类型
			{
				for each (data in datas)
				{
					for (i = 0; i < fieldIndexesLen; i++)
					{
						var fieldIndex : int = fieldIndexes[i];
						tabelFieldName = tabelConfigDesc.getPropertyFieldName(builtInField.mFieldName, fieldIndex);
						tabelFieldValue = data[tabelFieldName];
						builtInLinkIdFieldName = ConfigData.getBuiltInLinkIdFieldName(builtInField.mFieldName, fieldIndex);
						data[builtInLinkIdFieldName] = "";

						if (tabelFieldValue)
						{
							//trace(tabelFieldValue);
							cfg = ConfigData.create(configDesc, null, null, tabel.dataConstructor);
							cfg.setValue(builtInField.mFieldName, tabelFieldValue, false);
							data[builtInLinkIdFieldName] = String(cfg.id);
						}
					}
				}
			}
			else //列遍历类型
			{
				builtInField.linkEnable = false;
				tabelFieldName = builtInField.mFieldName;
				builtInLinkIdFieldName = ConfigData.getBuiltInLinkIdFieldName(builtInField.mFieldName, 0);
				var fieldData : TabelFieldData = tabel.addField(builtInLinkIdFieldName);
				if (fieldData)
				{
					fieldData.mFieldName = builtInLinkIdFieldName;
					fieldData.mLinkTabel = correlatTabel.id;
					fieldData.isInternal = true;
				}
				for each (data in datas)
				{
					data[builtInLinkIdFieldName] = "";
					tabelFieldValue = data[tabelFieldName];
					if (tabelFieldValue)
					{
						var filedValues : Array = tabelFieldValue.split(";");
						var linkInfos : Array = []
						for (i = 0; i < filedValues.length; i++)
						{
							cfg = ConfigData.create(configDesc, null, null, tabel.dataConstructor);
							var info : String = filedValues[i];
							cfg.setValue(tabelFieldName, info, false);
							linkInfos.push(String(cfg.id));
						}
						data.setValue(builtInLinkIdFieldName, linkInfos.join(";"), false);
					}
				}
			}
			TabelFieldData.setTabelFieldTips(tabel);

			for each (var builtInTabel : TabelData in builtInTables)
			{
				createBuiltInTableConfigData(tabel, builtInTabel);
			}
			EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, correlatTabel.name);
		}

		public function addValuesToTabel(tabel : TabelData, data : ConfigData, fields : Array, values : Array) : ConfigData
		{
			var cfg : ConfigData = null;
			var tabelConfigDesc : ConfigDesc = tabel.desc;
			var builtInTables : Array = tabelConfigDesc.builtInTables;
			for each (var builtInTabel : TabelData in builtInTables)
			{
				var hasField : Boolean = builtInTabel.hasField(fields[0]);
				if (hasField)
				{
					var builtInField : TabelFieldData = tabel.getField(builtInTabel.builtInFieldName);
					var fieldIndexes : Array = tabelConfigDesc.getSameFieldIndexes(builtInField.mFieldName);
					var builtInConfigDesc : ConfigDesc = builtInTabel.desc;
					var fieldIndexesLen : int = fieldIndexes ? fieldIndexes.length : 0;
					if (fieldIndexesLen > 1) //列遍历类型
					{

					}
					else //行遍历类型
					{
						cfg = ConfigData.create(builtInConfigDesc, null, null, builtInTabel.dataConstructor);
						for (var i : int = 0; i < fields.length; i++)
						{
							var field : String = fields[i];
							var fieldData : TabelFieldData = builtInTabel.getField(field);
							cfg.setValue(fieldData.mFieldName, values[i], false);
						}
						EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, cfg.tabelName);

						var builtInLinkIdFieldName : String = ConfigData.getBuiltInLinkIdFieldName(builtInField.mFieldName, 0);
						var linkInfo : String = data[builtInLinkIdFieldName];
						var infos : Array = linkInfo ? linkInfo.split(";") : [];
						infos.push(cfg.id);
						linkInfo = infos.join(";");
						data.setValue(builtInLinkIdFieldName, linkInfo);
						changeDataFromBuiltInTabel(builtInTabel, cfg);
					}
					break;
				}
			}
			return cfg;
		}

		public function changeDataFromBuiltInTabel(tabel : TabelData, data : ConfigData) : void
		{
			if (tabel.builtInFieldName)
			{
				var builtInField : TabelFieldData = tabel.getField(tabel.builtInFieldName);
				if (builtInField)
				{
					var inTabel : TabelData = DataStructuresManager.getInstance().getTabelById(tabel.builtInTabelId);
					if (inTabel)
					{
						var fieldValue : String = data[builtInField.mFieldName];
						var dataId : int = data.id;
						var tabelConfigDesc : ConfigDesc = inTabel.getConfigDesc();

						for each (var data : ConfigData in tabelConfigDesc.cacheDic)
						{
							var fieldIndexes : Array = tabelConfigDesc.getSameFieldIndexes(builtInField.mFieldName);
							var fieldIndexesLen : int = fieldIndexes ? fieldIndexes.length : 0;
							var builtInLinkIdFieldName : String;
							if (fieldIndexesLen > 1) //列遍历类型
							{
								for (var i : int = 0; i < fieldIndexesLen; i++)
								{
									var fieldIndex : int = fieldIndexes[i];
									var tabelFieldName : String = tabelConfigDesc.getPropertyFieldName(builtInField.mFieldName, fieldIndex);
									builtInLinkIdFieldName = ConfigData.getBuiltInLinkIdFieldName(builtInField.mFieldName, fieldIndex);
									var currId : int = data[builtInLinkIdFieldName];
									if (currId == dataId)
									{
										data.setValue(tabelFieldName, fieldValue);
										break;
									}
								}
							}
							else //行遍历类型
							{
								builtInLinkIdFieldName = ConfigData.getBuiltInLinkIdFieldName(builtInField.mFieldName, 0);
								var linkInfo : String = data[builtInLinkIdFieldName];
								var cfgDatas : Array = ConfigData.getCfgByFieldValue(tabel.desc, tabel.desc.majorKey, linkInfo);
								var infos : Array = [];
								for each (var cfgData : ConfigData in cfgDatas)
								{
									infos.push(cfgData[builtInField.mFieldName]);
								}
								data.setValue(builtInField.mFieldName, infos.join(";"));
							}
						}
					}
				}
			}
		}

		public function removeValuesFromTabel(data : ConfigData) : void
		{
			var tabel : TabelData = getTabel(data.tabelName);
			if (!tabel)
			{
				return;
			}
			var tabelConfigDesc : ConfigDesc = tabel.desc;
			var builtInTabelId : int = tabel.builtInTabelId;
			var inTabel : TabelData = getTabelById(builtInTabelId);
			if (inTabel)
			{
				var inTabelConfigDesc : ConfigDesc = inTabel.desc;
				var builtInField : TabelFieldData = inTabel.getField(tabel.builtInFieldName);
				var fieldIndexes : Array = inTabelConfigDesc.getSameFieldIndexes(builtInField.mFieldName);
				var fieldIndexesLen : int = fieldIndexes ? fieldIndexes.length : 0;
				if (fieldIndexesLen > 1) //列遍历类型
				{

				}
				else //行遍历类型
				{
					var builtInLinkIdFieldName : String = ConfigData.getBuiltInLinkIdFieldName(builtInField.mFieldName, 0);
					var cfgDatas : Array = ConfigData.getCfgByFieldValue(inTabelConfigDesc, builtInLinkIdFieldName, String(data.id));
					if (cfgDatas.length > 0)
					{
						var cfgData : ConfigData = cfgDatas[0];
						var linkInfo : String = cfgData[builtInLinkIdFieldName];
						var infos : Array = linkInfo ? linkInfo.split(";") : [];
						var index : int = infos.indexOf(String(data[inTabelConfigDesc.majorKey]));
						if (index > -1)
						{
							infos.splice(index, 1);
						}
						linkInfo = infos.join(";");
						cfgData.setValue(builtInLinkIdFieldName, linkInfo);
					}
				}
			}
			ConfigData.remove(tabelConfigDesc, data.id);
			changeDataFromBuiltInTabel(tabel, data);
			EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, tabel.tabelName);
		}

		public function setBuiltInTabelFromId(tabel : TabelData, data : ConfigData, fieldName : String) : void
		{
			var fieldIndex : int = ConfigData.getBuiltInLinkIdFieldIndex(fieldName);
			if (fieldIndex < 0)
				return;
			var orgFieldName : String = ConfigData.getOriginalFieldName(fieldName);
			var tabelConfigDesc : ConfigDesc = tabel.getConfigDesc();
			var tabelFieldName : String = tabelConfigDesc.getPropertyFieldName(orgFieldName, fieldIndex);

			var correlationTabels : Array = getCorrelationTabels(tabel);
			for each (var correTabel : TabelData in correlationTabels)
			{
				if (correTabel.builtInFieldName)
				{
					var builtInField : TabelFieldData = correTabel.getField(correTabel.builtInFieldName);
					if (builtInField)
					{
						var currConfigDesc : ConfigDesc = correTabel.getConfigDesc();
						var builtInLinkIdFieldName : String = ConfigData.getBuiltInLinkIdFieldName(builtInField.mFieldName, fieldIndex);
						var dataId : int = data[builtInLinkIdFieldName];
						//trace(dataId);
						var currDatas : Array = ConfigData.getCfgByFieldValue(currConfigDesc, correTabel.majorKeyField.mFieldName, String(dataId));
						if (currDatas.length > 0)
							data.setValue(tabelFieldName, currDatas[0][builtInField.mFieldName]);
						else
							data.setValue(tabelFieldName, "");
					}
				}
			}
		}

		public function clearTableConfigData(tabel : TabelData) : void
		{
			var configDesc : ConfigDesc = tabel.getConfigDesc();
			var builtInTables : Array = configDesc.builtInTables;
			for each (var builtInTabel : TabelData in builtInTables)
			{
				clearTableConfigData(builtInTabel);
			}
			tabel.clearData();
			EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, tabel.name);
		}

		public function saveTable(name : String = null) : void
		{
			for each (var tabel : TabelData in _tabels)
			{
				if (!name || (tabel.name == name))
				{
					if (!tabel.mFileDire)
						saveTabelConfigData(tabel, tabel.tabelFilePath);
				}
			}
		}

		public function saveTabelConfigData(tabel : TabelData, cfgPath : String) : void
		{
			try
			{
				if (FileUtil.pathValid(cfgPath))
				{
					var cfgFile : File = new File(cfgPath);
					if (cfgFile && cfgFile.exists && !cfgFile.isDirectory)
					{
						var configDesc : ConfigDesc = tabel.getConfigDesc();
						var data : String = FileUtil.getTextDataFromDatas(configDesc);
						FileUtil.writeToFile(cfgFile.nativePath, data, "GB2312");
					}
				}
			}
			catch (e : Error)
			{
				Alert.show("保存配置表" + cfgPath + "时发生错误！" + "\n" + e.message + "\n" + e.getStackTrace(), "错误");
			}
		}

		public function addTabel(name : String, id : int = 0, filePath : String = "", fileDire : String = "", featureType : String = "", subFeatureType : String = "", funcTag : String = "", order : String = "", fields : Array = null, majorKey : String = "") : TabelData
		{
			var tabel : TabelData = getTabel(name);
			if (tabel)
				return null;
			if (id == 0)
			{
				TabelData.UID++;
				id = TabelData.UID;
			}
			tabel = new TabelData(id, name, filePath, fileDire, featureType, subFeatureType, funcTag ? funcTag : name, order ? order : String(id));
			TabelFieldData.setTabelFieldTips(tabel);
			tabel.majorKey = majorKey || TabelFieldData.ID_FIELD;
			if (fields)
			{
				tabel.initFields(fields);
			}
			else
			{
				tabel.addField(TabelFieldData.ID_FIELD);
				tabel.addField(TabelFieldData.NAME_FIELD);
			}
			_tabels.push(tabel);
			_tabels.sortOn(["id"], Array.NUMERIC);
			return tabel;
		}

		public function removeTabel(name : String) : void
		{
			var tabel : TabelData = getTabel(name);
			if (!tabel)
				return;
			var index : int = _tabels.indexOf(tabel);
			if (index != -1)
			{
				_tabels.splice(index, 1);
				if (selectedTabel == tabel)
					selectedTabel = null;
			}
		}

		public function getTabel(name : String) : TabelData
		{
			for each (var tabel : TabelData in _tabels)
			{
				if (tabel.name == name)
				{
					return tabel;
				}
			}
			return null;
		}

		public function getTabelById(id : int) : TabelData
		{
			if (id > 0)
			{
				for each (var tabel : TabelData in _tabels)
				{
					if (tabel.id == id)
						return tabel;
				}
			}
			return null;
		}

		public function getTabelsByFeature(featureType : String) : Array
		{
			var tabels : Array = [];
			for each (var tabel : TabelData in _tabels)
			{
				if (tabel.mFeatureType == featureType || tabel.mSubFeatureType == featureType)
				{
					tabels.push(tabel);
				}
			}
			return tabels;
		}

		public function getTabels() : Array
		{
			return _tabels;
		}

		public function getTabelNum(name : String) : int
		{
			var num : int = 0;
			for each (var tabel : TabelData in _tabels)
			{
				if (tabel.name == name)
				{
					num++;
				}
			}
			return num;
		}

		public function getParentTabelFields() : Array
		{
			var fields : Array = [];
			fields.push({type: "", name: "无"});
			if (selectedTabel)
			{
				for each (var tabel : TabelData in _tabels)
				{
					if (tabel != selectedTabel)
					{
						for each (var field : TabelFieldData in tabel.fields)
						{
							if (field.mLinkTabel && field.linkEnable && field.mLinkTabel == selectedTabel.id)
							{
								fields.push({type: field.name, name: field.mFieldLabel});
							}
						}
					}
				}
			}
			return fields;
		}

		public function getOtherTabels() : Array
		{
			var tabels : Array = [];
			tabels.push({type: 0, name: "无"});
			for each (var tabel : TabelData in _tabels)
			{
				if (tabel.isInternal)
					continue;
				if (tabel != selectedTabel)
				{
					tabels.push({type: tabel.id, name: tabel.name});
				}
			}
			return tabels;
		}

		public function getOtherFields() : Array
		{
			var fileds : Array = [];
			fileds.push({type: "", name: "无"});
			if (selectedTabel)
			{
				for each (var filed : TabelFieldData in selectedTabel.fields)
				{
					if (filed != selectedFiled)
					{
						fileds.push({type: filed.name, name: filed.mFieldLabel});
					}
				}
			}
			return fileds;
		}

		public function get selectedTabel() : TabelData
		{
			return _selectedTabel;
		}

		public function set selectedTabel(value : TabelData) : void
		{
			_selectedTabel = value;
			selectedFiled = null;
		}

		public function get selectedFiled() : TabelFieldData
		{
			return _selectedFiled;
		}

		public function set selectedFiled(value : TabelFieldData) : void
		{
			_selectedFiled = value;
		}

		public function removeTabelField(name : String, fieldName : String) : void
		{
			var tabel : TabelData = getTabel(name);
			if (!tabel)
				return;
			var field : TabelFieldData = tabel.removeField(fieldName);
			if (field == selectedFiled)
				selectedFiled = null;
		}

		public function getCorrelationTabels(tabel : TabelData) : Array
		{
			var correlationTabels : Array = [];
			for each (var field : TabelFieldData in tabel.fields)
			{
				if (field.mLinkTabel && field.linkEnable)
				{
					var correlatTabel : TabelData = getTabelById(int(field.mLinkTabel));
					if (correlatTabel)
					{
						if (correlationTabels.indexOf(correlatTabel) == -1)
							correlationTabels.push(correlatTabel);
						var tmpTabels : Array = getCorrelationTabels(correlatTabel);
						if (tmpTabels.length > 0)
						{
							var tmpTabels2 : Array = correlationTabels.slice();
							for each (var tmpTabel : TabelData in tmpTabels)
							{
								var exists : Boolean = false;
								for each (var tmpTabel2 : TabelData in tmpTabels2)
								{
									if (tmpTabel == tmpTabel2)
									{
										exists = true;
										break;
									}
								}
								if (!exists)
									correlationTabels.push(tmpTabel);
							}
						}
					}
				}
			}
			return correlationTabels;
		}

		public function getTabelFieldValueFromRoot(field : String, data : ConfigData, isMultiple : Boolean = true, datas : Array = null, isStrict : Boolean = false) : Array
		{
			var tabel : TabelData = getTabel(data.tabelName);
			if (tabel)
			{
				var result : Array = getRootTabelData(tabel, data);
				if (!result)
					return null;
				tabel = result[0] as TabelData;
				data = result[1];
				if (tabel && data)
					return getTabelFieldValue(field, data, null, isMultiple, datas, isStrict);
			}
			return null;
		}

		public function getTabelFieldValue(field : String, data : ConfigData, parentTabelField : String = null, isMultiple : Boolean = true, datas : Array = null, isStrict : Boolean = false) : Array
		{
			var tabel : TabelData = getTabel(data.tabelName);
			if (tabel)
			{
				var values : Array = null;
				var fieldData : TabelFieldData;
				for each (var fieldTmp : TabelFieldData in tabel.fields)
				{
					if (fieldTmp.name == field && (!parentTabelField || !fieldTmp.mParentTabelField || (fieldTmp.mParentTabelField == parentTabelField)))
					{
						fieldData = fieldTmp;
						break;
					}
				}
				if (fieldData)
				{
					values = (data[fieldData.mFieldName] != null) ? (isMultiple ? String(data[fieldData.mFieldName]).split(";") : [String(data[fieldData.mFieldName])]) : null;
					if (datas)
					{
						datas.push(data);
					}
					return values;
				}
				else
				{
					for each (fieldData in tabel.fields)
					{
						var correlatTabel : TabelData = (fieldData.mLinkTabel && fieldData.linkEnable) ? getTabelById(int(fieldData.mLinkTabel)) : null;
						if (correlatTabel)
						{
							var configDesc : ConfigDesc = correlatTabel.getConfigDesc();
							var majorKeyField : TabelFieldData = correlatTabel.majorKeyField;
							if (configDesc && majorKeyField)
							{
								values = null;
								var correlatValues : Array = data[fieldData.mFieldName] ? (isMultiple ? String(data[fieldData.mFieldName]).split(";") : [String(data[fieldData.mFieldName])]) : null;
								if (correlatValues)
								{
									for each (var correlatValue : String in correlatValues)
									{
										var correlatDatas : Array = ConfigData.getCfgByFieldValue(configDesc, majorKeyField.mFieldName, correlatValue, isStrict);
										if (correlatDatas.length > 0)
										{
											var tmpValues : Array = getTabelFieldValue(field, correlatDatas[0], fieldData.name, isMultiple, datas);
											if (tmpValues != null)
											{
												if (!values)
													values = [];
												values = values.concat(tmpValues);
											}
										}
										else
										{
											if (!values)
												values = [];
											values = values.concat(null);
											if (datas)
											{
												datas.push(null);
											}
										}
									}
								}
								if (values != null)
									return values;
							}
						}
					}
				}
			}
			return null;
		}

		public function getCorrelationFieldByFieldName(tabel : TabelData, fieldName : String, targetFieldName : String) : TabelFieldData
		{
			var fieldData : TabelFieldData = tabel.getFieldByFieldName(fieldName);
			if (fieldData && !fieldData.mParentTabelField && fieldData.name == targetFieldName)
			{
				return fieldData;
			}
			else
			{
				for each (fieldData in tabel.fields)
				{
					if (fieldData.mFieldName == fieldName && fieldData.mLinkTabel && fieldData.linkEnable)
					{
						var correlatTabel : TabelData = getTabelById(int(fieldData.mLinkTabel));
						var correlatField : TabelFieldData = getCorrelationFieldByField(correlatTabel, targetFieldName, fieldData.name);
						if (correlatField)
							return correlatField;
					}
				}
			}
			return null;
		}

		private function getCorrelationFieldByField(tabel : TabelData, targetFieldName : String, parentTabelField : String = null) : TabelFieldData
		{
			for each (var fieldData : TabelFieldData in tabel.fields)
			{
				if (fieldData.name == targetFieldName && (!parentTabelField || (fieldData.mParentTabelField == parentTabelField)))
				{
					return fieldData;
				}
				else if (fieldData.mLinkTabel && fieldData.linkEnable)
				{
					var correlatTabel : TabelData = getTabelById(int(fieldData.mLinkTabel));
					var correlatField : TabelFieldData = getCorrelationFieldByField(correlatTabel, targetFieldName, fieldData.name);
					if (correlatField)
						return correlatField;
				}
			}
			return null;
		}

		/**
		 * 获取关联字段
		 * @param tabel
		 * @param field
		 * @return
		 *
		 */
		public function getCorrelationField(tabel : TabelData, field : String) : TabelFieldData
		{
			var fieldData : TabelFieldData = tabel.getField(field);
			if (fieldData)
			{
				return fieldData;
			}
			else
			{
				for each (fieldData in tabel.fields)
				{
					if (fieldData.mLinkTabel && fieldData.linkEnable)
					{
						var correlatTabel : TabelData = getTabelById(int(fieldData.mLinkTabel));
						var correlatField : TabelFieldData = getCorrelationField(correlatTabel, field);
						if (correlatField)
							return correlatField;
					}
				}
			}
			return null;
		}

		public function getCorrelationTabelByFieldName(tabel : TabelData, fieldName : String) : TabelData
		{
			for each (var fieldData : TabelFieldData in tabel.fields)
			{
				if (fieldData.mFieldName == fieldName)
				{
					return tabel;
				}
				else if (fieldData.mLinkTabel && fieldData.linkEnable)
				{
					var correlatTabel : TabelData = getTabelById(int(fieldData.mLinkTabel));
					var tmpTabel : TabelData = getCorrelationTabelByFieldName(correlatTabel, fieldName);
					if (tmpTabel)
						return tmpTabel;
				}
			}
			return null;
		}

		public function getRootTabel(tabel : TabelData) : TabelData
		{
			if (tabel.mFeatureType)
			{
				return tabel;
			}
			else
			{
				for each (var tmpTabel : TabelData in _tabels)
				{
					if (tabel == tmpTabel)
					{
						continue;
					}
					var correlatTabel : TabelData = getCorrelatedRootTabel(tabel, tmpTabel);
					if (correlatTabel)
						return correlatTabel;
				}
			}
			return null;
		}

		private function getCorrelatedRootTabel(tabel : TabelData, parentTabel : TabelData) : TabelData
		{
			if (!tabel || !parentTabel)
			{
				return null;
			}
			if (tabel == parentTabel)
			{
				return parentTabel;
			}
			else
			{
				for each (var fieldData : TabelFieldData in parentTabel.fields)
				{
					if (fieldData.mLinkTabel && fieldData.linkEnable)
					{
						var correlatTabel : TabelData = getTabelById(int(fieldData.mLinkTabel));
						if (correlatTabel == parentTabel)
						{
							return parentTabel;
						}
						else
						{
							correlatTabel = getCorrelatedRootTabel(tabel, correlatTabel);
							if (correlatTabel)
								return parentTabel;
						}
					}
				}
			}
			return null;
		}

		/**
		 * 获取链接表的数据
		 * @param data
		 * @param fieldName
		 * @return
		 *
		 */
		public function getLinkTabelData(data : ConfigData, fieldName : String) : ConfigData
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			if (tabel)
			{
				var fieldData : TabelFieldData = tabel.getFieldByFieldName(fieldName);
				if (fieldData && fieldData.mLinkTabel && fieldData.linkEnable)
				{
					var linkTabel : TabelData = DataStructuresManager.getInstance().getTabelById(fieldData.mLinkTabel);
					if (linkTabel && linkTabel.majorKeyField)
					{
						var datas : Array = ConfigData.getCfgByFieldValue(linkTabel.desc, linkTabel.majorKeyField.mFieldName, data[fieldName]);
						if (datas.length > 0)
							return datas[0];
					}
				}
			}
			return null;
		}

		public function getCorrelationDatas(tabel : TabelData, data : ConfigData) : Array
		{
			var datas : Array = [];
			var majorKeyField : TabelFieldData = tabel.majorKeyField;
			if (majorKeyField)
			{
				datas = datas.concat(data);
				var majorKeyValue : String = data[majorKeyField.mFieldName];
				for each (var tmpTabel : TabelData in _tabels)
				{
					var tmpDatas : Array = getCorrelationDatasByLinkId(tmpTabel, tabel.id, majorKeyValue);
					datas = datas.concat(tmpDatas);
				}
			}
			return datas;
		}

		private function getCorrelationDatasByLinkId(tabel : TabelData, linkId : int, majorValue : String) : Array
		{
			var datas : Array = [];
			for each (var fieldData : TabelFieldData in tabel.fields)
			{
				if (fieldData.mLinkTabel && fieldData.linkEnable)
				{
					if (fieldData.mLinkTabel == linkId)
					{
						var configDesc : ConfigDesc = tabel.getConfigDesc();
						var cfgDatas : Array = ConfigData.getCfgByFieldValue(configDesc, fieldData.mFieldName, majorValue);
						if (cfgDatas.length > 0)
							datas = datas.concat(cfgDatas);
					}
					var correlatTabel : TabelData = getTabelById(int(fieldData.mLinkTabel));
					if (correlatTabel)
					{
						var tmpDatas : Array = getCorrelationDatasByLinkId(correlatTabel, linkId, majorValue);
						if (tmpDatas.length > 0)
							datas = datas.concat(tmpDatas);
					}
				}
			}
			return datas;
		}

		public function getRootTabelData(tabel : TabelData, data : ConfigData) : Array
		{
			var result : Array = null;
			if (tabel.mFeatureType)
			{
				result = [tabel, data];
				return result;
			}
			else
			{
				for each (var tmpTabel : TabelData in _tabels)
				{
					result = getCorrelatedRootTabelData(tabel, tmpTabel, data);
					if (result)
						return result;
				}
			}
			return result;
		}

		private function getCorrelatedRootTabelData(tabel : TabelData, parentTabel : TabelData, data : ConfigData) : Array
		{
			var result : Array = null;
			if (!tabel || !parentTabel || !data)
			{
				return result;
			}
			if (tabel == parentTabel)
			{
				result = [parentTabel, data];
				return result;
			}
			else
			{
				var majorKeyField : TabelFieldData = tabel.majorKeyField;
				if (!majorKeyField)
					return result;
				var majorValue : String = data[majorKeyField.mFieldName];
				var configDesc : ConfigDesc = parentTabel.getConfigDesc();
				for each (var fieldData : TabelFieldData in parentTabel.fields)
				{
					if (fieldData.mLinkTabel && fieldData.linkEnable)
					{
						var cfgDatas : Array = ConfigData.getCfgByFieldValue(configDesc, fieldData.mFieldName, majorValue);
						if (cfgDatas.length == 0)
							continue;
						data = cfgDatas[0];
						var correlatTabel : TabelData = getTabelById(int(fieldData.mLinkTabel));
						if (correlatTabel == parentTabel)
						{
							result = [parentTabel, data];
							return result;
						}
						else
						{
							result = getCorrelatedRootTabelData(tabel, correlatTabel, data);
							if (result)
							{
								result = [parentTabel, data];
								return result;
							}
						}
					}
				}
			}
			return result;
		}

		public function getCorrelationCacheDatas(configDesc : ConfigDesc, searchKey : String = "", fields : Array = null, absoluteField : String = null, absoluteValue : String = null) : Dictionary
		{
			var result : Dictionary;
			if (searchKey || absoluteField)
			{
				result = new Dictionary();
				if (fields)
				{
					var tabel : TabelData = getTabel(configDesc.tabelName);
					for each (var data : ConfigData in configDesc.cacheDic)
					{
						for each (var field : String in fields)
						{
							if ((String(data[field]).indexOf(searchKey) != -1) && (!absoluteField || data[absoluteField] == absoluteValue || equalsCorrelationData(tabel, data.id, absoluteField, absoluteValue)))
							{
								result[data.id] = data;
								break;
							}
						}
					}
				}
			}
			else
			{
				if (configDesc)
					result = configDesc.cacheDic;
			}
			return result;
		}

		private function equalsCorrelationData(tabel : TabelData, id : int, fieldName : String, value : String) : Boolean
		{
			var configDesc : ConfigDesc = tabel.getConfigDesc();
			if (configDesc)
			{
				var data : ConfigData = ConfigData.getCfg(configDesc, id);
				if (data)
				{
					for each (var fieldData : TabelFieldData in tabel.fields)
					{
						if (fieldData.mFieldName == fieldName && data[fieldData.mFieldName] == value)
						{
							return true;
						}
						else if (fieldData.mLinkTabel && fieldData.linkEnable)
						{
							var correlatTabel : TabelData = getTabelById(int(fieldData.mLinkTabel));
							var tmpEquals : Boolean = equalsCorrelationData(correlatTabel, data[fieldData.name], fieldName, value);
							if (tmpEquals)
								return true;
						}
					}
				}
			}
			return false;
		}

		public function dispatchSceneIdChangeEvent() : void
		{
			for each (var tabel : TabelData in _tabels)
			{
				var sceneField : TabelFieldData = DataStructuresManager.getInstance().getCorrelationField(tabel, TabelFieldData.SCENE_FIELD);
				if (sceneField)
				{
					EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, tabel.name);
				}
			}
		}

		/**
		 * 当前路径的表是否已经设置成有特性功能的表
		 * @param path
		 * @return
		 *
		 */
		public function isFeaturesTabelByPath(path : String) : Boolean
		{
			for each (var tabel : TabelData in _tabels)
			{
				if (!tabel.mFileDire && ProjectConfig.getTabelCfgPath(tabel.mFilePath) == path)
					return true;
			}
			return false;
		}
	}
}
