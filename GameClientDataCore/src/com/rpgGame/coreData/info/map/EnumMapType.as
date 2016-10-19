package com.rpgGame.coreData.info.map
{
	import com.rpgGame.coreData.rEnum;

	/**
	 * 地图数据类型
	 */
	public class EnumMapType
	{
		/** 未知类型*/
		public static const MAP_TYPE_NONE : int = 0;
		/** 普通场景 */
		public static const MAP_TYPE_NORMAL : int = rEnum.ENUM_START(1);
		/** 监狱场景 */
		public static const MAP_TYPE_JAIL_DUNGEON : int = rEnum.next;
		/** 家族副本 */
		public static const MAP_TYPE_FAMILY_DUNGEON : int = rEnum.next;
		/** 王城战/皇城战 */
		public static const MAP_TYPE_FAMILY_BATTLE_SCENE : int = rEnum.next;
		/** 帮派神兽副本 */
		public static const MAP_TYPE_FAMILY_ANIMAL_SCENE : int = rEnum.next;
		/** 八阵图副本 */
		public static const MAP_TYPE_BAZHENTU_SCENE : int = rEnum.next;
		/** 讨逆副本 */
		public static const MAP_TYPE_TAO_NI_DUNGEON : int = rEnum.next;
		/** 剧情副本 */
		public static const MAP_TYPE_STORY_DUNGEON : int = rEnum.next;
	}
}
