package com.rpgGame.core.app
{
	import flash.events.Event;
	
	/**
	 * app事件 
	 * @author fly.liuyang
	 *  
	 */
	public class AppEvent extends Event
	{
		public static const APP_SHOW:String = "app_show";
		public static const APP_INIT:String = "app_init";
		public static const APP_HIDE:String = "app_hide";
		public static const APP_DESTORY:String = "app_destory";
		public static const APP_LOAD_ERROR : String = "app_load_error";
		
		public var appInfo:AppInfo;
		public function AppEvent( type:String, dataP:AppInfo, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			appInfo = dataP;
			super( type, bubbles, cancelable );
		}
	}
}