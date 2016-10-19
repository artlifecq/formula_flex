package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.state.role.RoleStateReference;
	import com.rpgGame.app.fight.spell.ReleaseSpellInfo;

	import flash.geom.Point;

	/**
	 *
	 * 攻击状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-10 上午10:15:16
	 *
	 */
	public class AttackStateReference extends RoleStateReference
	{
		private var _spellInfo : ReleaseSpellInfo;
		private var _targetRolePos : Point;
		private var _angle : int;
		private var _statusType : String;
		private var _soarFrameTime : int;
		private var _hitFrameTime : int;
		private var _throwFrameTime : int;
		private var _speed : Number;
		private var _castTime : int;
		private var _releaseEndHard : int;
		private var _hitFrameFunc : Function;
		private var _breakFrameFunc : Function;
		private var _totalFrameFunc : Function;

		public function AttackStateReference()
		{
			super();
		}

		public function setParams(spellInfo : ReleaseSpellInfo, statusType : String, speed : Number = 1, soarFrameTime : int = 0, releaseEndHard : int = 0) : void
		{
			_spellInfo = spellInfo;
			_targetRolePos = (spellInfo.targetRole && spellInfo.targetRole.usable) ? new Point(spellInfo.targetRole.x, spellInfo.targetRole.z) : spellInfo.targetPos;
			_castTime = spellInfo.castTime;
			_angle = spellInfo.releaseAngle;
			_speed = speed;
			_statusType = statusType;
			_soarFrameTime = soarFrameTime;
			_releaseEndHard = releaseEndHard;
		}

		public function get spellInfo() : ReleaseSpellInfo
		{
			return _spellInfo;
		}

		public function get statusType() : String
		{
			return _statusType;
		}

		public function get castTime() : int
		{
			return _castTime;
		}

		public function get speed() : Number
		{
			return _speed;
		}

		public function get releaseEndHard() : int
		{
			return _releaseEndHard;
		}

		public function get soarFrameTime() : int
		{
			return _soarFrameTime;
		}

		public function get targetRolePos() : Point
		{
			return _targetRolePos;
		}

		public function get angle() : int
		{
			return _angle;
		}

		/**
		 * 判定帧
		 * @param func(ref:StateRef):void
		 * @return
		 *
		 */
		public function onHitFrame(func : Function) : AttackStateReference
		{
			_hitFrameFunc = func;
			return this;
		}

		/**
		 * 打断帧
		 * @param func(ref:StateRef):void
		 * @return
		 *
		 */
		public function onBreakFrame(func : Function) : AttackStateReference
		{
			_breakFrameFunc = func;
			return this;
		}

		/**
		 * 总帧
		 * @param func(ref:StateRef):void
		 * @return
		 *
		 */
		public function onTotalFrame(func : Function) : AttackStateReference
		{
			_totalFrameFunc = func;
			return this;
		}

		public function get hitFrameTime() : int
		{
			return _hitFrameTime;
		}

		internal function setHitFrameTime(value : int) : void
		{
			_hitFrameTime = value;
		}

		public function get throwFrameTime() : int
		{
			return _throwFrameTime;
		}

		internal function setThrowFrameTime(value : int) : void
		{
			_throwFrameTime = value;
		}

		internal function hitFrame() : void
		{
			if (_hitFrameFunc != null)
				_hitFrameFunc(this);
		}

		internal function breakFrame() : void
		{
			if (_breakFrameFunc != null)
				_breakFrameFunc(this);
		}

		internal function totalFrame() : void
		{
			if (_totalFrameFunc != null)
				_totalFrameFunc(this);
		}

		override public function dispose() : void
		{
			_spellInfo = null;
			_targetRolePos = null;
			_angle = 0;
			_statusType = null;
			_soarFrameTime = 0;
			_hitFrameTime = 0;
			_throwFrameTime = 0;
			_speed = 0;
			_castTime = 0;
			_releaseEndHard = 0;
			_hitFrameFunc = null;
			_breakFrameFunc = null;
			_totalFrameFunc = null;
			super.dispose();
		}
	}
}
