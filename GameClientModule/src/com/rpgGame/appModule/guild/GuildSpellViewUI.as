package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import org.mokylin.skin.app.banghui.BangHui_Skill;

	public class GuildSpellViewUI extends ViewUI
	{
		private var _skin:BangHui_Skill;
		public function GuildSpellViewUI():void
		{
			_skin = new BangHui_Skill();
			super(_skin);
		}
	}
}