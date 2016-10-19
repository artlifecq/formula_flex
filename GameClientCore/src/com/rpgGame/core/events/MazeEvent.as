package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class MazeEvent
	{
		public function MazeEvent()
		{
		}
		/**上次的排名改变了**/
		public static const LAST_MAZE_CHANGE : uint = UNIQUEID.NEXT;
		/**本次的排名改变了**/
		public static const MAZE_CHANGE : uint = UNIQUEID.NEXT;
		/**副本信息改变了，可能需要更新UI或者场景**/
		public static const DUNEGON_INFO_CHANGE : uint = UNIQUEID.NEXT;
		/**副本开启提示**/
		public static const SHOW_DUNGEON_OPEN_ALERT : uint = UNIQUEID.NEXT;
		/**副本关闭提示**/
		public static const SHOW_DUNGEION_CLOSE_ALERT : uint = UNIQUEID.NEXT;
		/**随机层提示**/
		public static const SHOW_MAZE_RANDOM : uint = UNIQUEID.NEXT;
	}
}