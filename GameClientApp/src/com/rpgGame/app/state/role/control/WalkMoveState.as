package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.IState;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.utils.PathFinderUtil;
	import com.game.mainCore.libCore.utils.ZMath;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.app.state.role.action.AttackState;
	import com.rpgGame.app.state.role.action.BlinkState;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.core.state.role.control.MoveState;
	import com.rpgGame.coreData.info.move.RoleMoveInfo;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.getTimer;
	
	import away3d.pathFinding.DistrictWithPath;
	
	import gameEngine2D.PolyUtil;
	
	import gs.TweenLite;
	import gs.easing.Linear;

	/**
	 *
	 * 场景角色行走移动状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class WalkMoveState extends MoveState
	{
		private static var p1 : Point = new Point();
		private static var p2 : Point = new Point();
		private const throughDelay : int = 300;
		private var _stateReference : WalkMoveStateReference;
		private var _nextPos : Vector3D;
		private var _isMoving : Boolean;
		private var _throughTime : int;
		private var _lastEndPos : Vector3D;
		private var _lastTimeStamp : Number;
		private var _districtWithPath : DistrictWithPath;

		public function WalkMoveState()
		{
			super(RoleStateType.CONTROL_WALK_MOVE);
			_isMoving = false;
		}

		override public function enter() : void
		{
			super.enter();
			if (_machine && !_machine.isInPool)
			{
				_districtWithPath = SceneManager.getDistrict((_machine.owner as SceneRole).sceneName);
			}
		}

		override public function execute() : void
		{
			super.execute();
			_stateReference = null;
			if (_ref is WalkMoveStateReference)
			{
				_stateReference = _ref as WalkMoveStateReference;
				_stateReference.startPos = _stateReference.endPos = (_machine.owner as SceneRole).position;
				if (_stateReference.vectorPath)
				{
					walkToPos();
				}
				else if (_stateReference.moveInfo)
				{
					walkByInfo();
				}
			}
			else
				throw new Error("行走移动状态引用必须是WalkMoveStateReference类型！");
		}

		override public function leave() : void
		{
			super.leave();
			if (_machine && !_machine.isInPool)
			{
				_throughTime = 0;
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

		private function unable() : void
		{
			if (_machine && !_machine.isInPool)
			{
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE);
				if ((_machine as RoleStateMachine).isPrewarWaiting)
					transition(RoleStateType.ACTION_PREWAR);
				else
					transition(RoleStateType.ACTION_IDLE);
				_stateReference.unable();
			}
		}

		private function through() : void
		{
			if (_stateReference)
			{
				_stateReference.through();
			}
		}

		private function startMove(nextPos : Vector3D, nextGridPos : Vector3D, nextPosGapTm : int,path:Vector.<Vector3D>) : void
		{
			if (_stateReference)
			{
				_stateReference.nextPos = nextPos;
				_stateReference.nextGridPos = nextGridPos;
				_stateReference.nextPosGapTm = nextPosGapTm;
				_stateReference.leftPath=path;
				move();
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
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true});
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE);
				if ((_machine as RoleStateMachine).isPrewarWaiting)
					transition(RoleStateType.ACTION_PREWAR);
				else
					transition(RoleStateType.ACTION_IDLE);
				_stateReference.arrive();
			}
		}

		public function get lastEndPos() : Vector3D
		{
			return _lastEndPos;
		}

		private function stopWalk() : void
		{
			if (_machine && !_machine.isInPool)
			{
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true});
				//测试代码动态更新展示位置为了
			/*	if((_machine.owner as SceneRole).data is MonsterData){
					(_machine.owner as SceneRole).headFace.updateName();
				}*/
				//执行行走被停止回调
				if (_isMoving)
				{
					_stateReference.stop();
				}
				_stateReference.end();
				_stateReference.startPos = null;
				_stateReference.endPos = null;
				_stateReference.path = null;
				_lastEndPos = null;
				_lastTimeStamp = 0;
				_isMoving = false;
			}
		}

		///////////////////////////////////////////////////////////////////////////////////////
		/**
		 * 角色行走（自动寻路，主角应用）
		 *
		 */
		private function walkToPos() : void
		{
			if (_machine && !_machine.isInPool)
			{
				var targetPos3D : Vector3D = _stateReference.vectorPath;
				var path : Vector.<Vector3D> = PolyUtil.findPath(_districtWithPath, (_machine.owner as SceneRole).position, targetPos3D);
				//path = PathFinderUtil.findPath(_districtWithPath, (_machine.owner as SceneRole).position, targetPos3D);
				//如果无法找到寻路路径则找最近的点
				if (path == null || path.length < 2)
				{
					var nearestPos : Vector3D = PathFinderUtil.getNearestPos(_districtWithPath, (_machine.owner as SceneRole).position, targetPos3D);
					path = PolyUtil.findPath(_districtWithPath, (_machine.owner as SceneRole).position, targetPos3D);
					//path = PathFinderUtil.findPath(_districtWithPath, (_machine.owner as SceneRole).position, nearestPos);
				}
				//如果无法找到寻路路径则找附近的点
				if (path == null || path.length < 2)
				{
					var roundPoses : Vector.<Vector3D> = PathFinderUtil.getRoundPoses(_districtWithPath, targetPos3D);
					if (roundPoses && roundPoses.length > 0)
						path = PolyUtil.findPath(_districtWithPath, (_machine.owner as SceneRole).position, targetPos3D);
						//path = PathFinderUtil.findPath(_districtWithPath, (_machine.owner as SceneRole).position, roundPoses[0]);
					else
						path = null;
				}
				//如果无法找到寻路路径则返回
				if (path == null || path.length < 2)
				{
					(_machine.owner as SceneRole).faceToGround(targetPos3D.x, targetPos3D.z);
					//执行行走无法到达回调
					unable();
					return;
				}
				if (_stateReference.spacing > 0)
				{
					var prevEndPath : Vector3D = path[path.length - 2];
					var endPath : Vector3D = path[path.length - 1];
					var prevEndPos : Point = new Point(prevEndPath.x, prevEndPath.z);
					var endPos : Point = new Point(endPath.x, endPath.z);
					var dist : int = MathUtil.getDistance(prevEndPos.x, prevEndPos.y, endPos.x, endPos.y) - _stateReference.spacing;
					var targetPos : Point = dist > 0 ? MathUtil.get2PosDisPos(prevEndPos, endPos, dist) : prevEndPos;
					endPath.x = targetPos.x;
					endPath.z = targetPos.y;
				}

				_stateReference.path = path;
				var pathStartPos : Vector3D = path[0];
				var pathEndPos : Vector3D = path[path.length - 1];
				_stateReference.startPos = pathStartPos;
				_stateReference.endPos = pathEndPos;
				if (isArriveTarget(pathStartPos, pathEndPos))
				{
					(_machine.owner as SceneRole).faceToGround(targetPos3D.x, targetPos3D.z);
					//执行行走到达回调
					arrive();
				}
				else
				{
					if (_isMoving)
					{
						var endDist : Number = MathUtil.getDistanceNoSqrt(_lastEndPos.x, _lastEndPos.z, pathEndPos.x, pathEndPos.z);
						if (endDist < 100) //正在走则视为不远处，不走。
							return;
					}
					_stateReference.sync();
					//去掉自身位置的点,并更新自身初始位置
					path.shift();
					//开始行走
					walkByPath(path);
				}
			}
		}

		private function walkByInfo() : void
		{
			if (_machine && !_machine.isInPool)
			{
				_lastTimeStamp = 0;
				var info : RoleMoveInfo = _stateReference.moveInfo;
				var path : Vector.<Vector3D> = new Vector.<Vector3D>();
				var timeStamps : Array = [];
				var lastPathPos : Vector3D = null;
				var time : Number = 0;
				var dis : Number = 0;
				var lastPos : Point = new Point();
				var len : int = info.pathList.length;
				for (var i : int = 0; i < len; i++)
				{
					var pos : Point = info.pathList[i];
					if (lastPathPos)
					{
						lastPos.x = lastPathPos.x;
						lastPos.y = lastPathPos.z;
						dis = MathUtil.getDistance(pos.x, pos.y, lastPos.x, lastPos.y);
						time = time + (dis / _stateReference.speed * 1000);
						
//						trace("===========\t:"+(dis / _stateReference.speed * 1000));
//						trace("客户端计算走到下一个点的时间 + 寻路开始时间\t:" + time);
					}
					else
					{
						time = info.startTm;
						
//						trace("寻路开始时间 \t:" + time);
					}
					lastPathPos = new Vector3D(pos.x, 0, pos.y);
					path.push(lastPathPos);
					timeStamps.push(time);
				}
				_stateReference.path = path;
				var pathStartPos : Vector3D = path[0];
				var pathEndPos : Vector3D = path[path.length - 1];
				_stateReference.startPos = pathStartPos;
				_stateReference.endPos = pathEndPos;
				if (isArriveTarget(pathStartPos, pathEndPos))
				{
					//执行行走到达回调
					arrive();
				}
				else
				{
					//去掉自身位置的点,并更新自身初始位置
					path.shift();
					_lastTimeStamp = timeStamps.shift();
					//开始行走
//					trace("timestamps   : " + timeStamps[0]);
					walkByPath(path, timeStamps);
				}
			}
		}

		private function isArriveTarget(startPos : Vector3D, endPos : Vector3D) : Boolean
		{
			var dist : Number = MathUtil.getDistanceNoSqrt(startPos.x, startPos.z, endPos.x, endPos.z);
			if (dist < 100)
				return true;
			return false;
		}

		private function walkByPath(path : Vector.<Vector3D>, timeStamps : Array = null) : void
		{
			if (_machine && !_machine.isInPool)
			{
				_isMoving = true;
				_lastEndPos = _stateReference.endPos;
				if (path.length < 1)
				{
					//执行行走到达回调
					arrive();
					return;
				}
				//用TweenLite来执行行走...
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true});
				startMoveStep(path, timeStamps);
			}
		}

		private function startMoveStep(path : Vector.<Vector3D>, timeStamps : Array = null) : void
		{
			if (_machine && !_machine.isInPool)
			{
				_throughTime = getTimer();
				//执行开始行走回调
				ready();
				moveStep(path, timeStamps);
			}
		}

		private function moveStep(path : Vector.<Vector3D>, timeStamps : Array = null) : void
		{
			if (_machine && !_machine.isInPool)
			{
				if (!_isMoving)
				{
					return;
				}
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true});
				if (path && path.length)
				{
					var nextPosGapTm : int;
					_nextPos = path.shift();
					if (timeStamps)
					{
						var time : Number = timeStamps.shift();
						var elapseTm : int = SystemTimeManager.curtTm - _lastTimeStamp;
						if (elapseTm > 0)
						{
							p1.x = (_machine.owner as SceneRole).x;
							p1.y = (_machine.owner as SceneRole).z;
							p2.x = _nextPos.x;
							p2.y = _nextPos.z;

							var angle : Number = ZMath.getTowPointsAngle(p1, p2);
							var angleRad : Number = angle * Math.PI / 180;
							var cosV : Number = Math.cos(angleRad);
							var sinV : Number = Math.sin(angleRad);
							var dist : Number = _stateReference.speed * 0.001 * elapseTm;
							var posDist : Number = MathUtil.getDistance(p1.x, p1.y, p2.x, p2.y);
							if (dist > posDist)
							{
								(_machine.owner as SceneRole).x = p2.x;
								(_machine.owner as SceneRole).z = p2.y;
							}
							else
							{
								(_machine.owner as SceneRole).x = p1.x + dist * cosV;
								(_machine.owner as SceneRole).z = p1.y + dist * sinV;
							}
						}
						nextPosGapTm = time - SystemTimeManager.curtTm;
						_lastTimeStamp = time;
//						trace("寻路开始时间 + 一个阶段寻路时间   :" +  time  +"   time - SystemTimeManager.curtTm\t" + nextPosGapTm + "\t当前系统时间：\t" + SystemTimeManager.curtTm);
					}
					else
					{
						var distance : Number = MathUtil.getDistance((_machine.owner as SceneRole).x, (_machine.owner as SceneRole).z, _nextPos.x, _nextPos.z);
						nextPosGapTm = (distance / _stateReference.speed * 1000);
						trace("主角一步用的时间:  " + nextPosGapTm + "   主角一步的距离:  " + distance + "   主角一步的速度:  " + _stateReference.speed);
						trace("主角当前位置：         " + (_machine.owner as SceneRole).x + "   " + (_machine.owner as SceneRole).z);
						trace("主角下一步的目标点："  + _nextPos.x + "   " + _nextPos.z);
					}
					if (nextPosGapTm > 0)
					{
//						trace(nextPosGapTm + "    =======================真正一步用的时间");
						(_machine.owner as SceneRole).faceToGround(_nextPos.x, _nextPos.z);
						startMove(_nextPos, _nextPos, nextPosGapTm,path);
						TweenLite.to(_machine.owner as SceneRole, nextPosGapTm * 0.001, {x: _nextPos.x, z: _nextPos.z, onComplete: moveStep, onCompleteParams: [path, timeStamps], onUpdate: onWalkStepUpdate, onUpdateParams: [], ease: Linear.easeNone, overwrite: 0});
					}
					else
					{
						(_machine.owner as SceneRole).x = _nextPos.x;
						(_machine.owner as SceneRole).z = _nextPos.z;
						moveStep(path, timeStamps);
					}
				}
				else //到达
				{
					//执行行走到达回调
					arrive();
				}
			}
		}

		private function onWalkStepUpdate() : void
		{
			if (_machine && !_machine.isInPool)
			{
				if (!_isMoving)
				{
					return;
				}
				if (_stateReference)
				{
					_stateReference.update();
				}
				var currTime : int = getTimer();
				if (currTime - _throughTime > throughDelay)
				{
					_throughTime = currTime;
					through();
				}
			}
		}

		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if ((_machine as RoleStateMachine).isBingDong)
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
			else if ((_machine as RoleStateMachine).isAttackHarding)
			{
				if (!force)
					return false;
			}
			else if ((_machine as RoleStateMachine).isSpriteUp) 
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isLockCaseSpell)
			{
				if (!force)
					return false;
			}
			else if ((_machine as RoleStateMachine).isTripleLockCaseSpell)
			{
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
			else if ((_machine as RoleStateMachine).isBlinkMoving)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isBeatMoving)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isAttacking)
			{
				var attackState : AttackState = _machine.getCurrState(ActionState) as AttackState;
				if (!force && !attackState.attackBroken && !attackState.canWalkRelease)
					return false;
			}
			else if ((_machine as RoleStateMachine).isBlinking)
			{
				var blinkState : BlinkState = _machine.getCurrState(ActionState) as BlinkState;
				if (!force && !blinkState.blinkBroken)
					return false;
			}
			
			return true;
		}

		override public function dispose() : void
		{
			_stateReference = null;
			_lastEndPos = null;
			_lastTimeStamp = 0;
			_nextPos = null;
			_districtWithPath = null;
			_isMoving = false;
			super.dispose();
		}
	}
}
