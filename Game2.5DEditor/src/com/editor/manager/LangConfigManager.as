package com.editor.manager
{
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.LangConfig;
	import com.editor.cfg.ProjectConfig;
	import com.editor.data.ConfigDesc;
	import com.editor.utils.FileUtil;

	import flash.filesystem.File;
	import flash.utils.Dictionary;

	import mx.controls.Alert;

	/**
	 *
	 * 语言配置管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-03 下午5:22:16
	 *
	 */
	public class LangConfigManager
	{
		private static var _instance : LangConfigManager;

		public static function getInstance() : LangConfigManager
		{
			if (!_instance)
			{
				_instance = new LangConfigManager();
			}
			return _instance;
		}

		private var _langDict : Dictionary;
		private var _langFiles : Dictionary;

		public function LangConfigManager()
		{
		}

		public function loadLangConfigs() : void
		{
			_langFiles = new Dictionary();
			_langDict = new Dictionary();
			var fileList : Dictionary = FileUtil.getDirectoryFiles(ProjectConfig.langPath, "txt");
			for each (var files : Array in fileList)
			{
				for each (var file : File in files)
				{
					var cfgStr : String = FileUtil.readTextFile(file);
					var configDesc : ConfigDesc = new ConfigDesc();
					configDesc.majorKey = "key";
					var info : String = FileUtil.parseTextData(cfgStr, LangConfig, configDesc);
					if (info)
						Alert.show(file.nativePath + "信息：" + info, "提示");
					else
					{
						var name : String = file.name.split(".")[0];
						_langFiles[name] = file;
						_langDict[name] = configDesc;
					}
				}
			}
		}

		public function saveLangConfigs() : void
		{
			for (var name : String in _langDict)
			{
				var configDesc : ConfigDesc = _langDict[name];
				var file : File = _langFiles[name];
				var str : String = FileUtil.getTextDataFromDatas(configDesc);
				FileUtil.writeToFile(file.nativePath, str, "GB2312");
			}
		}

		public function get langDict() : Dictionary
		{
			return _langDict;
		}

		public function getCfgByFieldValue(configDesc : ConfigDesc, field : String, value : String) : Array
		{
			var rtn : Array = [];
			for each (var configDesc : ConfigDesc in _langDict)
			{
				var datas : Array = ConfigData.getCfgByFieldValue(configDesc, field, value);
				rtn = rtn.concat(datas);
			}
			return rtn;
		}
	}
}
