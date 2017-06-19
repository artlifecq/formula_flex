package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class D1v1Event
	{
		/**
		 *获得面板数据 
		 */		
		public static const GET_PANEL_DATA:int=UNIQUEID.NEXT;
		
		public static const GET_RANK_DATA:int=UNIQUEID.NEXT;
		
		public static const ACTIVITY_OPEN:int=UNIQUEID.NEXT;
		
		public static const ACTIVITY_FIGHT_START:int=UNIQUEID.NEXT;
		
		public static const QUIT_FB_RESULT:int=UNIQUEID.NEXT;
		
		public static const GET_REWARD_RESULT:int=UNIQUEID.NEXT;
		
		/**
		 *匹配成功
		 */		
		public static const MATCH_OK:int=UNIQUEID.NEXT;
	}
}