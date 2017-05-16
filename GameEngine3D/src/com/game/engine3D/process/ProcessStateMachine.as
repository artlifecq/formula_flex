package com.game.engine3D.process
{
	import flash.utils.Dictionary;
	import flash.utils.getTimer;

	/**
	 *
	 * 流程状态机
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午3:12:31
	 *
	 */
	public class ProcessStateMachine extends ProcessGroup
	{
		private static var _instance : ProcessStateMachine;

		public static function getInstance() : ProcessStateMachine
		{
			if (!_instance)
			{
				_instance = new ProcessStateMachine();
			}
			return _instance;
		}

		private var _processDic : Dictionary;
		private var _currProcess : IProcess;
		private var _preIndex : int;
		private var _startTime : Number;

		public function ProcessStateMachine()
		{
			super();
			_processDic = new Dictionary();
			_preIndex = 0;
			_currProcess = null;
		}

		public function pushProcess(process : IProcess) : void
		{
			if (_processDic[process.getState()])
				throw new Error("流程已存在！");
			_processDic[process.getState()] = process;
		}

		public function insertPreProcess(state : String) : void
		{
			var process : IProcess = ProcessStateMachine.getInstance().getProcess(state);
			if (process)
			{
				if (_preSet.indexOf(process) == -1)
				{
					var index : int = _preSet.indexOf(_currProcess);
					_preSet.splice(index + 1, 0, process);
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

		public function getProcess(state : String) : IProcess
		{
			return _processDic[state];
		}

		public function run() : void
		{
			if (!_isProcessing)
			{
				_preIndex = 0;
				if (_preSet.length > 0)
				{
					_isProcessing = true;
					nextProcess();
				}
				else
				{
					throw new Error("状态机没有可运行流程！");
				}
			}
			else
			{
				throw new Error("流程状态机运行时不可再次运行！");
			}
		}

		override public function free() : void
		{
			super.free();
			_preIndex = 0;
			if (_currProcess)
			{
				_currProcess.dispose();
				_currProcess = null;
			}
		}

		private function nextProcess() : void
		{
			var index : int = _preSet.indexOf(_currProcess);
			_preIndex = index + 1;
			if (_currProcess)
			{
				_currProcess.dispose();
				_currProcess = null;
			}
			var process : IProcess = _preSet[_preIndex] as IProcess;
			if (process)
			{
				_currProcess = process;
				trace(this, _currProcess.getState() + "开始...");
				_currProcess.setOnCompleteNotify(onCompleteNotify);
				_startTime = getTimer();
				if (!_currProcess.isProcessing)
				{
					_currProcess.startProcess();
				}
			}
			else
			{
				throw new Error("流程异常！");
			}
		}

		public function rollback() : void
		{
			var index : int = _preSet.indexOf(_currProcess);
			_preIndex = index - 1;
			if (_currProcess)
			{
				_currProcess.dispose();
				_currProcess = null;
			}
			var process : IProcess = _preSet[_preIndex] as IProcess;
			if (process)
			{
				_currProcess = process;
				trace(this, _currProcess.getState() + "开始...");
				_currProcess.setOnCompleteNotify(onCompleteNotify);
				_startTime = getTimer();
				if (!_currProcess.isProcessing)
				{
					_currProcess.startProcess();
				}
			}
			else
			{
				throw new Error("流程异常！");
			}
		}

		public function gotoProcess(state : String) : void
		{
			if (_currProcess)
			{
				_currProcess.dispose();
				_currProcess = null;
			}
			var process : IProcess = ProcessStateMachine.getInstance().getProcess(state);
			if (process)
			{
				_preIndex = _preSet.indexOf(process);
				_currProcess = process;
				trace(this, _currProcess.getState() + "开始...");
				_currProcess.setOnCompleteNotify(onCompleteNotify);
				_startTime = getTimer();
				if (!_currProcess.isProcessing)
				{
					_currProcess.startProcess();
				}
			}
			else
			{
				throw new Error("试图访问不存在的流程！");
			}
		}

		private function onCompleteNotify(process : IProcess) : void
		{
			if (_currProcess)
			{
				trace(this, _currProcess.getState(), "结束 耗时：" + (getTimer() - _startTime) + "ms");
				if (_preIndex < _preSet.length - 1)
				{
					nextProcess();
				}
				else
				{
					free();
					completeProcess();
				}
			}
		}

		public function get currState() : String
		{
			return _currProcess ? _currProcess.getState() : null;
		}

		public function get currProcess() : IProcess
		{
			return _currProcess;
		}
	}
}
