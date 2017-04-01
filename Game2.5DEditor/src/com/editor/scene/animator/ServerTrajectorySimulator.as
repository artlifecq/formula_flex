package com.editor.scene.animator
{
	import com.editor.fight.spell.ReleaseSpellInfo;
	import com.editor.fight.spell.SpellHitHelper;
	import com.editor.manager.SpellFightManager;
	import com.editor.scene.SceneRole;
	import com.game.engine3D.utils.MathUtil;
	import com.game.mainCore.libCore.utils.ZMath;

	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.getTimer;

	import gs.TweenLite;
	import gs.easing.Linear;

	/**
	 *
	 * 服务器弹道模拟器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-03-23 上午11:12:28
	 *
	 */
	public class ServerTrajectorySimulator
	{
		private static const POINT_1 : Point = new Point();
		private static const POINT_2 : Point = new Point();
		private static const UPDATE_DELAY : int = 100;

		protected var _collideTime : int;
		protected var _atkorPosition : Vector3D;
		protected var _targetPos : Vector3D;
		protected var _targetRole : SceneRole;
		protected var _spellInfo : ReleaseSpellInfo;
		protected var _speed : int;
		protected var _totalTime : int;
		protected var _trackTime : int;
		protected var _lastUpdateTime : int;
		protected var _isTrackTarget : Boolean;
		protected var _isFlyCross : Boolean;
		protected var _releaseDelayTime : int;
		protected var _queue : Vector.<ServerTrajectorySimulator>;
		protected var _locusPoints : Vector.<AnimatorLocusPoint>;
		protected var _locusPointIndex : int = 0;
		private var _movable : Object = {x: 0, y: 0};

		public function ServerTrajectorySimulator(spellInfo : ReleaseSpellInfo, targetPos : Vector3D, targetRole : SceneRole, totalTime : int, speed : int, isTrackTarget : Boolean, isFlyCross : Boolean, releaseDelayTime : int)
		{
			_spellInfo = spellInfo;
			_targetPos = targetPos;
			_targetRole = targetRole;
			_totalTime = totalTime;
			_trackTime = totalTime;
			_speed = speed;
			_isTrackTarget = isTrackTarget;
			_isFlyCross = isFlyCross;
			_releaseDelayTime = releaseDelayTime;
		}

		public function setAtkorData(position : Vector3D) : void
		{
			_atkorPosition = position.clone();
		}

		public function setQueue(queue : Vector.<ServerTrajectorySimulator>, locusPoints : Vector.<AnimatorLocusPoint>) : void
		{
			_queue = queue;
			_locusPoints = locusPoints;
			_locusPointIndex = 0;
			var index : int = _queue.indexOf(this);
			if (index < 0)
				_queue.push(this);
		}

		public function run() : void
		{
			if (_releaseDelayTime > 0)
				TweenLite.delayedCall(_releaseDelayTime * 0.001, startDelayHurt);
			else
				startDelayHurt();
		}

		private function startDelayHurt() : void
		{
			_movable.x = _atkorPosition.x;
			_movable.y = _atkorPosition.z;
			updateMove();
		}

		private function addLocusPoint() : AnimatorLocusPoint
		{
			if (_targetRole && _targetRole.usable)
			{
				_targetPos.setTo(_targetRole.x, _targetRole.y, _targetRole.z);
			}
			_atkorPosition.setTo(_movable.x, 0, _movable.y);
			var locusPoint : AnimatorLocusPoint = new AnimatorLocusPoint(_atkorPosition.clone(), _targetPos.clone());
			_locusPoints.push(locusPoint);
			return locusPoint;
		}

		private function updateMove() : void
		{
			var locusPoint : AnimatorLocusPoint = _locusPointIndex < _locusPoints.length ? _locusPoints[_locusPointIndex] : null;
			_locusPointIndex++;
			if (!locusPoint)
			{
				locusPoint = addLocusPoint();
			}
			_atkorPosition.setTo(locusPoint.position.x, locusPoint.position.y, locusPoint.position.z);
			_targetPos.setTo(locusPoint.targetPos.x, locusPoint.targetPos.y, locusPoint.targetPos.z);

			POINT_1.setTo(_atkorPosition.x, _atkorPosition.z);
			POINT_2.setTo(_targetPos.x, _targetPos.z);
			var angle : Number = ZMath.getTowPointsAngle(POINT_1, POINT_2);
			var dist : Number = MathUtil.getDistance(POINT_1.x, POINT_1.y, POINT_2.x, POINT_2.y);
			_collideTime = dist / (_speed * 0.001);

			var maxDist : int = _speed * 0.001 * _trackTime;
			var angleRad : Number = angle * Math.PI / 180;
			var cosV : Number = Math.cos(angleRad);
			var sinV : Number = Math.sin(angleRad);
			var posX : Number = _atkorPosition.x + maxDist * cosV;
			var posZ : Number = _atkorPosition.z + maxDist * sinV;

			_lastUpdateTime = getTimer();

			TweenLite.to(_movable, _trackTime * 0.001, {x: posX, y: posZ, ease: Linear.easeNone, overwrite: 0, onUpdate: onAnimation});
			TweenLite.to(_movable, _collideTime * 0.001, {ease: Linear.easeNone, overwrite: 0, onComplete: onReachRemoveEffect});

			if (SpellFightManager.getInstance().hurtRangeShapeArea3D)
				SpellFightManager.getInstance().hurtRangeShapeArea3D.setPosition(_targetPos.x, 20, _targetPos.z);
		}

		protected function onAnimation() : void
		{
			if (_isTrackTarget)
			{
				var currTime : int = getTimer();
				if (currTime - _lastUpdateTime >= UPDATE_DELAY)
				{
					updateMove();
					_lastUpdateTime = currTime;
				}
			}
		}

		private function onReachRemoveEffect() : void
		{
			stopAnimation();

			if (_isFlyCross)
			{
				_isTrackTarget = false;
			}
			else
			{
				addSpellHitEffect();
			}
			dispose();
		}

		private function addSpellHitEffect() : void
		{
			SpellHitHelper.addSpellHitEffect(SpellFightManager.getInstance().spellInfo, _spellInfo.atkor.stateMachine.isRiding);
		}

		private function stopAnimation() : void
		{
			TweenLite.killTweensOf(_movable);
			TweenLite.killDelayedCallsTo(startDelayHurt);
		}

		public function dispose() : void
		{
			stopAnimation();
			if (_queue)
			{
				var index : int = _queue.indexOf(this);
				if (index > -1)
					_queue.splice(index, 1);
				if (_locusPoints)
				{
					if (_queue.length == 0)
						_locusPoints.length = 0;
					_locusPoints = null;
				}
				_queue = null;
			}
			_locusPointIndex = 0;
			_atkorPosition = null;
			_targetPos = null;
			_targetRole = null;
			_totalTime = 0;
			_trackTime = 0;
			_collideTime = 0;
			_lastUpdateTime = 0;
			_speed = 0;
			_isTrackTarget = false;
			_isFlyCross = false;
			_releaseDelayTime = 0;
		}
	}
}
