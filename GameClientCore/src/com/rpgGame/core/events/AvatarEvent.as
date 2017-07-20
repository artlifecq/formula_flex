package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 *
	 * 换装事件
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-19 下午3:05:12
	 *
	 */
	public class AvatarEvent
	{
		/**
		 * 装备改变
		 */
		public static const EQUIP_CHANGE : int = UNIQUEID.NEXT;
		/**
		 * 装备改变完成
		 */
		public static const AVATAR_CHANGE_COMPLETE : int = UNIQUEID.NEXT;
		public static const AVATAR_CHANGE : int = UNIQUEID.NEXT;

		public function AvatarEvent()
		{
		}
	}
}
