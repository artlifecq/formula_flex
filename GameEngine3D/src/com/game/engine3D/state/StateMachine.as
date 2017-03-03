package com.game.engine3D.state
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	/**
	 *
	 * 状态机
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午2:05:15
	 *
	 */
	public class StateMachine implements IInstancePoolClass
	{
		public static var isDebug : Boolean = false;
		protected var _owner : Object;
		protected var _states : Dictionary;
		protected var _currStates : Dictionary;
		protected var _lastStates : Dictionary;
		protected var _blockQueue : Dictionary;
		protected var _referenceMapping : Dictionary;
		protected var _usePass : Boolean;
		protected var _isDisposed : Boolean;
		
		public function StateMachine(owner : Object)
		{
			_states = new Dictionary(true);
			_currStates = new Dictionary(true);
			_lastStates = new Dictionary(true);
			_blockQueue = new Dictionary(true);
			_referenceMapping = new Dictionary(true);
			reSet([owner]);
		}
		
		public function reSet($parameters : Array) : void
		{
			_owner = $parameters[0];
			_usePass = true;
			_isDisposed = false;
		}
		
		public function get owner() : Object
		{
			return _owner;
		}
		
		/**
		 *
		 * @param type 状态类型
		 * @param ref 状态引用
		 * @param force 是否强制，自定义支持
		 * @param allowQueue 允许队列，不能通过的状态是否置入队列
		 * @param dumpTypes 倾出类型，如果队列中有该类型的状态则会优先执行
		 *
		 */
		public function transition(type : int, ref : StateReference = null, force : Boolean = false, allowQueue : Boolean = false, dumpTypes : Array = null) : Boolean
		{
			if (_isDisposed)
				return false;
			var transState : IState = null;
			var data : StateBlockData = null;
			var passed : Boolean = false;
			if (dumpTypes && dumpTypes.indexOf(type) == -1)
			{
				for each (var dumpType : int in dumpTypes)
				{
					data = _blockQueue[dumpType];
					if (data)
					{
						transState = extractState(data.type);
						transState = transState ? (transState.isDisposed ? null : transState) : null;
						passed = transState ? passTo(transState.type, force) : false;
						if (passed)
						{
							type = data.type;
							ref = data.ref;
							force = data.force;
							break;
						}
						else
						{
							transState = null;
						}
						data = null;
					}
				}
			}
			if (!transState && type > 0)
			{
				transState = extractState(type);
				transState = transState ? (transState.isDisposed ? null : transState) : null;
				passed = transState ? passTo(transState.type, force) : false;
			}
			if (transState)
			{
				var passEnter : Boolean = false;
				var currState : IState = _currStates[transState.tribe];
				currState = currState ? (currState.isDisposed ? null : currState) : null;
				if (!currState || (currState != transState && currState.tribe == transState.tribe)) //互斥种群
				{
					if (_blockQueue[type])
					{
						_blockQueue[type] = null;
						delete _blockQueue[type];
					}
					
					if (passed)
					{
						if (currState)
							currState.beforeLeave();
						transState.beforeEnter();
						if (currState)
							currState.leave();
						_currStates[transState.tribe] = transState;
						transState.enter();
						if (currState)
							currState.afterLeave();
						passEnter = true;
					}
					else if (allowQueue)
					{
						data = new StateBlockData(type, ref, force);
						_blockQueue[type] = data;
					}
				}
				if (passed)
				{
					transState.beforeExecute(ref);
					transState.execute();
					transState.afterExecute();
					if (passEnter)
					{
						transState.afterEnter();
					}
					_lastStates[transState.tribe] = transState;
					return true;
				}
			}
			return false;
		}
		
		public function passTo(transType : int, force : Boolean = false) : Boolean
		{
			if (_isDisposed)
				return false;
			if (!_usePass)
				return true;
			var transState : IState = extractState(transType);
			transState = transState ? (transState.isDisposed ? null : transState) : null;
			if (!transState)
				return false;
			var currState : IState = _currStates[transState.tribe];
			currState = currState ? (currState.isDisposed ? null : currState) : null;
			var currPassed : Boolean = !currState || currState.leavePass(transState, force);
			var transPassed : Boolean = transState.enterPass(currState, force);
			var passed : Boolean = currPassed && transPassed;
			if (isDebug && !passed)
				trace("====================" + this + "no pass:", currState ? currState.type : "", transState.type);
			return passed;
		}
		
		public function removeState(type : int) : void
		{
			if (_isDisposed)
				return;
			var state : IState = _states[type];
			if (state && _currStates[state.tribe])
			{
				state.beforeLeave();
				state.leave();
				_currStates[state.tribe] = null;
				delete _currStates[state.tribe];
				var data : StateBlockData = _blockQueue[type];
				if (data)
				{
					data.dispose();
					_blockQueue[type] = null;
					delete _blockQueue[type];
				}
				state.afterLeave();
				_lastStates[state.tribe] = null;
				delete _lastStates[state.tribe];
			}
		}
		
		protected function createState(type : int) : IState
		{
			return null;
		}
		
		public function extractState(type : int) : IState
		{
			if (_isDisposed)
				return null;
			var state : IState = null;
			if (type > 0)
			{
				state = _states[type];
				if (!state)
				{
					state = createState(type);
					_states[type] = state;
				}
				state.init(this);
			}
			return state;
		}
		
		public function getCurrState(tribe : Class) : IState
		{
			if (_isDisposed)
				return null;
			return _currStates[getQualifiedClassName(tribe)];
		}
		
		public function getLastState(tribe : Class) : IState
		{
			if (_isDisposed)
				return null;
			return _lastStates[getQualifiedClassName(tribe)];
		}
		
		public function set usePass(value : Boolean) : void
		{
			_usePass = value;
		}
		
		public function getReference(referenceType : Class, key : Object = null) : StateReference
		{
			if (!_referenceMapping)
				return null;
			if (key == null)
			{
				key = referenceType;
			}
			var reference : StateReference = _referenceMapping[key];
			if (!reference)
			{
				reference = new referenceType();
				_referenceMapping[key] = reference;
			}
			reference.reset();
			return reference;
		}
		
		public function get isDisposed() : Boolean
		{
			return _isDisposed;
		}
		
		public function dispose() : void
		{
			if (_referenceMapping)
			{
				for (var key : Object in _referenceMapping)
				{
					var ref : StateReference = _referenceMapping[key];
					ref.dispose();
					_referenceMapping[key] = null;
					delete _referenceMapping[key];
				}
			}
			var tribe : *;
			if (_currStates)
			{
				for (tribe in _currStates)
				{
					var state : IState = _currStates[tribe];
					state.dispose();
					_currStates[tribe] = null;
					delete _currStates[tribe];
				}
			}
			if (_lastStates)
			{
				for (tribe in _lastStates)
				{
					_lastStates[tribe] = null;
					delete _lastStates[tribe];
				}
			}
			if (_blockQueue)
			{
				for (var type : * in _blockQueue)
				{
					var data : StateBlockData = _blockQueue[type];
					data.dispose();
					_blockQueue[type] = null;
					delete _blockQueue[type];
				}
			}
			_owner = null;
			_isDisposed = true;
		}
		
		public function instanceDestroy() : void
		{
			dispose();
			if (_states)
			{
				for (var type : * in _states)
				{
					var state : IState = _states[type];
					state.dispose();
					_states[type] = null;
					delete _states[type];
				}
				_states = null;
			}
			_referenceMapping = null;
			_currStates = null;
			_lastStates = null;
			_blockQueue = null;
		}
		
		public function instanceDispose() : void
		{
			dispose();
		}
	}
}
