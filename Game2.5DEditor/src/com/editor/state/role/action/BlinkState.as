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
	 * 场景角色瞬移状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-5 下午5:25:12
	 *
	 */
	public class BlinkState extends ActionState
	{
		private var _stateReference : BlinkStateReference;
		private var _speed : Number = 1;
		private var _statusType : String;
		private var _totalFrameTime : int;
		private var _totalFrameTween : TweenLite;
		private var _soarFrameTween : TweenLite;
		private var _nextSoarFrameTween : TweenLite;
		private var _isFixedFrame : Boolean;
		private var _totalTime : int;
		private var _throwDelayTime : int;
		private var _soarFrameTime : int;
		private var _blinkFinished : Boolean;
		private var _hitFrameTime : int;
		private var _hitFrameTween : TweenLite;

		public function BlinkState()
		{
			super(RoleStateType.ACTION_BLINK);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_stateReference = null;
				if (_ref)
				{
					if (_ref is BlinkStateReference)
					{
						_stateReference = _ref as BlinkStateReference;
						_blinkFinished = false;
						_isFixedFrame = _stateReference.isFixedFrame;
						_statusType = _stateReference.statusType;
						_totalTime = _stateReference.totalTime;
						_throwDelayTime = _stateReference.throwDelayTime;
						if (_statusType)
						{
							_soarFrameTime = _stateReference.soarFrameTime;
							_hitFrameTime = _stateReference.hitFrameTime;
						}
						else
						{
							_soarFrameTime = 0;
							_hitFrameTime = 0;
						}

						_speed = _stateReference.speed;
						syncAnimationSpeed(_speed);
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
			syncAnimation(true, -1, speedRatio);
		}

		override public function resume() : void
		{
			super.resume();
			if (_totalFrameTween)
				_totalFrameTween.resume();
			syncAnimation(false, -1, speedRatio);
		}

		override public function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			super.playAnimation(role, render, isFreeze, time, speedRatio);

			var status : String = _statusType ? _statusType : RoleActionType.IDLE;
			var matchStatus : String = RoleActionType.getActionType(status, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = 1;
					render.setStatus(matchStatus, 0.2, time, speedRatio);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 1;
					render.setStatus(status, 0.2, time, speedRatio);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
					render.repeat = 1;
					render.play(time, speedRatio);
					if (isFreeze)
						render.stop(time);
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
				case RenderUnitType.KNIFE_LIGHT:
					render.animateSpeed = speedRatio;
					break;
			}
		}

		override public function afterExecute() : void
		{
			super.afterExecute();
			syncAnimation(false, 0, speedRatio);

			if (_machine && !_machine.isDisposed)
			{
				var moveTotalTime : int = _throwDelayTime + _totalTime;
				_totalFrameTime = 0;
				if (_statusType)
				{
					var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
					_totalFrameTime = (bodyAp ? bodyAp.totalDuration : 0);
				}
				_totalFrameTime = _totalFrameTime > moveTotalTime ? _totalFrameTime : moveTotalTime;

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
							_hitFrameTween = TweenLite.delayedCall(jumpTime / _speed * 0.001, onHitFrameCmp);
							if (_soarFrameTween)
							{
								_soarFrameTween.kill();
								_soarFrameTween = null;
							}
							_soarFrameTween = TweenLite.delayedCall(_soarFrameTime / _speed * 0.001, soarPhase1To2);
							if (_nextSoarFrameTween)
							{
								_nextSoarFrameTween.kill();
								_nextSoarFrameTween = null;
							}
							_nextSoarFrameTween = TweenLite.delayedCall(nextSoarFrameTime / _speed * 0.001, soarPhase2To3);
						}
						else
						{
							_hitFrameTween = TweenLite.delayedCall(hitFrameTime / _speed * 0.001, onHitFrameCmp);
							_totalFrameTween = TweenLite.delayedCall(_totalFrameTime / _speed * 0.001, onTotalFrameCmp);
						}
					}
					else
					{
						_hitFrameTween = TweenLite.delayedCall(hitFrameTime / _speed * 0.001, onHitFrameCmp);
						_totalFrameTween = TweenLite.delayedCall(_totalFrameTime / _speed * 0.001, onTotalFrameCmp);
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
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
		}

		private function onTotalFrameCmp() : void
		{
			if (_machine && !_machine.isDisposed)
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

		private function soarPhase1To2() : void
		{
			if (_soarFrameTween)
			{
				_soarFrameTween.kill();
				_soarFrameTween = null;
			}
			syncAnimation(true, _soarFrameTime, speedRatio);
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
			syncAnimation(false, _soarFrameTime, speedRatio);
			_totalFrameTween = TweenLite.delayedCall((_totalFrameTime - _soarFrameTime) / _speed * 0.001, onTotalFrameCmp);
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
			else if (nextState.type == RoleStateType.ACTION_BLINK)
			{
				if (!force && !_blinkFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_ATTACK)
			{
				if (!force && !_blinkFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_HIT)
			{
				if (!force && !_blinkFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_WALK)
			{
				if (!force && !_blinkFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_RUN)
			{
				if (!force && !_blinkFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_JUMP)
			{
				if (!force && !_blinkFinished)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BEAT_BACK)
			{
				if (!force && !_blinkFinished)
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
			return true;
		}

		override public function dispose() : void
		{
			_stateReference = null;
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
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
			super.dispose();
		}
	}
}
