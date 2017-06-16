package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import gs.TweenLite;

	/**
	 *
	 * 场景角色瞬移状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-5 下午5:25:12
	 *
	 */
	public class BlinkState extends ActionState
	{
		private var _stateReference : BlinkStateReference;
		private var _statusType : String;
		
		private var _totalFrameTime : int;
//		private var _breakFrameTime : int;
		
		private var _totalFrameTween : TweenLite;
		private var _breakFrameTween : TweenLite;
		private var _soarFrameTween : TweenLite;
		private var _nextSoarFrameTween : TweenLite;
		
		private var _isFixedFrame : Boolean;
		
		private var _totalTime : int;
		private var _throwDelayTime : int;
		private var _soarFrameTime : int;
		
		private var _blinkFinished : Boolean;
		private var _hitFrameTime : int;
		private var _hitFrameTween : TweenLite;
		private var _blinkBroken : Boolean;

		public function BlinkState()
		{
			super(RoleStateType.ACTION_BLINK);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				_stateReference = null;
				if (_ref)
				{
					if (_ref is BlinkStateReference)
					{
						_stateReference = _ref as BlinkStateReference;
						_blinkBroken = false;
						_blinkFinished = false;
						_isFixedFrame = _stateReference.isFixedFrame;
						_statusType = _stateReference.statusType;
						_totalTime = _stateReference.totalTime;
						_throwDelayTime = _stateReference.throwDelayTime;
						if (_statusType)
						{
							_soarFrameTime = _stateReference.soarFrameTime;
//							_breakFrameTime = _stateReference.breakFrameTime;
							_hitFrameTime = _stateReference.hitFrameTime;
						}
						else
						{
							_soarFrameTime = 0;
//							_breakFrameTime = 0;
							_hitFrameTime = 0;
						}
					}
					else
						throw new Error("瞬移状态引用必须是BlinkStateRef类型！");
				}
			}
		}

		/*private function get hitFrameTime() : int
		{
			if (!_statusType)
				return 0;
			var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
			if (bodyAp && bodyAp.renderUnitData)
			{
				var time : String = bodyAp.renderUnitData.getAnimationExtrasData(_statusType, AnimationExtraFieldType.hit_frame_time);
				if (time)
					return Number(time) * 1000;
			}
			return 0;
		}

		private function get soarFrameTime() : int
		{
			if (!_statusType)
				return 0;
			var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
			if (bodyAp && bodyAp.renderUnitData)
			{
				var time : String = bodyAp.renderUnitData.getAnimationExtrasData(_statusType, AnimationExtraFieldType.soar_frame_time);
				if (time)
					return Number(time) * 1000;
			}
			return 0;
		}*/

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

			var status : String = _statusType ? _statusType : RoleActionType.STAND;
			var matchStatus : String = RoleActionType.getActionType(status, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = 1;
					render.setStatus(matchStatus, _useCrossfadeTransition ? 0.2 : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 1;
					render.setStatus(status, _useCrossfadeTransition ? 0.2 : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
					render.repeat = 1;
					render.play(time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.WEAPON_EFFECT:
					render.visible = true;
					break;
				case RenderUnitType.EFFECT:
					render.visible = false;
					break;
				case RenderUnitType.HURT:
					break;
			}
		}

		override public function afterExecute() : void
		{
			super.afterExecute();
			syncAnimation(false, 0);

			if (_machine && !_machine.isInPool)
			{
				var moveTotalTime : int = _throwDelayTime + _totalTime;
				_totalFrameTime = 0;
				if (_statusType)
				{
					var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
					_totalFrameTime = (bodyAp ? bodyAp.totalDuration : 0);
				}
				_totalFrameTime = _totalFrameTime > moveTotalTime ? _totalFrameTime : moveTotalTime;

//				var breakFrameTime : int = (_breakFrameTime > 0 ? _breakFrameTime : _totalFrameTime);
//				if (breakFrameTime > _totalFrameTime)
//					breakFrameTime = _totalFrameTime;
				var hitFrameTime : int = (_hitFrameTime > 0 ? _hitFrameTime : _totalFrameTime);
				if (hitFrameTime > _totalFrameTime)
					hitFrameTime = _totalFrameTime;

				if (_hitFrameTween)
				{
					_hitFrameTween.kill();
					_hitFrameTween = null;
				}
				if (_totalFrameTween)
				{
					_totalFrameTween.kill();
					_totalFrameTween = null;
				}
				if (_breakFrameTween)
				{
					_breakFrameTween.kill();
					_breakFrameTween = null;
				}

				if (_totalFrameTime > 0)
				{
					if (_isFixedFrame)
					{
						var jumpTime : int = _totalTime;
						if (jumpTime < hitFrameTime)
							jumpTime = hitFrameTime;
						var nextSoarFrameTime : int = jumpTime - (hitFrameTime - _soarFrameTime);
						if (nextSoarFrameTime > 0)
						{
							_hitFrameTween = TweenLite.delayedCall(jumpTime * 0.001, onHitFrameCmp);
							if (_soarFrameTween)
							{
								_soarFrameTween.kill();
								_soarFrameTween = null;
							}
							_soarFrameTween = TweenLite.delayedCall(_soarFrameTime * 0.001, soarPhase1To2);
							if (_nextSoarFrameTween)
							{
								_nextSoarFrameTween.kill();
								_nextSoarFrameTween = null;
							}
							_nextSoarFrameTween = TweenLite.delayedCall(nextSoarFrameTime * 0.001, soarPhase2To3);
						}
						else
						{
							_hitFrameTween = TweenLite.delayedCall(hitFrameTime * 0.001, onHitFrameCmp);
//							_breakFrameTween = TweenLite.delayedCall(breakFrameTime * 0.001, onBreakFrameCmp);
							_totalFrameTween = TweenLite.delayedCall(_totalFrameTime * 0.001, onTotalFrameCmp);
						}
					}
					else
					{
						_hitFrameTween = TweenLite.delayedCall(hitFrameTime * 0.001, onHitFrameCmp);
//						_breakFrameTween = TweenLite.delayedCall(breakFrameTime * 0.001, onBreakFrameCmp);
						_totalFrameTween = TweenLite.delayedCall(_totalFrameTime * 0.001, onTotalFrameCmp);
					}
				}
				else
				{
					onHitFrameCmp();
					onTotalFrameCmp();
				}
			}
		}

		override public function leave() : void
		{
			super.leave();
			stopBlink();
			_blinkFinished = false;
			_blinkBroken = false;
		}

		private function onHitFrameCmp() : void
		{
			if (_hitFrameTween)
			{
				_hitFrameTween.kill();
				_hitFrameTween = null;
			}
			if (_stateReference)
				_stateReference.hitFrame();
		}

		private function stopBlink() : void
		{
			_blinkBroken = true;
			_blinkFinished = true;
			if (_hitFrameTween)
			{
				_hitFrameTween.kill();
				_hitFrameTween = null;
			}
			if (_soarFrameTween)
			{
				_soarFrameTween.kill();
				_soarFrameTween = null;
			}
			if (_nextSoarFrameTween)
			{
				_nextSoarFrameTween.kill();
				_nextSoarFrameTween = null;
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

		private function onTotalFrameCmp() : void
		{
			if (_machine && !_machine.isInPool)
			{
				if (_totalFrameTween)
				{
					_totalFrameTween.kill();
					_totalFrameTween = null;
				}
				stopBlink();
				transition(RoleStateType.ACTION_PREWAR);
			}
		}

//		private function onBreakFrameCmp() : void
//		{
//			_blinkBroken = true;
//			if (_machine && !_machine.isDisposed)
//			{
//				if (_breakFrameTween)
//				{
//					_breakFrameTween.kill();
//					_breakFrameTween = null;
//				}
//				if (_stateReference)
//					_stateReference.breakFrame();
//			}
//		}

		private function soarPhase1To2() : void
		{
			if (_soarFrameTween)
			{
				_soarFrameTween.kill();
				_soarFrameTween = null;
			}
			syncAnimation(true, _soarFrameTime);
		}

		private function soarPhase2To3() : void
		{
			if (_soarFrameTween)
			{
				_soarFrameTween.kill();
				_soarFrameTween = null;
			}
			if (_nextSoarFrameTween)
			{
				_nextSoarFrameTween.kill();
				_nextSoarFrameTween = null;
			}
			syncAnimation(false, _soarFrameTime);
			_totalFrameTween = TweenLite.delayedCall((_totalFrameTime - _soarFrameTime) * 0.001, onTotalFrameCmp);
		}

		public function get blinkFinished() : Boolean
		{
			return _blinkFinished;
		}

		public function get blinkBroken() : Boolean
		{
			return _blinkBroken;
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
			else if ((_machine as RoleStateMachine).isBingDong)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BLINK)
			{
				if (!force && !_blinkBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_ATTACK)
			{
				if (!force && !_blinkBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_HIT)
			{
				if (!force && !_blinkBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_COLLECT)
			{
				if (!force && !_blinkBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_WALK)
			{
				if (!force && !_blinkBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_RUN)
			{
				if (!force && !_blinkBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_JUMP)
			{
				if (!force && !_blinkBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BEAT_BACK)
			{
				if (!force && !_blinkBroken)
					return false;
			}
			else
			{
				if (!_blinkFinished)
					return false;
			}
			return true;
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if (!force && (_machine as RoleStateMachine).isAttackHarding)
				return false;
			if (!force && (_machine as RoleStateMachine).isLockCaseSpell)
				return false;
			if (!force && (_machine as RoleStateMachine).isAttacking)
				return false;
			if (!force && (_machine as RoleStateMachine).isBeatMoving)
				return false;
			if (!force && (_machine as RoleStateMachine).isStiff)
				return false;
			if (!force && (_machine as RoleStateMachine).isStun)
				return false;
			if (!force && (_machine as RoleStateMachine).isUnmovable)
				return false;
			return true;
		}

		override public function dispose() : void
		{
			_stateReference = null;
			_blinkBroken = false;
			_blinkFinished = false;
			if (_hitFrameTween)
			{
				_hitFrameTween.kill();
				_hitFrameTween = null;
			}
			if (_soarFrameTween)
			{
				_soarFrameTween.kill();
				_soarFrameTween = null;
			}
			if (_nextSoarFrameTween)
			{
				_nextSoarFrameTween.kill();
				_nextSoarFrameTween = null;
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
