package com.editor.state.role.action
{
	import com.editor.data.RenderUnitID;
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleActionType;
	import com.editor.data.RoleStateType;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.RoleStateMachine;
	import com.editor.state.role.control.JumpRiseStateReference;
	import com.editor.state.role.control.MoveState;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;

	import gs.TweenLite;

	/**
	 *
	 * 场景角色跳跃状态
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-01 上午11:15:12
	 *
	 */
	public class JumpState extends ActionState
	{
		private var _totalFrameTween : TweenLite;
		private var _breakFrameTween : TweenLite;
		private var _startRiseTween : TweenLite;
		private var _jumpBroken : Boolean;
		private var _isSecondJump : Boolean;
		private var _stateReference : JumpStateReference;
		private var _lastControlIsWalkMove : Boolean;

		public function JumpState()
		{
			super(RoleStateType.ACTION_JUMP);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_stateReference = null;
				_jumpBroken = false;
				if (_ref is JumpStateReference)
				{
					_stateReference = _ref as JumpStateReference;
					if (_stateReference.jumpAction == 1)
					{
						_isSecondJump = false;
					}
					else if (_stateReference.jumpAction == 2)
					{
						_isSecondJump = true;
					}
					else
					{
						_isSecondJump = Math.random() * 100 < _stateReference.secondJumpProbability;
						_stateReference.jumpAction = _isSecondJump ? 2 : 1;
					}
					var state : IState = _machine.getLastState(MoveState);
					_lastControlIsWalkMove = state && (state.type == RoleStateType.CONTROL_WALK_MOVE);
					var speedRatio : Number = _isSecondJump ? (_stateReference.secondJumpSpeedRatio > 0 ? _stateReference.secondJumpSpeedRatio : 1) : (_stateReference.jumpSpeedRatio > 0 ? _stateReference.jumpSpeedRatio : 1);
					syncAnimationSpeed(speedRatio);
				}
				else
					throw new Error("跳跃状态引用必须是JumpStateReference类型！");
			}
		}

		override public function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			super.playAnimation(role, render, isFreeze, time, speedRatio);

			var jumpState : String = _isSecondJump ? RoleActionType.SECOND_JUMP : RoleActionType.JUMP;
			var statusType : String = RoleActionType.getActionType(jumpState, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = 1;
					render.setStatus(statusType, 0.2, time, speedRatio);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 1;
					render.setStatus(jumpState, 0.2, time, speedRatio);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
					break;
				case RenderUnitType.HURT:
					break;
			}
		}

		override public function setAnimationSpeed(role : BaseRole, render : RenderUnit3D, speedRatio : Number = 1) : void
		{
			super.setAnimationSpeed(role, render, speedRatio);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.MOUNT:
					render.animateSpeed = speedRatio;
					break;
			}
		}

		override public function pause() : void
		{
			super.pause();
			if (_startRiseTween)
				_startRiseTween.pause();
			if (_breakFrameTween)
				_breakFrameTween.pause();
			if (_totalFrameTween)
				_totalFrameTween.pause();
			syncAnimation(true, -1, speedRatio);
		}

		override public function resume() : void
		{
			super.resume();
			if (_startRiseTween)
				_startRiseTween.resume();
			if (_breakFrameTween)
				_breakFrameTween.resume();
			if (_totalFrameTween)
				_totalFrameTween.resume();
			syncAnimation(false, -1, speedRatio);
		}

		override public function afterExecute() : void
		{
			super.afterExecute();
			if (_machine && !_machine.isDisposed)
			{
				if (_startRiseTween)
				{
					_startRiseTween.kill();
					_startRiseTween = null;
				}
				if (_breakFrameTween)
				{
					_breakFrameTween.kill();
					_breakFrameTween = null;
				}
				if (_totalFrameTween)
				{
					_totalFrameTween.kill();
					_totalFrameTween = null;
				}
				var startTime : int = 0;
				if (_lastControlIsWalkMove)
				{
					if (_isSecondJump)
					{
						startTime = _stateReference.secondJumpStartTime;
					}
					else
					{
						startTime = _stateReference.jumpStartTime;
					}
				}
				syncAnimation(false, startTime, speedRatio);

				var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
				var totalFrameTm : uint = (bodyAp ? bodyAp.totalDuration : 0);
				if (totalFrameTm > 0)
				{
					var breakFrameTm : int = _isSecondJump ? _stateReference.secondJumpBreakTime : _stateReference.jumpBreakTime;
					breakFrameTm = (breakFrameTm > 0 ? breakFrameTm : totalFrameTm);
					if (breakFrameTm > totalFrameTm)
						breakFrameTm = totalFrameTm;
					_totalFrameTween = TweenLite.delayedCall((totalFrameTm - startTime) / speedRatio * 0.001, onPlayJumpCmp);
					_breakFrameTween = TweenLite.delayedCall((breakFrameTm - startTime) / speedRatio * 0.001, onBreakFrameCmp);

					var totalTime : int = totalFrameTm;
					if (_isSecondJump)
					{
						if (_stateReference.secondJumpEndTime > 0)
							totalTime = _stateReference.secondJumpEndTime - _stateReference.secondJumpStartTime;
						else
							totalTime = totalFrameTm - _stateReference.secondJumpStartTime;

						if (_lastControlIsWalkMove)
						{
							onStartJumpRise(totalTime / speedRatio);
						}
						else
						{
							if (_stateReference.secondJumpStartTime > 0)
							{
								_startRiseTween = TweenLite.delayedCall(_stateReference.secondJumpStartTime * 0.001, onStartJumpRise, [totalTime / speedRatio]);
							}
							else
							{
								onStartJumpRise(totalTime / speedRatio);
							}
						}
					}
					else
					{
						if (_stateReference.jumpEndTime > 0)
							totalTime = _stateReference.jumpEndTime - _stateReference.jumpStartTime;
						else
							totalTime = totalFrameTm - _stateReference.jumpStartTime;

						if (_lastControlIsWalkMove)
						{
							onStartJumpRise(totalTime / speedRatio);
						}
						else
						{
							if (_stateReference.jumpStartTime > 0)
							{
								_startRiseTween = TweenLite.delayedCall(_stateReference.jumpStartTime * 0.001, onStartJumpRise, [totalTime / speedRatio]);
							}
							else
							{
								onStartJumpRise(totalTime / speedRatio);
							}
						}
					}
				}
				else
				{
					onPlayJumpCmp();
				}
			}
		}

		private function onStartJumpRise(totalTime : uint) : void
		{
			if (totalTime > 0)
			{
				var ref : JumpRiseStateReference = _machine.getReference(JumpRiseStateReference) as JumpRiseStateReference;
				ref.setParams(_isSecondJump ? _stateReference.secondJumpHeight : _stateReference.jumpHeight, totalTime);
				transition(RoleStateType.CONTROL_JUMP_RISE, ref);
			}
		}

		private function onPlayJumpCmp() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				stopJump();
				if ((_machine as RoleStateMachine).isPrewarWaiting)
					transition(RoleStateType.ACTION_PREWAR);
				else if ((_machine as RoleStateMachine).isWalkMoving)
					transition(RoleStateType.ACTION_RUN);
				else
					transition(RoleStateType.ACTION_IDLE);
			}
		}

		private function stopJump() : void
		{
			_jumpBroken = true;
			if (_startRiseTween)
			{
				_startRiseTween.kill();
				_startRiseTween = null;
			}
			if (_breakFrameTween)
			{
				_breakFrameTween.kill();
				_breakFrameTween = null;
			}
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
		}

		private function onBreakFrameCmp() : void
		{
			_jumpBroken = true;
			if (_breakFrameTween)
			{
				_breakFrameTween.kill();
				_breakFrameTween = null;
			}
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if (prevState)
			{
				if (prevState.type == RoleStateType.ACTION_JUMP)
				{
					return false;
				}
			}
			if ((_machine as RoleStateMachine).isBlinking)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isBeatMoving)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isTrailMoving)
			{
				return false;
			}
			return true;
		}

		override public function leave() : void
		{
			super.leave();
			stopJump();
			_jumpBroken = false;
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
			else if (nextState.type == RoleStateType.ACTION_JUMP)
			{
				if (!force && !_jumpBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_ATTACK)
			{
				if (!force && !_jumpBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_PREWAR)
			{
				if (!force && !_jumpBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BLINK)
			{
				if (!force && !_jumpBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_IDLE)
			{
				if (!force && !_jumpBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_HIT)
			{
				if (!force && !_jumpBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_WALK)
			{
				if (!force && !_jumpBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_RUN)
			{
				if (!force && !_jumpBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BEAT_BACK)
			{
				if (!force && !_jumpBroken)
					return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			_stateReference = null;
			_jumpBroken = false;
			_isSecondJump = false;
			_lastControlIsWalkMove = false;
			if (_startRiseTween)
			{
				_startRiseTween.kill();
				_startRiseTween = null;
			}
			if (_breakFrameTween)
			{
				_breakFrameTween.kill();
				_breakFrameTween = null;
			}
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
			super.dispose();
		}
	}
}
