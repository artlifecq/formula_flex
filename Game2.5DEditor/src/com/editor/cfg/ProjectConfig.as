package com.editor.cfg
{
	import com.editor.data.ConfigDesc;
	import com.editor.data.InternalTabelID;
	import com.editor.data.InternalTabelName;
	import com.editor.data.TabelData;
	import com.editor.data.VersionItemData;
	import com.editor.data.map.EditorClientMapData;
	import com.editor.manager.DBManager;
	import com.editor.manager.DataStructuresManager;
	import com.editor.manager.ReleaseVersionManager;
	import com.editor.utils.FileUtil;
	
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 *
	 * 项目配置
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-24 上午10:30:12
	 *
	 */
	public class ProjectConfig
	{
		private static var CONFIG_PATH : String = "";
		private static var LANG_PATH : String = "";
		private static var CLIENT_RES_PATH : String = "";
		private static var CODE_PATH : String = "";
		private static var SERVER_PATH : String = "";

		private static var SCENE_MAP_BLOCK_INFO_PATH : String = "";
		private static var GENERATE_CODE_PATH : String = "";
		private static var EFFECT_ANIMATION_CFG_PATH : String = "";
		private static var AVATAR_RES_CONFIG_PATH : String = "";
		private static var GLOBAL_SETTING_CFG_PATH : String = "";
		private static var DIALOG_FACEMASK_REFEREN_PATH : String = "";
		private static var HEAD_FACE_MASK_REFEREN_PATH : String = "";
		private static var BOSS_HEAD_FACE_MASK_REFEREN_PATH : String = "";
		private static var STORY_CFG_PATH : String = "";
		private static var STORY_EVENT_CFG_PATH : String = "";
		private static var STORY_ACTION_CFG_PATH : String = "";

		//
		public static var USE_AVATAR_FILE_KINDS : Boolean = false;
		public static var USE_EFFECT_FILE_KINDS : Boolean = false;

		public function ProjectConfig()
		{
		}

		public static function load() : void
		{
			if (!EditorConfig.WORKSPACE_PATH)
				return;
			readWorkspace();
			readProject();
			readSettting();
			readProperties();
		}

		private static function readWorkspace() : void
		{
			var file : File = new File(EditorConfig.WORKSPACE_PATH);
			file = file.resolvePath(".game3DEditorWorkspace");
			if (file.exists && !file.isDirectory)
			{
				var bytes : ByteArray = FileUtil.readFile(file);
				var xml : XML = new XML(bytes.toString());
				CONFIG_PATH = xml.config.CONFIG_PATH;
				LANG_PATH = xml.config.LANG_PATH;
				CLIENT_RES_PATH = xml.config.CLIENT_RES_PATH;
				CODE_PATH = xml.config.CODE_PATH;
				SERVER_PATH = xml.config.SERVER_PATH;
				bytes.clear();
			}
		}

		private static function readProject() : void
		{
			var file : File = new File(EditorConfig.WORKSPACE_PATH);
			if (CLIENT_RES_PATH)
			{
				if (file.resolvePath(CLIENT_RES_PATH).exists)
					file = file.resolvePath(CLIENT_RES_PATH);
			}
			var projectFile : File = file.resolvePath(".game3DEditorProject");
			if (projectFile.exists && !projectFile.isDirectory)
			{
				var bytes : ByteArray = FileUtil.readFile(projectFile);
				var xml : XML = new XML(bytes.toString());
				STORY_CFG_PATH = xml.config.STORY_CFG_PATH;
				SCENE_MAP_BLOCK_INFO_PATH = xml.config.SCENE_MAP_BLOCK_INFO_PATH;
				GENERATE_CODE_PATH = xml.config.GENERATE_CODE_PATH;
				EFFECT_ANIMATION_CFG_PATH = xml.config.EFFECT_ANIMATION_CFG_PATH;
				AVATAR_RES_CONFIG_PATH = xml.config.AVATAR_RES_CONFIG_PATH;
				GLOBAL_SETTING_CFG_PATH = xml.config.GLOBAL_SETTING_CFG_PATH;
				DIALOG_FACEMASK_REFEREN_PATH = xml.config.DIALOG_FACEMASK_REFEREN_PATH;
				HEAD_FACE_MASK_REFEREN_PATH = xml.config.HEAD_FACE_MASK_REFEREN_PATH;
				BOSS_HEAD_FACE_MASK_REFEREN_PATH = xml.config.BOSS_HEAD_FACE_MASK_REFEREN_PATH;

				DBManager.openDB(file);
				DataStructuresManager.getInstance().loadConfig(xml);
				bytes.clear();
			}
		}

		private static function readSettting() : void
		{
			var file : File = new File(EditorConfig.WORKSPACE_PATH);
			if (CLIENT_RES_PATH)
			{
				if (file.resolvePath(CLIENT_RES_PATH).exists)
					file = file.resolvePath(CLIENT_RES_PATH);
			}
			var releaseVersionDatas : Vector.<VersionItemData> = new Vector.<VersionItemData>();
			file = file.resolvePath(".game3DEditorSettting");
			if (file.exists && !file.isDirectory)
			{
				var bytes : ByteArray = FileUtil.readFile(file);
				var xml : XML = new XML(bytes.toString());

				for each (var versionItem : XML in xml.releaseVersion.item)
				{
					var versionData : VersionItemData = new VersionItemData();
					versionData.versionId = int(versionItem.@id);
					versionData.versionName = String(versionItem.@name);
					versionData.svnRootDire = String(versionItem.@svnRootDire);
					versionData.releaseDire = String(versionItem.@releaseDire);
					releaseVersionDatas.push(versionData);
				}

				bytes.clear();
			}
			ReleaseVersionManager.getInstance().initVersions(releaseVersionDatas);
		}

		private static function readProperties() : void
		{
//			DBManager.addLan("qqqq", "11111");
//			DBManager.showLan();

			var avatarNameByRes : Dictionary = new Dictionary();
			var effectNameByRes : Dictionary = new Dictionary();
            var sceneID : Dictionary = new Dictionary();

			var file : File = new File(EditorConfig.WORKSPACE_PATH);
			if (CLIENT_RES_PATH)
			{
				if (file.resolvePath(CLIENT_RES_PATH).exists)
					file = file.resolvePath(CLIENT_RES_PATH);
			}
			file = file.resolvePath(".game3DEditorProperties");
			if (file.exists && !file.isDirectory)
			{
				var bytes : ByteArray = FileUtil.readFile(file);
				var xml : XML = new XML(bytes.toString());
				USE_AVATAR_FILE_KINDS = (String(xml.config.USE_AVATAR_FILE_KINDS) == "true");
				USE_EFFECT_FILE_KINDS = (String(xml.config.USE_EFFECT_FILE_KINDS) == "true");

				for each (var avatarNameItem : XML in xml.avatarName.item)
				{
					avatarNameByRes[String(avatarNameItem.@res)] = String(avatarNameItem.@name) + //
						"|" + String(avatarNameItem.@hairRes) + //
						"|" + String(avatarNameItem.@weaponRes + //
						"|" + String(avatarNameItem.@mountRes) + //
						"|" + String(avatarNameItem.@animatRes) + //
						"|" + String(avatarNameItem.@effectRes));
				}
				for each (var effectNameItem : XML in xml.effectName.item)
				{
					effectNameByRes[String(effectNameItem.@res)] = String(effectNameItem.@name);
				}
                for each (var sceneIDItem : XML in xml.sceneID.item) {
                    sceneID[String(sceneIDItem.@name)] = int(sceneIDItem.@id);
                }
				bytes.clear();
			}

			var tabel : TabelData;
			var configDesc : ConfigDesc;
			var relativePath : String;
			var kindName : String;
			var fileDatas : Array = [];

			////////
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarFileResConfigName);
			if (tabel)
			{
				configDesc = tabel.getConfigDesc();
				configDesc.clear();
				configDesc.majorKey = "res";
				configDesc.fieldLabels["res"] = "资源";
				configDesc.fieldLabels["hairRes"] = "头发资源";
				configDesc.fieldLabels["weaponRes"] = "装备资源";
				configDesc.fieldLabels["mountRes"] = "坐骑资源";
				configDesc.fieldLabels["animatRes"] = "动画资源";
				configDesc.fieldLabels["effectRes"] = "特效资源";

				fileDatas.length = 0;
				AvatarFileResConfig.avatarFileKinds.length = 0;
				var avatarRes : String;
				var avatarResConfigUID : int = 0;
				var avatarPath : String = GlobalConfig.avatarPath;
				var avatarDireFile : File = new File(avatarPath);
				if (avatarDireFile.exists && avatarDireFile.isDirectory)
				{
					var avatarFileList : Dictionary = FileUtil.getDirectoryFiles(avatarDireFile.nativePath, "awd");
					var avatarDire : File = new File(avatarDireFile.nativePath);
					for (var avatarKindPath : String in avatarFileList)
					{
						relativePath = avatarDire.getRelativePath(new File(avatarKindPath), false);
						if (relativePath)
							relativePath = relativePath.split("/")[0];
						if (AvatarFileResConfig.avatarFileKinds.indexOf(relativePath) == -1)
							AvatarFileResConfig.avatarFileKinds.push(relativePath);

						var avatarFiles : Array = avatarFileList[avatarKindPath];
						for each (var avatarFile : File in avatarFiles)
						{
							relativePath = avatarDireFile.getRelativePath(avatarFile);
							avatarRes = relativePath.split(".")[0];
							fileDatas.push(avatarRes);
						}
					}
					fileDatas.sort(Array.CASEINSENSITIVE);
					for each (avatarRes in fileDatas)
					{
						var nameValueParts : Array = String(avatarNameByRes[avatarRes]).split("|");
						var avatarName : String = nameValueParts[0] ? nameValueParts[0] : "";
						if (avatarName == "undefined")
							avatarName = "";
						var hairRes : String = nameValueParts[1] ? nameValueParts[1] : "";
						if (hairRes == "undefined")
							hairRes = "";
						var weaponRes : String = nameValueParts[2] ? nameValueParts[2] : "";
						if (weaponRes == "undefined")
							weaponRes = "";
						var mountRes : String = nameValueParts[3] ? nameValueParts[3] : "";
						if (mountRes == "undefined")
							mountRes = "";
						var animatRes : String = nameValueParts[4] ? nameValueParts[4] : "";
						if (animatRes == "undefined")
							animatRes = "";
						var aEffectRes : String = nameValueParts[5] ? nameValueParts[5] : "";
						if (aEffectRes == "undefined")
							aEffectRes = "";
						avatarResConfigUID++;
						var avatarResData : AvatarFileResConfig = ConfigData.create(configDesc, null, null, tabel.dataConstructor) as AvatarFileResConfig;
						avatarResData.id = avatarResConfigUID;
						avatarResData.name = avatarName || "";
						avatarResData.mRes = avatarRes;
						avatarResData.mHairRes = hairRes;
						avatarResData.mWeaponRes = weaponRes;
						avatarResData.mMountRes = mountRes;
						avatarResData.mAnimatRes = animatRes;
						avatarResData.mEffectRes = aEffectRes;
					}
				}
				AvatarFileResConfig.avatarFileKinds.sort(Array.CASEINSENSITIVE);
			}

			////////
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.EffectResConfigName);
			if (tabel)
			{
				configDesc = tabel.getConfigDesc();
				configDesc.clear();
				configDesc.majorKey = "res";
				configDesc.fieldLabels["res"] = "资源";

				fileDatas.length = 0;
				EffectResConfig.effectFileKinds.length = 0;
				var effectRes : String;
				var effectResConfigUID : int = 0;
				var effectPath : String = GlobalConfig.effectPath;
				var effectDireFile : File = new File(effectPath);
				if (effectDireFile.exists && effectDireFile.isDirectory)
				{
					var effectFileList : Dictionary = FileUtil.getDirectoryFiles(effectDireFile.nativePath, "awd");
					var effectDire : File = new File(effectDireFile.nativePath);
					for (var effectKindPath : String in effectFileList)
					{
						relativePath = effectDire.getRelativePath(new File(effectKindPath), false);
						if (relativePath)
							relativePath = relativePath.split("/")[0];
						if (EffectResConfig.effectFileKinds.indexOf(relativePath) == -1)
							EffectResConfig.effectFileKinds.push(relativePath);

						var effectFiles : Array = effectFileList[effectKindPath];
						for each (var effectFile : File in effectFiles)
						{
							relativePath = effectDireFile.getRelativePath(effectFile);
							effectRes = relativePath.split(".")[0];
							fileDatas.push(effectRes);
						}
					}
					fileDatas.sort(Array.CASEINSENSITIVE);
					for each (effectRes in fileDatas)
					{
						var effectName : String = effectNameByRes[effectRes];
						if (effectName == "undefined")
							effectName = "";
						var effectResData : EffectResConfig = ConfigData.create(configDesc, null, null, tabel.dataConstructor) as EffectResConfig;
						effectResConfigUID++;
						effectResData.id = effectResConfigUID;
						effectResData.name = effectName || "";
						effectResData.mRes = effectRes;
					}
				}
				EffectResConfig.effectFileKinds.sort(Array.CASEINSENSITIVE);
			}

			////////
			var mapFileConfigDesc : ConfigDesc = null;
			var mapFileTabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapFileResConfigName);
			if (mapFileTabel)
			{
				mapFileConfigDesc = mapFileTabel.getConfigDesc();
				mapFileConfigDesc.clear();
			}
			var mapDataConfigDesc : ConfigDesc = null;
			var mapDataTabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapDataConfigName);
			if (mapDataTabel)
			{
				mapDataConfigDesc = mapDataTabel.getConfigDesc();
				mapDataConfigDesc.clear();
			}
			var mapPath : String = GlobalConfig.mapPath;
			var mapDireFile : File = new File(mapPath);
			if (mapDireFile.exists && mapDireFile.isDirectory)
			{
				var mapFiles : Array = mapDireFile.getDirectoryListing();
				var fileLen : int = mapFiles.length;
				for (var i : int = 0; i < fileLen; i++)
				{
					var mapFile : File = mapFiles[i];
					if (mapFile.isDirectory)
					{
						var mapAwd : File = mapFile.resolvePath(mapFile.name + ".awd");
						if (mapAwd.exists && !mapAwd.isDirectory)
						{
							if (mapFileConfigDesc)
								ConfigData.create(mapFileConfigDesc, ["name", "res"], [mapFile.name, mapFile.name], mapFileTabel.dataConstructor);
						}
					}
					else
					{
						if (mapFile.extension.toLowerCase() == "dat")
						{
							var mapDataRes : String = mapFile.name.split(".")[0];
							if (mapDataConfigDesc) {
                                if (null != sceneID[mapDataRes]) {
                                    ConfigData.create(mapDataConfigDesc, ["name", "id"], [mapDataRes, sceneID[mapDataRes]], mapDataTabel.dataConstructor);
                                } else {
                                    ConfigData.create(mapDataConfigDesc, ["name"], [mapDataRes], mapDataTabel.dataConstructor);
                                }
                            }
						}
					}
				}
			}

			//音效数据
			createSoundData();
		}


		/**
		 * 构建音效数据
		 * @author 杨剑明	  2015-11-4
		 */
		private static function createSoundData() : void
		{
			var tabel : TabelData;
			var configDesc : ConfigDesc;
			var relativePath : String;
			var kindName : String;
			var fileDatas : Array = [];

			DataStructuresManager.getInstance().addTabel(InternalTabelName.SoundResConfigName, InternalTabelID.SoundResConfigID);
			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.SoundResConfigName);
			tabel.isInternal = true;
			tabel.dataConstructor = SoundResConfig;
			configDesc = tabel.getConfigDesc();
			configDesc.clear();
			configDesc.majorKey = "res";
			configDesc.fieldLabels["res"] = "资源";

			fileDatas.length = 0;
			SoundResConfig.soundFileKinds.length = 0;
			var soundRes : String;
			var soundResConfigUID : int = 0;
			var soundPath : String = GlobalConfig.soundPath;
			var soundDireFile : File = new File(soundPath);
			if (soundDireFile.exists && soundDireFile.isDirectory)
			{
				var soundFileList : Dictionary = FileUtil.getDirectoryFiles(soundDireFile.nativePath, "mp3");
				var soundDire : File = new File(soundDireFile.nativePath);
				for (var soundKindPath : String in soundFileList)
				{
					relativePath = soundDire.getRelativePath(new File(soundKindPath), false);
					if (relativePath)
						relativePath = relativePath.split("/")[0];
					if (SoundResConfig.soundFileKinds.indexOf(relativePath) == -1)
						SoundResConfig.soundFileKinds.push(relativePath);

					var soundFiles : Array = soundFileList[soundKindPath];
					for each (var soundFile : File in soundFiles)
					{
						relativePath = soundDireFile.getRelativePath(soundFile);
						soundRes = relativePath.split(".")[0];
						fileDatas.push(soundRes);
					}
				}
				fileDatas.sort(Array.CASEINSENSITIVE);
				for each (soundRes in fileDatas)
				{
					var soundffectResData : SoundResConfig = ConfigData.create(configDesc, null, null, tabel.dataConstructor) as SoundResConfig;
					soundResConfigUID++;
					soundffectResData.name = "";
					soundffectResData.id = soundResConfigUID;
					soundffectResData.mRes = soundRes;
				}
			}
			EffectResConfig.effectFileKinds.sort(Array.CASEINSENSITIVE);
		}

		public static function saveProject() : void
		{
			var xml : XML = <config/>;
			xml.config.STORY_CFG_PATH = STORY_CFG_PATH;
			xml.config.SCENE_MAP_BLOCK_INFO_PATH = SCENE_MAP_BLOCK_INFO_PATH;
			xml.config.GENERATE_CODE_PATH = GENERATE_CODE_PATH;
			xml.config.EFFECT_ANIMATION_CFG_PATH = EFFECT_ANIMATION_CFG_PATH;
			xml.config.AVATAR_RES_CONFIG_PATH = AVATAR_RES_CONFIG_PATH;
			xml.config.GLOBAL_SETTING_CFG_PATH = GLOBAL_SETTING_CFG_PATH;
			xml.config.DIALOG_FACEMASK_REFEREN_PATH = DIALOG_FACEMASK_REFEREN_PATH;
			xml.config.HEAD_FACE_MASK_REFEREN_PATH = HEAD_FACE_MASK_REFEREN_PATH;
			xml.config.BOSS_HEAD_FACE_MASK_REFEREN_PATH = BOSS_HEAD_FACE_MASK_REFEREN_PATH;

			DataStructuresManager.getInstance().saveConfig(xml);

			var bytes : ByteArray = new ByteArray();
			bytes.writeUTFBytes(xml.toXMLString());
			var file : File = new File(EditorConfig.WORKSPACE_PATH);
			if (CLIENT_RES_PATH)
			{
				if (file.resolvePath(CLIENT_RES_PATH).exists)
					file = file.resolvePath(CLIENT_RES_PATH);
			}
			file = file.resolvePath(".game3DEditorProject");
			FileUtil.writeToFile(file.nativePath, bytes);
			bytes.clear();
		}

		public static function saveSetting() : void
		{
			var xml : XML = <config/>;

			var versionDatas : Array = ReleaseVersionManager.getInstance().versions;
			xml.appendChild(<releaseVersion/>);
			for each (var versionData : VersionItemData in versionDatas)
			{
				xml.releaseVersion.appendChild(<item id={versionData.versionId} name={versionData.versionName} svnRootDire={versionData.svnRootDire} releaseDire={versionData.releaseDire}/>);
			}

			var bytes : ByteArray = new ByteArray();
			bytes.writeUTFBytes(xml.toXMLString());
			var file : File = new File(EditorConfig.WORKSPACE_PATH);
			if (CLIENT_RES_PATH)
			{
				if (file.resolvePath(CLIENT_RES_PATH).exists)
					file = file.resolvePath(CLIENT_RES_PATH);
			}
			file = file.resolvePath(".game3DEditorSettting");
			FileUtil.writeToFile(file.nativePath, bytes);
			bytes.clear();
		}

		public static function save() : void
		{
			if (!EditorConfig.WORKSPACE_PATH)
				return;
			var xml : XML = <config/>;
			xml.config.CONFIG_PATH = CONFIG_PATH;
			xml.config.LANG_PATH = LANG_PATH;
			xml.config.CLIENT_RES_PATH = CLIENT_RES_PATH;
			xml.config.CODE_PATH = CODE_PATH;
			xml.config.SERVER_PATH = SERVER_PATH;
			var bytes : ByteArray = new ByteArray();
			bytes.writeUTFBytes(xml.toXMLString());
			var file : File = new File(EditorConfig.WORKSPACE_PATH);
			file = file.resolvePath(".game3DEditorWorkspace");
			FileUtil.writeToFile(file.nativePath, bytes);
			bytes.clear();

			saveProject();
			saveSetting();

			xml = <config/>;
			xml.config.USE_AVATAR_FILE_KINDS = USE_AVATAR_FILE_KINDS;
			xml.config.USE_EFFECT_FILE_KINDS = USE_EFFECT_FILE_KINDS;

			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarFileResConfigName);
			var configDesc : ConfigDesc = tabel.getConfigDesc();
			var datas : Array = FileUtil.dictToArray(configDesc.cacheDic);
			FileUtil.sortDatas(datas);
			xml.appendChild(<avatarName/>);
			for each (var avatarResData : AvatarFileResConfig in datas)
			{
				xml.avatarName.appendChild(<item name={avatarResData.name} res={avatarResData.mRes} hairRes={avatarResData.mHairRes} weaponRes={avatarResData.mWeaponRes} mountRes={avatarResData.mMountRes} animatRes={avatarResData.mAnimatRes} effectRes={avatarResData.mEffectRes}/>);
			}

			tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.EffectResConfigName);
			configDesc = tabel.getConfigDesc();
			datas = FileUtil.dictToArray(configDesc.cacheDic);
			FileUtil.sortDatas(datas);
			xml.appendChild(<effectName/>);
			for each (var data : EffectResConfig in datas)
			{
				xml.effectName.appendChild(<item name={data.name} res={data.mRes}/>);
			}
            
            tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapDataConfigName);
            configDesc = tabel.getConfigDesc();
            datas = FileUtil.dictToArray(configDesc.cacheDic);
            FileUtil.sortDatas(datas);
            xml.appendChild(<sceneID/>);
            for each (var mapData : EditorClientMapData in datas)
            {
                xml.sceneID.appendChild(<item name={mapData.name} id={mapData.id}/>);
            }
            
			bytes = new ByteArray();
			bytes.writeUTFBytes(xml.toXMLString());
			file = new File(EditorConfig.WORKSPACE_PATH);
			if (CLIENT_RES_PATH)
			{
				if (file.resolvePath(CLIENT_RES_PATH).exists)
					file = file.resolvePath(CLIENT_RES_PATH);
			}
            
			file = file.resolvePath(".game3DEditorProperties");
			FileUtil.writeToFile(file.nativePath, bytes);
			bytes.clear();
		}

		public static function setTabelCfgPath(path : String) : String
		{
			if (!path)
				return "";
			if (!FileUtil.pathValid(path))
				return path;
			var file : File = new File(path);
			var serverFile : File = serverPath ? new File(serverPath) : null;
			var relativePath : String = serverFile ? serverFile.getRelativePath(file, false) : null;
			if (relativePath)
			{
				return relativePath;
			}
			else
			{
				var configFile : File = configPath ? new File(configPath) : null;
				relativePath = configFile ? configFile.getRelativePath(file, true) : null;
				if (relativePath)
				{
					return relativePath;
				}
				else
				{
					if (EditorConfig.WORKSPACE_PATH)
					{
						var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
						relativePath = workDire.getRelativePath(file, true);
						if (relativePath)
							return relativePath;
						else
							return path;
					}
					else
					{
						return path;
					}
				}
			}
		}

		public static function getTabelCfgPath(path : String) : String
		{
			if (path)
			{
				if (FileUtil.pathValid(path))
					return filePathDeal(path);
				var serverFile : File = serverPath ? new File(serverPath) : null;
				var file : File = serverFile ? serverFile.resolvePath(path) : null;
				if (file && file.exists)
				{
					return filePathDeal(file.nativePath);
				}
				else
				{
					var configFile : File = configPath ? new File(configPath) : null;
					file = configFile ? configFile.resolvePath(path) : null;
					if (file)
						return filePathDeal(file.nativePath);
				}
			}
			return "";
		}

		public static function setResPath(path : String) : String
		{
			if (!path)
				return "";
			if (!FileUtil.pathValid(path))
				return path;
			var file : File = new File(path);
			var resFile : File = clientResPath ? new File(clientResPath) : null;
			var relativePath : String = resFile ? resFile.getRelativePath(file, true) : null;
			if (relativePath)
			{
				return relativePath;
			}
			else
			{
				if (EditorConfig.WORKSPACE_PATH)
				{
					var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
					relativePath = workDire.getRelativePath(file, true);
					if (relativePath)
						return relativePath;
					else
						return path;
				}
				else
				{
					return path;
				}
			}
		}

		public static function getClientResPath(path : String) : String
		{
			if (path)
			{
				if (FileUtil.pathValid(path))
					return filePathDeal(path);
				var resFile : File = clientResPath ? new File(clientResPath) : null;
				var file : File = resFile ? resFile.resolvePath(path) : null;
				if (file)
					return filePathDeal(file.nativePath);
			}
			return "";
		}

		public static function set configPath(value : String) : void
		{
			if (!value)
			{
				CONFIG_PATH = "";
				return;
			}
			var file : File = new File(value);
			var resFile : File = clientResPath ? new File(clientResPath) : null;
			var relativePath : String = resFile ? resFile.getRelativePath(file, true) : null;
			if (relativePath)
			{
				CONFIG_PATH = relativePath;
			}
			else
			{
				if (EditorConfig.WORKSPACE_PATH)
				{
					var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
					relativePath = workDire.getRelativePath(file, true);
					if (relativePath)
						CONFIG_PATH = relativePath;
					else
						CONFIG_PATH = value;
				}
				else
				{
					CONFIG_PATH = value;
				}
			}
		}

		public static function get configPath() : String
		{
			if (CONFIG_PATH)
			{
				if (FileUtil.pathValid(CONFIG_PATH))
					return filePathDeal(CONFIG_PATH);
				var resFile : File = clientResPath ? new File(clientResPath) : null;
				var file : File = resFile ? resFile.resolvePath(CONFIG_PATH) : null;
				if (file)
					return filePathDeal(file.nativePath);
			}
			return "";
		}

		public static function set langPath(value : String) : void
		{
			if (!value)
			{
				LANG_PATH = "";
				return;
			}
			var file : File = new File(value);
			var resFile : File = clientResPath ? new File(clientResPath) : null;
			var relativePath : String = resFile ? resFile.getRelativePath(file, true) : null;
			if (relativePath)
			{
				LANG_PATH = relativePath;
			}
			else
			{
				if (EditorConfig.WORKSPACE_PATH)
				{
					var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
					relativePath = workDire.getRelativePath(file, true);
					if (relativePath)
						LANG_PATH = relativePath;
					else
						LANG_PATH = value;
				}
				else
				{
					LANG_PATH = value;
				}
			}
		}

		public static function get langPath() : String
		{
			if (LANG_PATH)
			{
				if (FileUtil.pathValid(LANG_PATH))
					return filePathDeal(LANG_PATH);
				var resFile : File = clientResPath ? new File(clientResPath) : null;
				var file : File = resFile ? resFile.resolvePath(LANG_PATH) : null;
				if (file)
					return filePathDeal(file.nativePath);
			}
			return "";
		}

		/**
		 * resPath需要优先设置
		 * @param value
		 *
		 */
		public static function set clientResPath(value : String) : void
		{
			if (value)
			{
				if (EditorConfig.WORKSPACE_PATH)
				{
					var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
					var file : File = value ? new File(value) : null;
					var relativePath : String = file ? workDire.getRelativePath(file, true) : null;
					if (relativePath)
						CLIENT_RES_PATH = relativePath;
					else
						CLIENT_RES_PATH = value;
				}
				else
				{
					CLIENT_RES_PATH = value;
				}
			}
			else
			{
				CLIENT_RES_PATH = "";
			}
			readProject();
			readSettting();
			readProperties();
		}

		public static function get clientResPath() : String
		{
			if (EditorConfig.WORKSPACE_PATH && CLIENT_RES_PATH)
			{
				var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
				var file : File = workDire.resolvePath(CLIENT_RES_PATH);
				if (file)
					return filePathDeal(file.nativePath);
				else
					return filePathDeal(CLIENT_RES_PATH);
			}
			else
			{
				return filePathDeal(CLIENT_RES_PATH);
			}
		}

		public static function set codePath(value : String) : void
		{
			if (!value)
			{
				CODE_PATH = "";
				return;
			}
			if (EditorConfig.WORKSPACE_PATH)
			{
				var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
				var file : File = value ? new File(value) : null;
				var relativePath : String = file ? workDire.getRelativePath(file, true) : null;
				if (relativePath)
					CODE_PATH = relativePath;
				else
					CODE_PATH = value;
			}
			else
			{
				CODE_PATH = value;
			}
		}

		public static function get codePath() : String
		{
			if (EditorConfig.WORKSPACE_PATH && CODE_PATH)
			{
				var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
				var file : File = workDire.resolvePath(CODE_PATH);
				if (file)
					return filePathDeal(file.nativePath);
				else
					return filePathDeal(CODE_PATH);
			}
			else
			{
				return filePathDeal(CODE_PATH);
			}
		}

		public static function set serverPath(value : String) : void
		{
			if (!value)
			{
				SERVER_PATH = "";
				return;
			}
			if (EditorConfig.WORKSPACE_PATH)
			{
				var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
				var file : File = value ? new File(value) : null;
				var relativePath : String = file ? workDire.getRelativePath(file, true) : null;
				if (relativePath)
					SERVER_PATH = relativePath;
				else
					SERVER_PATH = value;
			}
			else
			{
				SERVER_PATH = value;
			}
		}

		public static function get serverPath() : String
		{
			if (EditorConfig.WORKSPACE_PATH && SERVER_PATH)
			{
				var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
				var file : File = workDire.resolvePath(SERVER_PATH);
				if (file)
					return filePathDeal(file.nativePath);
				else
					return filePathDeal(SERVER_PATH);
			}
			else
			{
				return filePathDeal(SERVER_PATH);
			}
		}

		public static function set storyCfgPath(value : String) : void
		{
			STORY_CFG_PATH = setResPath(value);
		}

		public static function get storyCfgPath() : String
		{
			return getClientResPath(STORY_CFG_PATH);
		}

		public static function set effectAnimationCfgPath(value : String) : void
		{
			EFFECT_ANIMATION_CFG_PATH = setResPath(value);
		}

		public static function get effectAnimationCfgPath() : String
		{
			return getClientResPath(EFFECT_ANIMATION_CFG_PATH);
		}

		public static function set avatarResConfigPath(value : String) : void
		{
			AVATAR_RES_CONFIG_PATH = setResPath(value);
		}

		public static function get avatarResConfigPath() : String
		{
			return getClientResPath(AVATAR_RES_CONFIG_PATH);
		}

		public static function set globalSettingPath(value : String) : void
		{
			GLOBAL_SETTING_CFG_PATH = setResPath(value);
		}

		public static function get globalSettingPath() : String
		{
			return getClientResPath(GLOBAL_SETTING_CFG_PATH);
		}

		public static function set dialogFaceMaskReferenPath(value : String) : void
		{
			DIALOG_FACEMASK_REFEREN_PATH = setResPath(value);
		}

		public static function get dialogFaceMaskReferenPath() : String
		{
			return getClientResPath(DIALOG_FACEMASK_REFEREN_PATH);
		}

		public static function set headFaceMaskReferenPath(value : String) : void
		{
			HEAD_FACE_MASK_REFEREN_PATH = setResPath(value);
		}

		public static function get headFaceMaskReferenPath() : String
		{
			return getClientResPath(HEAD_FACE_MASK_REFEREN_PATH);
		}

		public static function set bossHeadFaceMaskReferenPath(value : String) : void
		{
			BOSS_HEAD_FACE_MASK_REFEREN_PATH = setResPath(value);
		}

		public static function get bossHeadFaceMaskReferenPath() : String
		{
			return getClientResPath(BOSS_HEAD_FACE_MASK_REFEREN_PATH);
		}

		public static function getSceneMonsterCfgPath(monsterCfgPath : String, sceneId : int) : String
		{
			monsterCfgPath = getTabelCfgPath(monsterCfgPath);
			return monsterCfgPath + "/" + sceneId + ".txt";
		}

		public static function getResPath(clientResPath : String) : String
		{
			var resFile : File = clientResPath ? new File(clientResPath) : null;
			var file : File = resFile ? resFile.resolvePath("res") : null;
			if (file)
				return filePathDeal(file.nativePath);
			return "";
		}

		public static function getGameClientDllPath(clientResPath : String) : String
		{
			var resFile : File = clientResPath ? new File(clientResPath) : null;
			var file : File = resFile ? resFile.resolvePath("entry/GameClientDll.swf") : null;
			if (file)
				return filePathDeal(file.nativePath);
			return "";
		}

		public static function getLoaderDirePath(clientResPath : String) : String
		{
			var resFile : File = clientResPath ? new File(clientResPath) : null;
			var file : File = resFile ? resFile.resolvePath("loader") : null;
			if (file)
				return filePathDeal(file.nativePath);
			return "";
		}

		public static function getGameClientPath(clientResPath : String) : String
		{
			var resFile : File = clientResPath ? new File(clientResPath) : null;
			var file : File = resFile ? resFile.resolvePath("loader/GameClient.swf") : null;
			if (file)
				return filePathDeal(file.nativePath);
			return "";
		}

		public static function set generateCodePath(value : String) : void
		{
			if (!value)
			{
				GENERATE_CODE_PATH = "";
				return;
			}
			var file : File = new File(value);
			var codeFile : File = codePath ? new File(codePath) : null;
			var relativePath : String = codeFile ? codeFile.getRelativePath(file, true) : null;
			if (relativePath)
			{
				GENERATE_CODE_PATH = relativePath;
			}
			else
			{
				if (EditorConfig.WORKSPACE_PATH)
				{
					var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
					relativePath = workDire.getRelativePath(file, true);
					if (relativePath)
						GENERATE_CODE_PATH = relativePath;
					else
						GENERATE_CODE_PATH = value;
				}
				else
				{
					GENERATE_CODE_PATH = value;
				}
			}
		}

		public static function get generateCodePath() : String
		{
			if (GENERATE_CODE_PATH)
			{
				if (FileUtil.pathValid(GENERATE_CODE_PATH))
					return filePathDeal(GENERATE_CODE_PATH);
				var codeFile : File = codePath ? new File(codePath) : null;
				var file : File = codeFile ? codeFile.resolvePath(GENERATE_CODE_PATH) : null;
				if (file)
					return filePathDeal(file.nativePath);
			}
			return "";
		}

		public static function get dataCodePath() : String
		{
			return generateCodePath + "/src";
		}

		public static function filePathDeal(path : String) : String
		{
			if (!path)
				return "";
			path = path.replace(/\\/g, "/");
			return path;
		}

		public static function set sceneMapBlockInfoPath(value : String) : void
		{
			if (!value)
			{
				SCENE_MAP_BLOCK_INFO_PATH = "";
				return;
			}
			var file : File = new File(value);
			var serverFile : File = serverPath ? new File(serverPath) : null;
			var relativePath : String = serverFile ? serverFile.getRelativePath(file, true) : null;
			if (relativePath)
			{
				SCENE_MAP_BLOCK_INFO_PATH = relativePath;
			}
			else
			{
				if (EditorConfig.WORKSPACE_PATH)
				{
					var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
					relativePath = workDire.getRelativePath(file, true);
					if (relativePath)
						SCENE_MAP_BLOCK_INFO_PATH = relativePath;
					else
						SCENE_MAP_BLOCK_INFO_PATH = value;
				}
				else
				{
					SCENE_MAP_BLOCK_INFO_PATH = value;
				}
			}
		}

		public static function get sceneMapBlockInfoPath() : String
		{
			if (SCENE_MAP_BLOCK_INFO_PATH)
			{
				if (FileUtil.pathValid(SCENE_MAP_BLOCK_INFO_PATH))
					return filePathDeal(SCENE_MAP_BLOCK_INFO_PATH);
				var serverFile : File = serverPath ? new File(serverPath) : null;
				var file : File = serverFile ? serverFile.resolvePath(SCENE_MAP_BLOCK_INFO_PATH) : null;
				if (file)
					return filePathDeal(file.nativePath);
			}
			return "";
		}
	}
}
