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
	 * 场景角色攻击状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 下午3:25:12
	 *
	 */
	public class AttackState extends ActionState
	{
		private var _stateReference : AttackStateReference;
		private var _speed : Number = 1;
		private var _statusType : String;
		private var _hitFrameTween : TweenLite;
		private var _totalFrameTween : TweenLite;
		private var _breakFrameTween : TweenLite;
		private var _attackFinished : Boolean;
		private var _attackBroken : Boolean;
		private var _startFrameTime : int;
		private var _breakFrameTime : int;
		private var _hitFrameTime : int;

		public function AttackState()
		{
			super(RoleStateType.ACTION_ATTACK);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_attackBroken = false;
				_attackFinished = false;
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
				_stateReference = null;

				if (_ref is AttackStateReference)
				{
					_stateReference = _ref as AttackStateReference;
//					if (_stateReference.speed > 0)
//						_speed = _stateReference.speed;
//					else
//						_speed = ((_machine.owner as SceneRole).data as RoleData).attackSpeed;
				}
				else
					throw new Error("攻击状态引用必须是AttackStateReference类型！");

				_statusType = _stateReference.statusType;
				if (_statusType)
				{
//					if (_stateReference.spellInfo.isRelateAction)
//						_startFrameTime = caromStartFrameTime || _stateReference.spellInfo.caromStartFrameTime;
//					else
					_startFrameTime = 0;
					_breakFrameTime = _stateReference.spellInfo.breakFrameTime - _startFrameTime;
					_hitFrameTime = _stateReference.spellInfo.hitFrameTime - _startFrameTime;
					var frameTime : int = _stateReference.spellInfo.throwDelayTime - _startFrameTime;
					_stateReference.setThrowFrameTime(frameTime > 0 ? frameTime : 0);
				}
				else
				{
					_startFrameTime = 0;
					_breakFrameTime = 0;
					_hitFrameTime = 0;
					_stateReference.setThrowFrameTime(0);
				}

				var targetX : int = _stateReference.targetPos.x;
				var targetZ : int = _stateReference.targetPos.y;
				(_machine.owner as SceneRole).faceToGround(targetX, targetZ, 0);
				_stateReference.rotationY = (_machine.owner as SceneRole).rotationY;

				_speed = _stateReference.speed;

				syncAnimationSpeed(_speed);
			}
		}

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

		/*private function get caromStartFrameTime() : int
		{
			if (!_statusType)
				return 0;
			var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
			if (bodyAp && bodyAp.renderUnitData)
			{
				var time : String = bodyAp.renderUnitData.getAnimationExtrasData(_statusType, AnimationExtraFieldType.carom_start_frame_time);
				if (time)
					return Number(time) * 1000;
			}
			return 0;
		}

		private function get breakFrameTime() : int
		{
			if (!_statusType)
				return 0;
			var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
			if (bodyAp && bodyAp.renderUnitData)
			{
				var time : String = bodyAp.renderUnitData.getAnimationExtrasData(_statusType, AnimationExtraFieldType.break_frame_time);
				if (time)
					return Number(time) * 1000;
			}
			return 0;
		}

		private function get hitFrameTime() : int
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

		private function get throwDelayTime() : int
		{
			if (!_statusType)
				return 0;
			var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
			if (bodyAp && bodyAp.renderUnitData)
			{
				var time : String = bodyAp.renderUnitData.getAnimationExtrasData(_statusType, AnimationExtraFieldType.throw_frame_time);
				if (time)
					return Number(time) * 1000;
			}
			return 0;
		}*/

		override public function afterExecute() : void
		{
			super.afterExecute();
			syncAnimation(false, _startFrameTime, speedRatio);

			if (_machine && !_machine.isDisposed)
			{
				var totalFrameTm : uint = 0;
				if (_statusType)
				{
					var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
					totalFrameTm = (bodyAp ? bodyAp.totalDuration - _startFrameTime : 200);
				}
//				keyFrameTm /= _speed;
				//				totalFrameTm /= _speed;
				var breakFrameTime : int = (_breakFrameTime > 0 ? _breakFrameTime : totalFrameTm);
				if (breakFrameTime > totalFrameTm)
					breakFrameTime = totalFrameTm;
				var hitFrameTime : int = (_hitFrameTime > 0 ? _hitFrameTime : breakFrameTime);
				if (hitFrameTime > breakFrameTime)
					hitFrameTime = breakFrameTime;
				_stateReference.setHitFrameTime(hitFrameTime / _speed);
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
				if (totalFrameTm > 0)
				{
					_hitFrameTween = TweenLite.delayedCall(_stateReference.hitFrameTime * 0.001, onHitFrameCmp);
					_breakFrameTween = TweenLite.delayedCall(breakFrameTime / _speed * 0.001, onBreakFrameCmp);
					_totalFrameTween = TweenLite.delayedCall(totalFrameTm / _speed * 0.001, onTotalFrameCmp);
				}
				else
				{
					onHitFrameCmp();
					onBreakFrameCmp();
					onTotalFrameCmp();
				}
			}
		}

		private function stopAttack() : void
		{
			_attackBroken = true;
			_attackFinished = true;
			if (_hitFrameTween)
			{
				_hitFrameTween.kill();
				_hitFrameTween = null;
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

		override public function leave() : void
		{
			super.leave();
			stopAttack();
			_attackBroken = false;
			_attackFinished = false;
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

		/**
		 * 非位移技能单个攻击动作结束回调（有的会有多个动作连续播放）
		 * @param info
		 *
		 */
		private function onTotalFrameCmp() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				if (_totalFrameTween)
				{
					_totalFrameTween.kill();
					_totalFrameTween = null;
				}
				if (_stateReference)
					_stateReference.totalFrame();
				stopAttack();
				transition(RoleStateType.ACTION_PREWAR, null, false, false, [RoleStateType.CONTROL_WALK_MOVE]);
			}
		}

		private function onBreakFrameCmp() : void
		{
			_attackBroken = true;
			if (_machine && !_machine.isDisposed)
			{
				if (_breakFrameTween)
				{
					_breakFrameTween.kill();
					_breakFrameTween = null;
				}
				if (_stateReference)
					_stateReference.breakFrame();
			}
		}

		public function get attackBroken() : Boolean
		{
			return _attackBroken;
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
				if (!force && !_attackBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_ATTACK)
			{
				if (!force && !_attackBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_HIT)
			{
				if (!force && !_attackBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_WALK)
			{
				if (!force && !_attackBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_RUN)
			{
				if (!force && !_attackBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_JUMP)
			{
				if (!force && !_attackBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BEAT_BACK)
			{
				if (!force && !_attackBroken)
					return false;
			}
			else
			{
				if (!_attackFinished)
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
			_statusType = null;
			_attackBroken = false;
			_attackFinished = false;
			if (_hitFrameTween)
			{
				_hitFrameTween.kill();
				_hitFrameTween = null;
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
