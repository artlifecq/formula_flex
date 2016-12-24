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
	 * 场景角色闲置状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-8 下午5:25:12
	 *
	 */
	public class IdleState extends ActionState
	{
		private var _preStateIsDead : Boolean;

		public function IdleState()
		{
			super(RoleStateType.ACTION_IDLE);
		}

		override public function beforeEnter() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.beforeEnter();
				_preStateIsDead = (_machine as RoleStateMachine).isDead;
			}
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
			}
		}

		override public function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			super.playAnimation(role, render, isFreeze, time, speedRatio);

			var statusType : String = RoleActionType.getActionType(RoleActionType.IDLE, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = 0;
					render.setStatus(statusType, _preStateIsDead ? null : new CrossfadeTransition(0.2), time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.visible = true;
					render.repeat = 0;
					render.setStatus(RoleActionType.IDLE, _preStateIsDead ? null : new CrossfadeTransition(0.2), time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.EFFECT:
					render.visible = true;
					render.repeat = 0;
					render.setStatus(RoleActionType.IDLE, null, time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
					break;
				case RenderUnitType.HURT:
					break;
			}
		}

		override public function pause() : void
		{
			super.pause();
			syncAnimation(true);
		}

		override public function resume() : void
		{
			super.resume();
			syncAnimation(false);
		}

		override public function afterEnter() : void
		{
			super.afterEnter();
			syncAnimation(false, 0);
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if (prevState)
			{
				if (prevState.type == RoleStateType.ACTION_DEATH)
				{
					if (force)
						return true;
					return false;
				}
				else if (prevState.type == RoleStateType.ACTION_DEAD_LAUNCH)
				{
					if (force)
						return true;
					return false;
				}
			}
			if ((_machine as RoleStateMachine).isBlinking)
			{
				if (!force)
					return false;
			}
			else if ((_machine as RoleStateMachine).isBeatMoving)
			{
				if (!force)
					return false;
			}
			else if ((_machine as RoleStateMachine).isTrailMoving)
			{
				if (!force)
					return false;
			}
			return true;
		}
	}
}
