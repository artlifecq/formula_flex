package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class HunYinEvent
	{
		/**
		 * 离婚结果
		 * */
		public static const HUNYIN_LIHUN:int=UNIQUEID.NEXT;
		
		/**
		 * 夫妻互动
		 * */
		public static const HUNYIN_HUDONG:int=UNIQUEID.NEXT;
		
		/**
		 * 婚姻数据
		 * */
		public static const HUNYIN_HUNYIN:int=UNIQUEID.NEXT;
		
		/**
		 * 求婚反馈
		 * */
		public static const HUNYIN_QIUHUN:int=UNIQUEID.NEXT;
		
		/**
		 * 求婚提示
		 * */
		public static const HUNYIN_QIUHUNTISHI:int=UNIQUEID.NEXT;
	
		/**
		 * 进阶反馈
		 * */
		public static const HUNYIN_JINJIE:int=UNIQUEID.NEXT;
		/**
		 * 突破
		 * */
		public static const HUNYIN_TUPO:int=UNIQUEID.NEXT;
		/**
		 * 进阶成功
		 * */
		public static const HUNYIN_JINJIE_CHENGGONG:int=UNIQUEID.NEXT;
		/**
		 * 副本挑战次数变化
		 * */
		public static const HUNYIN_FUBENCISHU:int=UNIQUEID.NEXT;
		/**
		 *征婚时间计时
		 * */
		public static const HUNYIN_ZHENGHUN:int=UNIQUEID.NEXT;
	}
}