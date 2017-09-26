package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 *
	 * 活动事件
	 * @author L.L.M.Sunny
	 * 创建时间：2016-09-05 下午3:05:12
	 *
	 */
	public class ActivityEvent
	{
		/**
		 * 开启活动
		 */
		public static const OPEN_ACTIVITY : int = UNIQUEID.NEXT;
		/**
		 * 关闭活动
		 */
		public static const CLOSE_ACTIVITY : int = UNIQUEID.NEXT;
		/**
		 * 关闭活动公告
		 */
		public static const CLOSE_ACTIVITY_NOTICE : int = UNIQUEID.NEXT;
		
		public static const NOTICE:int = UNIQUEID.NEXT;
		public static const SHOW_HIDE_ALL:int = UNIQUEID.NEXT;
		public static const SHOW_NEW_ACTIVITY_BUTTON:int = UNIQUEID.NEXT;
		
		/**
		 *更新活动 
		 */
		public static const UPDATE_ACTIVITY : int = UNIQUEID.NEXT;
		/**
		 *进入活动
		 */
		public static const ENTER_ACTIVITY : int = UNIQUEID.NEXT;
		/**
		 *更新boss伤害排行
		 */
		public static const UPDATE_BOSS_HURT_RANK : int = UNIQUEID.NEXT;
		/**
		 *更新极限挑战boss伤害排行
		 */
		public static const UPDATE_JIXIANBOSS_HURT_RANK : int = UNIQUEID.NEXT;
		/**
		 *更新极限挑战boss伤害排行
		 */
		public static const LAST_KILLER : int = UNIQUEID.NEXT;
		
		/*----------------天降元宝   yt---------------------------------------------*/
		/**
		 *元宝变化
		 */
		public static const LIJIN_CASHGIFT_CHANGE : int = UNIQUEID.NEXT;
		/**
		 *活动剩余时间
		 */
		public static const LIJIN_ACTIVITY_TIME : int = UNIQUEID.NEXT;
		/**
		 *刷怪信息
		 */
		public static const LIJIN_MONSTER_CHANGE : int = UNIQUEID.NEXT;
		
		/*----------------秦陵秘宝   yt---------------------------------------------*/
		/**
		 *活动剩余时间
		 */
		public static const MIBAO_ACTIVITY_TIME : int = UNIQUEID.NEXT;
		
		/**
		 *剩余怪物列表
		 */
		public static const MIBAO_MONSTER_LIST : int = UNIQUEID.NEXT;
		/**
		 *剩余怪物变化
		 */
		public static const MIBAO_MONSTER_CHANGE : int = UNIQUEID.NEXT;
		/**
		 *积分变化
		 */
		public static const MIBAO_JIFEN_CHANGE : int = UNIQUEID.NEXT;
		
		/**
		 *boss伤害排行
		 */
		public static const MIBAO__HURT_RANK : int = UNIQUEID.NEXT;
		
		public function ActivityEvent()
		{
		}
	}
}
