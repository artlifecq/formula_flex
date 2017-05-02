package com.rpgGame.core.events
{
	import flash.events.Event;
	
	/**
	 *经脉事件 
	 * @author Administrator
	 * 
	 */	
	public class MeridianEvent extends Event
	{
		public static const ALL_DATA_UPATE:String="all_data_update";
		public static const MERIDIAN_CHANGE:String="meridian_change";
		public static const MERDIAN_UPDATE_TIP:String="meridian_update_tip";
		public var data:*;
		public function MeridianEvent(type:String,ndata:*=null,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data=ndata;
		}
	}
}