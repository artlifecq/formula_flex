package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.coreData.info.move.RoleMoveInfo;
	import com.rpgGame.netData.structs.Position;
	
	import flash.geom.Vector3D;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;

	/**
	 *
	 * 行走移动状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-10 上午10:15:16
	 *
	 */
	public class WalkMoveStateReference extends RoleStateReference
	{
		/**
		 * 矢量路径
		 */
		private var _vectorPath : Vector3D;
		/**
		 * 位移信息
		 */
		private var _moveInfo : RoleMoveInfo;
		/**
		 * 速度
		 * 1s经过的距离单位数(m/s)
		 */
		private var _speed : int;
		private var _spacing : int;

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
		private var _debugPosFunc:Function;
		
		public var nextPos : Vector3D;
		public var nextGridPos : Vector3D;
		public var nextPosGapTm : int;
		public var path : Vector.<Vector3D>;
		public var startPos : Vector3D;
		public var endPos : Vector3D;
		public var isServerStop : Boolean;
		public var leftPath:Vector.<Vector3D>;
		/**
		 *是否需要冲刺 
		 */		
		public var needSpriteUp:Boolean=false;
		
		public var serverRunTimeHash:HashMap;
		public function WalkMoveStateReference()
		{
			super();
			serverRunTimeHash=new HashMap();
		}
		public function setServerTime(pos:Position):void
		{
			serverRunTimeHash.put(pos.x+"_"+pos.y,getTimer());
		}
		internal function getServerClientTimeDiff(x:int,y:int):int
		{
			var key:String=x+"_"+y;
			var serverTime:int=serverRunTimeHash.remove(key);
			if (serverTime==0) 
			{
				return 0;
			}
			return serverTime-getTimer();
		}
		public function setParams(speed : int, spacing : int, vectorPath : Vector3D = null, moveInfo : RoleMoveInfo = null) : void
		{
			serverRunTimeHash.clear();
			_speed = speed;
			_spacing = spacing;
			_vectorPath = vectorPath;
			_moveInfo = moveInfo;
			isServerStop = false;
			needSpriteUp=false;
		}

		public function get vectorPath() : Vector3D
		{
			return _vectorPath;
		}

		public function get moveInfo() : RoleMoveInfo
		{
			return _moveInfo;
		}

		public function get speed() : int
		{
			return _speed;
		}

		public function get spacing() : int
		{
			return _spacing;
		}

		public function onReady(func : Function) : WalkMoveStateReference
		{
			_readyFunc = func;
			return this;
		}

		public function onUnable(func : Function) : WalkMoveStateReference
		{
			_unableFunc = func;
			return this;
		}

		public function onThrough(func : Function, ... args) : WalkMoveStateReference
		{
			_throughFunc = func;
			_throughFuncArgs = args;
			return this;
		}

		public function get throughFuncArgs() : Array
		{
			return _throughFuncArgs;
		}

		public function onMove(func : Function) : WalkMoveStateReference
		{
			_moveFunc = func;
			return this;
		}

		public function onUpdate(func : Function) : WalkMoveStateReference
		{
			_updateFunc = func;
			return this;
		}

		public function onArrive(func : Function, ... args) : WalkMoveStateReference
		{
			_arriveFunc = func;
			_arriveFuncArgs = args;
			return this;
		}
		public function onDebugPos(func : Function) : WalkMoveStateReference
		{
			_debugPosFunc=func;
			return this;
		}
		public function onStop(func : Function) : WalkMoveStateReference
		{
			_stopFunc = func;
			return this;
		}

		public function onEnd(func : Function) : WalkMoveStateReference
		{
			_endFunc = func;
			return this;
		}

		public function onSync(func : Function) : WalkMoveStateReference
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
			
			if (_debugPosFunc) 
			{
				_debugPosFunc.apply(null, [this]);
			}
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
			_vectorPath = null;
			_moveInfo = null;
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
			nextGridPos = null;
			path = null;
			startPos = null;
			endPos = null;
			_speed = 0;
			_spacing = 0;
			isServerStop = false;
			needSpriteUp=false;
			leftPath=null;
			_debugPosFunc=null;
			super.dispose();
		}
	}
}
