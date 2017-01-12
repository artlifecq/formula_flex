package com.rpgGame.app.state.role.control
{
	import com.rpgGame.core.state.role.control.ControlState;
	
	import gs.TweenLite;

	/**
	 *
	 * 场景角色buff状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-30 下午2:25:12
	 *
	 */
	public class BuffState extends ControlState
	{
		protected var _stateReference : BuffStateReference;
		private var _stiffTween : TweenLite;

		public function BuffState(type : uint)
		{
			super(type);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_stateReference = null;
				if (_ref)
				{
					if (_ref is BuffStateReference)
					{
						_stateReference = _ref as BuffStateReference;
						if (_stiffTween)
						{
							_stiffTween.kill();
							_stiffTween = null;
						}
						var duration : Number = _stateReference.disappearTime;
						_stiffTween = TweenLite.delayedCall(duration * 0.001, onRemoveBuff);
					}
					else
						throw new Error("场景角色buff状态引用必须是BuffStateReference类型！");
				}
			}
		}

		protected function onRemoveBuff() : void
		{
			removeSelf();
		}

		override public function leave() : void
		{
			super.leave();
			if (_stiffTween)
			{
				_stiffTween.kill();
				_stiffTween = null;
			}
		}

		override public function dispose() : void
		{
			if (_stiffTween)
			{
				_stiffTween.kill();
				_stiffTween = null;
			}
			_stateReference = null;
			super.dispose();
		}
	}
}
