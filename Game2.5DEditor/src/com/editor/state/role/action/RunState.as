package com.editor.state.role.action
{
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleActionType;
	import com.editor.data.RoleStateType;
	import com.editor.state.role.RoleStateMachine;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;

	import away3d.animators.transitions.CrossfadeTransition;

	/**
	 *
	 * 场景角色跑步状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-8 下午5:25:12
	 *
	 */
	public class RunState extends ActionState
	{
		private var _stateReference : RunStateReference;

		public function RunState()
		{
			super(RoleStateType.ACTION_RUN);
		}

		override public function execute() : void
		{
			super.execute();
			if (_ref)
			{
				if (_ref is RunStateReference)
				{
					_stateReference = _ref as RunStateReference;
				}
				else
				{
					throw new Error("跑步状态引用必须是RunStateReference类型！");
				}
				var speedRatio : Number = _stateReference.footSpan;
				syncAnimationSpeed(speedRatio);
			}
		}

		override public function leave() : void
		{
			super.leave();
		}

		override public function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			super.playAnimation(role, render, isFreeze, time, speedRatio);

			var statusType : String = RoleActionType.getActionType(RoleActionType.RUN, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = 0;
					render.setStatus(statusType, new CrossfadeTransition(0.2), time, speedRatio);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 0;
					render.setStatus(RoleActionType.RUN, new CrossfadeTransition(0.2), time, speedRatio);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
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
					render.animateSpeed = speedRatio;
					break;
			}
		}

		override public function pause() : void
		{
			super.pause();
			syncAnimation(true, -1, speedRatio);
		}

		override public function resume() : void
		{
			super.resume();
			syncAnimation(false, -1, speedRatio);
		}

		override public function afterEnter() : void
		{
			super.afterEnter();
			syncAnimation(false, 0, speedRatio);
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if ((_machine as RoleStateMachine).isDead)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isDeadLaunch)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isAttackHarding)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isTrailMoving)
			{
				return false;
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
			else if (nextState.type == RoleStateType.ACTION_HIT)
			{
				return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			_stateReference = null;
			super.dispose();
		}
	}
}
