package com.rpgGame.app.state.role.control
{
	import com.rpgGame.coreData.type.RoleStateType;

	public class FlyUpState extends BuffState
	{
		public function FlyUpState(type:uint)
		{
			super(RoleStateType.CONTROL_FLY_UP);
		}
	}
}