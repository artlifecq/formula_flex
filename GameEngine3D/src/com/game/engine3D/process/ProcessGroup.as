package com.game.engine3D.process
{
	import away3d.utils.GCObject;

	/**
	 *
	 * 流程组
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午3:12:31
	 *
	 */
	public class ProcessGroup extends GCObject implements IProcessGroup
	{
		protected var _preSet : Array;
		private var _processSet : Array;
		private var _onCompleteNotify : Function;
		private var _holdOnNotify : Function;
		private var _fromPercent : Number;
		private var _toPercent : Number;
		private var _masterProcess : IProcess;
		private var _group : IProcessGroup;
		protected var _isProcessing : Boolean;
		protected var _isProcessed : Boolean;
		private var _parallelism : Boolean;
		private var _currPercent : Number;

		public function ProcessGroup()
		{
			_preSet = [];
			_fromPercent = 0;
			_toPercent = 1;
			_isProcessing = false;
			_isProcessed = false;
			_parallelism = false;
			_masterProcess = null;
			_group = null;
			_currPercent = 0;
			_onCompleteNotify = null;
			_holdOnNotify = null;
		}

		public function setHoldOnNotify(fun : Function) : void
		{
			_holdOnNotify = fun;
		}

		public function setOnCompleteNotify(fun : Function) : void
		{
			_onCompleteNotify = fun;
		}

		public function getState() : String
		{
			var states : Array = [];
			for each (var process : IProcess in _preSet)
			{
				states.push(process.getState());
			}
			return states.join("|");
		}

		public function startProcess() : void
		{
			if (_isProcessing)
			{
				return;
			}
			_isProcessing = true;
			_isProcessed = false;
			setProcessPercent(0);
			if (_preSet.length > 0)
			{
				_processSet = _preSet.slice();
				var hasParallelismMaster : Boolean = false;
				var tempSet : Array = _preSet.slice();
				for each (var process : IProcess in tempSet)
				{
					if (process.parallelism)
					{
						hasParallelismMaster = true;
						if (!_masterProcess)
						{
							_masterProcess = process;
							_masterProcess.switchMaster();
						}
						process.setOnCompleteNotify(onCompleteNotify);
						process.setHoldOnNotify(onHoldOnNotify);
						if (!process.isProcessing)
						{
							process.startProcess();
						}
					}
					else if (!hasParallelismMaster)
					{
						_masterProcess = process;
						_masterProcess.switchMaster();
						process.setOnCompleteNotify(onCompleteNotify);
						process.setHoldOnNotify(onHoldOnNotify);
						if (!process.isProcessing)
						{
							process.startProcess();
						}
						break;
					}
				}
			}
			else
			{
				free();
				completeProcess();
			}
		}

		public function completeProcess() : void
		{
			setProcessPercent(1);
			if (_onCompleteNotify != null)
				_onCompleteNotify(this);
			_isProcessing = false;
			_isProcessed = true;
			_parallelism = false;
		}

		public function holdOnProcess() : void
		{
			if (_holdOnNotify != null)
				_holdOnNotify(this);
		}

		public function set fromPercent(value : Number) : void
		{
			_fromPercent = value;
		}

		public function set toPercent(value : Number) : void
		{
			_toPercent = value;
		}

		public function processHandler(percent : Number) : void
		{
		}

		public function setProcessPercent(value : Number) : void
		{
			_currPercent = value;
			value = value < 0 ? 0 : value;
			value = value > 1 ? 1 : value;
			processHandler(_fromPercent + (_toPercent - _fromPercent) * value);
		}

		public function addPreGroup(group : ProcessGroup) : void
		{
			if (_preSet.indexOf(group) == -1)
			{
				_preSet.push(group);
			}
			else
			{
				throw new Error("预流程已存在！");
			}
		}

		/**
		 *
		 * @param state
		 * @param fromPercent
		 * @param toPercent
		 * @param parallelism 是否并行
		 *
		 */
		public function addPreProcess(state : String, fromPercent : Number = 0, toPercent : Number = 1, parallelism : Boolean = false) : void
		{
			var process : IProcess = ProcessStateMachine.getInstance().getProcess(state);
			if (process)
			{
				if (_preSet.indexOf(process) == -1)
				{
					process.fromPercent = fromPercent;
					process.toPercent = toPercent;
					process.group = this;
					process.parallelism = parallelism;
					_preSet.push(process);
				}
				else
				{
					throw new Error("预流程已存在！");
				}
			}
			else
			{
				throw new Error("试图访问不存在的流程！");
			}
		}

		public function set parallelism(value : Boolean) : void
		{
			_parallelism = value;
		}

		public function get parallelism() : Boolean
		{
			return _parallelism;
		}

		private function onHoldOnNotify(process : IProcess) : void
		{
			var isMaster : Boolean = (_masterProcess == process);
			if (isMaster)
			{
				var isSerial : Boolean = !process.parallelism;
				if (isSerial)
				{
					var tempSet : Array = _processSet.slice();
					for each (process in tempSet)
					{
						if (process.parallelism)
						{
							process.setOnCompleteNotify(onCompleteNotify);
							process.setHoldOnNotify(onHoldOnNotify);
							if (!process.isProcessing)
							{
								process.startProcess();
							}
						}
					}
				}
			}
		}

		private function onCompleteNotify(process : IProcess) : void
		{
			var isMaster : Boolean = (_masterProcess == process);
			if (isMaster)
			{
				_masterProcess = null;
			}
			var isSerial : Boolean = !process.parallelism;
			var index : int = _processSet.indexOf(process);
			if (index != -1)
				_processSet.splice(index, 1);
			process.dispose();
			process = null;
			if (_processSet.length == 0)
			{
				free();
				completeProcess();
			}
			else
			{
				var hasParallelism : Boolean = false;
				var tempSet : Array = _processSet.slice();
				if (isSerial)
				{
					for each (process in tempSet)
					{
						if (process.parallelism)
						{
							hasParallelism = true;
							if (!_masterProcess)
							{
								_masterProcess = process;
								_masterProcess.switchMaster();
							}
							process.setOnCompleteNotify(onCompleteNotify);
							process.setHoldOnNotify(onHoldOnNotify);
							if (!process.isProcessing)
							{
								process.startProcess();
							}
						}
						else if (!hasParallelism)
						{
							_masterProcess = process;
							_masterProcess.switchMaster();
							process.setOnCompleteNotify(onCompleteNotify);
							process.setHoldOnNotify(onHoldOnNotify);
							if (!process.isProcessing)
							{
								process.startProcess();
							}
							break;
						}
					}
				}
				else if (isMaster)
				{
					for each (process in tempSet)
					{
						if (process.parallelism)
						{
							hasParallelism = true;
							_masterProcess = process;
							_masterProcess.switchMaster();
							break;
						}
					}
					if (!hasParallelism)
					{
						process = tempSet[0];
						_masterProcess = process;
						_masterProcess.switchMaster();
						_masterProcess.setOnCompleteNotify(onCompleteNotify);
						_masterProcess.setHoldOnNotify(onHoldOnNotify);
						if (!_masterProcess.isProcessing)
						{
							_masterProcess.startProcess();
						}
					}
				}
			}
		}

		public function free() : void
		{
			_masterProcess = null;
			_preSet.length = 0;
			if (_processSet)
				_processSet.length = 0;
		}

		public function isHangUpMaster(process : IProcess) : Boolean
		{
			return getIsHangUpMaster(process, _processSet);
		}

		private function getIsHangUpMaster(process : IProcess, preSet : Array) : Boolean
		{
			var isHangUp : Boolean = false;
			var masterProcess : IProcess = (preSet && preSet.length > 0) ? preSet[0] : null;
			if (masterProcess)
			{
				if (masterProcess == process)
				{
					isHangUp = true;
				}
				else
				{
					if (masterProcess is ProcessGroup)
					{
						isHangUp = getIsHangUpMaster(process, (process as ProcessGroup)._processSet);
					}
				}
			}
			return isHangUp;
		}

		public function preProcessIsHangUp(state : String) : Boolean
		{
			return getPreProcessIsHangUp(state, _processSet);
		}

		private function getPreProcessIsHangUp(state : String, preSet : Array) : Boolean
		{
			var isHangUp : Boolean = false;
			for each (var process : IProcess in preSet)
			{
				if (process is ProcessGroup)
				{
					isHangUp = getPreProcessIsHangUp(state, (process as ProcessGroup)._processSet);
				}
				else
				{
					if (process.getState() == state)
						isHangUp = true;
				}
				if (isHangUp)
					break;
			}
			return isHangUp;
		}

		public function get isProcessing() : Boolean
		{
			return _isProcessing;
		}

		public function get isProcessed() : Boolean
		{
			return _isProcessed;
		}

		public function set group(value : IProcessGroup) : void
		{
			_group = value;
		}

		public function get group() : IProcessGroup
		{
			return _group;
		}

		public function switchMaster() : void
		{
			setProcessPercent(_currPercent);
		}

		public function dispose() : void
		{
			free();
			_currPercent = 0;
			_group = null;
			_onCompleteNotify = null;
			_holdOnNotify = null;
			_fromPercent = 0;
			_toPercent = 0;
			_isProcessing = false;
			_isProcessed = false;
			_parallelism = false;
			_preSet = null;
			_processSet = null;
		}
	}
}
