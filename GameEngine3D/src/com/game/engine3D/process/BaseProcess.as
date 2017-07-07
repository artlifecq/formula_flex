package com.game.engine3D.process
{
	import away3d.utils.GCObject;

	/**
	 *
	 * 基础流程
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午3:12:31
	 *
	 */
	public class BaseProcess extends GCObject implements IProcess
	{
		private var _onCompleteNotify : Function;
		private var _holdOnNotify : Function;
		private var _fromPercent : Number;
		private var _toPercent : Number;
		private var _isProcessing : Boolean;
		private var _isProcessed : Boolean;
		private var _group : IProcessGroup;
		private var _currPercent : Number;
		private var _parallelism : Boolean;

		public function BaseProcess()
		{
			_fromPercent = 0;
			_toPercent = 1;
			_isProcessing = false;
			_isProcessed = false;
			_group = null;
			_currPercent = 0;
			_parallelism = false;
			_onCompleteNotify = null;
			_holdOnNotify = null;
		}

		public function getState() : String
		{
			return null;
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
			if (!_group || _group.isHangUpMaster(this))
			{
				value = value < 0 ? 0 : value;
				value = value > 1 ? 1 : value;
				processHandler(_fromPercent + (_toPercent - _fromPercent) * value);
			}
		}

		public function switchMaster() : void
		{
			setProcessPercent(_currPercent);
		}

		public function setOnCompleteNotify(fun : Function) : void
		{
			_onCompleteNotify = fun;
		}

		public function startProcess() : void
		{
			_isProcessing = true;
			setProcessPercent(0);
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

		public function set parallelism(value : Boolean) : void
		{
			_parallelism = value;
		}

		public function get parallelism() : Boolean
		{
			return _parallelism;
		}

		public function setHoldOnNotify(fun : Function) : void
		{
			_holdOnNotify = fun;
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

		public function dispose() : void
		{
			_currPercent = 0;
			_group = null;
			_onCompleteNotify = null;
			_holdOnNotify = null;
			_fromPercent = 0;
			_toPercent = 0;
			_isProcessing = false;
			_isProcessed = false;
			_parallelism = false;
		}
	}
}
