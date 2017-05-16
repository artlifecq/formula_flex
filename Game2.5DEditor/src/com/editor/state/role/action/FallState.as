package com.editor.state.role.action
{
	import com.editor.data.RenderUnitID;
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleActionType;
	import com.editor.data.RoleStateType;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.RoleStateMachine;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;
	
	import gs.TweenLite;

	/**
	 *
	 * 场景角色击倒状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-7 下午5:25:12
	 *
	 */
	public class FallState extends ActionState
	{
		private var _stateReference : FallStateReference;
		private var _hardStiffTween : TweenLite;
		private var _totalFrameTween : TweenLite;
		private var _hardStiffFinished : Boolean;

		public function FallState()
		{
			super(RoleStateType.ACTION_FALL);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_hardStiffFinished = false;
				_stateReference = null;
				if (_ref)
				{
					if (_ref is FallStateReference)
					{
						_stateReference = _ref as FallStateReference;
						if (_hardStiffTween)
						{
							_hardStiffTween.kill();
							_hardStiffTween = null;
						}
						_hardStiffTween = TweenLite.delayedCall(_stateReference.stiffTime * 0.001, onStopHardStiff);
					}
					else
						throw new Error("击倒状态引用必须是FallStateRef类型！");
				}
			}
		}

		override public function pause() : void
		{
			super.pause();
			if (_totalFrameTween)
				_totalFrameTween.pause();
			syncAnimation(true);
		}

		override public function resume() : void
		{
			super.resume();
			if (_totalFrameTween)
				_totalFrameTween.resume();
			syncAnimation(false);
		}

		override public function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			super.playAnimation(role, render, isFreeze, time, speedRatio);

			var statusType : String = RoleActionType.getActionType(RoleActionType.FALL, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = 1;
					render.setStatus(statusType, 0.2, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 1;
					render.setStatus(RoleActionType.FALL, 0.2, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
					break;
				case RenderUnitType.HURT:
					break;
			}
		}

		override public function afterExecute() : void
		{
			super.afterExecute();
			syncAnimation(false, 0);

			if (_machine && !_machine.isDisposed)
			{
				var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
				var totalFrameTm : uint = (bodyAp ? bodyAp.totalDuration : 0);
				if (totalFrameTm > 0)
					_totalFrameTween = TweenLite.delayedCall(totalFrameTm * 0.001, onPlayFallCmp);
				else
					onPlayFallCmp();
			}
		}

		private function onPlayFallCmp() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				stopFall();
			}
		}

		private function stopFall() : void
		{
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
		}

		override public function leave() : void
		{
			super.leave();
			stopFall();
			stopHardStiff();
			_hardStiffFinished = false;
		}

		private function onStopHardStiff() : void
		{
			stopHardStiff();
			transition(RoleStateType.ACTION_GETUP, null, false, false, [RoleStateType.CONTROL_WALK_MOVE]);
		}

		private function stopHardStiff() : void
		{
			if (_hardStiffTween)
			{
				_hardStiffTween.kill();
				_hardStiffTween = null;
			}
			_hardStiffFinished = true;
		}

		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (nextState.type == RoleStateType.ACTION_DEATH)
			{
				return true;
			}
			else if (nextState.type == RoleStateType.ACTION_DEAD_LAUNCH)
			{
				return true;
			}
			else if (nextState.type == RoleStateType.ACTION_TRAIL)
			{
				return true;
			}
			else if (nextState.type == RoleStateType.ACTION_FALL)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_HIT)
			{
				return false;
			}
			else
			{
				if (!_hardStiffFinished)
					return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			_stateReference = null;
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
			if (_hardStiffTween)
			{
				_hardStiffTween.kill();
				_hardStiffTween = null;
			}
			super.dispose();
		}
	}
}
