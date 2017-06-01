package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 *竞技争霸事件 
	 * @author Administrator
	 * 
	 */	
	public class JJBattleEvent
	{
		/**
		 *获得面板数据 
		 */		
		public static const GET_PANEL_DATA:int=UNIQUEID.NEXT;
		/**
		 *挑战日志 
		 */		
		public static const GET_LOG_DATA:int=UNIQUEID.NEXT;
		/**
		 *奖励数据 
		 */		
		public static const GET_REWARD_DATA:int=UNIQUEID.NEXT;
		/**
		 *战斗结果 
		 */		
		public static const GET_FIGHT_RESULT:int=UNIQUEID.NEXT;
		
	}
}