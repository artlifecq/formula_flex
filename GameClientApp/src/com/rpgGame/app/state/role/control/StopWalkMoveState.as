package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.control.MoveState;
	import com.rpgGame.coreData.type.RoleStateType;

	/**
	 *
	 * 场景角色停止行走移动状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-21 上午10:25:12
	 *
	 */
	public class StopWalkMoveState extends MoveState
	{
		private var _stateReference : StopWalkMoveStateReference;

		public function StopWalkMoveState()
		{
			super(RoleStateType.CONTROL_STOP_WALK_MOVE);
		}
		override public function enter():void
		{
			super.enter();
			trace("StopWalkMoveState");
		}
		override public function execute() : void
		{
			super.execute();
			if (_machine && !_machine.isDisposed)
			{
				_stateReference = null;
				if (_ref)
				{
					if (_ref is StopWalkMoveStateReference)
					{
						_stateReference = _ref as StopWalkMoveStateReference;
						(_machine.owner as SceneRole).setGroundXY(_stateReference.targetX, _stateReference.targetY);
					}
					else
						throw new Error("停止行走移动状态引用必须是StopWalkMoveStateRef类型！");
				}
			}
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if ((_machine as RoleStateMachine).isBlinkMoving)
			{
				if (!force)
					return false;
			}
			else if ((_machine as RoleStateMachine).isBeatMoving)
			{
				if (!force)
					return false;
			}
			else if ((_machine as RoleStateMachine).isDeadLaunching)
			{
				if (!force)
					return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			_stateReference = null;
			super.dispose();
		}
	}
}
