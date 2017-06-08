package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.sender.MountSender;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.control.ControlState;
	import com.rpgGame.coreData.type.RoleStateType;

	/**
	 *
	 * 场景角色骑马状态
	 * @author L.L.M.Sunny
	 * 创建时间：2016-9-19 下午5:25:12
	 *
	 */
	public class MountRideState extends ControlState
	{
		private var _stateReference : MountRideStateReference;

		public function MountRideState()
		{
			super(RoleStateType.CONTROL_MOUNT_RIDE);
		}

		override public function execute() : void
		{
			super.execute();
			if (_machine && !_machine.isInPool)
			{
				_stateReference = null;
				if (_ref)
				{
					if (_ref is MountRideStateReference)
					{
						_stateReference = _ref as MountRideStateReference;
					}
					else
						throw new Error("场景角色骑马状态引用必须是MountRideStateReference类型！");
				}
			}
		}

		override public function afterExecute() : void
		{
			super.afterExecute();
			MountSender.requestSetUpMountRide(_stateReference.isRide);
			if (!_stateReference.isRide)
			{
				removeSelf();
			}
		}

		override public function afterLeave() : void
		{
			super.afterLeave();
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if ((_machine as RoleStateMachine).isIdle)
			{
				return true;
			}
			else if ((_machine as RoleStateMachine).isPrewar)
			{
				return true;
			}
			else if ((_machine as RoleStateMachine).isWalking)
			{
				return true;
			}
			else if ((_machine as RoleStateMachine).isRunning)
			{
				return true;
			}
			return false;
		}

		override public function dispose() : void
		{
			_stateReference = null;
			super.dispose();
		}
	}
}
