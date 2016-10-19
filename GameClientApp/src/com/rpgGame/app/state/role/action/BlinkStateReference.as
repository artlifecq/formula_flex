package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * 瞬移状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-20 下午2:25:12
	 *
	 */
	public class BlinkStateReference extends RoleStateReference
	{
		private var _statusType : String;
		private var _isFixedFrame : Boolean;
		private var _totalTime : int;
		private var _soarFrameTime : int;
		private var _hitFrameTime : int;
		private var _breakFrameTime : int;
		private var _throwDelayTime : int;
		private var _hitFrameFunc : Function;
		private var _hitFrameFuncArgs : Array;
		private var _breakFrameFunc : Function;

		public function BlinkStateReference()
		{
			super();
		}

		public function setParams(statusType : String, isFixedFrame : Boolean, totalTime : int, soarFrameTime : int, hitFrameTime : int, breakFrameTime : int, throwDelayTime : int) : void
		{
			_statusType = statusType;
			_isFixedFrame = isFixedFrame;
			_totalTime = totalTime;
			_soarFrameTime = soarFrameTime;
			_hitFrameTime = hitFrameTime;
			_breakFrameTime = breakFrameTime;
			_throwDelayTime = throwDelayTime;
		}

		public function get statusType() : String
		{
			return _statusType;
		}

		public function get isFixedFrame() : Boolean
		{
			return _isFixedFrame;
		}

		public function get totalTime() : int
		{
			return _totalTime;
		}

		public function get soarFrameTime() : int
		{
			return _soarFrameTime;
		}

		public function get throwDelayTime() : int
		{
			return _throwDelayTime;
		}

		public function get hitFrameTime() : int
		{
			return _hitFrameTime;
		}

		public function get breakFrameTime() : int
		{
			return _breakFrameTime;
		}

		/**
		 * 打断帧
		 * @param func(ref:StateRef):void
		 * @return
		 *
		 */
		public function onBreakFrame(func : Function) : BlinkStateReference
		{
			_breakFrameFunc = func;
			return this;
		}

		/**
		 * 判定帧
		 * @param func(ref:StateRef):void
		 * @return
		 *
		 */
		public function onHitFrame(func : Function, ... args) : BlinkStateReference
		{
			_hitFrameFunc = func;
			_hitFrameFuncArgs = args;
			return this;
		}

		internal function hitFrame() : void
		{
			var args : Array;
			if (_hitFrameFuncArgs && _hitFrameFuncArgs.length)
				args = _hitFrameFuncArgs.concat(this);
			else
				args = [this];
			if (_hitFrameFunc != null)
				_hitFrameFunc.apply(null, args);
		}

		internal function breakFrame() : void
		{
			if (_breakFrameFunc != null)
				_breakFrameFunc(this);
		}

		override public function dispose() : void
		{
			_hitFrameFunc = null;
			_hitFrameFuncArgs = null;
			_breakFrameFunc = null;
			super.dispose();
		}
	}
}
