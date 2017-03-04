package com.game.engine3D.process
{

	/**
	 *
	 * 基础流程
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午3:12:31
	 *
	 */
	public class BaseProcess implements IProcess
	{
		private var _onCompleteNotify : Function;
		private var _fromPercent : Number;
		private var _toPercent : Number;
		private var _isProcessing : Boolean;
		private var _isProcessed : Boolean;

		public function BaseProcess()
		{
			_fromPercent = 0;
			_toPercent = 1;
			_isProcessing = false;
			_isProcessed = false;
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
			value = value < 0 ? 0 : value;
			value = value > 1 ? 1 : value;
			processHandler(_fromPercent + (_toPercent - _fromPercent) * value);
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
			_onCompleteNotify = null;
			_fromPercent = 0;
			_toPercent = 0;
			_isProcessing = false;
			_isProcessed = false;
		}
	}
}
