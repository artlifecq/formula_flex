package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class MenuEvent
	{
		/** 点击了弹出菜单的某项   带参数：类型 MenuType **/
		public static const MENU_CLICK : int = UNIQUEID.NEXT;
		
		/** (屏蔽菜单)点击了弹出菜单的某项   带参数：类型 ShieldMenuType **/
		public static const SHIELDMENU_CLICK : int = UNIQUEID.NEXT;
		/**一键屏蔽（带参数）*/
		public static const SAKEYBLOCK : int = UNIQUEID.NEXT;
	}
}