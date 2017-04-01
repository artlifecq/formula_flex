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
		public function IdleState()
		{
			super(RoleStateType.ACTION_IDLE);
		}
		
		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
			}
		}
		
		override public function beforeEnter() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.beforeEnter();
				if (_useCrossfadeTransition)
				{
					var state : IState = _machine.getLastState(ActionState);
					_useCrossfadeTransition = state && (state.type != RoleStateType.ACTION_DEATH);
				}
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
					render.setStatus(statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.visible = true;
					render.repeat = 0;
					render.setStatus(RoleActionType.IDLE, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.EFFECT:
					render.visible = true;
					render.repeat = 0;
					render.setStatus(RoleActionType.IDLE, null, time);
					break;
				case RenderUnitType.WEAPON_EFFECT:
					render.visible = true;
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
			
			if(!force && (_machine as RoleStateMachine).isFly)
			{
				return false;
			}
			
			if (!force && (_machine as RoleStateMachine).isUseSpell)
			{
				return false;
			}
			
			if ((_machine.owner as SceneRole).isMainChar)
			{
				if (KeyMoveManager.getInstance().keyMoving)
					return false;
			}
			return true;
		}
	}
}
