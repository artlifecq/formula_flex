package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import org.mokylin.skin.app.banghui.BangHui_Member;
	
	public class GuildPlayerListViewUI extends ViewUI
	{
		private var _skin:BangHui_Member
		public function GuildPlayerListViewUI():void
		{
			_skin = new BangHui_Member();
			super(_skin);
		}
	}
}