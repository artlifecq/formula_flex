package com.rpgGame.app.state.role.control
{
	import com.rpgGame.coreData.type.RoleStateType;

	public class FlyFallState extends BuffState
	{
		public function FlyFallState(type:uint)
		{
			super(RoleStateType.CONTROL_FLY_FALL);
		}
	}
}