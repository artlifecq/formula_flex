package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class PeopleMenuEvent
	{
		/**人物菜单显示*/
		public static const PEOPLE_MENU_SHOWED:int = UNIQUEID.NEXT;
		/**人物菜单关闭*/
		public static const PEOPLE_MENU_CLOSED:int = UNIQUEID.NEXT;
	}
}