package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	public class HuBaoEvent
	{
		/**
		 * 护送成功
		 * */
		public static const HUBAO_HUSONGCHENGGONG:int = UNIQUEID.NEXT;
		/**
		 * 护送失败
		 * */
		public static const HUBAO_HUSONGSHIBAI:int = UNIQUEID.NEXT;	
		/**
		 * 更新品质
		 * */
		public static const HUBAO_UPDATEPINZHI:int = UNIQUEID.NEXT;
		/**
		 * 追踪信息
		 * */
		public static const HUBAO_ZHUIZONG:int = UNIQUEID.NEXT;
		/**
		 * 开始护送
		 * */
		public static const HUBAO_STAR:int = UNIQUEID.NEXT;
	}
}