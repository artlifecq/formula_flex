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

		public function ActivityEvent()
		{
		}
	}
}
