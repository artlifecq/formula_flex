package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.control.MoveState;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SpellBlinkType;
	
	import gs.TweenLite;
	import gs.easing.Cubic;
	import gs.easing.Linear;

	/**
	 *
	 * 场景角色瞬移移动状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-5 下午5:25:12
	 *
	 */
	public class BlinkMoveState extends MoveState
	{
		private var _stateReference : BlinkMoveStateReference;
		private var _blinkHeight : int;
		private var _ghostEffect : Boolean;

		public function BlinkMoveState()
		{
			super(RoleStateType.CONTROL_BLINK_MOVE);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				_stateReference = null;
				if (_ref)
				{
					if (_ref is BlinkMoveStateReference)
					{
						_stateReference = _ref as BlinkMoveStateReference;
						_ghostEffect = _stateReference.spellInfo.ghostEffect;
						doBlink(_stateReference.spellInfo);
					}
					else
						throw new Error("闪烁移动状态引用必须是BlinkMoveStateRef类型！");
				}
			}
		}

		private function doBlink(info : ReleaseSpellInfo) : void
		{
			if (_machine && !_machine.isInPool)
			{
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true, offsetY: true});
				TweenLite.killDelayedCallsTo(onReleaseDelayComplete);
				if (_stateReference.throwDelayTime > 0)
					TweenLite.delayedCall(_stateReference.throwDelayTime * 0.001, onReleaseDelayComplete);
				else
					switchBlinkType();
			}
		}

		private function onReleaseDelayComplete() : void
		{
			switchBlinkType();
		}

		private function switchBlinkType() : void
		{
			var info : ReleaseSpellInfo = _stateReference.spellInfo;
			switch (info.blinkType)
			{
				case SpellBlinkType.CHONG_FENG:
					doChongFeng();
					break;
				case SpellBlinkType.SHAN_SHUO:
					doShanShuo();
					break;
				case SpellBlinkType.TIAO_PI:
					doTiaoPi();
					break;
				case SpellBlinkType.DODGE:
					doDodge();
					break;
				default:
					break;
			}
		}
		
		private function doDodge():void
		{
			(_machine.owner as SceneRole).avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.entityPhantom = _ghostEffect;
						break;
				}
			});
			
			(_machine.owner as SceneRole).turnRoundTo(_stateReference.angle, 0);
			var targetX : int = _stateReference.targetPos.x;
			var targetZ : int = _stateReference.targetPos.y;
			_stateReference.move();
			var totalTime : int = _stateReference.totalTime;
			if (totalTime > 0)
				TweenLite.to(_machine.owner as SceneRole, totalTime * 0.001, {x: targetX, z: targetZ, ease: Linear.easeNone, overwrite: 0, onComplete: onMoveComplete});
			else
				onMoveComplete();
		}

		private function doChongFeng() : void
		{
			(_machine.owner as SceneRole).avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.entityPhantom = _ghostEffect;
						break;
				}
			});

			(_machine.owner as SceneRole).turnRoundTo(_stateReference.angle, 0);
			var targetX : int = _stateReference.targetPos.x;
			var targetZ : int = _stateReference.targetPos.y;
			_stateReference.move();
			var totalTime : int = _stateReference.totalTime;
			
			if (totalTime > 0)
				TweenLite.to(_machine.owner as SceneRole, totalTime * 0.001, {x: targetX, z: targetZ, ease: Linear.easeNone, overwrite: 0, onComplete: onMoveComplete});
			else
				onMoveComplete();
		}

		private function doShanShuo() : void
		{
			(_machine.owner as SceneRole).turnRoundTo(_stateReference.angle, 0);
			_stateReference.move();
			onMoveComplete();
		}

		private function doTiaoPi() : void
		{
			(_machine.owner as SceneRole).avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.entityPhantom = _ghostEffect;
						break;
				}
			});

			(_machine.owner as SceneRole).turnRoundTo(_stateReference.angle, 0);
			var targetX : int = _stateReference.targetPos.x;
			var targetZ : int = _stateReference.targetPos.y;
			_blinkHeight = _stateReference.blinkHeight;
			_stateReference.move();
			var totalTime : int = _stateReference.totalTime;
			if (totalTime > 0)
			{
				TweenLite.to(_machine.owner as SceneRole, totalTime * 0.001, {x: targetX, z: targetZ, ease: Linear.easeNone, overwrite: 0, onComplete: onMoveComplete});
				TweenLite.to(_machine.owner as SceneRole, totalTime * 0.5 * 0.001, {offsetY: _blinkHeight, ease: Cubic.easeOut, overwrite: 0, onComplete: onJumpOffComplete});
			}
			else
			{
				onMoveComplete();
			}
		}

		private function onMoveComplete() : void
		{
			if (_machine && !_machine.isInPool)
			{
				var targetX : int = _stateReference.targetPos.x;
				var targetZ : int = _stateReference.targetPos.y;
				(_machine.owner as SceneRole).x = targetX;
				(_machine.owner as SceneRole).z = targetZ;
				(_machine.owner as SceneRole).offsetY = 0;
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true, offsetY: true});

				_stateReference.hitFrame();
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
			}
		}

		private function onJumpOffComplete() : void
		{
			var totalTime : int = _stateReference.totalTime;
			TweenLite.to(_machine.owner as SceneRole, totalTime * 0.5 * 0.001, {offsetY: 0, ease: Cubic.easeIn, overwrite: 0, onComplete: onJumpFallComplete});
		}

		private function onJumpFallComplete() : void
		{
		}

		override public function leave() : void
		{
			super.leave();
			TweenLite.killDelayedCallsTo(onReleaseDelayComplete);
			stopBlink();
		}

		private function stopBlink() : void
		{
			if (_machine && !_machine.isInPool)
			{
				(_machine.owner as SceneRole).offsetY = 0;
				var targetX : int = _stateReference.targetPos.x;
				var targetZ : int = _stateReference.targetPos.y;
				(_machine.owner as SceneRole).x = targetX;
				(_machine.owner as SceneRole).z = targetZ;
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true, offsetY: true});
				(_machine.owner as SceneRole).avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
				{
					switch (render.type)
					{
						case RenderUnitType.BODY:
						case RenderUnitType.HAIR:
						case RenderUnitType.WEAPON:
						case RenderUnitType.DEPUTY_WEAPON:
						case RenderUnitType.MOUNT:
							render.entityPhantom = false;
							break;
					}
				});
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
			else if ((_machine as RoleStateMachine).isUnmovable)
			{
				if (!force)
					return false;
			}
			else if ((_machine as RoleStateMachine).isHush)
			{
				if (!force)
					return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			TweenLite.killDelayedCallsTo(onReleaseDelayComplete);
			_stateReference = null;
			super.dispose();
		}
	}
}
