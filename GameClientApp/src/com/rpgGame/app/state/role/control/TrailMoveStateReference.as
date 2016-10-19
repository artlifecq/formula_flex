package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;
	import com.rpgGame.coreData.info.move.TrailPathPoint;

	/**
	 *
	 * 轨道移动状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2016-6-23 上午10:15:16
	 *
	 */
	public class TrailMoveStateReference extends RoleStateReference
	{
		/**
		 * 路径
		 */
		private var _pathPoints : Vector.<TrailPathPoint>;

		private var _readyFunc : Function;
		private var _unableFunc : Function;
		private var _throughFunc : Function;
		private var _throughFuncArgs : Array;
		private var _moveFunc : Function;
		private var _updateFunc : Function;
		private var _arriveFunc : Function;
		private var _arriveFuncArgs : Array;
		private var _stopFunc : Function;
		private var _endFunc : Function;
		private var _syncFunc : Function;
		private var _isClingGround : Boolean;
		private var _startTime : Number;

		public var nextPos : TrailPathPoint;
		public var nextPosGapTm : int;
		public var path : Vector.<TrailPathPoint>;
		public var startPos : TrailPathPoint;
		public var endPos : TrailPathPoint;

		/**
		 * 速度
		 * 1s经过的距离单位数(m/s)
		 */
		private var _speed : int;
		private var _statusType : String;
		private var _baseActionSpeed : int;

		public function TrailMoveStateReference()
		{
			super();
		}

		public function setParams(pathPoints : Vector.<TrailPathPoint>, isClingGround : Boolean, startTime : Number) : void
		{
			_pathPoints = pathPoints;
			_isClingGround = isClingGround;
			_startTime = startTime;
		}

		public function get pathPoints() : Vector.<TrailPathPoint>
		{
			return _pathPoints;
		}

		public function get startTime() : Number
		{
			return _startTime;
		}

		public function get isClingGround() : Boolean
		{
			return _isClingGround;
		}

		public function get speed() : int
		{
			return _speed;
		}

		public function set speed(value : int) : void
		{
			_speed = value;
		}

		public function set statusType(value : String) : void
		{
			_statusType = value;
		}

		public function get statusType() : String
		{
			return _statusType;
		}

		public function get baseActionSpeed() : int
		{
			return _baseActionSpeed;
		}

		public function set baseActionSpeed(value : int) : void
		{
			_baseActionSpeed = value;
		}

		public function onReady(func : Function) : TrailMoveStateReference
		{
			_readyFunc = func;
			return this;
		}

		public function onUnable(func : Function) : TrailMoveStateReference
		{
			_unableFunc = func;
			return this;
		}

		public function onThrough(func : Function, ... args) : TrailMoveStateReference
		{
			_throughFunc = func;
			_throughFuncArgs = args;
			return this;
		}

		public function onMove(func : Function) : TrailMoveStateReference
		{
			_moveFunc = func;
			return this;
		}

		public function onUpdate(func : Function) : TrailMoveStateReference
		{
			_updateFunc = func;
			return this;
		}

		public function onArrive(func : Function, ... args) : TrailMoveStateReference
		{
			_arriveFunc = func;
			_arriveFuncArgs = args;
			return this;
		}

		public function onEnd(func : Function) : TrailMoveStateReference
		{
			_endFunc = func;
			return this;
		}

		public function onStop(func : Function) : TrailMoveStateReference
		{
			_stopFunc = func;
			return this;
		}

		public function onSync(func : Function) : TrailMoveStateReference
		{
			_syncFunc = func;
			return this;
		}

		internal function ready() : void
		{
			if (_readyFunc != null)
				_readyFunc(this);
		}

		internal function unable() : void
		{
			if (_unableFunc != null)
				_unableFunc(this);
		}

		internal function through() : void
		{
			var args : Array;
			if (_throughFuncArgs && _throughFuncArgs.length)
				args = _throughFuncArgs.concat(this);
			else
				args = [this];
			if (_throughFunc != null)
				_throughFunc.apply(null, args);
		}

		internal function move() : void
		{
			if (_moveFunc != null)
				_moveFunc(this);
		}

		internal function update() : void
		{
			if (_updateFunc != null)
				_updateFunc(this);
		}

		internal function arrive() : void
		{
			var args : Array;
			if (_arriveFuncArgs && _arriveFuncArgs.length)
				args = _arriveFuncArgs.concat(this);
			else
				args = [this];
			if (_arriveFunc != null)
				_arriveFunc.apply(null, args);
		}

		internal function stop() : void
		{
			if (_stopFunc != null)
				_stopFunc(this);
		}

		internal function end() : void
		{
			if (_endFunc != null)
				_endFunc(this);
		}

		internal function sync() : void
		{
			if (_syncFunc != null)
				_syncFunc(this);
		}

		override public function dispose() : void
		{
			if (_pathPoints)
			{
				_pathPoints.length = 0;
				_pathPoints = null;
			}
			_startTime = 0;
			_isClingGround = false;
			_readyFunc = null;
			_unableFunc = null;
			_throughFunc = null;
			_throughFuncArgs = null;
			_moveFunc = null;
			_updateFunc = null;
			_arriveFunc = null;
			_arriveFuncArgs = null;
			_stopFunc = null;
			_endFunc = null;
			_syncFunc = null;
			nextPos = null;
			path = null;
			startPos = null;
			endPos = null;
			_speed = 0;
			_statusType = null;
			_baseActionSpeed = 0;
			super.dispose();
		}
	}
}
