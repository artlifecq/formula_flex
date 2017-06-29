package com.gameClient.utils
{
	import flash.utils.Dictionary;

	/**
	 *
	 * 文件版本管理
	 * @author fly.liuyang
	 * 创建时间：2014-2-26 下午10:20:00
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-3-31 上午10:15:32
	 *
	 */
	public class VersionUtils
	{
		private static const QUE : String = "?";
		private static const SPLIT : String = "_";
		private static var _verMap : Object = {};
		private static var _version : String;
		private static var _defaultVer : String;
		private static var _useVersion : Boolean = false;
		/** 资源根目录*/
		private static var _baseDir : String = "../";
		private static var _resURL : String = "res/";

		private static var _cacheUrlDic : Dictionary = new Dictionary();

		public function VersionUtils()
		{
		}

		public static function setup(vMap : Object, baseDir : String = "../", version : String = null, useVersion : Boolean = false) : void
		{
			_verMap = vMap ? vMap.list : null;;
			_baseDir = baseDir;
			_version = version || "0";
			_defaultVer = vMap ? vMap.defaultVersion : "0";
			_useVersion = useVersion;
		}

		public static function getVersionPath(url : String) : String
		{
			var versionUrl : String = _cacheUrlDic[url];
			if (versionUrl)
			{
				return versionUrl;
			}
			var arr : Array;
			var verUrl : String = url;
			if (verUrl.indexOf(_baseDir) == 0)
				verUrl = verUrl.substr(_baseDir.length);
			arr = url.split(".");
			var version : String = _verMap ? _verMap[verUrl] : null;
			if (version)
			{
                versionUrl = url + QUE + version;
			}
			else
			{
                versionUrl = url + QUE + _defaultVer;
			}
			_cacheUrlDic[url] = versionUrl;
			//避免重复执行的必要措施！@L.L.M.Sunny 
			if (verUrl == url)
				_cacheUrlDic[_baseDir + verUrl] = versionUrl;
			else
				_cacheUrlDic[verUrl] = versionUrl;
			_cacheUrlDic[versionUrl] = versionUrl;
			return versionUrl;
		}

		public static function getVersion(url : String) : String
		{
			var verUrl : String = url;
			if (verUrl.indexOf(_baseDir) == 0)
				verUrl = verUrl.substr(_baseDir.length);
			return _verMap ? _verMap[verUrl] : _defaultVer;
		}
	}
}
