package com.editor.core
{
	import com.editor.cfg.GlobalConfig;
	import com.editor.cfg.ProjectConfig;
	import com.editor.data.AliasData;
	import com.editor.data.ConfigDesc;
	import com.editor.utils.FileUtil;

	import flash.filesystem.File;
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	import mx.controls.Alert;

	/**
	 *
	 * 配置打包创建器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-2 下午1:22:16
	 *
	 */
	public class ConfigPackCreater
	{
		private static var _instance : ConfigPackCreater;

		public static function getInstance() : ConfigPackCreater
		{
			if (!_instance)
			{
				_instance = new ConfigPackCreater();
			}
			return _instance;
		}

		public function ConfigPackCreater()
		{
		}

		public function export() : Boolean
		{
			var configFile : File = FileUtil.pathValid(ProjectConfig.configPath) ? new File(ProjectConfig.configPath) : null;
			if (configFile && configFile.exists && configFile.isDirectory)
			{
				var file : File;
				var allFiles : Array = [];
				var fileList : Dictionary = FileUtil.getDirectoryFiles(configFile.nativePath);
				var configDic : Dictionary = new Dictionary();
				var hasError : Boolean = false;
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
				for each (file in allFiles)
				{
					var relativePath : String = configFile.getRelativePath(file);
					var nameArr : Array = relativePath.split(".");
					var clsPath : String = "data." + String(nameArr[0]).replace(/\//g, ".");
					var clsDots : Array = clsPath.split(".");
					var cfgName : String = clsDots[clsDots.length - 1];
					var dataCfgName : String = cfgName;
					dataCfgName = dataCfgName.substr(0, 1).toUpperCase() + dataCfgName.substr(1);
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
					var configData : ByteArray = getConfig(clsPath, file, String(nameArr[1]).toLowerCase() == "txt");
					if (configData)
					{
						if (isMixCfg)
						{
							if (!configDic.hasOwnProperty(clsPath))
								configDic[clsPath] = new Dictionary();
							var datas : Dictionary = configDic[clsPath];
							datas[dataCfgName] = configData;
						}
						else
						{
							configDic[clsPath] = configData;
						}
					}
					else
					{
						hasError = true;
					}
				}
				if (!hasError)
				{
					var path : String = configFile.nativePath;
					var bytes : ByteArray = new ByteArray();
					bytes.writeObject(configDic);
					bytes.compress();
					FileUtil.writeToFile(path + "/" + GlobalConfig.configFileName, bytes);
					return true;
				}
			}
			return false;
		}

		private function getConfig(clsPath : String, file : File, isText : Boolean) : ByteArray
		{
			var bytes : ByteArray = null;
			if (isText)
			{
				registerClassAlias(clsPath, AliasData);
				var str : String = FileUtil.readTextFile(file);
				var configDesc : ConfigDesc = new ConfigDesc();
				var cacheDic : Dictionary = configDesc.cacheDic;
				var info : String = FileUtil.parseTextData(str, AliasData, configDesc);
				if (info)
				{
					Alert.show(clsPath + "信息：" + info, "提示");
					return null;
				}
				var dataArr : Array = FileUtil.dictToArray(cacheDic);
				FileUtil.sortDatas(dataArr);
				bytes = new ByteArray();
				bytes.writeObject(dataArr);
			}
			else
			{
				bytes = FileUtil.readFile(file);
			}
			return bytes;
		}
	}
}
