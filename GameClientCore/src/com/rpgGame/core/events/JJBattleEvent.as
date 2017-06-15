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
		 *可挑战玩家数据
		 */		
		public static const GET_FIGHTERS_DATA:int=UNIQUEID.NEXT;
		/**
		 *奖励数据 
		 */		
		public static const GET_REWARD_PANEL_DATA:int=UNIQUEID.NEXT;
		/**
		 *战斗结果 
		 */		
		public static const GET_FIGHT_RESULT:int=UNIQUEID.NEXT;
		
		/**
		 *获取奖励结果
		 */		
		public static const GET_REWARD_RESULT:int=UNIQUEID.NEXT;
		
		/**
		 *获取奖励结果
		 */		
		public static const GOBACK:int=UNIQUEID.NEXT;
		
	
	}
}