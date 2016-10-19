package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class FamilyWarEvent
	{
		public function FamilyWarEvent()
		{
		}
		/**竞标低价改变了 **/
		public static const FAMILY_WAR_MIN_BID_CHANGE : int = UNIQUEID.NEXT;
		/**我的竞标改变了**/
		public static const FAMILY_WAR_MY_BID_CHANGE : int = UNIQUEID.NEXT;
		/**竞标开始时间改变了**/
		public static const FAMILY_WAR_BID_START_TIME_CHANGE : int = UNIQUEID.NEXT;
		/**竞标结束时间改变了**/
		public static const FAMILY_WAR_END_TIME_CHANGE : int = UNIQUEID.NEXT;
		/**获得排名数据**/
		public static const FAMILY_WAR_BID_RANK : int = UNIQUEID.NEXT;
		/**进攻方和防守方名字**/
		public static const FAMILY_WAR_FIGHT_FAMILY : int = UNIQUEID.NEXT;
		/**王城战战斗结束时间改变**/
		public static const FAMILY_WAR_FIGHT_END_TIME : int = UNIQUEID.NEXT;
		/**王城战开始时间**/
		public static const FAMILY_WAR_FIGHT_START_TIME : int = UNIQUEID.NEXT;
		/**获得王城战副本中的排行榜**/
		public static const FAMILY_WAR_DUNGEION : int=  UNIQUEID.NEXT;
		/**副本状态改变了**/
		public static const FAMILY_WAR_DUNGEON_STATUS_CHANGE : int = UNIQUEID.NEXT;
		/**获取战场广播**/
		public static const FAMILY_WAR_SCENE_BROADCAST : int= UNIQUEID.NEXT;
		/**复活时间改变**/
		public static const FAMILY_WAR_RELIVE_TIME_CHANGE : int = UNIQUEID.NEXT;
	}
}