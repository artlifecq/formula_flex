package com.rpgGame.app.state.role.control
{
	import com.rpgGame.core.state.role.control.ControlState;
	import com.rpgGame.coreData.type.RoleStateType;

	import gs.TweenLite;

	/**
	 *
	 * 场景投放技能锁定状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-09 上午11:25:12
	 *
	 */
	public class CastSpellLockState extends ControlState
	{
		private var _stateReference : CastSpellLockStateReference;
		private var _lockTween : TweenLite;

		public function CastSpellLockState()
		{
			super(RoleStateType.CONTROL_CAST_SPELL_LOCK);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_stateReference = null;

				if (_ref is CastSpellLockStateReference)
				{
					_stateReference = _ref as CastSpellLockStateReference;
				}
				else
					throw new Error("投放技能锁定状态必须是CastSpellLockStateReference类型！");

				if (!_stateReference.spellEffectData || !_stateReference.spellEffectData.can_walk_release)
					transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
				_lockTween = TweenLite.delayedCall(5, onUnlock);
			}
		}

		private function onUnlock() : void
		{
			removeSelf();
		}

		override public function leave() : void
		{
			super.leave();
			if (_lockTween)
			{
				_lockTween.kill();
				_lockTween = null;
			}
		}

		override public function dispose() : void
		{
			_stateReference = null;
			if (_lockTween)
			{
				_lockTween.kill();
				_lockTween = null;
			}
			super.dispose();
		}
	}
}
