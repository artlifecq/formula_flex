package com.rpgGame.app.manager.hud
{
	import com.rpgGame.core.events.PromptBarEvent;
	
	import org.client.mainCore.manager.EventManager;
	

	public class PromptBarManager
	{
		public function PromptBarManager()
		{
		}
		
		private static var _instance : PromptBarManager;
		public static function getInstance() : PromptBarManager
		{
			if (!_instance)
				_instance = new PromptBarManager();
			
			return _instance;
		}
		//------------------------------------------
		
		public function setup():void
		{
		
		}
		
		
		/**
		 * 
		 * @param type
		 * @param isShow
		 * 
		 */		
		public function showAndHideIco( type:int, isShow:Boolean ):void
		{
			if( isShow )
				EventManager.dispatchEvent( PromptBarEvent.SHOW_PROMPT_ICO, type );
			else
				EventManager.dispatchEvent( PromptBarEvent.HIDE_PROMPT_ICO, type );
		}
		
	}
}