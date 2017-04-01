package com.editor.core
{
	import com.editor.cfg.ProjectConfig;
	import com.editor.data.KeyValueInfo;
	import com.editor.utils.FileUtil;

	import flash.filesystem.File;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	import mx.controls.Alert;

	/**
	 *
	 * 语言打包创建器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-2 下午1:22:16
	 *
	 */
	public class LangPackCreater
	{
		private static var _instance : LangPackCreater;

		public static function getInstance() : LangPackCreater
		{
			if (!_instance)
			{
				_instance = new LangPackCreater();
			}
			return _instance;
		}

		private var _keyValueInfoDic : Dictionary;

		public function LangPackCreater()
		{
		}

		public function export() : Boolean
		{
			_keyValueInfoDic = new Dictionary();
			var langFile : File = FileUtil.pathValid(ProjectConfig.langPath) ? new File(ProjectConfig.langPath) : null;
			if (langFile && langFile.exists && langFile.isDirectory)
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
						createConfig(file);
					}
				}
				var path : String = ProjectConfig.langPath;
				var bytes : ByteArray = new ByteArray();
				bytes.writeObject(_keyValueInfoDic);
				bytes.compress();
				FileUtil.writeToFile(path + "/lang.data", bytes);
				return true;
			}
			return false;
		}

		private function createConfig(file : File) : void
		{
			try
			{
				var str : String = FileUtil.readTextFile(file);
				var arr : Array = str.split("\n");
				var length : int = arr.length;
				var headStr : String = arr[1];
				var headArr : Array = headStr.split("\t");
				if (headArr.length > 1)
				{
					var keyNameIndex : int = -1;
					var fieldValueIndex : int = -1;
					var fields : Array = [];
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
						fields.push(field);
					}
					if (keyNameIndex > -1 && fieldValueIndex > -1)
					{
						for (var i : int = 2; i < length; i++)
						{
							addLangInfo(arr[i], keyNameIndex, fieldValueIndex, fields);
						}
					}
					else
					{
						Alert.show("发现语言配置" + file.nativePath + "中不包含key和value字段，请检查！");
					}
				}
			}
			catch (e : Error)
			{
				Alert.show(file.nativePath + "\r" + e.message);
			}
		}

		private function addLangInfo(str : String, keyNameIndex : int, fieldValueIndex : int, fields : Array) : void
		{
			var arr : Array = str.split("\t");
			if (arr.length > 1)
			{
				var keyName : String = arr[keyNameIndex];
				var fieldValue : String = arr[fieldValueIndex];
				var keyValueInfo : KeyValueInfo;
				keyValueInfo = new KeyValueInfo();
				if (keyName != null)
				{
					var strValue : String = fieldValue;
					var extendValue : String;
					strValue = strValue.replace(/\r/g, "");
					var len : int = fields.length;
					var language : Object = {value: strValue};
					for (var i : int = 0; i < len; i++)
					{
						if (i == keyNameIndex)
							continue;
						if (i == fieldValueIndex)
							continue;
						extendValue = arr[i];
						if (!extendValue || extendValue == "undefined")
							extendValue = "";
						language[fields[i]] = extendValue;
					}
					keyValueInfo.key = keyName;
					keyValueInfo.value = language;

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
		}
	}
}
