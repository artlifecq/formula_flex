package utils
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * 简单按键查询管理器
	 * @author wewell@163.com
	 */
	public class KeyboardMananger
	{
		public function KeyboardMananger(stage:Stage)
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown,true,2000);
			stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp,true,2000);
			stage.addEventListener(Event.DEACTIVATE,onDeactive);
			downKeyCodes = {};
		}
		
		private function onDeactive(event:Event):void
		{
			downKeyCodes = {};
		}
		/**
		 * 按下的键代码列表
		 */		
		private static var downKeyCodes:Object;
		
		private function onKeyDown(event:KeyboardEvent):void
		{
			var keyCode:uint = event.keyCode;
			downKeyCodes[keyCode] = true;
		}
		
		private function onKeyUp(event:KeyboardEvent):void
		{
			var keyCode:uint = event.keyCode;
			downKeyCodes[keyCode] = false;
		}
		
		public static function isKeyDown(keyCode:uint):Boolean
		{
			return (keyCode in downKeyCodes) && Boolean(downKeyCodes[keyCode]);
		}
	}
}


