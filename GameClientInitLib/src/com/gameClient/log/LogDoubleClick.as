package com.gameClient.log
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	/**
	 * 双击管理器，用于外部单击的扩展 
	 * 
	 */	
	public class LogDoubleClick extends EventDispatcher
	{
		
		/**
		 * 双击事件 
		 */		
		public static const DOUBLE_CLICK:String = "DoubleClickManager.DOUBLE_CLICK";
		
		private var _timer:Timer;
		
		/**
		 * 开关,0-关，1-开 
		 */		
		private var _switch:int;
		
		public function LogDoubleClick()
		{
			_timer = new Timer(500, 1);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, onComplete);
		}
		
		/**
		 * 得到一个双击管理器 
		 * @return 
		 * 
		 */		
		public static function createDC():LogDoubleClick 
		{
			return new LogDoubleClick();
		}
		
		/**
		 * 单击 
		 * 
		 */		
		public function trig():void 
		{
			if(_switch == 0) 
			{
				//关闭状态中，开启计时
				_switch = 1;
				_timer.reset();
				_timer.start();
			} 
			else 
			{ 
				//计时状态，发送双击事件
				dispatchEvent(new Event(DOUBLE_CLICK));
			}
		}
		
		/**
		 * 计时完成 
		 * @param $e
		 * 
		 */		
		private function onComplete($e:TimerEvent):void 
		{
			_switch = 0;
			_timer.reset();
			_timer.stop();
		}
	}
}