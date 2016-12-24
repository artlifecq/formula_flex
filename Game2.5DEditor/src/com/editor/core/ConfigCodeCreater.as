package com.editor.core
{
	import com.editor.cfg.GlobalConfig;
	import com.editor.cfg.ProjectConfig;
	import com.editor.utils.FileUtil;

	import flash.filesystem.File;
	import flash.utils.Dictionary;

	import mx.controls.Alert;

	/**
	 *
	 * 配置代码创建器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-2 下午3:22:16
	 *
	 */
	public class ConfigCodeCreater
	{
		private static var _instance : ConfigCodeCreater;

		public static function getInstance() : ConfigCodeCreater
		{
			if (!_instance)
			{
				_instance = new ConfigCodeCreater();
			}
			return _instance;
		}

		private var _regStr : String;
		private var _regAttrStr : String;

		public function ConfigCodeCreater()
		{
		}

		public function generate() : Boolean
		{
			_regStr = "";
			_regAttrStr = "";

			var configFile : File = FileUtil.pathValid(ProjectConfig.configPath) ? new File(ProjectConfig.configPath) : null;
			var codeFile : File = FileUtil.pathValid(ProjectConfig.dataCodePath) ? new File(ProjectConfig.dataCodePath) : null;
			if ((configFile && configFile.exists && configFile.isDirectory) && (codeFile && codeFile.exists && codeFile.isDirectory))
			{
				var file : File;
				var allFiles : Array = [];
				var fileList : Dictionary = FileUtil.getDirectoryFiles(configFile.nativePath);
				for each (var files : Array in fileList)
				{
					for each (file in files)
					{
						if (file.name == GlobalConfig.configFileName)
						{
							continue;
						}
						allFiles.push(file);
					}
				}
				allFiles.sortOn("nativePath", Array.CASEINSENSITIVE);
				var mixCfgs : Array = [];
				for each (file in allFiles)
				{
					var relativePath : String = configFile.getRelativePath(file);
					var nameArr : Array = relativePath.split(".");
					var clsPath : String = "data." + String(nameArr[0]).replace(/\//g, ".");
					var clsDots : Array = clsPath.split(".");
					var cfgName : String = clsDots[clsDots.length - 1];
					var isMixCfg : Boolean = false;
					if (file.parent.nativePath != configFile.nativePath) //目录名和文件名相似时合并为单独一个 
					{
						if (cfgName.toLowerCase().indexOf(file.parent.name.toLowerCase()) == 0)
						{
							clsDots.pop();
							isMixCfg = true;
						}
					}
					cfgName = clsDots[clsDots.length - 1];
					cfgName = cfgName.substr(0, 1).toUpperCase() + cfgName.substr(1);
					clsDots[clsDots.length - 1] = cfgName;
					clsPath = clsDots.join(".");
					if (isMixCfg)
					{
						if (mixCfgs.indexOf(clsPath) > -1)
						{
							continue;
						}
						mixCfgs.push(clsPath);
					}
					createConfig(clsPath, file, cfgName, String(nameArr[1]).toLowerCase() == "txt");
				}

				var classStr : String = CodeTemplet.registerSourceStr;
				var packageName : String = "com.rpgGame.coreData.clientConfig";
				classStr = classStr.replace("#package#", packageName);
				classStr = classStr.replace("#attrName#", _regStr);
				classStr = classStr.replace("#regAttrStr#", _regAttrStr);

				var createFileName : String = "ConfigClassRegister" + ".as";
				var filePackageStr : String = packageName.replace(/\./g, "/")
				FileUtil.writeToFile(codeFile.nativePath + "/" + filePackageStr + "/" + createFileName, classStr);
				return true;
			}
			return false;
		}

		private function createConfig(clsPath : String, file : File, cfgName : String, isText : Boolean) : void
		{
			try
			{
				var arr : Array;
				var attrArr : Array;
				if (isText)
				{
					var str : String = FileUtil.readTextFile(file);
					arr = str.split("\n");
					attrArr = getLineArr(arr[1]);
				}
				else
				{
					arr = [clsPath];
					attrArr = ["byteArray#ByteArray#ByteArray"];
				}

				var keyNameIndex : int = -1;
				var noteIndex : int = -1;
				var nameArr : Array = [];
				var typeArr : Array = [];
				var noteArr : Array = [];
				var len : int = attrArr.length;
				var hasBytes : Boolean = false;
				for (var i : int = 0; i < len; i++)
				{
					var attStr : String = attrArr[i];
					attStr = attStr.replace("\n", "");
					attStr = attStr.replace(/\"/g, "");
					var spliArr : Array = attStr.split("#");
					var keyName : String = spliArr[0];
					nameArr.push(keyName);
					var type : String = spliArr[1];
					typeArr.push(type);
					if (type == "ByteArray")
						hasBytes = true;
					var noteName : String = spliArr[2];
					noteArr.push(noteName);

					if (keyNameIndex == -1 && keyName == "key")
					{
						keyNameIndex = i;
					}
					if (noteIndex == -1 && noteName == "note")
					{
						noteIndex = i;
					}
				}

				genSourceFile(clsPath, cfgName, nameArr, typeArr, noteArr, hasBytes);
				if (keyNameIndex > -1)
				{
					var enumName : String = cfgName;
					var cfgEnumName : String = "Enum" + enumName;
					genEnumFile(cfgEnumName, arr, keyNameIndex, noteIndex);
				}
				var commenStr : String = arr[0].replace(/\r/g, "");
				_regAttrStr += "\t\t/**  " + commenStr + " */\n";
				//				_regAttrStr += "/** " + arr[0] +  "*\/";
				var fileName : String = cfgName;
				_regAttrStr += "\t\tpublic static const " + fileName + ":String = \"" + clsPath + "\";\n";
			}
			catch (e : Error)
			{
				Alert.show(file.nativePath + "\r" + e.message);
			}
		}

		private static function getLineArr(str : String) : Array
		{
			var arr : Array = str.split("\t");
			if (arr.length > 1)
			{
				for (var i : int = 0; i < arr.length; i++)
				{
					arr[i] = arr[i].replace(/\r/g, "");
				}
			}
			return arr;
		}

		private function genSourceFile(clsPath : String, cfgName : String, nameArr : Array, typeArr : Array, noteArr : Array, hasBytes : Boolean) : void
		{
			var classStr : String = hasBytes ? CodeTemplet.configSourceStrWithBytes : CodeTemplet.configSourceStr;
			var length : int = nameArr.length;
			var attrStr : String = "";
			var className : String = cfgName;
			var packageName : String = "com.rpgGame.coreData.clientConfig";
			for (var i : int = 0; i < length; i++)
			{
				var commenStr : String = noteArr[i];
				if (commenStr)
				{
					commenStr = commenStr.replace(/\r/g, "");
					commenStr = commenStr.replace(/\n/g, "");
				}
				else
				{
					commenStr = "";
				}
				attrStr += "\t\t /**  " + commenStr + " */\n";
				var type : String = typeArr[i];
				if (!type)
					type = "String";
				attrStr += "\t\tpublic var " + nameArr[i] + ":" + type + ";\n";
			}
			classStr = classStr.replace("#package#", packageName);
			classStr = classStr.replace("#className#", className);
			classStr = classStr.replace("#attrName#", attrStr);

			var createFileName : String = className + ".as";
			var filePackageStr : String = packageName.replace(/\./g, "/");
			FileUtil.writeToFile(ProjectConfig.dataCodePath + "/" + filePackageStr + "/" + createFileName, classStr);
			_regStr += "\t\t\tregClass(\"" + clsPath + "\", " + packageName + "." + className + ");\n";
		}

		private function genEnumFile(cfgName : String, lineArr : Array, keyNameIndex : int, noteIndex : int) : void
		{
			var classStr : String = CodeTemplet.configSourceStr;
			var length : int = lineArr.length;
			var attrStr : String = "";
			var className : String = cfgName;
			var packageName : String = "com.rpgGame.coreData.configEnum";
			for (var i : int = 2; i < length; i++)
			{
				var str : String = lineArr[i];
				var arr : Array = str.split("\t");
				if (arr.length > 1)
				{
					var keyName : String = arr[keyNameIndex];
					var commenStr : String = noteIndex > -1 ? arr[noteIndex] : "";
					commenStr = commenStr ? commenStr : "";
					commenStr = commenStr.replace(/\r/g, "");
					commenStr = commenStr.replace(/\n/g, "");
					attrStr += "\t\t /**  " + commenStr + " */\n";
					attrStr += "\t\tpublic static const " + keyName + ":String = \"" + keyName + "\";\n";
				}
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
