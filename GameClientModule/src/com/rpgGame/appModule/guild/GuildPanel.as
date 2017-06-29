package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.appModule.guild.war.WczbWarViewUI;
	import com.rpgGame.core.events.GuildEvent;
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
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(TabBarSkin_pack,GuildInfoViewUI,EmFunctionID.EM_BANGHUI_INFO);
			addTabDatas(TabBarSkin_pack,GuildPlayerListViewUI,EmFunctionID.EM_BANGHUI_CHENGYUAN);
			addTabDatas(TabBarSkin_pack,GuildUPViewUI,EmFunctionID.EM_BANGHUI_UPLEVEL);
			addTabDatas(TabBarSkin_pack,GuildSkillViewUI,EmFunctionID.EM_BANGHUI_SPELL);
			addTabDatas(TabBarSkin_pack,GuildListVewUI,EmFunctionID.EM_BANGHUI_LIEBIAO);
			addTabDatas(TabBarSkin_pack,GuildPlayerListViewUI,EmFunctionID.EM_BANGHUI_COMBAT);
			addTabDatas(TabBarSkin_pack,WczbWarViewUI,EmFunctionID.EM_BANGHUI_WCZB2);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
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