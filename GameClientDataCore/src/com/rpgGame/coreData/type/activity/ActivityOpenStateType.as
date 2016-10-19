package com.rpgGame.coreData.type.activity
{
	import com.rpgGame.coreData.rEnum;

	/**
	 *
	 * 活动开启状态类型
	 * @author L.L.M.Sunny
	 * 创建时间：2016-09-05 下午3:05:12
	 *
	 */
	public class ActivityOpenStateType
	{
		/** 开启*/
		public static const OPEN : uint = rEnum.ENUM_START(1);
		/** 开启倒计时*/
		public static const OPEN_COUNTDOWN : uint = rEnum.next;
		/** 关闭*/
		public static const CLOSE : uint = rEnum.next;
		/** 关闭倒计时*/
		public static const CLOSE_COUNTDOWN : uint = rEnum.next;

		public function ActivityOpenStateType()
		{
		}
	}
}
