package com.game.engine3D.events
{

	/**
	 *
	 * 地图加载事件类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-8 下午5:25:37
	 *
	 */
	public class MapLoadEvent
	{
		public static const MAP_RESOURCE_COMPLETE : String = "map_resource_complete";
		public static const MAP_LOAD_COMPLETE : String = "map_load_complete";
		public static const MAP_LOAD_PROGRESS : String = "map_load_progress";
		public static const MAP_LOAD_ERROR : String = "map_load_error";
		public static const MAP_PARSE_PROGRESS : String = "map_parse_progress";
		public static const MAP_PARSE_ERROR : String = "map_parse_error";
		public static const MAP_DATA_ERROR : String = "map_data_error";
		public static const MAP_MINI_MAP_ERROR : String = "map_mini_map_error";
		public static const MAP_RADAR_MAP_ERROR : String = "map_radar_map_error";

		public function MapLoadEvent()
		{
		}
	}
}
