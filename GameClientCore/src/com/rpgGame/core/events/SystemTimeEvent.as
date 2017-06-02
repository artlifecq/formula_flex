package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	public class SystemTimeEvent
	{
		/** 每日24：00点数据清零*/
		public static const DAILY_CLEARED:int = UNIQUEID.NEXT;
		/**同步服务器时间*/
		public static const SEVER_TIMR:int = UNIQUEID.NEXT;
	}
}