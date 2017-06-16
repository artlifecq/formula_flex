package com.editor.state.role.control
{
	import com.editor.data.RoleStateType;
	import com.editor.data.TrailPathPoint;
	import com.editor.manager.SceneManager;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.RoleStateMachine;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.utils.MathUtil;
	import com.game.mainCore.libCore.utils.ZMath;

	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.getTimer;

	import gs.TweenLite;
	import gs.easing.Linear;

	/**
	 *
	 * 场景角色轨道移动状态
	 * @author L.L.M.Sunny
	 * 创建时间：2016-6-23 下午5:25:12
	 *
	 */
	public class TrailMoveState extends MoveState
	{
		private static var p1 : Point = new Point();
		private static var p2 : Point = new Point();
		private const throughDelay : int = 300;
		private var _stateReference : TrailMoveStateReference;
		private var _lastPos : TrailPathPoint;
		private var _nextPos : TrailPathPoint;
		private var _isMoving : Boolean;
		private var _throughTime : int;
		private var _lastEndPos : TrailPathPoint;

		public function TrailMoveState()
		{
			super(RoleStateType.CONTROL_TRAIL_MOVE);
			_isMoving = false;
		}

		override public function execute() : void
		{
			super.execute();
			_stateReference = null;
			if (_ref is TrailMoveStateReference)
			{
				_stateReference = _ref as TrailMoveStateReference;
				walkByInfo();
			}
			else
				throw new Error("轨道移动状态引用必须是TrailMoveStateReference类型！");
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

		private function through() : void
		{
			if (_stateReference)
			{
				_stateReference.through();
			}
		}

		private function startMove(nextPos : TrailPathPoint, nextPosGapTm : int) : void
		{
			if (_stateReference)
			{
				_stateReference.nextPos = nextPos;
				_stateReference.nextPosGapTm = nextPosGapTm;
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
				_isMoving = false;
				_stateReference.path = null;
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, y: true, z: true});
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE);
				if ((_machine as RoleStateMachine).isPrewarWaiting)
					transition(RoleStateType.ACTION_PREWAR);
				else
					transition(RoleStateType.ACTION_IDLE);
				_stateReference.arrive();
			}
		}

		public function get lastEndPos() : TrailPathPoint
		{
			return _lastEndPos;
		}

		private function stopWalk() : void
		{
			if (_machine && !_machine.isInPool)
			{
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, y: true, z: true});
				_stateReference.path = null;
				//执行行走被停止回调
				if (_isMoving)
					_stateReference.stop();
				_stateReference.end();
				_isMoving = false;
				_stateReference.startPos = null;
				_stateReference.endPos = null;
				_lastEndPos = null;
			}
		}

		private function walkByInfo() : void
		{
			if (_machine && !_machine.isInPool)
			{
				var pathPoints : Vector.<TrailPathPoint> = _stateReference.pathPoints;
				var path : Vector.<TrailPathPoint> = new Vector.<TrailPathPoint>();
				var timeStamps : Array = [];
				var lastPath : TrailPathPoint = null;
				var lastPathPos : Vector3D = null;
				var time : Number = 0;
				var dis : Number = 0;
				var lastPos : Vector3D = new Vector3D();
				var len : int = pathPoints.length;
				for (var i : int = 0; i < len; i++)
				{
					var point : TrailPathPoint = pathPoints[i];
					if (lastPath)
					{
						lastPos.setTo(lastPath.x, lastPath.y, lastPath.z);
						dis = MathUtil.getDistance(point.x, point.z, lastPos.x, lastPos.z);
						time = time + (dis / lastPath.speed * 1000);
					}
					else
					{
						time = _stateReference.startTime;
					}
					if (i == 0 || i == len - 1) //起点和终点
					{
						var scene : GameScene3D = SceneManager.getInstance().mainScene;
						point.y = scene.sceneMapLayer.queryHeightAt(point.x, point.z);
					}
					lastPath = point;
					path.push(point);
					timeStamps.push(time);
				}
				_stateReference.path = path;
				var pathStartPos : TrailPathPoint = path[0];
				var pathEndPos : TrailPathPoint = path[path.length - 1];
				(_machine.owner as SceneRole).position = new Vector3D(pathStartPos.x, pathStartPos.y, pathStartPos.z);
				_lastPos = pathStartPos;
				if (isArriveTarget(pathStartPos, pathEndPos))
				{
					(_machine.owner as SceneRole).faceToGround(_stateReference.endPos.x, _stateReference.endPos.z);
					//执行行走到达回调
					arrive();
				}
				else
				{
					//去掉自身位置的点,并更新自身初始位置
					_stateReference.startPos = path.shift();
					_stateReference.endPos = path[path.length - 1];
					timeStamps.shift();
					timeStamps = null; //编辑器不需要时间戳
					//开始行走
					walkByPath(path, timeStamps);
				}
			}
		}

		private function isArriveTarget(startPos : TrailPathPoint, endPos : TrailPathPoint) : Boolean
		{
			var dist : Number = MathUtil.getDistanceNoSqrt(startPos.x, startPos.z, endPos.x, endPos.z);
			if (dist < 100)
				return true;
			return false;
		}

		private function walkByPath(path : Vector.<TrailPathPoint>, timeStamps : Array = null) : void
		{
			if (_machine && !_machine.isInPool)
			{
				_isMoving = true;
				_lastEndPos = _stateReference.endPos;
				if (path.length < 1)
				{
					(_machine.owner as SceneRole).faceToGround(_stateReference.endPos.x, _stateReference.endPos.z);
					//执行行走到达回调
					arrive();
					return;
				}
				//用TweenLite来执行行走...
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, y: true, z: true});
				startMoveStep(path, timeStamps);
			}
		}

		private function startMoveStep(path : Vector.<TrailPathPoint>, timeStamps : Array = null) : void
		{
			if (_machine && !_machine.isInPool)
			{
				_throughTime = getTimer();
				//执行开始行走回调
				ready();
				moveStep(path, timeStamps);
			}
		}

		private function moveStep(path : Vector.<TrailPathPoint>, timeStamps : Array = null) : void
		{
			if (_machine && !_machine.isInPool)
			{
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, y: true, z: true});
				if ((_machine.owner as SceneRole).usable && path && path.length)
				{
					_stateReference.speed = _lastPos.speed;
					_stateReference.baseActionSpeed = _lastPos.baseActionSpeed;
					_stateReference.statusType = _lastPos.statusType;
					var nextPosGapTm : int;
					_nextPos = path.shift();
					if (timeStamps)
					{
						var time : Number = timeStamps.shift();
						var elapseTm : int = getTimer() - time; //SystemTimeManager.curtTm - time;
						if (elapseTm > 0)
						{
							p1.x = (_machine.owner as SceneRole).x;
							p1.y = (_machine.owner as SceneRole).z;
							p2.x = _nextPos.x;
							p2.y = _nextPos.z;

							var angle : Number = ZMath.getTowPointsAngle(p2, p1);
							var angleRad : Number = angle * Math.PI / 180;
							var cosV : Number = Math.cos(angleRad);
							var sinV : Number = Math.sin(angleRad);
							var dist : Number = _lastPos.speed * 0.001 * elapseTm;
							p1.x = p1.x + dist * cosV;
							p1.y = p1.y + dist * sinV;
							(_machine.owner as SceneRole).x = p1.x;
							(_machine.owner as SceneRole).z = p1.y;
						}
						nextPosGapTm = time - getTimer(); //time - SystemTimeManager.curtTm;
					}
					else
					{
						var distance : Number = MathUtil.getDistance((_machine.owner as SceneRole).x, (_machine.owner as SceneRole).z, _nextPos.x, _nextPos.z);
						nextPosGapTm = (distance / _lastPos.speed * 1000);
					}
					(_machine.owner as SceneRole).faceToGround(_nextPos.x, _nextPos.z);
					(_machine.owner as SceneRole).tiltTo(_lastPos.tiltAngle);
					startMove(_nextPos, nextPosGapTm);
					_lastPos = _nextPos;
					if (nextPosGapTm > 0)
					{
						TweenLite.to(_machine.owner as SceneRole, nextPosGapTm * 0.001, {x: _nextPos.x, y: _nextPos.y, z: _nextPos.z, onComplete: moveStep, onCompleteParams: [path, timeStamps], onUpdate: onWalkStepUpdate, onUpdateParams: [], ease: Linear.easeNone, overwrite: 0});
					}
					else
					{
						(_machine.owner as SceneRole).x = _nextPos.x;
						(_machine.owner as SceneRole).y = _nextPos.y;
						(_machine.owner as SceneRole).z = _nextPos.z;
						_lastPos = _nextPos;
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
			else if ((_machine as RoleStateMachine).isAttackHarding)
			{
				if (!force)
					return false;
			}
			else if (!(_machine as RoleStateMachine).passTo(RoleStateType.ACTION_TRAIL))
			{
				if (!force)
					return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			_stateReference = null;
			_lastEndPos = null;
			_lastPos = null;
			_nextPos = null;
			_isMoving = false;
			super.dispose();
		}
	}
}
