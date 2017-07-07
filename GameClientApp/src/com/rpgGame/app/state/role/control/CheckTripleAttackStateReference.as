package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;
	
	public class CheckTripleAttackStateReference extends RoleStateReference
	{
		public var skill:int;
		public function CheckTripleAttackStateReference()
		{
			super();
		}
		public function setParams(skill:int):void
		{
			this.skill=skill;
		}
	}
}