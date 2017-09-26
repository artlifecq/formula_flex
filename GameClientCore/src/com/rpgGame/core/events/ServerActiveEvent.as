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
		/**
		 *等级提升后可领取提示
		 */
		public static const SERVERACTIVE_DENGJI_TISHI:int = UNIQUEID.NEXT;
		/**
		 *返回在线时间
		 */
		public static const SERVERACTIVE_ONLINE_TIME:int = UNIQUEID.NEXT;
		/**
		 *在线奖励领取反馈
		 */
		public static const SERVERACTIVE_ONLINE_PICKUP:int = UNIQUEID.NEXT;		
		/**
		 *获取签到信息
		 */
		public static const SERVERACTIVE_SIGN_GETINFOS:int = UNIQUEID.NEXT;

	}
}