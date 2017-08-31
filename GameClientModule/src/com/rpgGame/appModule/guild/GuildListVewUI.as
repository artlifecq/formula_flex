package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.ui.SkinUI;
	
	import org.game.netCore.data.long;
	
	public class GuildListVewUI extends ViewUI
	{
		private var _panle:SkinUI;
		private var _guildId:long=new long(0);
		public function GuildListVewUI()
		{
			super(null);
		}
		override public function show(data:Object=null):void
		{
			if(data) _guildId=data as long;
			refeashLiftPane();
			super.show(data);
		}
		
		private function refeashLiftPane():void
		{
			if(GuildManager.instance().haveGuild)
			{
				if(_panle!=null)
				{
					if(_panle is GuildListPanel)
						return ;
					this.removeChild(_panle,true);
				}
				_panle = new GuildListPanel();
				this.addChild(_panle);
			}else{
				if(_panle!=null)
				{
					if(_panle is GuildCreateListPanel)
					{
						if(!_guildId.EqualTo(new long(0))){
							(_panle as GuildCreateListPanel).showOneGuildById(_guildId);
							_guildId=new long(0);
						}	
						return ;
					}
					this.removeChild(_panle,true);
				}
				_panle = new GuildCreateListPanel();
				this.addChild(_panle);
				if(!_guildId.EqualTo(new long(0))){
					(_panle as GuildCreateListPanel).showOneGuildById(_guildId);
					_guildId=new long(0);
				}			
			}
		}
	}
}