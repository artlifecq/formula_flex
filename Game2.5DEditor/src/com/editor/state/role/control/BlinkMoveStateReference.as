package com.editor.state.role.control
{
	import com.editor.enum.SpellBlinkType;
	import com.editor.fight.spell.ReleaseSpellInfo;
	import com.game.engine3D.state.role.RoleStateReference;
	import com.game.engine3D.utils.MathUtil;

	import flash.geom.Point;

	/**
	 *
	 * 闪烁移动状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-21 上午10:25:12
	 *
	 */
	public class BlinkMoveStateReference extends RoleStateReference
	{
		private var _atkorPos : Point;
		private var _targetPos : Point;
		private var _moveSpeed : int;
		private var _moveFunc : Function;
		private var _hitFrameFunc : Function;
		private var _hitFrameFuncArgs : Array;
		private var _spellInfo : ReleaseSpellInfo;
		private var _rotationY : Number;
		private var _blinkHeight : int;
		private var _soarFrameTime : int;
		private var _hitFrameTime : int;
		private var _throwDelayTime : int;
		private var _speed : Number;

		public function BlinkMoveStateReference()
		{
			super();
		}

		public function setParams(atkorPos : Point, targetPos : Point, moveSpeed : int, blinkHeight : int, soarFrameTime : int, hitFrameTime : int, spellInfo : ReleaseSpellInfo, speed : Number = 1) : void
		{
			_atkorPos = atkorPos;
			_targetPos = targetPos;
			_moveSpeed = moveSpeed;
			_blinkHeight = blinkHeight;
			_soarFrameTime = soarFrameTime;
			_hitFrameTime = hitFrameTime;
			_spellInfo = spellInfo;
			_throwDelayTime = _spellInfo.throwDelayTime;
			_speed = speed;
			_rotationY = 0;
		}

		public function get spellInfo() : ReleaseSpellInfo
		{
			return _spellInfo;
		}

		public function get speed() : Number
		{
			return _speed;
		}

		public function get atkorPos() : Point
		{
			return _atkorPos;
		}

		public function get targetPos() : Point
		{
			return _targetPos;
		}

		public function get moveSpeed() : int
		{
			return _moveSpeed;
		}

		public function get rotationY() : Number
		{
			return _rotationY;
		}

		public function set rotationY(value : Number) : void
		{
			_rotationY = value;
		}

		public function onMove(func : Function) : BlinkMoveStateReference
		{
			_moveFunc = func;
			return this;
		}

		public function get blinkHeight() : int
		{
			return _blinkHeight;
		}

		public function get soarFrameTime() : int
		{
			return _soarFrameTime;
		}

		public function get totalTime() : int
		{
			var totalTime : int = 0;
			if (spellInfo.blinkType != SpellBlinkType.SHAN_SHUO)
			{
				var distance : Number = MathUtil.getDistance(atkorPos.x, atkorPos.y, targetPos.x, targetPos.y);
				totalTime = moveSpeed > 0 ? (distance / moveSpeed * 1000) : 0;
				if (totalTime < _hitFrameTime)
					totalTime = _hitFrameTime;
			}
			return totalTime;
		}

		public function get hitFrameTime() : int
		{
			return _hitFrameTime;
		}

		public function get throwDelayTime() : int
		{
			return _throwDelayTime;
		}

		internal function move() : void
		{
			if (_moveFunc != null)
				_moveFunc(this);
		}

		/**
		 * 判定帧
		 * @param func(ref:StateRef):void
		 * @return
		 *
		 */
		public function onHitFrame(func : Function, ... args) : BlinkMoveStateReference
		{
			_hitFrameFunc = func;
			_hitFrameFuncArgs = args;
			return this;
		}

		internal function hitFrame() : void
		{
			var args : Array;
			if (_hitFrameFuncArgs && _hitFrameFuncArgs.length)
				args = _hitFrameFuncArgs.concat(this);
			else
				args = [this];
			if (_hitFrameFunc != null)
				_hitFrameFunc.apply(null, args);
		}

		override public function dispose() : void
		{
			_hitFrameFunc = null;
			_hitFrameFuncArgs = null;
			_moveFunc = null;
			_atkorPos = null;
			_targetPos = null;
			_spellInfo = null;
			_speed = 0;
			super.dispose();
		}
	}
}
