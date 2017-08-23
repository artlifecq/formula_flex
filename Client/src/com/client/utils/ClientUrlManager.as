package com.client.utils
{
	import com.gameClient.utils.VersionUtils;

	/**
	 *
	 * 管理client的所有url地址
	 * @author fly.liuyang
	 * 创建时间：2014-2-27 下午8:50:29
	 *
	 */
	public class ClientUrlManager
	{

		private static const LOADING_BG : String = "res/login/loadingBg.swf";
		private static const GAME_XML_URL : String = "entry/game.xml";
		private static const LOAD_LOADING_URL : String = "res/login/loading.swf";
		private static const LOGIN_URL : String = "res/login/Login.swf";
		
		private static var _baseDir : String;
		private static var _version : String;

		public static function get decode() : Function
		{
			return _decode;
		}

		private static var _decode : Function;

		public static function updateBaseDir($newUrl : String) : void
		{
			_baseDir = $newUrl;
		}

		public static function setup(baseDir : String, version : String, decode : Function = null) : void
		{
			_baseDir = baseDir;
			_version = version;
			_decode = decode;
		}

		public static function getLoadLogoBg() : String
		{
			var url : String = _baseDir + VersionUtils.getVersionPath(getDecodeURL(LOADING_BG));
			return url;
		}

		public static function getGameXmlUrl() : String
		{
			var url : String = _baseDir + GAME_XML_URL;
			if (_decode != null)
			{
				url = url.replace("entry", "version" + _version);
				url = url.replace(".xml", ".ml");
			}
			return url;
		}

		public static function getLoadLoadingUrl() : String
		{
			var url : String = _baseDir + VersionUtils.getVersionPath(getDecodeURL(LOAD_LOADING_URL));
			return url;
		}

		public static function getLoginURL() : String
		{
			var url : String = _baseDir + VersionUtils.getVersionPath(getDecodeURL(LOGIN_URL));
			return url;
		}

		public static function getStotyPicUrl(index : int) : String
		{
			var url : String = "res/pic/login_story/" + index + ".jpg"
			url = _baseDir + VersionUtils.getVersionPath(getDecodeURL(url));
			return url;
		}

		public static function getDecodeURL(url : String) : String
		{
			if (_decode != null)
			{
				url = url.replace(".xml", ".res");
				url = url.replace(".jpg", ".res");
				url = url.replace(".swf", ".res");
				url = url.replace(".data", ".res");
				url = url.replace(".png", ".res");
			}
			return url;
		}

		public static function getCreaterCharBgUrl() : String
		{
			var url : String = "res/login/create_char_bg/create_char.swf"
			url = _baseDir + VersionUtils.getVersionPath(getDecodeURL(url));
			return url;
		}
	}
}
