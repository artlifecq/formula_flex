package com.rpgGame.coreData.info.map
{
	import com.rpgGame.coreData.rEnum;

	/**
	 * 地图图标类型
	 * @author L.L.M.Sunny
	 * 创建时间：2016-06-07 上午10:05:12
	 */
	public class MapIconType
	{
		/**怪物出生点*/
		public static const BORN_MONSTER : int = rEnum.ENUM_START(1);
		/**官员出生点*/
		public static const BORN_OFFICER : int = rEnum.next;
		/**家族成员出生点*/
		public static const BORN_FAMILY : int = rEnum.next;
		/**本国或盟国成员出生点*/
		public static const BORN_COUNTRY_MEMBER : int = rEnum.next;
		/**敌国成员出生点*/
		public static const BORN_ENEMY_MEMBER : int = rEnum.next;
		/**队员出生点*/
		public static const BORN_TEAMMATE : int = rEnum.next;
		/**传送门出生点*/
		public static const BORN_TRANPORTS : int = rEnum.next;
		/**NPC出生点*/
		public static const BORN_NPC : int = rEnum.next;
		/**场景怪物点*/
		public static const SCENE_MONSTER : int = rEnum.next;
		/**场景采集物点*/
		public static const SCENE_COLLECT : int = rEnum.next;
		/**场景本国玩家点*/
		public static const SCENE_PLAYER_MY_COUNTRY : int = rEnum.next;
		/**场景敌国玩家点*/
		public static const SCENE_PLAYER_ENEMY_COUNTRY : int = rEnum.next;

		public function MapIconType()
		{
		}
	}
}
