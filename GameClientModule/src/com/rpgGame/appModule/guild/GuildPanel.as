package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.app.ui.tab.UITabBarData;
	import com.rpgGame.appModule.guild.war.HczbPlayerViewUI;
	import com.rpgGame.appModule.guild.war.WczbWarViewUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.banghui.BangHui_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	import org.mokylin.skin.component.tabbar.TabBarSkin_tab;

	public class GuildPanel extends TabBarPanel
	{
		private var _skin:BangHui_Skin;
		public function GuildPanel():void
		{
			_skin = new BangHui_Skin();
			super(_skin);
			_tabBar.checkToTabHandler=checkToTabHandler;
			_tabBar.checkOpenHandler=checkOpenHandler;
			addNode(RTNodeID.MAIN_SOCAIL,RTNodeID.GUILD_INFO,_tabBar.getTabDataByTabKey(EmFunctionID.EM_BANGHUI_INFO).button,65,GuildManager.instance().hasDailyGift,false,null,true);
			addNode(RTNodeID.MAIN_SOCAIL,RTNodeID.GUILD_UP,_tabBar.getTabDataByTabKey(EmFunctionID.EM_BANGHUI_UPLEVEL).button,65,GuildManager.instance().hasGuildLevelUp,false,null,true);
			addNode(RTNodeID.MAIN_SOCAIL,RTNodeID.GUILD_MEM,_tabBar.getTabDataByTabKey(EmFunctionID.EM_BANGHUI_CHENGYUAN).button,65,GuildManager.instance().hasApplyList,false,null,true);
			addNode(RTNodeID.MAIN_SOCAIL,RTNodeID.GUILD_SKILL,_tabBar.getTabDataByTabKey(EmFunctionID.EM_BANGHUI_SPELL).button,65,GuildManager.instance().hasSkill2LevelUp,false,null,true);
		}
		
		private function checkOpenHandler(item:UITabBarData):Boolean
		{
			var funcID:int=item.tabKey;
			switch(funcID){
				case EmFunctionID.EM_BANGHUI_CHENGYUAN:
				case EmFunctionID.EM_BANGHUI_UPLEVEL:
				case EmFunctionID.EM_BANGHUI_SPELL:
				case EmFunctionID.EM_BANGHUI_INFO:
					if(GuildManager.instance().haveGuild==false){
						return false;
					}
					break;
			}
			return true
		}
		
		private function checkToTabHandler(funcID:int):Boolean
		{
			switch(funcID){
				case EmFunctionID.EM_BANGHUI_CHENGYUAN:
				case EmFunctionID.EM_BANGHUI_UPLEVEL:
				case EmFunctionID.EM_BANGHUI_SPELL:
				case EmFunctionID.EM_BANGHUI_INFO:
					if(GuildManager.instance().haveGuild==false){
						NoticeManager.showNotifyById(22004);
						return false;
					}
					break;
			}
			return true
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(TabBarSkin_tab,GuildInfoViewUI,EmFunctionID.EM_BANGHUI_INFO);
			addTabDatas(TabBarSkin_tab,GuildPlayerListViewUI,EmFunctionID.EM_BANGHUI_CHENGYUAN);
			addTabDatas(TabBarSkin_tab,GuildUPViewUI,EmFunctionID.EM_BANGHUI_UPLEVEL);
			addTabDatas(TabBarSkin_tab,GuildSkillViewUI,EmFunctionID.EM_BANGHUI_SPELL);
			addTabDatas(TabBarSkin_tab,GuildListVewUI,EmFunctionID.EM_BANGHUI_LIEBIAO);
			addTabDatas(TabBarSkin_tab,WczbWarViewUI,EmFunctionID.EM_BANGHUI_WAR);
			addTabDatas(TabBarSkin_tab,HczbPlayerViewUI,EmFunctionID.EM_HCZB_INFO_GUILD);
		}
	}
}