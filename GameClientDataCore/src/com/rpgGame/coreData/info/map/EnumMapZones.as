package com.rpgGame.coreData.info.map
{
	import com.rpgGame.coreData.rEnum;

	/**
	 * 是否为副本对应Q_map的 q_map_zones字段
	 * @author dik
	 * 
	 */
	public class EnumMapZones
	{
		/**
		 * 普通场景 0
		 */
		public static const MAP_NORMAL : int = rEnum.ENUM_START(0);
		/**
		 *副本 1 
		 */
		public static const MAP_COPY : int = rEnum.next;
		
		public function EnumMapZones()
		{
		}
	}
}