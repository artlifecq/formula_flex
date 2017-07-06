package com.game.engine3D.state
{
	import away3d.utils.GCObject;

	/**
	 *
	 * 状态引用基类
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-10 上午10:15:16
	 *
	 */
	public class StateReference extends GCObject
	{
		private var _owner : Object;
		private var _data : Object;
		private var _beforeEnterFunc : Function;
		private var _beforeEnterFuncArgs : Array;
		private var _enterFunc : Function;
		private var _enterFuncArgs : Array;
		private var _afterEnterFunc : Function;
		private var _afterEnterFuncArgs : Array;
		private var _afterExecuteFunc : Function;
		private var _afterExecuteFuncArgs : Array;
		private var _executeFunc : Function;
		private var _executeFuncArgs : Array;
		private var _beforeExecuteFunc : Function;
		private var _beforeExecuteFuncArgs : Array;
		private var _beforeLeaveFunc : Function;
		private var _beforeLeaveFuncArgs : Array;
		private var _leaveFunc : Function;
		private var _leaveFuncArgs : Array;
		private var _afterLeaveFunc : Function;
		private var _afterLeaveFuncArgs : Array;
		private var _pauseFunc : Function;
		private var _pauseFuncArgs : Array;
		private var _resumeFunc : Function;
		private var _resumeFuncArgs : Array;
		private var _overrideType : int;

		public function StateReference()
		{
			_overrideType = StateRefOverrideType.RESET;
		}

		internal function setOwner(owner : Object) : void
		{
			_owner = owner;
		}

		public function get owner() : Object
		{
			return _owner;
		}

		/**
		 * 进入
		 * @param func(ref:StateRef):void
		 * @return
		 *
		 */
		public function onEnter(func : Function, ... args) : StateReference
		{
			_enterFunc = func;
			_enterFuncArgs = args;
			return this;
		}

		public function onBeforeEnterFunc(func : Function, ... args) : StateReference
		{
			_beforeEnterFunc = func;
			_beforeEnterFuncArgs = args;
			return this;
		}

		public function onAfterEnterFunc(func : Function, ... args) : StateReference
		{
			_afterEnterFunc = func;
			_afterEnterFuncArgs = args;
			return this;
		}

		/**
		 * 执行
		 * @param func(ref:StateRef):void
		 * @return
		 *
		 */
		public function onExecute(func : Function, ... args) : StateReference
		{
			_executeFunc = func;
			_executeFuncArgs = args;
			return this;
		}

		public function onBeforeExecute(func : Function, ... args) : StateReference
		{
			_beforeExecuteFunc = func;
			_beforeExecuteFuncArgs = args;
			return this;
		}

		public function onAfterExecute(func : Function, ... args) : StateReference
		{
			_afterExecuteFunc = func;
			_afterExecuteFuncArgs = args;
			return this;
		}

		/**
		 * 退出
		 * @param func(ref:StateRef):void
		 * @return
		 *
		 */
		public function onLeave(func : Function, ... args) : StateReference
		{
			_leaveFunc = func;
			_leaveFuncArgs = args;
			return this;
		}

		public function onBeforeLeave(func : Function, ... args) : StateReference
		{
			_beforeLeaveFunc = func;
			_beforeLeaveFuncArgs = args;
			return this;
		}

		public function onAfterLeave(func : Function, ... args) : StateReference
		{
			_afterLeaveFunc = func;
			_afterLeaveFuncArgs = args;
			return this;
		}

		public function onPause(func : Function, ... args) : StateReference
		{
			_pauseFunc = func;
			_pauseFuncArgs = args;
			return this;
		}

		public function onResume(func : Function, ... args) : StateReference
		{
			_resumeFunc = func;
			_resumeFuncArgs = args;
			return this;
		}

		public function get overrideType() : int
		{
			return _overrideType;
		}

		public function set overrideType(value : int) : void
		{
			_overrideType = value;
		}

		public function get data() : Object
		{
			return _data;
		}

		public function set data(value : Object) : void
		{
			_data = value;
		}

		public function attachRef(ref : StateReference) : void
		{
			if (_beforeEnterFunc == null)
			{
				_beforeEnterFunc = ref._beforeEnterFunc;
				_beforeEnterFuncArgs = ref._beforeEnterFuncArgs;
			}
			if (_enterFunc == null)
			{
				_enterFunc = ref._enterFunc;
				_enterFuncArgs = ref._enterFuncArgs;
			}
			if (_afterEnterFunc == null)
			{
				_afterEnterFunc = ref._afterEnterFunc;
				_afterEnterFuncArgs = ref._afterEnterFuncArgs;
			}
			if (_afterExecuteFunc == null)
			{
				_afterExecuteFunc = ref._afterExecuteFunc;
				_afterExecuteFuncArgs = ref._afterExecuteFuncArgs;
			}
			if (_executeFunc == null)
			{
				_executeFunc = ref._executeFunc;
				_executeFuncArgs = ref._executeFuncArgs;
			}
			if (_beforeExecuteFunc == null)
			{
				_beforeExecuteFunc = ref._beforeExecuteFunc;
				_beforeExecuteFuncArgs = ref._beforeExecuteFuncArgs;
			}
			if (_beforeLeaveFunc == null)
			{
				_beforeLeaveFunc = ref._beforeLeaveFunc;
				_beforeLeaveFuncArgs = ref._beforeLeaveFuncArgs;
			}
			if (_leaveFunc == null)
			{
				_leaveFunc = ref._leaveFunc;
				_leaveFuncArgs = ref._leaveFuncArgs;
			}
			if (_afterLeaveFunc == null)
			{
				_afterLeaveFunc = ref._afterLeaveFunc;
				_afterLeaveFuncArgs = ref._afterLeaveFuncArgs;
			}
			if (_pauseFunc == null)
			{
				_pauseFunc = ref._pauseFunc;
				_pauseFuncArgs = ref._pauseFuncArgs;
			}
			if (_resumeFunc == null)
			{
				_resumeFunc = ref._resumeFunc;
				_resumeFuncArgs = ref._resumeFuncArgs;
			}
			if (_data == null)
				_data = ref._data;
		}

		internal function enter() : void
		{
			var args : Array;
			if (_enterFuncArgs && _enterFuncArgs.length)
				args = _enterFuncArgs.concat(this);
			else
				args = [this];
			if (_enterFunc != null)
				_enterFunc.apply(null, args);
		}

		internal function beforeEnter() : void
		{
			var args : Array;
			if (_beforeEnterFuncArgs && _beforeEnterFuncArgs.length)
				args = _beforeEnterFuncArgs.concat(this);
			else
				args = [this];
			if (_beforeEnterFunc != null)
				_beforeEnterFunc.apply(null, args);
		}

		internal function afterEnter() : void
		{
			var args : Array;
			if (_afterEnterFuncArgs && _afterEnterFuncArgs.length)
				args = _afterEnterFuncArgs.concat(this);
			else
				args = [this];
			if (_afterEnterFunc != null)
				_afterEnterFunc.apply(null, args);
		}

		internal function execute() : void
		{
			var args : Array;
			if (_executeFuncArgs && _executeFuncArgs.length)
				args = _executeFuncArgs.concat(this);
			else
				args = [this];
			if (_executeFunc != null)
				_executeFunc.apply(null, args);
		}

		internal function beforeExecute() : void
		{
			var args : Array;
			if (_beforeExecuteFuncArgs && _beforeExecuteFuncArgs.length)
				args = _beforeExecuteFuncArgs.concat(this);
			else
				args = [this];
			if (_beforeExecuteFunc != null)
				_beforeExecuteFunc.apply(null, args);
		}

		internal function afterExecute() : void
		{
			var args : Array;
			if (_afterExecuteFuncArgs && _afterExecuteFuncArgs.length)
				args = _afterExecuteFuncArgs.concat(this);
			else
				args = [this];
			if (_afterExecuteFunc != null)
				_afterExecuteFunc.apply(null, args);
		}

		internal function leave() : void
		{
			var args : Array;
			if (_leaveFuncArgs && _leaveFuncArgs.length)
				args = _leaveFuncArgs.concat(this);
			else
				args = [this];
			if (_leaveFunc != null)
				_leaveFunc.apply(null, args);
		}

		internal function beforeLeave() : void
		{
			var args : Array;
			if (_beforeLeaveFuncArgs && _beforeLeaveFuncArgs.length)
				args = _beforeLeaveFuncArgs.concat(this);
			else
				args = [this];
			if (_beforeLeaveFunc != null)
				_beforeLeaveFunc.apply(null, args);
		}

		internal function afterLeave() : void
		{
			var args : Array;
			if (_afterLeaveFuncArgs && _afterLeaveFuncArgs.length)
				args = _afterLeaveFuncArgs.concat(this);
			else
				args = [this];
			if (_afterLeaveFunc != null)
				_afterLeaveFunc.apply(null, args);
		}

		internal function pause() : void
		{
			var args : Array;
			if (_pauseFuncArgs && _pauseFuncArgs.length)
				args = _pauseFuncArgs.concat(this);
			else
				args = [this];
			if (_pauseFunc != null)
				_pauseFunc.apply(null, args);
		}

		internal function resume() : void
		{
			var args : Array;
			if (_resumeFuncArgs && _resumeFuncArgs.length)
				args = _resumeFuncArgs.concat(this);
			else
				args = [this];
			if (_resumeFunc != null)
				_resumeFunc.apply(null, args);
		}

		public function dispose() : void
		{
			_owner = null;
			_beforeEnterFunc = null;
			_beforeEnterFuncArgs = null;
			_enterFunc = null;
			_enterFuncArgs = null;
			_afterEnterFunc = null;
			_afterEnterFuncArgs = null;
			_beforeExecuteFunc = null;
			_beforeExecuteFuncArgs = null;
			_executeFunc = null;
			_executeFuncArgs = null;
			_afterExecuteFunc = null;
			_afterExecuteFuncArgs = null;
			_beforeLeaveFunc = null;
			_beforeLeaveFuncArgs = null;
			_leaveFunc = null;
			_leaveFuncArgs = null;
			_afterLeaveFunc = null;
			_afterLeaveFuncArgs = null;
			_pauseFunc = null;
			_pauseFuncArgs = null;
			_resumeFunc = null;
			_resumeFuncArgs = null;
			_data = null;
			_overrideType = 0;
		}
		
		public function reset():void
		{
			
		}
	}
}
