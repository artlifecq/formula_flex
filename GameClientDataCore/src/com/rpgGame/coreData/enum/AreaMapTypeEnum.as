package com.rpgGame.coreData.enum
{

	/**
	 *
	 * 区域图类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-09-15 上午11:03:17
	 *
	 */
	public class AreaMapTypeEnum
	{
		/**
		 * 障碍区域
		 */
		public static const OBSTACLE : int = 2;
		/**
		 * 传送门区域
		 */
		public static const TRANS : int = 4;
		/**
		 * 摄像机属性区域
		 */
		public static const CAMERA_PROPERTY : int = 8;
		/**
		 * 事件区域属性区域
		 */
		public static const EVENT_AREA_PROPERTY : int = 16;
		/**
		 * 地图数据区域属性区域
		 */
		public static const MAP_DATA_AREA_PROPERTY : int = 32;
		/**
		 * 触发区域属性区域
		 */
		public static const TRIGGER_AREA_PROPERTY : int = 64;

		public function AreaMapTypeEnum()
		{
		}
	}
}
