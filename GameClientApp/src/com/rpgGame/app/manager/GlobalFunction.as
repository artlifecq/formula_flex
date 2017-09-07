package  com.rpgGame.app.manager
{
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.Capabilities;

	public class GlobalFunction
	{
		public function GlobalFunction()
		{
		}
		
		public static function iWantRecharge():void
		{
			
		}
		public static function OpenUrl(url:String, window:String = "_blank"):void
		{
			try
			{
				if (url == "" || url == null)
					return;
				
				url = decodeURIComponent(url);
				
				var str:String = url;
				if ( str.indexOf( "http://" ) != 0 && str.indexOf( "https://" ) != 0 )
					str = "http://" + str;
				
				if ( Capabilities.playerType == "ActiveX" )
				{
					ExternalInterface.call( "window.open", str );
				}
				else
				{
					navigateToURL(new URLRequest( str ), window);
				}
			}
			catch(err:Error)
			{
				trace("when you look this trace, then adobe will suck you");
			}
		}
	}
}