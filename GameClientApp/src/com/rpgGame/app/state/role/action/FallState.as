package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import away3d.animators.transitions.CrossfadeTransition;
	
	import gs.TweenLite;
	import gs.easing.Linear;

	/**
	 *
	 * 场景角色击飞状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-7 下午5:25:12
	 *
	 */
	public class FallState extends ActionState
	{
		private var _stateReference : FallStateReference;
		
		private var _totalTime : int;
		
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
						
						doFlyBack();
//						if (_hardStiffTween)
//						{
//							_hardStiffTween.kill();
//							_hardStiffTween = null;
//						}
//						_hardStiffTween = TweenLite.delayedCall(_stateReference.stiffTime * 0.001, onStopHardStiff);
					}
					else
						throw new Error("击倒状态引用必须是FallStateRef类型！");
				}
			}
		}
		
		private function doFlyBack() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true});
				
				var targetX : int = _stateReference.targetPos.x;
				var targetZ : int = _stateReference.targetPos.y;
				var atkorX : int = _stateReference.atkorPos.x;
				var atkorZ : int = _stateReference.atkorPos.y;
				var distance : Number = MathUtil.getDistance((_machine.owner as SceneRole).x, (_machine.owner as SceneRole).z, targetX, targetZ);
				_totalTime = distance / _stateReference.moveSpeed * 1000;
				
				(_machine.owner as SceneRole).faceToGround(atkorX, atkorZ, 0);
				if (_totalTime > 0)
					TweenLite.to(_machine.owner as SceneRole, _totalTime * 0.001, {x: targetX, z: targetZ, ease: Linear.easeNone, overwrite: 0, onComplete: onMoveComplete});
				else
					onMoveComplete();
				
				_stateReference.move();
			}
		}
		
		private function onMoveComplete() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				var targetX : int = _stateReference.targetPos.x;
				var targetZ : int = _stateReference.targetPos.y;
				(_machine.owner as SceneRole).x = targetX;
				(_machine.owner as SceneRole).z = targetZ;
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true});
				
				stopHardStiff();
				transition(RoleStateType.ACTION_GETUP, null, false, false, [RoleStateType.CONTROL_WALK_MOVE]);
			}
		}
		
		private function stopBeatBack() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				var targetX : int = _stateReference.targetPos.x;
				var targetZ : int = _stateReference.targetPos.y;
				(_machine.owner as SceneRole).x = targetX;
				(_machine.owner as SceneRole).z = targetZ;
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true});
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
					render.setStatus(statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 1;
					render.setStatus(RoleActionType.FALL, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
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

		private function stopHardStiff() : void
		{
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
			else if ((_machine as RoleStateMachine).isBingDong)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_FALL)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_HIT)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_COLLECT)
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
		
			super.dispose();
		}
	}
}
