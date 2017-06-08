package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import org.mokylin.skin.app.banghui.BangHui_Home;
	
	public class GuildListVewUI extends ViewUI
	{
		private var _skin:BangHui_Home;
		private var _cratePanel:CreateGuildPanel;
		private var _guildInfo:GuildInfoPanel;
		public function GuildListVewUI()
		{
			_skin = new BangHui_Home();
			super(_skin);
			initView();
		}
		private function initView():void
		{
//			_skin.lbList
		}
		override public function show(data:Object=null):void
		{
			super.show(data);
			refeashLiftPane();
		}
		
		private function refeashLiftPane():void
		{
			if(!GuildManager.instance().haveGuild)
			{
				if(_guildInfo!=null&&_guildInfo.parent!=null)
					this.removeChild(_guildInfo);
				if(_cratePanel == null)
					_cratePanel = new CreateGuildPanel();
				_cratePanel.x = 19;
				_cratePanel.y = 81;
				this.addChild(_cratePanel);
			}else{
				if(_cratePanel!=null&&_cratePanel.parent!=null)
					this.removeChild(_cratePanel);
				if(_guildInfo == null)
					_guildInfo = new GuildInfoPanel();
				_guildInfo.x = 19;
				_guildInfo.y = 81;
				this.addChild(_guildInfo);
			}
		}
	}
}