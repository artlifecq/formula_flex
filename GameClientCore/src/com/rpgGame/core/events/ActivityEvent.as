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

		public function ActivityEvent()
		{
		}
	}
}
