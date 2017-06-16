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
		 *关闭 
		 */
		public static const CLOSE : uint = rEnum.ENUM_START(0);
		/**
		 *开启 
		 */
		public static const OPEN : uint = rEnum.next;
		/**
		 *参与中 
		 */
		public static const JOINING : uint = rEnum.next;
		/**
		 *已完成 
		 */
		public static const COMPLETE : uint = rEnum.next;
		
		public function ActivityJoinStateEnum()
		{
		}
	}
}