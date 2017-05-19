package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	public class JunJieEvent
	{
		/**
		 * 军阶条件发生改变
		 * */
		public static const JUNJIE_CHANGE:int=UNIQUEID.NEXT;
		
		/**
		 * 激活结果
		 * */
		public static const JUNJIE_JIEGUO:int=UNIQUEID.NEXT;
		
		/**
		 * 选取事件
		 * */
		public static const JUNJIE_SELECT:int=UNIQUEID.NEXT;
	}
}