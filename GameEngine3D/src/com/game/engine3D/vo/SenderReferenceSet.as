package com.game.engine3D.vo
{
	import com.game.mainCore.core.timer.GameTimer;

	import flash.utils.getTimer;

	/**
	 *
	 * 消息发送引用集合
	 * @author L.L.M.Sunny
	 * 创建时间：2016-1-14 上午10:15:16
	 *
	 */
	public class SenderReferenceSet extends ReferenceSet
	{
		private static var _senderMap : Vector.<SenderReferenceSet> = new Vector.<SenderReferenceSet>();
		private static var _isRunning : Boolean = false;

		public static function start() : void
		{
			if (_isRunning)
			{
				return;
			}
			_isRunning = true;
			for each (var sender : SenderReferenceSet in _senderMap)
			{
				sender._dataUpdateTime = 0;
				sender.onCallBack();
			}
		}

		public static function stop() : void
		{
			if (!_isRunning)
			{
				return;
			}
			_isRunning = false;
		}

		private var _dataChanged : Boolean = true;
		private var _dataLocked : Boolean = false;
		private var _dataUpdateTime : Number = 0;

		private var _callBack : Function;
		private var _currTime : int;
		private var _delay : int;
		private var _timer : GameTimer;

		public function SenderReferenceSet(name : String, callBack : Function, delay : int)
		{
			super();
			_callBack = callBack;
			_delay = delay;
			_timer = new GameTimer(name, 1000, 0, onCallBack);
			_senderMap.push(this);
		}

		public function dataChanged() : void
		{
			_dataChanged = true;
			onCallBack();
		}

		private function timeOut() : void
		{
			_currTime = getTimer();
			_dataUpdateTime = _currTime + _delay;
			_dataChanged = false;
		}

		private function checkPass() : Boolean
		{
			_currTime = getTimer();
			return _isRunning && !_dataLocked && (refCount > 0 && (_dataChanged || _currTime >= _dataUpdateTime));
		}

		public function lock() : void
		{
			_dataLocked = true;
		}

		public function unlock() : void
		{
			_dataLocked = false;
			onCallBack();
		}

		private function onCallBack() : void
		{
			if (checkPass())
			{
				_callBack();
				timeOut();
			}
		}

		override public function addRef(ref : Object) : Boolean
		{
			var flag : Boolean = super.addRef(ref);
			if (flag)
			{
				onCallBack();
				_timer.delay = _delay;
				_timer.reset();
				_timer.start();
			}
			return flag;
		}

		override public function removeRef(ref : Object) : Boolean
		{
			var flag : Boolean = super.removeRef(ref);
			if (flag)
			{
				if (refCount <= 0)
				{
					_timer.stop();
				}
			}
			return flag;
		}

		override public function dispose() : void
		{
			var index : int = _senderMap.indexOf(this);
			if (index > -1)
			{
				_senderMap.splice(index, 1);
			}
			super.dispose();
		}
	}
}
