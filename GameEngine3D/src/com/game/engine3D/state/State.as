package com.game.engine3D.state
{
	import flash.utils.getQualifiedClassName;
	
	import away3d.utils.GCObject;

	/**
	 *
	 * 状态基类
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class State extends GCObject implements IState
	{
		protected var _machine : StateMachine;
		protected var _ref : StateReference;
		protected var _type : uint;
		protected var _isRepeat : Boolean;
		protected var _isPaused : Boolean;
		protected var _isDisposed : Boolean;

		public function State(type : uint)
		{
			_type = type;
			_isRepeat = false;
			_isPaused = false;
			_isDisposed = false;
		}

		public function init(machine : StateMachine) : void
		{
			_machine = machine;
			_isDisposed = false;
		}

		public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			return true;
		}

		public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			return true;
		}

		public function beforeEnter() : void
		{
			if (_ref)
				_ref.beforeEnter();
		}

		public function enter() : void
		{
			if (_ref)
				_ref.enter();
		}

		public function afterEnter() : void
		{
			if (_ref)
				_ref.afterEnter();
		}

		public function beforeExecute(ref : StateReference) : void
		{
			if (_machine && !_machine.isInPool)
			{
				if (_ref != ref)
				{
					if (ref && ref.overrideType == StateRefOverrideType.ATTACH)
					{
						if (_ref)
							ref.attachRef(_ref);
					}
					if (_ref)
						_ref.dispose();
				}
				_ref = ref;
				if (_ref)
					_ref.setOwner(_machine.owner);
			}
			_isPaused = false;
			if (_ref)
				_ref.beforeExecute();
		}

		public function execute() : void
		{
			if (_ref)
				_ref.execute();
		}

		public function afterExecute() : void
		{
			if (_ref)
				_ref.afterExecute();
			_isRepeat = true;
		}

		public function beforeLeave() : void
		{
			if (_ref)
				_ref.beforeLeave();
		}

		public function leave() : void
		{
			if (_ref)
				_ref.leave();
		}

		public function afterLeave() : void
		{
			if (_ref)
				_ref.afterLeave();
			_isRepeat = false;
		}

		public function pause() : void
		{
			_isPaused = true;
			if (_ref)
				_ref.pause();
		}

		public function resume() : void
		{
			_isPaused = false;
			if (_ref)
				_ref.resume();
		}

		public function get ref() : StateReference
		{
			return _ref;
		}

		/**
		 * 种群，默认共存种群，互斥种群：getQualifiedClassName(ActionState);
		 * @return
		 *
		 */
		public function get tribe() : String
		{
			return getQualifiedClassName(this);
		}

		public function get type() : uint
		{
			return _type;
		}

		public function transition(type : int, ref : StateReference = null, force : Boolean = false, allowQueue : Boolean = false, dumpTypes : Array = null) : void
		{
			if (_machine && !_machine.isInPool)
				_machine.transition(type, ref, force, allowQueue, dumpTypes);
		}

		public function removeSelf() : void
		{
			if (_machine && !_machine.isInPool)
				_machine.removeState(_type);
		}

		public function get isRepeat() : Boolean
		{
			return _isRepeat;
		}

		public function get isPaused() : Boolean
		{
			return _isPaused;
		}

		public function get isDisposed() : Boolean
		{
			return _isDisposed;
		}

		public function dispose() : void
		{
			if (_ref)
			{
				_ref.dispose();
				_ref = null;
			}
			_isRepeat = false;
			_isPaused = false;
			_machine = null;
			_isDisposed = true;
		}
	}
}
