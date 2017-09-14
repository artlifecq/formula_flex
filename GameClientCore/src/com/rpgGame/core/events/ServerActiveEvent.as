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
	}
}