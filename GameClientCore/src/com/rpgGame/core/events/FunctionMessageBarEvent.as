package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 *
	 * 主界面消息icon显示事件
	 * @author fly.liuyang
	 * 创建时间：2014-4-17 下午10:27:50
	 * 
	 */
	public class FunctionMessageBarEvent 
	{
		/** 主界面消息icon显示事件 **/
		public static const FUNCTION_MESSAGE_BAR_SHOW_TYPE:int = UNIQUEID.NEXT;
		/** 主界面消息icon移除事件 **/
		public static const FUNCTION_MESSAGE_BAR_HIDE_TYPE:int = UNIQUEID.NEXT;
	}
}