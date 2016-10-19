package com.rpgGame.core.app
{
	import flash.events.EventDispatcher;
	

	[Event(name="app_show", 	type="com.rpgGame.core.app.AppEvent")]
	[Event(name="app_init", 	type="com.rpgGame.core.app.AppEvent")]
	[Event(name="app_hide", 	type="com.rpgGame.core.app.AppEvent")]
	[Event(name="app_destory", type="com.rpgGame.core.app.AppEvent")]
	[Event(name="app_load_error", type="com.rpgGame.core.app.AppEvent")]
	/**
	 * app面板事件侦听，事件分发器  
	 * @author fly.liuyang
	 * 
	 */	
	public class AppDispather extends EventDispatcher
	{
		private static var _instance:AppDispather;
		public static function get instance():AppDispather
		{
			if(_instance == null)
				_instance= new AppDispather();

			return _instance;
		}
		
		public function AppDispather()
		{
			super();
		}
	}
}