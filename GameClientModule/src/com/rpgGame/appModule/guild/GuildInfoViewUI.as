package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import org.mokylin.skin.app.banghui.BangHui_Info;
	
	public class GuildInfoViewUI extends ViewUI
	{
		private var _skin:BangHui_Info;
		private var _guildInfo:GuildInfoPanel;
		public function GuildInfoViewUI()
		{
			_skin = new BangHui_Info();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			_guildInfo = new GuildInfoPanel();
			_guildInfo.x = 19;
			_guildInfo.y = 81;
			this.addChild(_guildInfo);
		}
	}
}