package  com.rpgGame.app.manager.platform
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.GlobalFunction;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.events.Event;
	import flash.external.ExternalInterface;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/**
	 * 平台工具 
	 * @author Administrator
	 * 
	 */
	public class PlatformUtil
	{
		
		// 当前平台
		protected static var _platform:Iplatform;
		
		
		public static function get platform():Iplatform
		{
			return _platform;
		}
		
		public static function get platformName():String
		{
			return _platform.name;
		}

		/**
		 * 初始化会在主程序添加到舞台时执行 
		 * 
		 */
		public static function init():void
		{
			var nam:String = ClientConfig.urlParmar["agent"];
			if( nam == null )
				nam = EnumPlatformName.WAN37;
			switch (nam)
			{
				case EnumPlatformName.WAN37:
					_platform = new P_37wan(nam);break;
				default:
					_platform = new P__default(nam);break;
			}
			
//			_gt.Reg(_updateGSec);
//			_gt.Start();
			
//			req360GsUrl();
		}
		
		public function getWebId(serverKey:int):int
		{
			var webid:int = ((serverKey >> 14) & 0x00FF);
			if (webid >= 1 && webid <= 4) {
				return 1;
			}
			return webid;
		}
		
		public function getServerId(serverKey:int):int
		{
			var webid:int = ((serverKey >> 14) & 0x00FF);
			if ( webid > 1 && webid <= 4) {
				return (serverKey & 0x3FFF) + (16384 * (webid-1));
			}
			return serverKey & 0x3FFF;
		}
		

		
		public static var NonageUrl:String;

		public static function showNonagePage():Boolean
		{
			if (NonageUrl != null)
			{
				try
				{
					//navigateToURL(new URLRequest(NonageUrl));
					GlobalFunction.OpenUrl(NonageUrl);
				}
				catch(err:Error)
				{
					GameLog.addError("打开防沉迷地址错误", err);
				}
				finally
				{
					return true;
				}
			}
			
			return false;
		}
		
		public static function is37():Boolean
		{
			return platform.name == EnumPlatformName.WAN37;
		}
		
		public static function isQQ():Boolean
		{
			return (PlatformUtil.platformName == EnumPlatformName.QQ || PlatformUtil.platformName == EnumPlatformName.QQ_LIANMENG);
		}
		
		public static function isJinShan():Boolean
		{
			return platform.name == EnumPlatformName.JINGSHAN;
		}
		
		public static function isDuowanYY():Boolean
		{
			return platform.name == EnumPlatformName.YYDUOWAN;
		}
		
	
		/***************************************************************************
		 * 
		 * 逻辑啊
		 * 
		 ***************************************************************************/ 
		
		
		public static function reloadMeFunc():void
		{
			if (ExternalInterface.available) 
			{
				ExternalInterface.call("reloadswf",1,platform.name,ClientConfig.urlParmar["showlogin"]);
			}
		}
		public static function OpenErrorBackUrl():void
		{
			if (ExternalInterface.available) 
			{
				ExternalInterface.call("reloadswf",0,platform.name,ClientConfig.urlParmar["showlogin"]);
			}
		}
	}
}