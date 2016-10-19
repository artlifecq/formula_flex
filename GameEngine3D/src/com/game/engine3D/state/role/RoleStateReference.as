package com.game.engine3D.state.role
{
	import com.game.engine3D.state.StateReference;

	/**
	 *
	 * 场景角色状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-10 上午10:15:16
	 *
	 */
	public class RoleStateReference extends StateReference
	{
		private var _syncAnimatFunc : Function;

		public function RoleStateReference()
		{
			super();
		}

		public function onSyncAnimat(func : Function) : RoleStateReference
		{
			_syncAnimatFunc = func;
			return this;
		}

		internal function syncAnimat() : void
		{
			if (_syncAnimatFunc != null)
				_syncAnimatFunc(this);
		}

		override public function attachRef(ref : StateReference) : void
		{
			super.attachRef(ref);
			if (_syncAnimatFunc == null)
				_syncAnimatFunc = (ref as RoleStateReference)._syncAnimatFunc;
		}

		override public function dispose() : void
		{
			_syncAnimatFunc = null;
			super.dispose();
		}
	}
}
