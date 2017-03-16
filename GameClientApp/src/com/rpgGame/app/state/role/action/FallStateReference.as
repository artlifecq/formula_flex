package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.state.role.RoleStateReference;
	
	import flash.geom.Point;

	/**
	 *
	 * 击倒状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-7 下午5:25:12
	 *
	 */
	public class FallStateReference extends RoleStateReference
	{
		/**
		 * 硬直时间
		 */
		private var _stiffTime : int;
		
		private var _targetPos : Point;
		private var _atkorPos : Point;
		private var _moveSpeed : int;
		private var _moveFunc : Function;

		public function FallStateReference()
		{
			super();
		}

		public function setParams(stiffTime:int,targetPos : Point, atkorPos : Point, moveSpeed : int) : void
		{
			_stiffTime = stiffTime;
			_targetPos = targetPos;
			_atkorPos = atkorPos;
			_moveSpeed = moveSpeed;
		}

		public function get stiffTime() : int
		{
			return _stiffTime;
		}
		
		public function get targetPos() : Point
		{
			return _targetPos;
		}
		
		public function get atkorPos() : Point
		{
			return _atkorPos;
		}
		
		public function get moveSpeed() : int
		{
			return _moveSpeed;
		}
		
		public function onMove(func : Function) : FallStateReference
		{
			_moveFunc = func;
			return this;
		}
		
		internal function move() : void
		{
			if (_moveFunc != null)
				_moveFunc(this);
		}
		
		override public function dispose() : void
		{
			_moveFunc = null;
			_targetPos = null;
			_atkorPos = null;
			super.dispose();
		}
	}
}
