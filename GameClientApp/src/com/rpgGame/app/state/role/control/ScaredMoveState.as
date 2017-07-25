package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.IState;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.utils.PathFinderUtil;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.control.MoveState;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.geom.Vector3D;
	import flash.utils.getTimer;
	
	import away3d.pathFinding.DistrictWithPath;
	
	import gs.TweenLite;
	import gs.easing.Linear;
	
	/**
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-9-8 上午11:00:36
	 */
	
	public class ScaredMoveState extends MoveState
	{
		private const THROUGH_DELAY : int = 300;
		private var _stateReference : ScaredMoveStateReference;
		private var _isMoving : Boolean;
		private var _throughTime:int;
		private var _count:int;//行走次数
		private var originPos:Vector3D;
		private var originRotationY:Number;
		
		public function ScaredMoveState()
		{
			super(RoleStateType.CONTROL_SCARED_MOVE);
			_isMoving = false;
		}
		
		override public function execute() : void
		{
			super.execute();
			_stateReference = null;
			if (_ref is ScaredMoveStateReference)
			{
				_stateReference = _ref as ScaredMoveStateReference;
				startWalk();
			}
			else
				throw new Error("状态引用必须是ScaredMoveStateReference类型！");
		}
		
		override public function leave() : void
		{
			super.leave();
			if (_machine && !_machine.isInPool)
			{
				_throughTime = 0;
				//stopWalk();
				end();//回到原来的位置
			}
		}
		
		private function end():void
		{
			if (_machine && !_machine.isInPool)
			{
				var role:SceneRole = (_machine.owner as SceneRole);
				var distance : Number = MathUtil.getDistance(role.x, role.z, originPos.x, originPos.z);
				var nextPosGapTm : int = (distance / _stateReference.speed * 1000);
				if (nextPosGapTm > 0)
				{
					_isMoving = true;
					role.faceToGround(originPos.x, originPos.z);
					move();
					TweenLite.to(role, nextPosGapTm * 0.001, {x: originPos.x, y: originPos.y, z: originPos.z,onComplete:backToOrigin, onUpdate: onWalkStepUpdate, ease: Linear.easeNone, overwrite: 0});
				}
			}
		}
		
		private function backToOrigin():void
		{
			if (_machine && !_machine.isInPool)
			{
				_isMoving = false;
				(_machine.owner as SceneRole).rotationY = originRotationY;
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, y: true, z: true});
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE);
				if ((_machine as RoleStateMachine).isPrewarWaiting)
					transition(RoleStateType.ACTION_PREWAR);
				else
					transition(RoleStateType.ACTION_IDLE);
				stopWalk();
			}
		}
		
		private function ready() : void
		{
			if (_machine && !_machine.isInPool)
			{
				_stateReference.ready();
			}
		}
		
		private function through() : void
		{
			if (_stateReference)
			{
				_stateReference.through();
			}
		}
		
		private function move() : void
		{
			if (_stateReference)
			{
				_stateReference.move();
			}
		}
		
		private function arrive() : void
		{
			if (_machine && !_machine.isInPool)
			{
				_isMoving = false;
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, y: true, z: true});
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE);
				if ((_machine as RoleStateMachine).isPrewarWaiting)
					transition(RoleStateType.ACTION_PREWAR);
				else
					transition(RoleStateType.ACTION_IDLE);
				_stateReference.arrive();
			}
		}
		
		private function stopWalk() : void
		{
			if (_machine && !_machine.isInPool)
			{
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, y: true, z: true});
				//执行行走被停止回调
				if (_isMoving)
					_stateReference.stop();
				_stateReference.end();
				_isMoving = false;
			}
		}
		
		private function startWalk() : void
		{
			if (_machine && !_machine.isInPool)
			{
				if(_stateReference.endTime - SystemTimeManager.curtTm <= THROUGH_DELAY)//时间小于300ms就不播放效果了
				{
					return;
				}
				var pathPoints:Vector.<Vector3D> = _stateReference.pathPoints;
				var role:SceneRole = (_machine.owner as SceneRole);
				originPos = role.position.clone();
				originRotationY = role.rotationY;
				
				_count = 1;
				
				_isMoving = true;
				startMoveStep(pathPoints[0]);
			}
		}
		
		private function startMoveStep(pos : Vector3D) : void
		{
			if (_machine && !_machine.isInPool)
			{
				_throughTime = getTimer();
				//执行开始行走回调
				ready();
				moveStep(pos);
			}
		}
		
		private function moveStep(pos : Vector3D) : void
		{
			if (_machine && !_machine.isInPool)
			{
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, y: true, z: true});
				var role:SceneRole = (_machine.owner as SceneRole);
				if (_stateReference.endTime - SystemTimeManager.curtTm > THROUGH_DELAY)
				{
					var nextPos:Vector3D = _stateReference.pathPoints[_count % _stateReference.pathPoints.length];
					_count++;
					
					var districtWithPath : DistrictWithPath = SceneManager.getDistrict(role.sceneName);
					var forwardPos : Vector3D = PathFinderUtil.getForwardPointInSide(districtWithPath, role.position, pos);
					
					var distance : Number = MathUtil.getDistance(role.x, role.z, forwardPos.x, forwardPos.z);
					var nextPosGapTm : int = (distance / _stateReference.speed * 1000);
					if (nextPosGapTm > 0)
					{
						role.faceToGround(forwardPos.x, forwardPos.z);
						move();
						TweenLite.to(role, nextPosGapTm * 0.001, {x: forwardPos.x, y: forwardPos.y, z: forwardPos.z, onComplete: moveStep, onCompleteParams: [nextPos], onUpdate: onWalkStepUpdate, onUpdateParams: [], ease: Linear.easeNone, overwrite: 0});
					}
				}
				else //到达
				{
					arrive();
				}
			}
		}
		
		private function onWalkStepUpdate() : void
		{
			if (_machine && !_machine.isInPool)
			{
				if (_stateReference)
				{
					_stateReference.update();
				}
				var currTime : int = getTimer();
				if (currTime - _throughTime > THROUGH_DELAY)
				{
					_throughTime = currTime;
					through();
				}
			}
		}
		
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (_isMoving)
			{
				if (!force)
					return false;
			}
			return true;
		}
		
		
		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if (prevState)
			{
				if (prevState.type == RoleStateType.CONTROL_TRAIL_MOVE)
				{
					return false;
				}
			}
			
			if ((_machine as RoleStateMachine).isDead)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isDeadLaunch)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isLockCaseSpell)
			{
				if (!force)
					return false;
			}
			else if ((_machine as RoleStateMachine).isStiff)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isStun)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isUnmovable)
			{
				return false;
			}
			
			return true;
		}
		
		override public function dispose() : void
		{
			_stateReference = null;
			_isMoving = false;
			super.dispose();
		}
	}
}