package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.state.role.RoleStateReference;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.app.state.role.control.CheckTripleAttackStateReference;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;
	
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
		/**
		 * 攻速--暂时还没有启用，等后面有了这个属性，再启用 
		 */		
		private var _speed : Number = 1;
		/**
		 * 动作名称 
		 */		
		private var _statusType : String;
		
		private var _startSelfFrameTween:TweenLite;
		private var _hitFrameTween : TweenLite;
		private var _totalFrameTween : TweenLite;
		private var _breakFrameTween : TweenLite;
		
		private var _attackFinished : Boolean;
		private var _attackBroken : Boolean;
		private var _canWalkRelease : Boolean;
		private var _canWalkBreak:Boolean;
		private var _startSelfFrameTime:int;
		private var _startFrameTime : int;
		private var _hitFrameTime : int;

		public function AttackState()
		{
			super(RoleStateType.ACTION_ATTACK);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				//
				_machine.removeState(RoleStateType.CONTROL_PREWAR_WAITING);
				//
				_attackBroken = false;
				_attackFinished = false;
				_canWalkRelease = false;
				_stateReference = null;
				_canWalkBreak=false;
				if (_ref is AttackStateReference)
				{
					_stateReference = _ref as AttackStateReference;
					if (_stateReference.speed > 0)
					{
						_speed = _stateReference.speed;
					}
					else
					{
						_speed = ((_machine.owner as SceneRole).data as RoleData).totalStat.attackSpeed;
					}
					_canWalkRelease = _stateReference.spellInfo.canWalkRelease;
					_canWalkBreak=CastSpellHelper.isCanCancelByMainPlayer(_stateReference.spellInfo.spellData.q_cancel);
				}
				else
					throw new Error("攻击状态引用必须是AttackStateReference类型！");

				
				
				_statusType = _stateReference.statusType;
				if (_statusType)
				{
//					if (isRepeat)
//						_startFrameTime = caromStartFrameTime || _stateReference.spellInfo.caromStartFrameTime;
//					else
					_startFrameTime = 0;
					_startSelfFrameTime = _stateReference.spellInfo.startFrameTime - _startFrameTime;
					_hitFrameTime = _stateReference.spellInfo.hitFrameTime - _startFrameTime;
					var frameTime : int = _stateReference.spellInfo.throwDelayTime - _startFrameTime;
					_stateReference.setThrowFrameTime(frameTime > 0 ? frameTime : 0);
				}
				else
				{
					_startSelfFrameTime = 0;
					_startFrameTime = 0;
					_hitFrameTime = 0;
					_stateReference.setThrowFrameTime(0);
				}
				if (!_canWalkRelease)//不可边走边放技能
				{
					transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
					var fixDirection : Boolean = false;
//					if ((_machine.owner as SceneRole).data is RoleData)
//					{
//						fixDirection = ((_machine.owner as SceneRole).data as RoleData).fixDirection;
//					}
					if (!fixDirection&&_stateReference.angle!=-1)
					{
						(_machine.owner as SceneRole).turnRoundTo(_stateReference.angle, 0);
					}
				}
				//可边走边放但是没走
				else
				{
					if ((_machine as RoleStateMachine).isWalkMoving==false&&_stateReference.angle!=-1) 
					{
						(_machine.owner as SceneRole).turnRoundTo(_stateReference.angle, 0);
					}
				}
				
				syncAnimationSpeed(1);
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

			var status : String = _statusType ? _statusType : RoleActionType.STAND;
			if(_canWalkRelease)
			{
				if((_machine.owner as SceneRole).stateMachine.isWalkMoving)
				{
					status = RoleActionType.RUN;
				}
			}
			var matchStatus : String = RoleActionType.getActionType(status, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = 1;
					render.setStatus(matchStatus, _useCrossfadeTransition ? 0.2 : null, time, speedRatio);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.ZHANQI:
					render.repeat = 0;
					render.setStatus(RoleActionType.RUN, _useCrossfadeTransition ? 0.2 : null, time, speedRatio);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 1;
					render.setStatus(status, _useCrossfadeTransition ? 0.2 : null, time, speedRatio);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
					render.repeat = 1;
					render.play(time, speedRatio);
					break;
				case RenderUnitType.WEAPON_EFFECT:
					render.visible = true;
					break;
				case RenderUnitType.EFFECT:
					render.visible = true;
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

			if (_machine && !_machine.isInPool)
			{
				var totalFrameTm : uint = 0;
				if (_statusType)
				{
					var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
					totalFrameTm = (bodyAp ? bodyAp.totalDuration - _startFrameTime : 200);
				}
//				keyFrameTm /= _speed;
//				totalFrameTm /= _speed;
				/*var breakFrameTime : int = (_breakFrameTime > 0 ? _breakFrameTime : totalFrameTm);
				if (breakFrameTime > totalFrameTm)
					breakFrameTime = totalFrameTm;
				var hitFrameTime : int = (_hitFrameTime > 0 ? _hitFrameTime : breakFrameTime);
				if (hitFrameTime > breakFrameTime)
					hitFrameTime = breakFrameTime;*/
				
				var startSelfFrameTime:int = (_startSelfFrameTime > 0 ? _startSelfFrameTime : 0);
				if(startSelfFrameTime > totalFrameTm)
				{
					startSelfFrameTime = totalFrameTm;
				}
				
				var hitFrameTime : int = (_hitFrameTime > 0 ? _hitFrameTime : totalFrameTm);
				if (hitFrameTime > totalFrameTm)
				{
					hitFrameTime = totalFrameTm;
				}
				
				var castTime:int = _stateReference.castTime > 0 ? _stateReference.castTime : totalFrameTm;
				
				_stateReference.setHitFrameTime(hitFrameTime);
				if(_startSelfFrameTween)
				{
					_startSelfFrameTween.kill();
					_startSelfFrameTween = null;
				}
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
					_startSelfFrameTween = TweenLite.delayedCall(startSelfFrameTime * 0.001,onStartFrameCmp);
					_hitFrameTween = TweenLite.delayedCall(hitFrameTime * 0.001, onHitFrameCmp);
					_breakFrameTween = TweenLite.delayedCall(castTime * 0.001, onBreakFrameCmp);
					_totalFrameTween = TweenLite.delayedCall(totalFrameTm * 0.001, onTotalFrameCmp);
				}
				else
				{
					onHitFrameCmp();
					onStartFrameCmp();
					onTotalFrameCmp();
				}
			}
		}

		private function stopAttack() : void
		{
//			try{if((((_machine as RoleStateMachine).owner as SceneRole).data as MonsterData).modelID==9008)
//			{
//				Lyt.a("@@@@攻击完成:"+"-----"+AttackStateReference(_ref).spellInfo.spellData.q_skillName);
//			}}catch(e:Error){}
			_attackBroken = true;
			_attackFinished = true;
			if(_startSelfFrameTween)
			{
				_startSelfFrameTween.kill();
				_startSelfFrameTween = null;
			}
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
			_canWalkRelease = false;
			_canWalkBreak=false;
		}
		
		private function onStartFrameCmp() : void
		{
			if(_startSelfFrameTween)
			{
				_startSelfFrameTween.kill();
				_startSelfFrameTween = null;
			}
			if (_stateReference)
				_stateReference.startFrame();
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
			if (_machine && !_machine.isInPool)
			{
				if (_totalFrameTween)
				{
					_totalFrameTween.kill();
					_totalFrameTween = null;
				}
				if (_stateReference)
					_stateReference.totalFrame();
				stopAttack();
				if((_ref.owner as SceneRole).isMainChar&&TrusteeshipManager.getInstance().tripleSkillCtrl.isTripleSkill(AttackStateReference(_ref).spellInfo.spellData.q_skillID))
				{
					var ref:CheckTripleAttackStateReference=_machine.getReference(CheckTripleAttackStateReference) as CheckTripleAttackStateReference;
					ref.setParams(AttackStateReference(_ref).spellInfo.spellData.q_skillID);
					transition(RoleStateType.CONTROL_TRIPLE_ATTACK_CHECK,ref);
				}
				else
				{
					if (!_canWalkRelease)//不可边走边放技能
					{
						transition(RoleStateType.ACTION_PREWAR, null, false, false, [RoleStateType.CONTROL_WALK_MOVE]);
					}
					else
					{
						if((_machine as RoleStateMachine).isWalkMoving)
							transition(RoleStateType.ACTION_RUN,null,false,false,[RoleStateType.CONTROL_WALK_MOVE]);
						else
							transition(RoleStateType.ACTION_PREWAR, null, false, false, [RoleStateType.CONTROL_WALK_MOVE]);
//						removeSelf();
					}
				}
			}
		}

		private function onBreakFrameCmp() : void
		{
//			try{if((((_machine as RoleStateMachine).owner as SceneRole).data as MonsterData).modelID==9008)
//			{
//				Lyt.a("@@@@@解除锁定：-----"+AttackStateReference(_ref).spellInfo.spellData.q_skillName);
//			}}catch(e:Error){}
			_attackBroken = true;
			_attackFinished = true;
			if (_machine && !_machine.isInPool)
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

		public function get canWalkRelease() : Boolean
		{
			return _canWalkRelease;
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
				if (/*!force && */!_attackBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_ATTACK)
			{
				if (/*!force && */!_attackBroken)
				{
					return false;
				}
					
			}
			else if (nextState.type == RoleStateType.ACTION_HIT)
			{
				//if (!force && !_attackBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_COLLECT)
			{
				if (!force && !_attackBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_WALK)
			{
				if (/*!force && */!_attackBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_RUN)
			{
				if (/*!force && */!_attackBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_JUMP)
			{
				if (/*!force && */!_attackBroken)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BEAT_BACK)
			{
				if (!force && !_attackBroken)
					return false;
			}
			else if (force) 
			{
				return true;
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
			if (!force && (_machine as RoleStateMachine).isLockCaseSpell)
				return false;
			if (!force && (_machine as RoleStateMachine).isJumpRising)
				return false;
			if (!force && (_machine as RoleStateMachine).isBlinkMoving)
			{
				return false;
			}
				
			if (!force && (_machine as RoleStateMachine).isBeatMoving)
				return false;
			if (!force && (_machine as RoleStateMachine).isStun)
				return false;
			if (!force && (_machine as RoleStateMachine).isHush)
				return false;
			if (!force && (_machine as RoleStateMachine).isFall)
				return false;
			 if (!force&&(_machine as RoleStateMachine).isSpriteUp)
			{
				return false;
			}
//			if (!force && (_machine as RoleStateMachine).isUseSpell)
//				return false;
			return true;
		}

		override public function dispose() : void
		{
			_stateReference = null;
			_statusType = null;
			_attackBroken = false;
			_attackFinished = false;
			_canWalkRelease = false;
			_canWalkBreak=false;
			if(_startSelfFrameTween)
			{
				_startSelfFrameTween.kill();
				_startSelfFrameTween = null;
			}
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

		/**是否可以主动打断**/
		public function get canWalkBreak():Boolean
		{
			return _canWalkBreak;
		}

	}
}
