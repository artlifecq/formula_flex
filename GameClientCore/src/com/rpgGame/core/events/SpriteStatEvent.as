package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 *
	 * 属性事件
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-27 下午8:01:22
	 *
	 */
	public class SpriteStatEvent
	{
		/** 当前血量变化*/
		public static const NOWHP_CHANGE : int = UNIQUEID.NEXT;
		/** 血量最大值变化*/
		public static const MAXHP_CHANGE : int = UNIQUEID.NEXT;
		/** 当前魔法变化*/
		public static const NOWMP_CHANGE : int = UNIQUEID.NEXT;
		/** 魔法最大值变化*/
		public static const MAXMP_CHANGE : int = UNIQUEID.NEXT;
	}
}
