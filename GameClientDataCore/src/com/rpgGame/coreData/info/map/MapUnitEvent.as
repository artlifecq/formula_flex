package com.rpgGame.coreData.info.map
{
	import com.rpgGame.coreData.UNIQUEID;

	public class MapUnitEvent
	{
		/**附近的队伍*/
		public static const UPDATE_MAP_NEARBYTEAM : int = UNIQUEID.NEXT;
		/**附近的英雄*/
		public static const UPDATE_MAP_NEARBYHERO : int = UNIQUEID.NEXT;
		/**本场景的官员*/
		public static const UPDATE_MAP_OFFICER : int = UNIQUEID.NEXT;
		/**本场景的所有家族成员*/
		public static const UPDATE_MAP_FAMILYMEMBER : int = UNIQUEID.NEXT;
		/**本场景的所有本国以及盟国成员*/
		public static const UPDATE_MAP_COUNTRYMEMBER : int = UNIQUEID.NEXT;
		/**本场景的所有敌对成员*/
		public static const UPDATE_MAP_ENEMYMEMBER : int = UNIQUEID.NEXT;
		/**本场景的所有本队伍成员*/
		public static const UPDATE_MAP_TEAMMATE : int = UNIQUEID.NEXT;
		public function MapUnitEvent()
		{
		}
	}
}