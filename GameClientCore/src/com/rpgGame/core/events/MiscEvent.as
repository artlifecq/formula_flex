package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 * 各种杂项事件, 不好归类的 
	 * @author fly.liuyang
	 * 
	 */	
	public class MiscEvent 
	{
		public static const CONGFIG_ALL_CMP:int = UNIQUEID.NEXT;
		public static const SHOW_GM:int = UNIQUEID.NEXT;
		/** 在core里点击了带连接的，文本框， 但是又访问不到script类，就抛个事件出来*/
		public static const TEXT_LINK:int = UNIQUEID.NEXT;
		/** 获得奖励时播放物品飞到背包的动画*/
		public static const PRIZE_FLY_TO_BAG:int = UNIQUEID.NEXT;
		
		
		
	}
}