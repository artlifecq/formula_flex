package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	public class ZhanGongEvent
	{
		/**
		 * 地图怪物选择
		 * */
		public static const MAPITEM_SELECT:int=UNIQUEID.NEXT;
		
		/**
		 * 升级结果反馈
		 * */
		public static const BOSSITEM_CHANGE:int=UNIQUEID.NEXT;
		/**
		 * 展示下一级效果
		 * */
		public static const BOSSITEN_SHOW:int=UNIQUEID.NEXT;
		/**
		 * 隐藏下级效果
		 * */
		public static const BOSSITEN_CLOSE:int=UNIQUEID.NEXT;
	}
}