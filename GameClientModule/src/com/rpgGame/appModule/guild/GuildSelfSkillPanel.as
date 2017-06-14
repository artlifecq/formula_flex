package com.rpgGame.appModule.guild
{
	import org.mokylin.skin.app.banghui.Skill_Personal;

	public class GuildSelfSkillPanel extends GuildSkillBase
	{
		private var _skin:Skill_Personal;
		public function GuildSelfSkillPanel(skin:Skill_Personal):void
		{
			_skin = skin;
			super(_skin);
		}
		
	}
}