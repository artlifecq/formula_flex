package com.rpgGame.core.events
{
	import flash.events.Event;
	
	public class CheatsEvent extends Event
	{
		
		public static const CHEATS_NODE_CHANGE:String="cheats_node_change";
		public static const CHEATS_CHANGE:String="cheats_change";
		public static const CHEATS_NODE_TIP_CHANGE:String="cheats_node_tip_change";
		public var data:*;
		public function CheatsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}