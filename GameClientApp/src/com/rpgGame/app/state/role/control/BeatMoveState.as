package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.IState;
	import com.game.engine3D.utils.MathUtil;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.control.MoveState;
	import com.rpgGame.coreData.type.RoleStateType;

	import gs.TweenLite;
	import gs.easing.Linear;

	/**
	 *
	 * 场景角色被击移动状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-21 上午10:25:12
	 *
	 */
	public class BeatMoveState extends MoveState
	{
		private var _stateReference : BeatMoveStateReference;
		private var _totalTime : int;

		public function BeatMoveState()
		{
			super(RoleStateType.CONTROL_BEAT_MOVE);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_stateReference = null;
				if (_ref)
				{
					if (_ref is BeatMoveStateReference)
					{
						_stateReference = _ref as BeatMoveStateReference;
						doBeatBack();
					}
					else
						throw new Error("瞬移状态引用必须是BeatMoveStateRef类型！");
				}
			}
		}

		private function doBeatBack() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true});

				var targetX : int = _stateReference.targetPos.x;
				var targetZ : int = _stateReference.targetPos.y;
				var atkorX : int = _stateReference.atkorPos.x;
				var atkorZ : int = _stateReference.atkorPos.y;
				var distance : Number = MathUtil.getDistance((_machine.owner as SceneRole).x, (_machine.owner as SceneRole).z, targetX, targetZ);
				_totalTime = distance / _stateReference.moveSpeed * 1000;

				(_machine.owner as SceneRole).faceToGround(atkorX, atkorZ, 0);
				if (_totalTime > 0)
					TweenLite.to(_machine.owner as SceneRole, _totalTime * 0.001, {x: targetX, z: targetZ, ease: Linear.easeNone, overwrite: 0, onComplete: onMoveComplete});
				else
					onMoveComplete();

				_stateReference.move();
			}
		}

		override public function leave() : void
		{
			super.leave();
			stopBeatBack();
		}

		private function onMoveComplete() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				var targetX : int = _stateReference.targetPos.x;
				var targetZ : int = _stateReference.targetPos.y;
				(_machine.owner as SceneRole).x = targetX;
				(_machine.owner as SceneRole).z = targetZ;
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true});
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
			}
		}

		private function stopBeatBack() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				var targetX : int = _stateReference.targetPos.x;
				var targetZ : int = _stateReference.targetPos.y;
				(_machine.owner as SceneRole).x = targetX;
				(_machine.owner as SceneRole).z = targetZ;
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true});
			}
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if (prevState)
			{
				if (prevState.type == RoleStateType.CONTROL_TRAIL_MOVE)
				{
					return false;
				}
			}
			if ((_machine as RoleStateMachine).isDead)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isDeadLaunch)
			{
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
