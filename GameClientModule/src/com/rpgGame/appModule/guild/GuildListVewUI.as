package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.ui.SkinUI;
	
	public class GuildListVewUI extends ViewUI
	{
		private var _panle:SkinUI;
		public function GuildListVewUI()
		{
			super(null);
		}
		override public function show(data:Object=null):void
		{
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
						return ;
					this.removeChild(_panle,true);
				}
				_panle = new GuildCreateListPanel();
				this.addChild(_panle);
			}
		}
	}
}