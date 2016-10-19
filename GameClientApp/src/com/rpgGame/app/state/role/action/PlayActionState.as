package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;

	import away3d.animators.transitions.CrossfadeTransition;

	/**
	 *
	 * 场景角色播放动作状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-24 下午3:25:12
	 *
	 */
	public class PlayActionState extends ActionState
	{
		private var _stateReference : PlayActionStateReference;
		private var _statusType : String;

		public function PlayActionState()
		{
			super(RoleStateType.ACTION_PLAY_ACTION);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_stateReference = null;

				if (_ref is PlayActionStateReference)
				{
					_stateReference = _ref as PlayActionStateReference;
				}
				else
					throw new Error("播放动作状态引用必须是PlayActionStateReference类型！");

				_statusType = _stateReference.statusType;
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
					render.repeat = _stateReference.repeat;
					render.setStatus(statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.visible = true;
					render.repeat = _stateReference.repeat;
					render.setStatus(_statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
					render.visible = true;
					render.repeat = _stateReference.repeat;
					render.play(time);
					break;
				case RenderUnitType.EFFECT:
					render.visible = true;
					render.repeat = _stateReference.repeat;
					render.play(time);
					break;
				case RenderUnitType.WEAPON_EFFECT:
					render.visible = true;
					break;
				case RenderUnitType.HURT:
					break;
			}
		}

		override public function afterExecute() : void
		{
			super.afterExecute();
			syncAnimation(false, _stateReference.time);
		}

		override public function dispose() : void
		{
			_stateReference = null;
			_statusType = null;
			super.dispose();
		}
	}
}
