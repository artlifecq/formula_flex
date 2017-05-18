package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.manager.input.KeyMoveManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;

	/**
	 *
	 * 场景角色备战状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class PrewarState extends ActionState
	{
		public function PrewarState()
		{
			super(RoleStateType.ACTION_PREWAR);
		}

		override public function execute() : void
		{
			super.execute();
			transition(RoleStateType.CONTROL_PREWAR_WAITING);
		}

		override public function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			super.playAnimation(role, render, isFreeze, time, speedRatio);

			var statusType : String = RoleActionType.getActionType(RoleActionType.PREWAR, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = 0;
					render.setStatus(statusType, _useCrossfadeTransition ? 0.2 : null, time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 0;
					render.setStatus(RoleActionType.PREWAR, _useCrossfadeTransition ? 0.2 : null, time);
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

		override public function afterExecute() : void
		{
			super.afterExecute();
			syncAnimation(false, 0);
		}

		override public function leave() : void
		{
			super.leave();
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
				if (prevState.type == RoleStateType.ACTION_DEATH)
				{
					return false;
				}
				else if (prevState.type == RoleStateType.ACTION_DEAD_LAUNCH)
				{
					return false;
				}
			}
			if ((_machine.owner as SceneRole).isMainChar)
			{
				if (KeyMoveManager.getInstance().keyMoving)
					return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			super.dispose();
		}
	}
}
