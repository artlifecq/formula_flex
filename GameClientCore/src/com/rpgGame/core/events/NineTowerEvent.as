package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class NineTowerEvent
	{
		/**
		 *获得面板数据 
		 */		
		public static const GET_PANEL_DATA:int=UNIQUEID.NEXT;
		
		public static const GET_LOG_DATA:int=UNIQUEID.NEXT;
		
		public static const GET_SCORE_RANK_DATA:int=UNIQUEID.NEXT;
	
		public static const GET_TRACK_DATA:int=UNIQUEID.NEXT;
		
		public static const QUIT_FB_RESULT:int=UNIQUEID.NEXT;
		
		public static const GET_REWARD_RESULT:int=UNIQUEID.NEXT;
		
		/**
		 *匹配成功
		 */		
		public static const MATCH_OK:int=UNIQUEID.NEXT;
	}
}