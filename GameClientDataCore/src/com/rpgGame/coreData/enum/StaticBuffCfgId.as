package com.rpgGame.coreData.enum
{
	import com.rpgGame.coreData.rEnum;

	/**
	 *
	 * 静态buff配置id
	 * @author L.L.M.Sunny
	 * 创建时间：2016-04-21 下午2:53:32
	 *
	 */
	public class StaticBuffCfgId
	{
		/**
		 * 家族技能buff
		 */
		public static const SOCIETY_SPELL_BUFF_CFG_ID : int = rEnum.ENUM_START(int.MAX_VALUE - 100);
		/**
		 * 地图区域buff
		 */
		public static const MAP_AREA_BUFF_CFG_ID : int = rEnum.next;
		/**
		 * 八阵图类型1 
		 */		
		public static const BA_ZHEN_TU_BUFF_ID_1 : int = rEnum.next;
		/**
		 * 八阵图类型2 
		 */		
		public static const BA_ZHEN_TU_BUFF_ID_2 : int = rEnum.next;
		/**
		 * 八阵图类型3
		 */		
		public static const BA_ZHEN_TU_BUFF_ID_3 : int = rEnum.next;
		/**
		 * 八阵图类型4 
		 */		
		public static const BA_ZHEN_TU_BUFF_ID_4 : int = rEnum.next;
		/**
		 * 八阵图类型5 
		 */		
		public static const BA_ZHEN_TU_BUFF_ID_5 : int = rEnum.next;
		/**
		 * 八阵图类型6
		 */		
		public static const BA_ZHEN_TU_BUFF_ID_6 : int = rEnum.next;
		/**
		 * 八阵图类型7 
		 */		
		public static const BA_ZHEN_TU_BUFF_ID_7 : int = rEnum.next;
		/**
		 * 八阵图类型0
		 */		
		public static const BA_ZHEN_TU_BUFF_ID_0 : int = rEnum.next;

		public function StaticBuffCfgId()
		{
		}
	}
}
