package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	public class PromptBarEvent
	{
		/** 显示某个图标   参数   type:int **/
		public static const SHOW_PROMPT_ICO : int = UNIQUEID.NEXT;
		/** 隐藏某个图标   参数   type:int **/
		public static const HIDE_PROMPT_ICO : int = UNIQUEID.NEXT;
	}
}