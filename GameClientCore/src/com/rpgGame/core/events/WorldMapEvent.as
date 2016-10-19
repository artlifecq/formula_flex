package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 * 世界地图
	 * @author Wing
	 */
	public class WorldMapEvent
	{
		/**世界地图城镇查看*/
		public static const Event_WorldMapClick : uint = UNIQUEID.NEXT;
		/**寻路指引更新*/
		public static const MAP_WAYS_GUILD_UPDATA_PATHS : uint = UNIQUEID.NEXT;

		public function WorldMapEvent()
		{
		}
	}
}
