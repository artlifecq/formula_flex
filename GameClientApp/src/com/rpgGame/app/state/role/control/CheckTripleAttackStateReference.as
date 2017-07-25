package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;
	
	public class CheckTripleAttackStateReference extends RoleStateReference
	{
		public function CheckTripleAttackStateReference()
		{
			super();
		}
		public var startSkill:int;
		public function setParams(skill:int):void
		{
			this.startSkill=skill;
		}
	}
}