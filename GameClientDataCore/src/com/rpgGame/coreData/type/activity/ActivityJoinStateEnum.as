package com.rpgGame.coreData.type.activity
{
	import com.rpgGame.coreData.rEnum;

	/**
	 *活动参与状态 
	 * @author dik
	 * 
	 */
	public class ActivityJoinStateEnum
	{
		/**
		 *非当日
		 */
		public static const UN_TODAY : uint = rEnum.ENUM_START(0);
		/**
		 *未开启 
		 */
		public static const UN_OPEN : uint = rEnum.next;
		/**
		 *进行中
		 */
		public static const JOINING : uint = rEnum.next;
		/**
		 *已击杀
		 */
		public static const KILLED_BOSS : uint = rEnum.next;
		/**
		 *已结束
		 */
		public static const OVER : uint = rEnum.next;
		
		public function ActivityJoinStateEnum()
		{
		}
	}
}