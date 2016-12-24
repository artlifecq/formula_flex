package com.editor.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;

	import flash.geom.Point;

	/**
	 *
	 * 被击移动状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-21 上午10:25:12
	 *
	 */
	public class BeatMoveStateReference extends RoleStateReference
	{
		private var _targetPos : Point;
		private var _atkorPos : Point;
		private var _moveSpeed : int;
		private var _moveFunc : Function;

		public function BeatMoveStateReference()
		{
			super();
		}

		public function setParams(targetPos : Point, atkorPos : Point, moveSpeed : int) : void
		{
			_targetPos = targetPos;
			_atkorPos = atkorPos;
			_moveSpeed = moveSpeed;
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

		public function onMove(func : Function) : BeatMoveStateReference
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
