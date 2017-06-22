package com.rpgGame.coreData.info.map
{
	import com.rpgGame.coreData.rEnum;
	
	/**
	 * 地图数据类型
	 */
	public class EnumMapType
	{
		/** 普通场景 */
		public static const MAP_TYPE_NORMAL : int = rEnum.ENUM_START(0);
		/**
		 *论剑副本 
		 */
		public static const MAP_TYPE_LUNJIAN : int = rEnum.next;//1
		/**
		 *多人副本 
		 */
		public static const MAP_TYPE_MULTY : int = rEnum.next;//2
		
		/**
		 * 真气副本
		 */
		public static const MAP_TYPE_Genuine:int = rEnum.next;//3
		
		/**
		 * 装备副本
		 */
		public static const MAP_TYPE_EQUIP:int = rEnum.next;//4
		/**
		 * 经验副本
		 */
		public static const MAP_TYPE_EXP:int = rEnum.next;//5
        /**
		 * 巅峰对决
		 */
		public static const MAP_TYPE_D1V1:int = rEnum.next;//6
		/**
		 * 九层妖塔
		 */
		public static const MAP_TYPE_TOWERS:int = rEnum.next;//7
		/**
		 * 世界boss
		 */
		public static const MAP_WORLD_BOSS:int = rEnum.next;//8
		/**
		 * 极限挑战
		 */
		public static const MAP_JIXIAN:int = rEnum.next;//9
		
	}
}
