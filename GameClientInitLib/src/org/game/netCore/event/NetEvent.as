package org.game.netCore.event
{
	import flash.events.Event;

	/**
	 * 游戏自定义事件，data数据用于传递数据
	 * @author neil
	 */
	public class NetEvent extends Event 
    {
		/** 更换IP登录*/
		public static const GAME_CHANGE_IP :String = "GAME_CHANGE_IP";
		
		public var data :*;

		public function NetEvent(type :String, data :* = null, bubbles : Boolean = false, cancelable : Boolean = false) 
        {
			super(type, bubbles, cancelable);
			this.data = data;
		}

		override public function clone():Event 
        {
			return new NetEvent(type, data, bubbles, cancelable);
		}
	}
}
