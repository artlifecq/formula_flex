package com.editor.core
{
	import com.editor.cfg.ProjectConfig;
	import com.editor.data.KeyValueInfo;
	import com.editor.utils.FileUtil;

	import flash.filesystem.File;
	import flash.utils.Dictionary;

	import mx.controls.Alert;

	/**
	 *
	 * 语言代码创建器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-25 下午3:22:16
	 *
	 */
	public class LangCodeCreater
	{
		private static var _instance : LangCodeCreater;

		public static function getInstance() : LangCodeCreater
		{
			if (!_instance)
			{
				_instance = new LangCodeCreater();
			}
			return _instance;
		}

		public function LangCodeCreater()
		{
		}

		private var _fileStrMap : Dictionary;
		private var _keyValueInfoDic : Dictionary;

		public function generate() : Boolean
		{
			_fileStrMap = new Dictionary();
			_keyValueInfoDic = new Dictionary();
			var langFile : File = FileUtil.pathValid(ProjectConfig.langPath) ? new File(ProjectConfig.langPath) : null;
			var codeFile : File = FileUtil.pathValid(ProjectConfig.dataCodePath) ? new File(ProjectConfig.dataCodePath) : null;
			if ((langFile && langFile.exists && langFile.isDirectory) && (codeFile && codeFile.exists && codeFile.isDirectory))
			{
				var file : File;
				var allFiles : Array = [];
				var fileList : Dictionary = FileUtil.getDirectoryFiles(langFile.nativePath, "txt");
				for each (var files : Array in fileList)
				{
					for each (file in files)
					{
						allFiles.push(file);
					}
				}
				allFiles.sortOn("nativePath", Array.CASEINSENSITIVE);
				for each (file in allFiles)
				{
					var relativePath : String = langFile.getRelativePath(file);
					var nameArr : Array = relativePath.split(".");
					if (nameArr[1] == "txt")
					{
						var langName : String = file.name.split(".")[0];
						langName = langName.substr(0, 1).toUpperCase() + langName.substr(1);
						var cfgName : String = "Lang" + langName;
						var cacheArr : Array = createConfig(file);
						if (cacheArr)
							_fileStrMap[cfgName] = cacheArr;
					}
				}
				toGenAs();
				return true;
			}
			return false;
		}

		private function createConfig(file : File) : Array
		{
			try
			{
				var str : String = FileUtil.readTextFile(file);
				var arr : Array = str.split("\n");
				var length : int = arr.length;
				var keyValueInfos : Array = [];
				var headStr : String = arr[1];
				var headArr : Array = headStr.split("\t");
				if (headArr.length > 1)
				{
					var keyNameIndex : int = -1;
					var fieldValueIndex : int = -1;
					var len : int = headArr.length;
					for (var n : int = 0; n < len; n++)
					{
						var field : String = headArr[n];
						var fieldSplit : Array = field.split("#");
						field = fieldSplit[0];
						field = field.replace(/\"/g, "");
						if (field == "key")
							keyNameIndex = n;
						else if (field == "value")
							fieldValueIndex = n;
					}
					if (keyNameIndex > -1 && fieldValueIndex > -1)
					{
						for (var i : int = 2; i < length; i++)
						{
							var keyValueInfo : KeyValueInfo = getLangInfo(arr[i], keyNameIndex, fieldValueIndex);
							if (keyValueInfo)
							{
								keyValueInfos.push(keyValueInfo);
							}
						}
					}
					else
					{
						Alert.show("发现语言配置" + file.nativePath + "中不包含key和value字段，请检查！");
					}
				}
				return keyValueInfos;
			}
			catch (e : Error)
			{
				Alert.show(file.nativePath + "\r" + e.message);
			}
			return null;
		}

		private function getLangInfo(str : String, keyNameIndex : int, fieldValueIndex : int) : KeyValueInfo
		{
			var keyValueInfo : KeyValueInfo = null;
			var arr : Array = str.split("\t");
			var keyName : String = arr[keyNameIndex];
			var fieldValue : String = arr[fieldValueIndex];
			if (arr.length > 1)
			{
				keyValueInfo = new KeyValueInfo();
				if (keyName != null)
				{
					var strValue : String = fieldValue;
					strValue = strValue.replace(/\r/g, "");
					keyValueInfo.key = keyName;
					keyValueInfo.value = replaceColorStr(strValue);

					if (_keyValueInfoDic.hasOwnProperty(keyValueInfo.key))
					{
						Alert.show("发现多语言key重复，请检查：" + keyValueInfo.key);
					}
					else
					{
						_keyValueInfoDic[keyValueInfo.key] = keyValueInfo.value;
					}
				}
			}
			return keyValueInfo;
		}

		private function replaceColorStr(strValue : String) : String
		{
			//				var dic:Dictionary = TextColor.colorDic;
			//				for (var key:String in dic) 
			//				{
			//				}
			return strValue;
		}

		private function toGenAs() : void
		{
			for (var key : String in _fileStrMap)
			{
				toGem(key, _fileStrMap[key]);
			}
		}

		private static function toGem(cfgName : String, langArr : Array) : void
		{
			var classStr : String = CodeTemplet.configSourceStr;
			var length : int = langArr.length;
			var attrStr : String = "";
			var className : String = cfgName;
			var packageName : String = "com.rpgGame.coreData.lang";
			for (var i : int = 0; i < length; i++)
			{
				var langInfo : KeyValueInfo = langArr[i];
				var commenStr : String = String(langInfo.value);
				commenStr = commenStr.replace(/\r/g, "");
				commenStr = commenStr.replace(/\n/g, "");
				attrStr += "\t\t /**  " + commenStr + " */\n";
				attrStr += "\t\tpublic static const " + langInfo.key + ":String = \"" + langInfo.key + "\";\n";
			}
			classStr = classStr.replace("#package#", packageName);
			classStr = classStr.replace("#className#", className);
			classStr = classStr.replace("#attrName#", attrStr);

			var createFileName : String = className + ".as";
			var filePackageStr : String = packageName.replace(/\./g, "/")
			FileUtil.writeToFile(ProjectConfig.dataCodePath + "/" + filePackageStr + "/" + createFileName, classStr);
		}
	}
}
