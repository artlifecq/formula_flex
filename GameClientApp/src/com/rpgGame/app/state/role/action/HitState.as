package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;

	import away3d.animators.transitions.CrossfadeTransition;

	import gs.TweenLite;

	/**
	 *
	 * 场景角色受击状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-18 下午5:25:12
	 *
	 */
	public class HitState extends ActionState
	{
		private var _stateReference : HitStateReference;
		private var _totalFrameTween : TweenLite;

		public function HitState()
		{
			super(RoleStateType.ACTION_HIT);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_stateReference = null;
				if (_ref is HitStateReference)
				{
					_stateReference = _ref as HitStateReference;
					var fixDirection : Boolean = false;
					if ((_machine.owner as SceneRole).data is RoleData)
					{
						fixDirection = ((_machine.owner as SceneRole).data as RoleData).fixDirection;
					}
					if (!fixDirection)
					{
						if(_stateReference.atkorPos != null)
						{
							var atkorX : int = _stateReference.atkorPos.x;
							var atkorY : int = _stateReference.atkorPos.y;
							(_machine.owner as SceneRole).faceToGround(atkorX, atkorY, 0);
						}
					}
				}
				else
					throw new Error("受击状态引用必须是HitStateReference类型！");
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

			var statusType : String = RoleActionType.getActionType(RoleActionType.HIT, (_machine as RoleStateMachine).isRiding);
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
					render.setStatus(RoleActionType.HIT, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
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
				if (_totalFrameTween)
				{
					_totalFrameTween.kill();
					_totalFrameTween = null;
				}
				var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
				var totalFrameTm : uint = (bodyAp ? bodyAp.totalDuration : 0);
				if (totalFrameTm > 0)
					_totalFrameTween = TweenLite.delayedCall(totalFrameTm * 0.001, onPlayHitCmp);
				else
					onPlayHitCmp();
			}
		}

		private function onPlayHitCmp() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				stopHit();
				if ((_machine as RoleStateMachine).isPrewarWaiting)
					transition(RoleStateType.ACTION_PREWAR);
				else
					transition(RoleStateType.ACTION_IDLE);
			}
		}

		private function stopHit() : void
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
			stopHit();
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if (prevState)
			{
//				if (prevState.type == RoleStateType.ACTION_HIT)
//					return false;
//				else 
				if (prevState.type == RoleStateType.ACTION_WALK)
					return false;
				else if (prevState.type == RoleStateType.ACTION_RUN)
					return false;
				else if (prevState.type == RoleStateType.ACTION_BEAT_BACK)
					return false;
				else if((_machine as RoleStateMachine).isFly)
				{
					return false;
				}
			}
			return true;
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
