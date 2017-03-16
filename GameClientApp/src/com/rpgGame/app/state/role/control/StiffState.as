package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.coreData.type.RoleStateType;

	/**
	 *
	 * 场景角色定身状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-30 下午2:25:12
	 *
	 */
	public class StiffState extends BuffState
	{
		public function StiffState()
		{
			super(RoleStateType.CONTROL_STIFF);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
				if (_stateReference)
				{
					if (_stateReference is StiffStateReference)
					{
//						(_machine as RoleStateMachine).actionPause();
					}
					else
						throw new Error("场景角色定身状态引用必须是StiffStateReference类型！");
				}
			}
		}

		override public function afterLeave() : void
		{
			super.afterLeave();
			if (_machine && !_machine.isDisposed)
			{
//				(_machine as RoleStateMachine).actionResume();
			}
		}
	}
}
