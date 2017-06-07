package game.rpgGame.login.state
{
	

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
			if (_machine && !_machine.isInPool)
			{
				(_machine as RoleStateMachine).updateAvatar();
				super.afterExecute();
				removeSelf();
			}
		}
	}
}
