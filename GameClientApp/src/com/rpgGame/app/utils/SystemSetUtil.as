package com.rpgGame.app.utils
{
	import com.rpgGame.coreData.lang.LangShieldingMenu;

	public class SystemSetUtil
	{
		public function SystemSetUtil()
		{
			
		}
		
		public static function getShieldingMenu():Array
		{
			var menus:Array = [];
			menus.push(LangShieldingMenu.SYSTEMSET_AKEY_BLOCK);
			menus.push(LangShieldingMenu.SYSTEMSET_MONSTER);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_PLAYERS);		
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_GANG_PLAYERS);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_DOTHER_EFFECTS);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_OTHER_GIRL);
			return menus;
		}
	}
}