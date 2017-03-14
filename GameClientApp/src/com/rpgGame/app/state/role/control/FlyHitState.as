package com.rpgGame.app.state.role.control
{
	import com.rpgGame.coreData.type.RoleStateType;

	public class FlyHitState extends BuffState
	{
		public function FlyHitState(type:uint)
		{
			super(RoleStateType.CONTROL_FLY_HIT);
		}
	}
}