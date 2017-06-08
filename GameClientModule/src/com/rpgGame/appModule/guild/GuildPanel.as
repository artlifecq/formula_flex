package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.banghui.BangHui_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;

	public class GuildPanel extends TabBarPanel
	{
		private var _skin:BangHui_Skin;
		public function GuildPanel():void
		{
			_skin = new BangHui_Skin();
			super(_skin);
		}
		
		override protected function initTabBarDatas():void
		{
			if(GuildManager.instance().haveGuild)
			{
				addTabDatas(TabBarSkin_pack,GuildInfoViewUI,EmFunctionID.EM_BANGHUI_INFO);
				addTabDatas(TabBarSkin_pack,GuildPlayerListViewUI,EmFunctionID.EM_BANGHUI_CHENGYUAN);
				addTabDatas(TabBarSkin_pack,GuildUPViewUI,EmFunctionID.EM_BANGHUI_UPLEVEL);
				addTabDatas(TabBarSkin_pack,GuildPlayerListViewUI,EmFunctionID.EM_BANGHUI_SPELL);
				addTabDatas(TabBarSkin_pack,GuildListVewUI,EmFunctionID.EM_BANGHUI_LIEBIAO);
				addTabDatas(TabBarSkin_pack,GuildPlayerListViewUI,EmFunctionID.EM_BANGHUI_COMBAT);
			}else{
				addTabDatas(TabBarSkin_pack,GuildListVewUI,EmFunctionID.EM_BANGHUI_LIEBIAO);
			}
			
		}
	}
}