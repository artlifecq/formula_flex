package com.editor.fight.spell
{
	import com.editor.cfg.ConfigData;
	import com.editor.scene.SceneRole;
	
	import flash.geom.Point;

	/**
	 *
	 * 释放技能信息
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 下午5:22:16
	 *
	 */
	public class ReleaseSpellInfo
	{
		private var _spellData : ConfigData;
		private var _atkor : SceneRole;
		private var _atkorPos : Point;
		private var _targetRole : SceneRole;
		private var _targetPos : Point;
		private var _caromStartFrameTime : int = 0;
		private var _breakFrameTime : int = 0;
		private var _hitFrameTime : int = 0;
		private var _throwDelayTime : int = 0;
		private var _releaseDelayTime : int = 0;
		private var _hurtDelayTime : int = 0;
		private var _ghostEffect : Boolean = false;
		private var _matchTerrain : Boolean = false;
		private var _blinkType : int = 0;
		private var _castTime : int = 0;
		private var _flySpeed : int = 0;
		private var _isTrackTarget : Boolean = false;
		private var _isRelateAction : Boolean = false;
		private var _isFlyCross : Boolean = false;
		private var _isAdaptiveTargetHeight : Boolean = false;
		private var _isTrapSpell : Boolean = false;
		private var _repeatTimes : int = 0;
		private var _repeatInterval : int = 0;
		public var flySceneObjID : int = 0;
		public var hurtLife : int = 0;

		public function ReleaseSpellInfo() : void
		{
		}

		public function setData(spellData : ConfigData, atkor : SceneRole, atkorX : int, atkorY : int, targetRole : SceneRole, targetX : int, targetY : int, blinkType : int, //
			castTime : int, flySpeed : int, isRelateAction : Boolean, isTrackTarget : Boolean, isFlyCross : Boolean, isAdaptiveTargetHeight : Boolean, repeatTimes : int, repeatInterval : int, isTrapSpell : Boolean) : void
		{
			_spellData = spellData;
			_atkor = atkor;
			_atkorPos = new Point(atkorX, atkorY);
			_targetRole = targetRole;
			_targetPos = new Point(targetX, targetY);
			_blinkType = blinkType;
			_castTime = castTime;
			_flySpeed = flySpeed;
			_isRelateAction = isRelateAction;
			_isTrackTarget = isTrackTarget;
			_isFlyCross = isFlyCross;
			_isAdaptiveTargetHeight = isAdaptiveTargetHeight;
			_repeatTimes = repeatTimes;
			_repeatInterval = repeatInterval;
			_isTrapSpell = isTrapSpell;
		}

		public function setFrameTime(caromStartFrameTime : int, breakFrameTime : int, hitFrameTime : int, throwDelayTime : int, releaseDelayTime : int, hurtDelayTime : int, ghostEffect : Boolean, matchTerrain : Boolean) : void
		{
			_caromStartFrameTime = caromStartFrameTime;
			_breakFrameTime = breakFrameTime;
			_hitFrameTime = hitFrameTime;
			_throwDelayTime = throwDelayTime;
			_releaseDelayTime = releaseDelayTime;
			_hurtDelayTime = hurtDelayTime;
			_ghostEffect = ghostEffect;
			_matchTerrain = matchTerrain;
		}

		public function get targetPos() : Point
		{
			return _targetPos;
		}

		public function get atkorPos() : Point
		{
			return _atkorPos;
		}

		public function get atkor() : SceneRole
		{
			if (_atkor && _atkor.usable)
				return _atkor;
			return null;
		}

		public function get spellData() : ConfigData
		{
			return _spellData;
		}

		public function get targetRole() : SceneRole
		{
			if (_targetRole && _targetRole.usable)
				return _targetRole;
			return null;
		}

		public function get caromStartFrameTime() : int
		{
			return _caromStartFrameTime;
		}

		public function get breakFrameTime() : int
		{
			return _breakFrameTime;
		}

		public function get hitFrameTime() : int
		{
			return _hitFrameTime;
		}

		public function get throwDelayTime() : int
		{
			return _throwDelayTime;
		}

		public function get releaseDelayTime() : int
		{
			return _releaseDelayTime;
		}

		public function get hurtDelayTime() : int
		{
			return _hurtDelayTime;
		}

		public function get ghostEffect() : Boolean
		{
			return _ghostEffect;
		}

		public function get matchTerrain() : Boolean
		{
			return _matchTerrain;
		}

		public function get blinkType() : int
		{
			return _blinkType;
		}

		public function get castTime() : int
		{
			return _castTime;
		}

		public function get flySpeed() : int
		{
			return _flySpeed;
		}

		public function get isTrackTarget() : Boolean
		{
			return _isTrackTarget;
		}

		public function get isRelateAction() : Boolean
		{
			return _isRelateAction;
		}

		public function get isFlyCross() : Boolean
		{
			return _isFlyCross;
		}

		public function get isAdaptiveTargetHeight() : Boolean
		{
			return _isAdaptiveTargetHeight;
		}

		public function get repeatInterval() : int
		{
			return _repeatInterval;
		}

		public function get repeatTimes() : int
		{
			return _repeatTimes;
		}

		public function get isTrapSpell() : Boolean
		{
			return _isTrapSpell;
		}
	}
}
