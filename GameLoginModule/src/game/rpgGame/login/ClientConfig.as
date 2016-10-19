package game.rpgGame.login
{
	import com.gameClient.utils.VersionUtils;

	/**
	 *
	 * 客户端配置
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-31 上午11:32:15
	 *
	 */
	public class ClientConfig
	{
		/** 资源根目录*/
		public static var baseDir : String = "../";
		public static var resURL : String = "res/";
		public static var decode : Function = null;

		public static function get eName_AWD() : String
		{
			return decode == null ? ".awd" : ".res";
		}

		public function ClientConfig()
		{
		}

		public static function getVersionPath(resUrl : String, isVersion : Boolean = true, isRandom : Boolean = false) : String
		{
			var url : String = resURL + resUrl;
			if (isVersion)
			{
				url = VersionUtils.getVersionPath(url);
			}
			else if (isRandom)
			{
				url = url + "?" + Math.random();
			}
			return baseDir + url;
		}

		/**
		 * 获取avatar资源路径
		 * @return
		 *
		 */
		public static function getAvatar(avatarName : String) : String
		{
			var url : String;
			if (avatarName.indexOf("/") == -1)
				url = "avatar/" + avatarName + "/" + avatarName + eName_AWD;
			else
				url = "avatar/" + avatarName + eName_AWD;
			return getVersionPath(url);
		}
	}
}
