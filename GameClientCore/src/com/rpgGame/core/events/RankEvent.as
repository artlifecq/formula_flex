package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 *
	 * 排行榜事件
	 * @author L.L.M.Sunny
	 * 创建时间：2016-06-01 下午3:05:12
	 *
	 */
	public class RankEvent
	{
		/**
		 * 伤害排行榜改变
		 */
		public static const PLUNDER_HURT_RANK_CHANGE : int = UNIQUEID.NEXT;
		/**
		 * 自己的伤害排行改变
		 */
		public static const PLUNDER_HURT_RANK_SELF_AMOUNT_CHANGE : int = UNIQUEID.NEXT;

		public function RankEvent()
		{
		}
	}
}
