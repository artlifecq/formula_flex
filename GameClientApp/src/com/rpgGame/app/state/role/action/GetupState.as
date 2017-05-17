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
	 * 场景角色起身状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-7 下午5:25:12
	 *
	 */
	public class GetupState extends ActionState
	{
		private var _totalFrameTween : TweenLite;

		public function GetupState()
		{
			super(RoleStateType.ACTION_GETUP);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
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

			var statusType : String = RoleActionType.getActionType(RoleActionType.GETUP, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = 1;
					render.setStatus(statusType, _useCrossfadeTransition ? 0.2 : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 1;
					render.setStatus(RoleActionType.GETUP, _useCrossfadeTransition ? 0.2 : null, time);
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
					_totalFrameTween = TweenLite.delayedCall(totalFrameTm * 0.001, onPlayGetupCmp);
				else
					onPlayGetupCmp();
			}
		}

		private function onPlayGetupCmp() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				stopGetup();
				if ((_machine as RoleStateMachine).isPrewarWaiting)
					transition(RoleStateType.ACTION_PREWAR, null, false, false, [RoleStateType.CONTROL_WALK_MOVE]);
				else
					transition(RoleStateType.ACTION_IDLE, null, false, false, [RoleStateType.CONTROL_WALK_MOVE]);
			}
		}

		private function stopGetup() : void
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
			stopGetup();
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
			else if (nextState.type == RoleStateType.ACTION_GETUP)
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
			return true;
		}

		override public function dispose() : void
		{
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
			super.dispose();
		}
	}
}
