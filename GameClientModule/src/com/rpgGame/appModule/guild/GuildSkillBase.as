package com.rpgGame.appModule.guild
{
	import feathers.controls.StateSkin;

	public class GuildSkillBase
	{
		private var _skin:StateSkin;
		public function GuildSkillBase(skin:StateSkin):void
		{
			_skin = skin;
		}
		
		protected function show():void
		{
			
		}
		
		protected function hide():void
		{
			
		}
		public function set visible(value:Boolean):void
		{
			_skin.container.visible = value;
			value?show():hide();
		}
		
		public function get visible():Boolean
		{
			return _skin.container.visible;
		}
	}
}