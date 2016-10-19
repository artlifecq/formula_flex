package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.control.ControlState;
	import com.rpgGame.coreData.type.RoleStateType;

	import gs.TweenLite;

	/**
	 *
	 * 场景角色备战等待状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class PrewarWaitingState extends ControlState
	{
		private var _prewarTween : TweenLite;

		public function PrewarWaitingState()
		{
			super(RoleStateType.CONTROL_PREWAR_WAITING);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				if (_prewarTween)
				{
					_prewarTween.kill();
					_prewarTween = null;
				}
				_prewarTween = TweenLite.delayedCall(5, onStopPrewar);
			}
		}

		private function onStopPrewar() : void
		{
			removeSelf();
		}

		private function stopPrewar() : void
		{
			if (_prewarTween)
			{
				_prewarTween.kill();
				_prewarTween = null;
			}
		}

		override public function leave() : void
		{
			super.leave();
			stopPrewar();
			if (_machine && !_machine.isDisposed)
			{
				if ((_machine as RoleStateMachine).isPrewar)
					transition(RoleStateType.ACTION_IDLE);
			}
		}

		override public function dispose() : void
		{
			if (_prewarTween)
			{
				_prewarTween.kill();
				_prewarTween = null;
			}
			super.dispose();
		}
	}
}
