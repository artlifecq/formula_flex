package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;
	
	import flash.geom.Vector3D;
	
	/**
	 * 恐惧下四处乱走引用
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-9-8 上午10:49:24
	 */
	
	public class ScaredMoveStateReference extends RoleStateReference
	{
		private var _pathPoints : Vector.<Vector3D>;//角色上下左右4个点的坐标数组

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
		
		private var _endTime:Number;
		private var _speed:int;
		
		public function ScaredMoveStateReference()
		{
			super();
		}
		
		public function setParams(pathPoints : Vector.<Vector3D>,  endTime : Number, speed:int) : void
		{
			_pathPoints = pathPoints;
			_endTime = endTime;
			_speed = speed;
		}
		
		public function get speed():int
		{
			return _speed;
		}
		
		public function get endTime():Number
		{
			return _endTime;
		}
		
		public function get pathPoints():Vector.<Vector3D>
		{
			return _pathPoints;
		}
		
		public function onReady(func : Function) : ScaredMoveStateReference
		{
			_readyFunc = func;
			return this;
		}
		
		public function onUnable(func : Function) : ScaredMoveStateReference
		{
			_unableFunc = func;
			return this;
		}
		
		public function onThrough(func : Function, ... args) : ScaredMoveStateReference
		{
			_throughFunc = func;
			_throughFuncArgs = args;
			return this;
		}
		
		public function onMove(func : Function) : ScaredMoveStateReference
		{
			_moveFunc = func;
			return this;
		}
		
		public function onUpdate(func : Function) : ScaredMoveStateReference
		{
			_updateFunc = func;
			return this;
		}
		
		public function onArrive(func : Function, ... args) : ScaredMoveStateReference
		{
			_arriveFunc = func;
			_arriveFuncArgs = args;
			return this;
		}
		
		public function onEnd(func : Function) : ScaredMoveStateReference
		{
			_endFunc = func;
			return this;
		}
		
		public function onStop(func : Function) : ScaredMoveStateReference
		{
			_stopFunc = func;
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
		
		override public function dispose() : void
		{
			if (_pathPoints)
			{
				_pathPoints.length = 0;
				_pathPoints = null;
			}
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
			_endTime = 0;
			super.dispose();
		}
	}
}