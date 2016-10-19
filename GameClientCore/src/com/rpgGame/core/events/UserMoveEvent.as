package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	/**
	 *
	 * 主角色移动事件
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-10 上午10:32:16
	 *
	 */
	public class UserMoveEvent
	{
		/**开始自动寻路	 无参数*/
		public static const MOVE_START : int = UNIQUEID.NEXT;
		/**移动进入	无参数*/
		public static const MOVE_ENTER : int = UNIQUEID.NEXT;
		/**移动经过	无参数*/
		public static const MOVE_THROUGH : int = UNIQUEID.NEXT;
		/**移动结束	无参数*/
		public static const MOVE_END : int = UNIQUEID.NEXT;
		/**跟随移动进入	无参数*/
		public static const FOLLOW_MOVE_ENTER : int = UNIQUEID.NEXT;
		/**跟随移动经过	无参数*/
		public static const FOLLOW_MOVE_THROUGH : int = UNIQUEID.NEXT;
	}
}
