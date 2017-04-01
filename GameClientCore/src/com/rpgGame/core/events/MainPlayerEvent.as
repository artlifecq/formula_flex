package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class MainPlayerEvent
	{
		/** 等级变化 */
		public static const LEVEL_CHANGE:int = UNIQUEID.NEXT;
		/** 当前血量变化*/
		public static const NOWHP_CHANGE:int = UNIQUEID.NEXT;
		/** 自己血量变化*/
		public static const SELFHP_CHANGE:int = UNIQUEID.NEXT;
		/** 血量最大值变化*/
		public static const MAXHP_CHANGE:int = UNIQUEID.NEXT;
		/** 当前魔法变化*/
		public static const NOWMP_CHANGE:int = UNIQUEID.NEXT;
		/** 魔法最大值变化*/
		public static const MAXMP_CHANGE:int = UNIQUEID.NEXT;
		/** 当前经验变化*/
		public static const NOWEXP_CHANGE:int = UNIQUEID.NEXT;
		/** 经验最大值变化*/
		public static const MAXEXP_CHANGE:int = UNIQUEID.NEXT;
		
		/** PK模式变化*/
		public static const PK_MODE_CHANGE:int = UNIQUEID.NEXT;
		/** PK值变化*/
		public static const PK_AMOUNT_CHANGE:int = UNIQUEID.NEXT;
		/**战斗力变化*/
		public static const FIGHTING_AMOUNT_CHANGE:int = UNIQUEID.NEXT;
		
		/** 属性变化*/
		public static const STAT_CHANGE:int = UNIQUEID.NEXT;
		/** 最大属性变化*/
		public static const STAT_MAX_CHANGE:int = UNIQUEID.NEXT;
		/** RES属性变化*/
		public static const STAT_RES_CHANGE:int = UNIQUEID.NEXT;
		/** 复活成功*/
		public static const REVIVE_SUCCESS:int = UNIQUEID.NEXT;
	}
}