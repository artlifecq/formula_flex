package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * 采集状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2016-03-09 上午10:15:16
	 *
	 */
	public class CollectStateReference extends RoleStateReference
	{
		private var _time : int;
		private var _endFunc : Function;
		private var _endFuncArgs : Array;

		public function CollectStateReference()
		{
			super();
		}

		public function setParams(time : int) : void
		{
			_time = time;
		}

		public function get time() : int
		{
			return _time;
		}

		public function onEnd(func : Function, ... args) : CollectStateReference
		{
			_endFunc = func;
			_endFuncArgs = args;
			return this;
		}

		internal function end() : void
		{
			var args : Array;
			if (_endFuncArgs && _endFuncArgs.length)
				args = _endFuncArgs.concat(this);
			else
				args = [this];
			if (_endFunc != null)
				_endFunc.apply(null, args);
		}

		override public function dispose() : void
		{
			_time = 0;
			_endFunc = null;
			_endFuncArgs = null;
			super.dispose();
		}
	}
}
