package com.rpgGame.core.events.toujing
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 * 偷经事件 
	 * @author Administrator
	 * 
	 */	
	public class TouJingEvent
	{
		/** 完成偷经任务 **/
		public static const TOUJING_COMPLETE:int = UNIQUEID.NEXT;
		/** 国家经书变化 **/
		public static const TOUJING_COUNTRY_JINGSHU_CHANGE:int = UNIQUEID.NEXT;
		/** 偷经成功 **/
		public static const TOUJING_SUCCEED:int = UNIQUEID.NEXT;
		/** 接受偷经任务 **/
		public static const TOUJING_ACCEPT_TASK:int = UNIQUEID.NEXT;
		/** 接受密信任务 **/
		public static const MIXIN_ACCEPT_TASK:int = UNIQUEID.NEXT;
		/** 完成每日2次偷经任务 **/
		public static const TOUJING_COMPLETE_TASK_MAX:int = UNIQUEID.NEXT;
		/** 点击护国寺 **/
		public static const TOU_JING_NPC:int = UNIQUEID.NEXT;
		/** 点击鸡毛信NPC **/
		public static const MI_XIN_NPC:int = UNIQUEID.NEXT;
		/** 点击运镖NPC **/
		public static const YUN_BIAO:int = UNIQUEID.NEXT;
		/** 上线检测偷经状态---灰色经书的时候 **/
		public static const TOUJING_CHECK_STATE:int = UNIQUEID.NEXT;
	}
}