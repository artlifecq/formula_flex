package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import org.mokylin.skin.app.banghui.BangHui_Up;
	
	public class GuildUPViewUI extends ViewUI
	{
		private var _skin:BangHui_Up;
		public function GuildUPViewUI()
		{
			_skin = new BangHui_Up();
			super(_skin);
		}
	}
}