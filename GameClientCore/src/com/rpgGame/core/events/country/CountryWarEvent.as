package com.rpgGame.core.events.country
{
	import com.rpgGame.coreData.UNIQUEID;

	public class CountryWarEvent
	{
		/** 守城怪数据变化 */
		public static const MONSTER_STATUS_CHANGE : int = UNIQUEID.NEXT;
		/** 杀敌数变化 */
		public static const KILL_INFO_CHANGE : int = UNIQUEID.NEXT;

		/** 我方国战杀人排行榜 **/
		public static const MY_COUNTRY_RANK_INFO_CHANGE : int = UNIQUEID.NEXT;
		/** 国战结束**/
		public static const WAR_END : int = UNIQUEID.NEXT;
		/** 大怪死了 */
		public static const MONSTEN_DEAD : int = UNIQUEID.NEXT;

		/**国战信息变更*/
		public static const COUNTRY_WARS_INFO_UPDATE : int = UNIQUEID.NEXT;

		/**国战积分变更*/
		public static const COUNTRY_WARS_SCORE_UPDATE : int = UNIQUEID.NEXT;
		/**上了自己的战车*/
		public static const GET_ON_OWN_ZHAN_CHE:int = UNIQUEID.NEXT;
		/**下了自己的战车*/
		public static const GET_OFF_OWN_ZHAN_CHE:int = UNIQUEID.NEXT;
		/**上了别人的战车*/
		public static const GET_ON_OTHERS_ZHAN_CHE:int = UNIQUEID.NEXT;
		/**下了别人的战车*/
		public static const GET_OFF_OTHERS_ZHAN_CHE:int = UNIQUEID.NEXT;
		
		/**自己在国战中的信息变了*/
		public static const SELF_INFO_CHANGED:int = UNIQUEID.NEXT;
		/**支持的数值发生了变化*/
		public static const SUPPORT_COUNT_CHANGE:int = UNIQUEID.NEXT;
		/**观战的数值发生了变化*/
		public static const WATCHER_COUNT_CHANGE:int = UNIQUEID.NEXT;
		
	}
}
