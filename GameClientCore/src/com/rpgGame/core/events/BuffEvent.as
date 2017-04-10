package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 *
	 * Buff事件
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-19 下午3:05:12
	 *
	 */
	public class BuffEvent
	{
		/**更新Buff**/
		public static const UPDATE_BUFF : int = UNIQUEID.NEXT;
		/**增加Buff**/
		public static const ADD_BUFF : int = UNIQUEID.NEXT;
		/**移除Buff**/
		public static const REMOVE_BUFF : int = UNIQUEID.NEXT;
		/**更新帮派技能Buff**/
		public static const UPDATE_SOCIETY_SPELL_BUFF : int = UNIQUEID.NEXT;
		/**疯狂连弩技能 其它图标置灰**/
		public static const CHANGE_GRID_BUFF : int = UNIQUEID.NEXT;
		
		
	}
}
