package com.rpgGame.app.manager.hud
{
	

	public class ActivityBarManager
	{
		public function ActivityBarManager()
		{
		}
		
		private static var _instance : ActivityBarManager;
		public static function getInstance() : ActivityBarManager
		{
			if (!_instance)
				_instance = new ActivityBarManager();
			
			return _instance;
		}
		//------------------------------
		
		
		public function setup():void
		{
			
		}
		
		
		
		
		
	}
}