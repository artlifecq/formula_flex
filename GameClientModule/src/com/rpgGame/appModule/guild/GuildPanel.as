package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.appModule.guild.war.HczbPlayerViewUI;
	import com.rpgGame.appModule.guild.war.WczbWarViewUI;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.BangHui_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	
	import starling.display.DisplayObjectContainer;

	public class GuildPanel extends TabBarPanel
	{
		private var _skin:BangHui_Skin;
		public function GuildPanel():void
		{
			_skin = new BangHui_Skin();
			super(_skin);
			
			addNode(RTNodeID.MAIN_SOCAIL,RTNodeID.GUILD_INFO,_tabBar.getTabDataByTabKey(EmFunctionID.EM_BANGHUI_INFO).button,65,GuildManager.instance().hasDailyGift,false,null,true);
			addNode(RTNodeID.MAIN_SOCAIL,RTNodeID.GUILD_UP,_tabBar.getTabDataByTabKey(EmFunctionID.EM_BANGHUI_UPLEVEL).button,65,GuildManager.instance().hasGuildLevelUp,false,null,true);
			addNode(RTNodeID.MAIN_SOCAIL,RTNodeID.GUILD_MEM,_tabBar.getTabDataByTabKey(EmFunctionID.EM_BANGHUI_CHENGYUAN).button,65,GuildManager.instance().hasApplyList,false,null,true);
			addNode(RTNodeID.MAIN_SOCAIL,RTNodeID.GUILD_SKILL,_tabBar.getTabDataByTabKey(EmFunctionID.EM_BANGHUI_SPELL).button,65,GuildManager.instance().hasSkill2LevelUp,false,null,true);
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(TabBarSkin_pack,GuildInfoViewUI,EmFunctionID.EM_BANGHUI_INFO);
			addTabDatas(TabBarSkin_pack,GuildPlayerListViewUI,EmFunctionID.EM_BANGHUI_CHENGYUAN);
			addTabDatas(TabBarSkin_pack,GuildUPViewUI,EmFunctionID.EM_BANGHUI_UPLEVEL);
			addTabDatas(TabBarSkin_pack,GuildSkillViewUI,EmFunctionID.EM_BANGHUI_SPELL);
			addTabDatas(TabBarSkin_pack,GuildListVewUI,EmFunctionID.EM_BANGHUI_LIEBIAO);
			addTabDatas(TabBarSkin_pack,WczbWarViewUI,EmFunctionID.EM_BANGHUI_WCZB2);
			addTabDatas(TabBarSkin_pack,HczbPlayerViewUI,EmFunctionID.EM_BANGHUI_COMBAT);
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			EventManager.addEvent(GuildEvent.GUILD_DATA_INIT,refeashView);
			EventManager.addEvent(GuildEvent.GUILD_SKILLINFO_CHAGE,refeashView);
			refeashView();
			GuildSender.requestGuildInfo();
			GuildSender.reqGuildSkillInfo();
		}
		
		private function refeashView():void
		{
			_tabBar.checkOpen();
		}
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(GuildEvent.GUILD_DATA_INIT,refeashView);
			EventManager.removeEvent(GuildEvent.GUILD_SKILLINFO_CHAGE,refeashView);
		}
	}
}