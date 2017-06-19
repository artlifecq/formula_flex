package com.editor.state.role.control
{
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleStateType;
	import com.editor.enum.SpellBlinkType;
	import com.editor.fight.spell.ReleaseSpellInfo;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.RoleStateMachine;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;

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
		private var _speed : Number = 1;

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
						_speed = _stateReference.speed;
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
					TweenLite.delayedCall(_stateReference.throwDelayTime / _speed * 0.001, onReleaseDelayComplete);
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
				case SpellBlinkType.JI_TUI:
					doJiTui();
					break;
				default:
					break;
			}
		}

		private function doJiTui() : void
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

			var targetX : int = _stateReference.targetPos.x;
			var targetZ : int = _stateReference.targetPos.y;
//			(_machine.owner as SceneRole).faceToGround(targetX, targetZ, 0);
			_stateReference.rotationY = (_machine.owner as SceneRole).rotationY;
			_stateReference.move();
			var totalTime : int = _stateReference.totalTime;
			if (totalTime > 0)
				TweenLite.to(_machine.owner as SceneRole, totalTime / _speed * 0.001, {x: targetX, z: targetZ, ease: Linear.easeNone, overwrite: 0, onComplete: onMoveComplete});
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

			var targetX : int = _stateReference.targetPos.x;
			var targetZ : int = _stateReference.targetPos.y;
//			(_machine.owner as SceneRole).faceToGround(targetX, targetZ, 0);
			_stateReference.rotationY = (_machine.owner as SceneRole).rotationY;
			_stateReference.move();
			var totalTime : int = _stateReference.totalTime;
			if (totalTime > 0)
				TweenLite.to(_machine.owner as SceneRole, totalTime / _speed * 0.001, {x: targetX, z: targetZ, ease: Linear.easeNone, overwrite: 0, onComplete: onMoveComplete});
			else
				onMoveComplete();
		}

		private function doShanShuo() : void
		{
			var targetX : int = _stateReference.targetPos.x;
			var targetZ : int = _stateReference.targetPos.y;
//			(_machine.owner as SceneRole).faceToGround(targetX, targetZ, 0);
			_stateReference.rotationY = (_machine.owner as SceneRole).rotationY;
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

			var targetX : int = _stateReference.targetPos.x;
			var targetZ : int = _stateReference.targetPos.y;
			_blinkHeight = _stateReference.blinkHeight;

//			(_machine.owner as SceneRole).faceToGround(targetX, targetZ, 0);
			_stateReference.rotationY = (_machine.owner as SceneRole).rotationY;
			_stateReference.move();
			var totalTime : int = _stateReference.totalTime;
			if (totalTime > 0)
			{
				TweenLite.to(_machine.owner as SceneRole, totalTime / _speed * 0.001, {x: targetX, z: targetZ, ease: Linear.easeNone, overwrite: 0, onComplete: onMoveComplete});
				TweenLite.to(_machine.owner as SceneRole, totalTime / _speed * 0.5 * 0.001, {offsetY: _blinkHeight, ease: Cubic.easeOut, overwrite: 0, onComplete: onJumpOffComplete});
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
			TweenLite.to(_machine.owner as SceneRole, totalTime / _speed * 0.5 * 0.001, {offsetY: 0, ease: Cubic.easeIn, overwrite: 0, onComplete: onJumpFallComplete});
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
			TweenLite.killDelayedCallsTo(onReleaseDelayComplete);
			_stateReference = null;
			super.dispose();
		}
	}
}
