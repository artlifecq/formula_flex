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
	 * 场景角色击退状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-21 上午10:25:12
	 *
	 */
	public class BeatBackState extends ActionState
	{
		private var _totalFrameTween : TweenLite;

		public function BeatBackState()
		{
			super(RoleStateType.ACTION_BEAT_BACK);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				if (_ref)
				{
				}
			}
		}

		override public function leave() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.leave();
				stopBeat();
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
					render.setStatus(statusType, 0.2, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 1;
					render.setStatus(RoleActionType.HIT, 0.2, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
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
				var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
				var totalFrameTm : uint = (bodyAp ? bodyAp.totalDuration : 100);
				if (_totalFrameTween)
				{
					_totalFrameTween.kill();
					_totalFrameTween = null;
				}
				_totalFrameTween = TweenLite.delayedCall(totalFrameTm * 0.001, onTotalFrameCmp);
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
				stopBeat();
				if ((_machine as RoleStateMachine).isPrewarWaiting)
					transition(RoleStateType.ACTION_PREWAR);
				else
					transition(RoleStateType.ACTION_IDLE);
			}
		}

		private function stopBeat() : void
		{
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
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
			else if (nextState.type == RoleStateType.CONTROL_WALK_MOVE)
			{
				if (!force)
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
