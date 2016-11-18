package com.rpgGame.coreData.enum
{
	import com.rpgGame.coreData.rEnum;

	/**
	 *
	 * 静态buff配置组id
	 * @author L.L.M.Sunny
	 * 创建时间：2016-04-21 下午2:53:32
	 *
	 */
	public class StaticBuffGroupId
	{
		/**
		 * 家族技能buff
		 */
		public static const SOCIETY_SPELL_BUFF_ID : int = rEnum.ENUM_START(int.MAX_VALUE - 100);
		/**
		 * 地图区域buff
		 */
		public static const MAP_AREA_BUFF_ID : int = 1000000088;

		public function StaticBuffGroupId()
		{
		}
	}
}
