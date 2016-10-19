package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.core.state.role.control.ControlState;

	/**
	 *
	 * 场景角色换装状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class AvatarState extends ControlState
	{
		public function AvatarState()
		{
			super(RoleStateType.CONTROL_AVATAR);
		}

		override public function afterExecute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				(_machine as RoleStateMachine).updateAvatar();
				super.afterExecute();
				removeSelf();
			}
		}
	}
}
