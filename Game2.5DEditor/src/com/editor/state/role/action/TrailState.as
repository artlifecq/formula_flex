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
	 * 场景角色轨道状态
	 * @author L.L.M.Sunny
	 * 创建时间：2016-6-23 下午5:25:12
	 *
	 */
	public class TrailState extends ActionState
	{
		private var _stateReference : TrailStateReference;
		private var _statusType : String;

		public function TrailState()
		{
			super(RoleStateType.ACTION_TRAIL);
		}

		override public function execute() : void
		{
			super.execute();
			_stateReference = null;
			if (_ref)
			{
				if (_ref is TrailStateReference)
				{
					_stateReference = _ref as TrailStateReference;
				}
				else
				{
					throw new Error("轨道状态引用必须是TrailStateReference类型！");
				}
				_statusType = _stateReference.statusType;
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

			var statusType : String = RoleActionType.getActionType(_statusType, (_machine as RoleStateMachine).isRiding);
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
					render.setStatus(_statusType, new CrossfadeTransition(0.2), time, speedRatio);
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
			else if (nextState.type == RoleStateType.ACTION_ATTACK)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_HIT)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BEAT_BACK)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BLINK)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_TRAIL)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_FALL)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_GETUP)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_WALK)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_RUN)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_JUMP)
			{
				return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			_stateReference = null;
			_statusType = null;
			super.dispose();
		}
	}
}
