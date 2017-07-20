package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class RankListEvent
	{
		/**
		 * 选择修改 
		 */
		public static const SELECTCHANGEEVENT:int = UNIQUEID.NEXT;
		
		/**
		 * 更新每类型首页消息
		 */
		public static const UPDATATYPEINFO:int = UNIQUEID.NEXT;
		
		/**
		 * 更新每页列表信息
		 */
		public static const UPDATAEVERYPAGELIST:int = UNIQUEID.NEXT;
	}
}