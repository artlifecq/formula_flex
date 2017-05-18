package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.manager.input.KeyMoveManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.app.state.role.control.JumpRiseStateReference;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;
	
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
		/**
		 * 跳跃速率
		 */
		public static var JUMP_SPEED_RATIO : Number = 0;
		/**
		 * 二级跳跃速率
		 */
		public static var SECOND_JUMP_SPEED_RATIO : Number = 0;
		/**
		/**
		 * 跳跃开始时间
		 */
		public static var JUMP_START_TIME : int = 0;
		/**
		 * 二级跳跃开始时间
		 */
		public static var SECOND_JUMP_START_TIME : int = 0;
		/**
		 * 跳跃结束时间
		 */
		public static var JUMP_END_TIME : int = 0;
		/**
		 * 二级跳跃结束时间
		 */
		public static var SECOND_JUMP_END_TIME : int = 0;
		/**
		 * 跳跃打断时间
		 */
		public static var JUMP_BREAK_TIME : int = 0;
		/**
		 * 二级跳跃打断时间
		 */
		public static var SECOND_JUMP_BREAK_TIME : int = 0;
		/**
		 * 二级跳概率
		 */
		public static var SECOND_JUMP_PROBABILITY : int = 30;
		
		private var _totalFrameTween : TweenLite;
		private var _breakFrameTween : TweenLite;
		private var _startRiseTween : TweenLite;
		
		private var _jumpFinished : Boolean;
		private var _isSecondJump : Boolean;
		private var _stateReference : JumpStateReference;

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
				_jumpFinished = false;
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
						_isSecondJump = Math.random() * 100 < SECOND_JUMP_PROBABILITY;
						_stateReference.jumpAction = _isSecondJump ? 2 : 1;
					}
					var speedRatio : Number = _isSecondJump ? (SECOND_JUMP_SPEED_RATIO > 0 ? SECOND_JUMP_SPEED_RATIO : 1) : (JUMP_SPEED_RATIO > 0 ? JUMP_SPEED_RATIO : 1);
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
					render.setStatus(statusType, _useCrossfadeTransition ? 0.2 : null, time, speedRatio);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 1;
					render.setStatus(jumpState, _useCrossfadeTransition ? 0.2 : null, time, speedRatio);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
					break;
				case RenderUnitType.WEAPON_EFFECT:
				case RenderUnitType.DEPUTY_WEAPON_EFFECT:
					render.visible = true;
					break;
				case RenderUnitType.EFFECT:
					render.visible = false;
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

		override public function afterEnter() : void
		{
			super.afterEnter();
			syncAnimation(false, 0, speedRatio);
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
				var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
				var totalFrameTm : uint = (bodyAp ? bodyAp.totalDuration : 0);//动画的总时间
				if (totalFrameTm > 0)
				{
					var breakFrameTm : int = _isSecondJump ? JUMP_BREAK_TIME : SECOND_JUMP_BREAK_TIME;
					breakFrameTm = (breakFrameTm > 0 ? breakFrameTm : totalFrameTm);
					if (breakFrameTm > totalFrameTm)
						breakFrameTm = totalFrameTm;
					_totalFrameTween = TweenLite.delayedCall(totalFrameTm / speedRatio * 0.001, onPlayJumpCmp);
					_breakFrameTween = TweenLite.delayedCall(breakFrameTm / speedRatio * 0.001, onBreakFrameCmp);

					var totalTime : int = totalFrameTm;
					if (_isSecondJump)
					{
						if (SECOND_JUMP_END_TIME > 0)
							totalTime = SECOND_JUMP_END_TIME - SECOND_JUMP_START_TIME;
						else
							totalTime = totalFrameTm - SECOND_JUMP_START_TIME;

						if (SECOND_JUMP_START_TIME > 0)
						{
							_startRiseTween = TweenLite.delayedCall(SECOND_JUMP_START_TIME * 0.001, onStartJumpRise, [totalTime / speedRatio]);
						}
						else
						{
							onStartJumpRise(totalTime / speedRatio);
						}
					}
					else
					{
						if (JUMP_END_TIME > 0)
							totalTime = JUMP_END_TIME - JUMP_START_TIME;
						else
							totalTime = totalFrameTm - JUMP_START_TIME;

						if (JUMP_START_TIME > 0)
						{
							_startRiseTween = TweenLite.delayedCall(JUMP_START_TIME * 0.001, onStartJumpRise, [totalTime / speedRatio]);
						}
						else
						{
							onStartJumpRise(totalTime / speedRatio);
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
				ref.setParams(totalTime, _isSecondJump);
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
				else if ((_machine.owner as SceneRole).isMainChar && KeyMoveManager.getInstance().keyMoving)
					transition(RoleStateType.ACTION_RUN);
				else
					transition(RoleStateType.ACTION_IDLE);
			}
		}

		private function stopJump() : void
		{
			_jumpFinished = true;
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
			_jumpFinished = true;
			if (_breakFrameTween)
			{
				_breakFrameTween.kill();
				_breakFrameTween = null;
			}
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if ((_machine as RoleStateMachine).isJumpRising)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isBlinkMoving)
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
			else if ((_machine as RoleStateMachine).isStiff)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isStun)
			{
				return false;
			}
			return true;
		}

		override public function leave() : void
		{
			super.leave();
			stopJump();
			_jumpFinished = false;
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
			else if (nextState.type == RoleStateType.ACTION_ATTACK)
			{
				if (!force && !_jumpFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_PREWAR)
			{
				if (!force && !_jumpFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BLINK)
			{
				if (!force && !_jumpFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_IDLE)
			{
				if (!force && !_jumpFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_HIT)
			{
				if (!force && !_jumpFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_COLLECT)
			{
				if (!force && !_jumpFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_WALK)
			{
				if (!force && !_jumpFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_RUN)
			{
				if (!force && !_jumpFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_JUMP)
			{
				if (!force && !_jumpFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BEAT_BACK)
			{
				if (!force && !_jumpFinished)
					return false;
			}
			else if ((_machine as RoleStateMachine).isBingDong)
			{
				return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			_stateReference = null;
			_jumpFinished = false;
			_isSecondJump = false;
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
