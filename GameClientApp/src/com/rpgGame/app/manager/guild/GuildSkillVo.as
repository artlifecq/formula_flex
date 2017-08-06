package com.rpgGame.app.manager.guild
{
	/**
	 *客户端的技能列表和服务器一样 
	 * @author Administrator
	 * 
	 */	
	public class GuildSkillVo
	{
		//技能Id
		private var _id: int;
		
		//技能等级
		private var _level: int;
		public function GuildSkillVo(skill:int)
		{
			this._id=skill;
		}

		public function get id():int
		{
			return _id;
		}

		public function get level():int
		{
			return _level;
		}

		public function set level(value:int):void
		{
			_level = value;
		}


	}
}