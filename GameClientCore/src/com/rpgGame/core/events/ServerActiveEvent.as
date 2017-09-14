package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 * 
	 * @author YT
	 */
	public class ServerActiveEvent
	{
		/**
		 *7日豪礼更新
		 */
		public static const SERVERACTIVE_SEVENDAY_UPDATE:int = UNIQUEID.NEXT;
		/**
		 *7日豪礼领奖成功
		 */
		public static const SERVERACTIVE_SEVENDAY_REWARD:int = UNIQUEID.NEXT;
		/**
		 *等级礼包更新数据
		 */
		public static const SERVERACTIVE_DENGJI_UPDATE:int = UNIQUEID.NEXT;
		/**
		 *等级礼包领取反馈
		 */
		public static const SERVERACTIVE_DENGJI_PICKUP:int = UNIQUEID.NEXT;
	}
}