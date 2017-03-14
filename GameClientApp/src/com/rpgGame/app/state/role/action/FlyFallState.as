package com.rpgGame.app.state.role.action
{
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.type.RoleStateType;
	
	/**
	 * 从地上击飞在空中的状态
	 * @author NEIL
	 * 
	 */	
	public class FlyFallState extends ActionState
	{
		public function FlyFallState(type:uint)
		{
			super(RoleStateType.ACTION_FLY_FALL);
		}
	}
}