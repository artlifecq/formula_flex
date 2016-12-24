package com.editor.state.role.control
{
	import com.editor.data.RoleStateType;
	import com.editor.state.role.RoleStateMachine;

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
