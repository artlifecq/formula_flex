package com.editor.state.role.action
{
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleActionType;
	import com.editor.data.RoleStateType;
	import com.editor.state.role.RoleStateMachine;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseRole;

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
					render.setStatus(statusType, 0.2, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.visible = true;
					render.repeat = _stateReference.repeat;
					render.setStatus(_statusType, 0.2, time);
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
					render.setStatus(statusType, 0, time);
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
