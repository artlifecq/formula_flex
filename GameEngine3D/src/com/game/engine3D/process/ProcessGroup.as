package com.game.engine3D.process
{

	/**
	 *
	 * 流程组
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午3:12:31
	 *
	 */
	public class ProcessGroup implements IProcess
	{
		protected var _preSet : Array;
		private var _processSet : Array;
		protected var _onCompleteNotify : Function;
		private var _fromPercent : Number;
		private var _toPercent : Number;
		protected var _isProcessing : Boolean;
		protected var _isProcessed : Boolean;

		public function ProcessGroup()
		{
			_preSet = [];
			_fromPercent = 0;
			_toPercent = 1;
			_isProcessing = false;
			_isProcessed = false;
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
			_processSet = _preSet.slice();
			for each (var process : IProcess in _preSet)
			{
				process.setOnCompleteNotify(onCompleteNotify);
				process.startProcess();
			}
			setProcessPercent(0);
		}

		public function completeProcess() : void
		{
			setProcessPercent(1);
			if (_onCompleteNotify != null)
				_onCompleteNotify(this);
			_isProcessing = false;
			_isProcessed = true;
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

		public function addPreProcess(state : String, fromPercent : Number = 0, toPercent : Number = 1) : void
		{
			var process : IProcess = ProcessStateMachine.getInstance().getProcess(state);
			if (process)
			{
				if (_preSet.indexOf(process) == -1)
				{
					process.fromPercent = fromPercent;
					process.toPercent = toPercent;
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

		private function onCompleteNotify(process : IProcess) : void
		{
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
		}

		public function free() : void
		{
			_preSet.length = 0;
			if (_processSet)
				_processSet.length = 0;
		}

		public function preProcessIsHangUp(state : String) : Boolean
		{
			return getPreProcessIsHangUp(state, _preSet);
		}

		private function getPreProcessIsHangUp(state : String, preSet : Array) : Boolean
		{
			var isHangUp : Boolean = false;
			for each (var process : IProcess in preSet)
			{
				if (process is ProcessGroup)
				{
					isHangUp = getPreProcessIsHangUp(state, (process as ProcessGroup)._preSet);
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

		public function dispose() : void
		{
			free();
			_preSet = null;
			_processSet = null;
			_onCompleteNotify = null;
			_fromPercent = 0;
			_toPercent = 0;
			_isProcessing = false;
			_isProcessed = false;
		}
	}
}
