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
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.animat.EffectAnimationCfgData;
	import com.rpgGame.coreData.clientConfig.EffectAnimation;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.getTimer;
	
	import gs.TweenLite;
	import gs.easing.Cubic;
	import gs.easing.Linear;
	
	/**
	 * 弹道动画控制 
	 * @author NEIL
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
		protected var _targetRole : SceneRole;
		/**
		 * 飞行特效的每次更新位置时的当前位置，方面用来算当前飞行特效到目标点的方位 
		 */		
		protected var _lastPos : Vector3D;
		protected var _lastOffset : Vector3D;
		
		protected var _totalTime : int;
//		protected var _trackTime : int;
		protected var _trackPerTime : Number;
		/**
		 * 到目标点所需要的时间，根据速度算出来的 
		 */		
		protected var _collideTime : int;
		protected var _collidePerTime : Number;
		/**
		 * 弹道开始的时间 
		 */		
		protected var _startTime : int;
		/**
		 * 每一次更新时的当前时间刻度 
		 */		
		protected var _lastTime : int;
		/**
		 * 专门针对追踪弹道来计时的，当每次更新弹道的位置时，去获取目标的当前点 ，要求每次至少要在100毫秒以上的时间，才能获取目标的当前点，为了性能
		 */		
		protected var _lastUpdateTime : int;
		/**
		 * 从弹道开始到目前已经过去了多少毫秒 
		 */		
		protected var _elapseTime : int;
		/**
		 * 每次更新弹道的时间差（上一次更新后，到这一次要更新时的时间间隔） 
		 */		
		protected var _diffTime : int;
		
		protected var _speed : int;
		protected var _destHeightOffset : Number;
		protected var _targetOffsetY : Number;
		protected var _isTrackTarget : Boolean;
		protected var _matchTerrain : Boolean;
		/**
		 * 当已经击中了目标，是否还要朝目标点，继续飞行 
		 */		
		protected var _isFlyCross : Boolean;
		protected var _isAdaptiveTargetHeight : Boolean;
		protected var _moveDelay : int;
		protected var _playDelay : int;
//		protected var _releaseDelayTime : int;
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
		private var _offsetDest : Vector3D;
		
		public function CommonTrajectoryAnimator(spellInfo : ReleaseSpellInfo, targetPos : Vector3D, targetRole : SceneRole, 
												 totalTime : int, speed : int, isTrackTarget : Boolean, matchTerrain : Boolean, 
												 isFlyCross : Boolean, isAdaptiveTargetHeight : Boolean, moveDelay : int, 
												 playDelay : int, /*releaseDelayTime : int,*/ throwHeight : int, throwWeightRatio : int)
		{
			_spellInfo = spellInfo;
			_targetPos = targetPos;
			_targetRole = targetRole;
			_totalTime = totalTime;
//			_trackTime = totalTime;
			_speed = speed;
			_isTrackTarget = isTrackTarget;
			_matchTerrain = matchTerrain;
			_isFlyCross = isFlyCross;
			_isAdaptiveTargetHeight = isAdaptiveTargetHeight;
			
			_moveDelay = moveDelay;
			_playDelay = playDelay;
//			_releaseDelayTime = releaseDelayTime;
			
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
			var posY : Number = 0;//scene.sceneMapLayer.queryHeightAt(_destPosition.x, _destPosition.z);2.5D没有高度值，因为只有2维
			_destHeightOffset = _destPosition.y - posY;
			
			_renderSet.position.x = _destPosition.x;
			_renderSet.position.y = _destPosition.z;
			_renderSet.position.z = _destPosition.y;
			
			_renderSet.offsetY = 0;
			_renderSet.rotationX = 0;
			_renderSet.rotationY = _atkorRotationY;
			_targetOffsetY = _targetPos.z;
			
			var targetDestPosition : Vector3D = null;
			if (_targetRole && _targetRole.usable)
			{
				targetDestPosition = _targetRole.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_02);
				if (!targetDestPosition)
					targetDestPosition = _targetRole.position;
				_targetOffsetY = targetDestPosition.y - _targetRole.y;
			}
			
			if (_moveDelay > 0)
			{
				TweenLite.delayedCall(_moveDelay * 0.001, onStartMove);
			}
			else
			{
				onStartMove();
			}
			if (_playDelay > 0)
			{
				TweenLite.delayedCall(_playDelay * 0.001, onStartPlay);
			}
			else
			{
				onStartPlay();
			}
		}
		
		public function setAtkorData(position : Vector3D, rotationY : Number, destPosition : Vector3D) : void
		{
			_atkorPosition = position.clone();
			_atkorRotationY = rotationY;
			_destPosition = destPosition.clone();
			_offsetDest = new Vector3D(_destPosition.x - _atkorPosition.x, _destPosition.y - _atkorPosition.y, _destPosition.z - _atkorPosition.z);
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
			if (_matchTerrain)
			{
				_renderSet.y = 0;
				_renderSet.offsetY = _destHeightOffset;
			}
			updateMove();
			_isMoving = true;
		}
		
		protected function onStartPlay() : void
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
//			SpellHitHelper.fightSpellHitEffect(_spellInfo);
			onRemoveRender();
		}
		
		private function onRemoveRender() : void
		{
			SceneManager.removeSceneObjFromScene(_renderSet);
		}
		
		private function addLocusPoint() : AnimatorLocusPoint
		{
			if (_targetRole && _targetRole.usable)
			{
				if (_matchTerrain)
					_targetPos.setTo(_targetRole.x, 0, _targetRole.z);
				else
					_targetPos.setTo(_targetRole.x, _targetRole.y, _targetRole.z);
			}
			_destPosition.setTo(_renderSet.x, _renderSet.y, _renderSet.z);
			var locusPoint : AnimatorLocusPoint = new AnimatorLocusPoint(_destPosition.clone(), _targetPos.clone());
			_locusPoints.push(locusPoint);
			return locusPoint;
		}
		
		/**
		 *  
		 * @param isReached 是否一定要把策划填的总得飞行时间，飞完---此值受isflycross影响。技能基础表的q_is_fly_cross字段来控制
		 * 
		 */		
		private function updateMove(isReached : Boolean = false) : void
		{
			var locusPoint : AnimatorLocusPoint = _locusPointIndex < _locusPoints.length ? _locusPoints[_locusPointIndex] : null;
			_locusPointIndex++;
			if (!locusPoint)
			{
				locusPoint = addLocusPoint();
			}
			_destPosition.setTo(locusPoint.position.x, locusPoint.position.y, locusPoint.position.z);
			_targetPos.setTo(locusPoint.targetPos.x, locusPoint.targetPos.y, locusPoint.targetPos.z);
			
			POINT_1.setTo(_destPosition.x + _offsetDest.x, _destPosition.z + _offsetDest.z);
			POINT_2.setTo(_targetPos.x, _targetPos.z);
			var angle : Number = ZMath.getTowPointsAngle(POINT_1, POINT_2);
			var dist : Number = MathUtil.getDistance(POINT_1.x, POINT_1.y, POINT_2.x, POINT_2.y);
			_collideTime = dist / (_speed * 0.001);//到目标点所需要的时间，根据速度算出来的
			_renderSet.rotationY = 270 - angle;
			
			var maxDist : int = isReached ? (_speed * 0.001 * _totalTime) : dist;
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
					TweenLite.to(_renderSet, _totalTime * 0.001, {x: _endPosX, z: _endPosZ, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateAnimation, onComplete: onReachRemoveEffect});
				}
				else
				{
					if (_isAdaptiveTargetHeight)
					{
						_endRotationX = 0;
						TweenLite.to(_renderSet, _totalTime * 0.001, {x: _endPosX, z: _endPosZ, rotationX: _endRotationX, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateAnimation, onComplete: onReachRemoveEffect});
					}
					else
					{
						TweenLite.to(_renderSet, _totalTime * 0.001, {x: _endPosX, z: _endPosZ, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateAnimation, onComplete: onReachRemoveEffect});
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
					var hitTime : int = _collideTime - /*(*/_moveDelay /*- _releaseDelayTime)*/;
					if (hitTime < 0)
						hitTime = 0;
					if (hitTime > 0)
					{
						if (_isAdaptiveTargetHeight)
						{
							_endOffsetY = _targetPos.y + _targetOffsetY;
							_endRotationX = dist > 0 ? Math.atan((_endOffsetY - _destPosition.z) / dist) * 57.33 : 0;//旋转x轴，匹配从上向下，或者从下朝上的感觉
							TweenLite.to(_renderSet, hitTime * 0.001, {x: _endPosX, z: _endPosZ, y: _endOffsetY, rotationX: _endRotationX, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateAnimation, onComplete: onReachRemoveEffect});
						}
						else
						{
							//这个控制飞向目标点的
							TweenLite.to(_renderSet, hitTime * 0.001, {x: _endPosX, z: _endPosZ, ease: Linear.easeNone, overwrite: 0, onUpdate: onUpdateAnimation, onComplete: onReachRemoveEffect});
							var scene : GameScene3D;
							var currThrowHeight : int;
							if (_throwHeight > 0)
							{
								scene = SceneManager.getScene();
								_endPosY = scene.sceneMapLayer.queryHeightAt(_endPosX, _endPosZ) + _destHeightOffset;
								currThrowHeight = _renderSet.y + (_throwWeightRatio > 0 ? (_throwHeight * dist * 0.5 / _throwWeightRatio) : _throwHeight);
								//这个控制飞行特效的 y值，也就是高度值
								TweenLite.to(_renderSet, hitTime * 0.5 * 0.001, {y: currThrowHeight, ease: Cubic.easeOut, overwrite: 0, onComplete: onThrowOffComplete, onCompleteParams: [hitTime]});
							}
							else if (_throwWeightRatio > 0) //角度值
							{
								scene = SceneManager.getScene();
								_endPosY = scene.sceneMapLayer.queryHeightAt(_endPosX, _endPosZ) + _destHeightOffset;
								currThrowHeight = _renderSet.y + dist * 0.5 * Math.tan(_throwWeightRatio * 0.0175);
								//这个控制飞行特效的 y值，也就是高度值
								TweenLite.to(_renderSet, hitTime * 0.5 * 0.001, {y: currThrowHeight, ease: Cubic.easeOut, overwrite: 0, onComplete: onThrowOffComplete, onCompleteParams: [hitTime]});
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
//				SpellHitHelper.fightSpellHitEffect(_spellInfo);
				
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
				_trackPerTime = _elapseTime / _totalTime;
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
		
		public function update(gapTm:uint) : void
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
			_destHeightOffset = 0;
			_targetOffsetY = 0;
			_totalTime = 0;
//			_trackTime = 0;
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
//			_releaseDelayTime = 0;
			_isMoving = false;
			_isPlaying = false;
			_spellInfo = null;
			_offsetDest = null;
		}
	}
}
