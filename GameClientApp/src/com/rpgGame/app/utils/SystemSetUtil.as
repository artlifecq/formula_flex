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
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_PLAYERS);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_GANG_ENEMYS);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_GANG_PLAYERS);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_DAMAGE_NUMBER);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_OTHER_SPELL_EFFECTS);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_SPELL_EFFECTS);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_EFFECTS);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_SHADOW_EFFECTS);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_WEATHER_EFFECTS);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_SCREEN_SHOCK);
			menus.push(LangShieldingMenu.SYSTEMSET_HIDE_SWTSITL);
			return menus;
		}
	}
}