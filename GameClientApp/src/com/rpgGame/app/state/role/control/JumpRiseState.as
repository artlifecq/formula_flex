package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.control.ControlState;
	import com.rpgGame.coreData.type.RoleStateType;

	import gs.TweenLite;
	import gs.easing.Cubic;

	/**
	 *
	 * 场景角色跳跃上升状态
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-01 上午11:15:12
	 *
	 */
	public class JumpRiseState extends ControlState
	{
		/**
		 * 跳跃高度
		 */
		public static var JUMP_HEIGHT : int = 100;
		/**
		 * 二级跳跃高度
		 */
		public static var SECOND_JUMP_HEIGHT : int = 100;

		private var _stateReference : JumpRiseStateReference;

		public function JumpRiseState()
		{
			super(RoleStateType.CONTROL_JUMP_RISE);
		}

		override public function execute() : void
		{
			super.execute();
			_stateReference = null;
			if (_ref is JumpRiseStateReference)
			{
				_stateReference = _ref as JumpRiseStateReference;
				doJump();
			}
			else
				throw new Error("跳跃上升状态引用必须是JumpRiseStateReference类型！");
		}

		private function doJump() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {offsetY: true});
				var jumpHeight : int = _stateReference.isSecondJump ? SECOND_JUMP_HEIGHT : JUMP_HEIGHT;
				var totalTime : int = _stateReference.totalTime;
				TweenLite.to(_machine.owner as SceneRole, totalTime * 0.5 * 0.001, {offsetY: jumpHeight, ease: Cubic.easeOut, overwrite: 0, onComplete: onJumpOffComplete});
			}
		}

		private function onJumpOffComplete() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				var totalTime : int = _stateReference.totalTime;
				TweenLite.to(_machine.owner as SceneRole, totalTime * 0.5 * 0.001, {offsetY: 0, ease: Cubic.easeIn, overwrite: 0, onComplete: onJumpFallComplete});
			}
		}

		private function onJumpFallComplete() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				removeSelf();
				if ((_machine as RoleStateMachine).isWalkMoving)
				{
					transition(RoleStateType.ACTION_RUN);
				}
			}
		}

		override public function leave() : void
		{
			super.leave();
			stopJump();
		}

		private function stopJump() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				(_machine.owner as SceneRole).offsetY = 0;
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {offsetY: true});
			}
		}

		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if ((_machine as RoleStateMachine).isBingDong)
			{
				if (!force)
					return false;
			}
			return true;
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if ((_machine as RoleStateMachine).isDead)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isDeadLaunch)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isTrailMoving)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isStiff)
			{
				if (!force)
					return false;
			}
			else if ((_machine as RoleStateMachine).isStun)
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
