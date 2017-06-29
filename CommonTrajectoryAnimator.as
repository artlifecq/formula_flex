package com.rpgGame.app.scene.animator
{
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.IRenderAnimator;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.mainCore.libCore.utils.ZMath;
	import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
	import com.rpgGame.app.fight.spell.SpellHitHelper;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.animat.EffectAnimationCfgData;
	import com.rpgGame.coreData.clientConfig.EffectAnimation;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;

	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.getTimer;

	import gs.TweenLite;
	import gs.easing.Cubic;
	import gs.easing.Linear;

	/**
	 *
	 * 普通弹道动画
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-05 上午11:12:28
	 *
	 */
	public class CommonTrajectoryAnimator implements IRenderAnimator
	{
		private static const POINT_1 : Point = new Point();
		private static const POINT_2 : Point = new Point();
		private static const UPDATE_DELAY : int = 100;
		protected var _renderUnit : RenderUnit3D;
		protected var _renderSet : RenderSet3D;
		protected var _queue : Vector.<IRenderAnimator>;
		protected var _locusPoints : Vector.<AnimatorLocusPoint>;
		protected var _locusPointIndex : int = 0;
		protected var _destPosition : Vector3D;
		protected var _targetPos : Vector3D;
		protected var _atkor : SceneRole;
		protected var _targetRole : SceneRole;
		protected var _lastPos : Vector3D;
		protected var _lastOffset : Vector3D;
		protected var _totalTime : int;
		protected var _trackTime : int;
		protected var _trackPerTime : Number;
		protected var _collideTime : int;
		protected var _collidePerTime : Number;
		protected var _startTime : int;
		protected var _lastTime : int;
		protected var _lastUpdateTime : int;
		protected var _elapseTime : int;
		protected var _diffTime : int;
		protected var _speed : int;
		protected var _destHeightOffset : Number;
		protected var _targetOffsetY : Number;
		protected var _isTrackTarget : Boolean;
		protected var _matchTerrain : Boolean;
		protected var _isFlyCross : Boolean;
		protected var _isAdaptiveTargetHeight : Boolean;
		protected var _moveDelay : int;
		protected var _playDelay : int;
		protected var _isMoving : Boolean;
		protected var _isPlaying : Boolean;
		protected var _spellInfo : ReleaseSpellInfo;
		protected var _atkorPosition : Vector3D;
		protected var _atkorRotationY : Number;
		protected var _throwHeight : int;
		protected var _throwWeightRatio : int;
		protected var _endPosX : Number;
		protected var _endPosZ : Number;
		protected var _endPosY : Number;
		protected var _endOffsetY : Number;
		protected var _endRotationX : Number;
		protected var _bindBone : String;
		protected var _targetBindBone : String;
		private var _offsetDest : Vector3D;

		public function CommonTrajectoryAnimator(spellInfo : ReleaseSpellInfo, targetPos : Vector3D, targetRole : SceneRole, totalTime : int, speed : int, isTrackTarget : Boolean, matchTerrain : Boolean, isFlyCross : Boolean, isAdaptiveTargetHeight : Boolean, moveDelay : int, playDelay : int, throwHeight : int, throwWeightRatio : int)
		{
			_spellInfo = spellInfo;
			_targetPos = targetPos;
			_targetRole = targetRole;
			_totalTime = totalTime;
			_trackTime = totalTime;
			_speed = speed;
			_isTrackTarget = isTrackTarget;
			_matchTerrain = matchTerrain;
			_isFlyCross = isFlyCross;
			_isAdaptiveTargetHeight = isAdaptiveTargetHeight;
			_moveDelay = moveDelay;
			_playDelay = playDelay;
			_throwHeight = throwHeight;
			_throwWeightRatio = throwWeightRatio;
			_isMoving = false;
			_isPlaying = false;
		}

		public function setOwner(owner : BaseObj3D) : void
		{
			_renderSet = owner as RenderSet3D;
			_renderUnit = _renderSet.getRenderUnitByID("effect", 1);
			_renderUnit.repeat = 0;
			_lastPos = new Vector3D();
			_lastOffset = new Vector3D();
			var scene : GameScene3D = SceneManager.getScene();
			var posY : Number = scene.sceneMapLayer.queryHeightAt(_destPosition.x, _destPosition.z);
			_destHeightOffset = _destPosition.y - posY;
			_renderSet.position = _destPosition;
			_renderSet.rotationY = _atkorRotationY;
			_renderSet.offsetY = 0;
			_renderSet.rotationX = 0;
			_targetOffsetY = 0;

			var targetDestPosition : Vector3D = null;
			if (_targetRole && _targetRole.usable)
			{
				if (_targetBindBone)
					targetDestPosition = _targetRole.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, _targetBindBone);
				if (!targetDestPosition)
					targetDestPosition = _targetRole.position;
				_targetOffsetY = targetDestPosition.y - _targetRole.y;
			}

			if (_moveDelay > 0)
				TweenLite.delayedCall(_moveDelay * 0.001, onStartMove);
			else
				onStartMove();
			if (_playDelay > 0)
				TweenLite.delayedCall(_playDelay * 0.001, onStartPlay);
			else
				onStartPlay();
		}

		private function updateDestPosition(locusPoint : AnimatorLocusPoint = null) : void
		{
			if (locusPoint)
			{
				_destPosition = locusPoint.position.clone();
			}
			else
			{
				if (_atkor && _atkor.usable)
				{
					_atkorRotationY = _atkor.rotationY;
					var destPosition : Vector3D = null;
					if (_bindBone)
						destPosition = _atkor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, _bindBone);
					if (!destPosition)
						destPosition = _atkor.position;
					_destPosition = destPosition.clone();
					_atkorPosition = _atkor.position.clone();
				}
				_offsetDest.setTo(_destPosition.x - _atkorPosition.x, _destPosition.y - _atkorPosition.y, _destPosition.z - _atkorPosition.z);
			}
			if (_renderSet)
			{
				_renderSet.position = _destPosition;
				_renderSet.rotationY = _atkorRotationY;
			}
		}

		/**
		 * 施法者数据
		 * @param atkor
		 * @param position
		 * @param destPosition
		 * @param bindBone
		 *
		 */
		public function setAtkorData(atkor : SceneRole, position : Vector3D, rotationY : Number, destPosition : Vector3D, bindBone : String, targetBindBone : String) : void
		{
			_atkor = atkor;
			_atkorPosition = position.clone();
			_atkorRotationY = 0;
			_destPosition = destPosition.clone();
			_bindBone = bindBone;
			_targetBindBone = targetBindBone;
			_offsetDest = new Vector3D();
			var locusPoint : AnimatorLocusPoint = _locusPointIndex < _locusPoints.length ? _locusPoints[_locusPointIndex] : null;
			_locusPointIndex++;
			if (!locusPoint)
			{
				updateDestPosition();
				locusPoint = addLocusPoint(_destPosition.x, _destPosition.y, _destPosition.z);
			}
			else
			{
				updateDestPosition(locusPoint);
			}
		}

		public function setQueue(queue : Vector.<IRenderAnimator>, locusPoints : Vector.<AnimatorLocusPoint>) : void
		{
			_queue = queue;
			_locusPoints = locusPoints;
			_locusPointIndex = 0;
			var index : int = _queue.indexOf(this);
			if (index < 0)
				_queue.push(this);
		}

		protected function onStartMove() : void
		{
			TweenLite.delayedCall(_totalTime * 0.001, onTimeOutRemove);
			var locusPoint : AnimatorLocusPoint = _locusPointIndex < _locusPoints.length ? _locusPoints[_locusPointIndex] : null;
			_locusPointIndex++;
			if (!locusPoint)
			{
				updateDestPosition();
				locusPoint = addLocusPoint(_destPosition.x, _destPosition.y, _destPosition.z);
			}
			else
			{
				updateDestPosition(locusPoint);
			}
			if (_matchTerrain)
			{
				_renderSet.y = 0;
				_renderSet.offsetY = _destHeightOffset;
			}
			updateMove();
			_isMoving = true;
		}

		private function onStartPlay() : void
		{
			if (_renderUnit)
			{
				startPlay();
				_isPlaying = true;
			}
		}

		protected function startPlay() : void
		{
			if (_renderUnit)
			{
				_renderUnit.play(0);
			}
		}

		private function onTimeOutRemove() : void
		{
			SpellHitHelper.clientSpellHitEffect(_spellInfo);
			onRemoveRender();
		}

		private function onRemoveRender() : void
		{
			SceneManager.removeSceneObjFromScene(_renderSet);
		}

		private function addLocusPoint(currX : Number, currY : Number, currZ : Number) : AnimatorLocusPoint
		{
			if (_targetRole && _targetRole.usable)
			{
				if (_matchTerrain)
					_targetPos.setTo(_targetRole.x, 0, _targetRole.z);
				else
					_targetPos.setTo(_targetRole.x, _targetRole.y, _targetRole.z);
			}
			_destPosition.setTo(currX, currY, currZ);
			var locusPoint : AnimatorLocusPoint = new AnimatorLocusPoint(_destPosition.clone(), _targetPos.clone());
			_locusPoints.push(locusPoint);
			return locusPoint;
		}

		private function updateMove(isReached : Boolean = false) : void
		{
			var locusPoint : AnimatorLocusPoint = _locusPointIndex < _locusPoints.length ? _locusPoints[_locusPointIndex] : null;
			_locusPointIndex++;
			if (!locusPoint)
			{
				locusPoint = addLocusPoint(_renderSet.x, _renderSet.y, _renderSet.z);
			}
			_destPosition.setTo(locusPoint.position.x, locusPoint.position.y, locusPoint.position.z);
			_targetPos.setTo(locusPoint.targetPos.x, locusPoint.targetPos.y, locusPoint.targetPos.z);

			POINT_1.setTo(_destPosition.x + _offsetDest.x, _destPosition.z + _offsetDest.z);
			POINT_2.setTo(_targetPos.x, _targetPos.z);
			var angle : Number = ZMath.getTowPointsAngle(POINT_1, POINT_2);
			var dist : Number = MathUtil.getDistance(POINT_1.x, POINT_1.y, POINT_2.x, POINT_2.y);
			_collideTime = dist / (_speed * 0.001);
			_renderSet.rotationY = 270 - angle;

			var maxDist : int = isReached ? (_speed * 0.001 * _trackTime) : dist;
			var angleRad : Number = angle * Math.PI / 180;
			var cosV : Number = Math.cos(angleRad);
			var sinV : Number = Math.sin(angleRad);
			_endPosX = _destPosition.x + maxDist * cosV;
			_endPosZ = _destPosition.z + maxDist * sinV;
			_endPosY = 0;
			_endOffsetY = 0;
			_endRotationX = 0;

			_startTime = getTimer();
			_lastTime = _startTime;
			_lastUpdateTime = _startTime;

			if (isReached)
			{
				if (_matchTerrain)
				{
					TweenLite.to(_renderSet, _trackTime * 0.001, {x: _endPosX, z: _endPosZ, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateAnimation, onComplete: onReachRemoveEffect});
				}
				else
				{
					if (_isAdaptiveTargetHeight)
					{
						_endRotationX = 0;
						TweenLite.to(_renderSet, _trackTime * 0.001, {x: _endPosX, z: _endPosZ, rotationX: _endRotationX, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateAnimation, onComplete: onReachRemoveEffect});
					}
					else
					{
						TweenLite.to(_renderSet, _trackTime * 0.001, {x: _endPosX, z: _endPosZ, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateAnimation, onComplete: onReachRemoveEffect});
					}
				}
			}
			else
			{
				_lastPos.setTo(_renderSet.x, _renderSet.y, _renderSet.z);
				_lastOffset.setTo(_renderSet.offsetX, _renderSet.offsetY, _renderSet.offsetZ);
				if (_matchTerrain)
				{
					_endOffsetY = _targetOffsetY;
					TweenLite.to(_renderSet, _collideTime * 0.001, {x: _endPosX, z: _endPosZ, offsetY: _endOffsetY, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateAnimation, onComplete: onReachRemoveEffect});
				}
				else
				{
					if (_collideTime > 0)
					{
						if (_isAdaptiveTargetHeight)
						{
							_endOffsetY = _targetPos.y + _targetOffsetY;
							_endRotationX = dist > 0 ? Math.atan((_endOffsetY - _destPosition.y) / dist) * 57.33 : 0;
							TweenLite.to(_renderSet, _collideTime * 0.001, {x: _endPosX, z: _endPosZ, y: _endOffsetY, rotationX: _endRotationX, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateAnimation, onComplete: onReachRemoveEffect});
						}
						else
						{
							TweenLite.to(_renderSet, _collideTime * 0.001, {x: _endPosX, z: _endPosZ, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateAnimation, onComplete: onReachRemoveEffect});
							var scene : GameScene3D;
							var currThrowHeight : int;
							if (_throwHeight > 0)
							{
								scene = SceneManager.getScene();
								_endPosY = scene.sceneMapLayer.queryHeightAt(_endPosX, _endPosZ) + _destHeightOffset;
								currThrowHeight = _renderSet.y + (_throwWeightRatio > 0 ? (_throwHeight * dist * 0.5 / _throwWeightRatio) : _throwHeight);
								TweenLite.to(_renderSet, _collideTime * 0.5 * 0.001, {y: currThrowHeight, ease: Cubic.easeOut, overwrite: 0, onComplete: onThrowOffComplete, onCompleteParams: [_collideTime]});
							}
							else if (_throwWeightRatio > 0) //角度值
							{
								scene = SceneManager.getScene();
								_endPosY = scene.sceneMapLayer.queryHeightAt(_endPosX, _endPosZ) + _destHeightOffset;
								currThrowHeight = _renderSet.y + dist * 0.5 * Math.tan(_throwWeightRatio * 0.0175);
								TweenLite.to(_renderSet, _collideTime * 0.5 * 0.001, {y: currThrowHeight, ease: Cubic.easeOut, overwrite: 0, onComplete: onThrowOffComplete, onCompleteParams: [_collideTime]});
							}
						}
					}
					else
					{
						onReachRemoveEffect();
					}
				}
			}
		}

		private function onThrowOffComplete(hitTime : int) : void
		{
			if (_renderSet && _renderSet.usable)
			{
				TweenLite.to(_renderSet, hitTime * 0.5 * 0.001, {y: _endPosY, ease: Cubic.easeIn, overwrite: 0, onComplete: onThrowFallComplete});
			}
		}

		private function onThrowFallComplete() : void
		{
		}

		private function onReachRemoveEffect() : void
		{
			if (_renderSet && _renderSet.usable)
			{
				SpellHitHelper.clientSpellHitEffect(_spellInfo);

				_renderSet.x = _endPosX;
				_renderSet.z = _endPosZ;
				_renderSet.y = _endPosY;
				_renderSet.offsetY = _endOffsetY;
				_renderSet.rotationX = _endRotationX;
				onUpdateAnimation();

				if (_isFlyCross)
				{
					_isTrackTarget = false;
					updateMove(true);
				}
				else
				{
					stopAnimation();
					if (_renderUnit)
					{
						var effectCfg : EffectAnimation = EffectAnimationCfgData.getInfo(_renderUnit.renderParamData.sourceName);
						if (effectCfg && effectCfg.dissipateTime > 0)
						{
							var childNames : Array = effectCfg.collideHideNodes.split(";");
							for each (var childName : String in childNames)
							{
								setRenderChildVisible(childName);
							}
							TweenLite.delayedCall(effectCfg.dissipateTime * 0.001, onRemoveRender);
						}
						else
						{
							onRemoveRender();
						}
					}
					else
					{
						onRemoveRender();
					}
				}
			}
		}

		protected function setRenderChildVisible(childName : String) : void
		{
			if (_renderUnit)
			{
				_renderUnit.setVisibleByName([childName], false);
			}
		}

		protected function onUpdateAnimation() : void
		{
			if (_renderSet && _renderSet.usable)
			{
				var currTime : int = getTimer();
				_elapseTime = currTime - _startTime;
				_diffTime = currTime - _lastTime;
				_lastTime = currTime;
				_trackPerTime = _elapseTime / _trackTime;
				_trackPerTime = _trackPerTime > 1 ? 1 : _trackPerTime;
				_collidePerTime = _elapseTime / _collideTime;
				_collidePerTime = _collidePerTime > 1 ? 1 : _collidePerTime;

				var dist : int;
				if (_matchTerrain)
				{
					dist = MathUtil.getDistance(_renderSet.x, _renderSet.z, _lastPos.x, _lastPos.z);
					_renderSet.rotationX = dist > 0 ? Math.atan((_renderSet.y - _lastPos.y) / dist) * 57.33 : 0;
				}
				else if (_throwHeight > 0 || _throwWeightRatio > 0)
				{
					dist = MathUtil.getDistance(_renderSet.x, _renderSet.z, _lastPos.x, _lastPos.z);
					_renderSet.rotationX = dist > 0 ? Math.atan((_renderSet.y - _lastPos.y) / dist) * 57.33 : 0;
				}
				_lastPos.setTo(_renderSet.x, _renderSet.y, _renderSet.z);
				_lastOffset.setTo(_renderSet.offsetX, _renderSet.offsetY, _renderSet.offsetZ);

				if (_isTrackTarget)
				{
					if (currTime - _lastUpdateTime >= UPDATE_DELAY)
					{
						updateMove();
						_lastUpdateTime = currTime;
					}
				}
			}
		}

		private function stopAnimation() : void
		{
			TweenLite.killTweensOf(_renderSet);
			TweenLite.killDelayedCallsTo(onStartMove);
			TweenLite.killDelayedCallsTo(onStartPlay);
			TweenLite.killDelayedCallsTo(onTimeOutRemove);
		}

		public function update() : void
		{
		}

		public function dispose() : void
		{
			stopAnimation();
			TweenLite.killDelayedCallsTo(onRemoveRender);
			_renderSet = null;
			_renderUnit = null;
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
			_atkorRotationY = 0;
			_lastPos = null;
			_lastOffset = null;
			_destPosition = null;
			_targetPos = null;
			_targetRole = null;
			_atkor = null;
			_bindBone = null;
			_targetBindBone = null;
			_destHeightOffset = 0;
			_targetOffsetY = 0;
			_totalTime = 0;
			_trackTime = 0;
			_trackPerTime = 0;
			_collideTime = 0;
			_collidePerTime = 0;
			_startTime = 0;
			_lastTime = 0;
			_lastUpdateTime = 0;
			_elapseTime = 0;
			_diffTime = 0;
			_speed = 0;
			_isTrackTarget = false;
			_matchTerrain = false;
			_isFlyCross = false;
			_isAdaptiveTargetHeight = false;
			_moveDelay = 0;
			_playDelay = 0;
			_isMoving = false;
			_isPlaying = false;
			_spellInfo = null;
			_offsetDest = null;
		}
	}
}
