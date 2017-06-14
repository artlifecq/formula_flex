package com.rpgGame.appModule.guild
{
	import org.mokylin.skin.app.banghui.Skill_TongShuai;

	public class GuildOtherSkillPanel extends GuildSkillBase
	{
		private var _skin:Skill_TongShuai;
		public function GuildOtherSkillPanel(skin:Skill_TongShuai):void
		{
			_skin = skin;
			super(_skin);
		}
		
	}
}