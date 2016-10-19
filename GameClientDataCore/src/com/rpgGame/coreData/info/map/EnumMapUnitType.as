package com.rpgGame.coreData.info.map
{

	/**
	 * 地图单位枚举类型
	 * @author Wing
	 *
	 */
	public class EnumMapUnitType
	{
		/**附近的队伍*/
		public static const TYPE_NEAR_TEAM : int = 0;
		/**附近的英雄*/
		public static const TYPE_NEAR_HERO : int = 1;
		/**本场景的官员*/
		public static const TYPE_OFFICER : int = 2;
		/**本场景的所有家族成员*/
		public static const TYPE_FAMILY_MEMBER : int = 3;
		/**本场景的所有本国以及盟国成员*/
		public static const TYPE_COUNTRY_MEMBER : int = 4;
		/**本场景的所有敌对成员*/
		public static const TYPE_ENEMY_MEMBER : int = 5;
		/**本场景的所有本队伍成员*/
		public static const TYPE_TEAMMATE : int = 6;

		public function EnumMapUnitType()
		{
		}
	}
}
