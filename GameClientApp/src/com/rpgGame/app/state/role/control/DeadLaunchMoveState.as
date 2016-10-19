package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.utils.PathFinderUtil;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.state.role.control.MoveState;
	import com.rpgGame.coreData.type.RoleStateType;

	import flash.geom.Vector3D;

	import away3d.pathFinding.DistrictWithPath;

	import gs.TweenLite;
	import gs.easing.Cubic;
	import gs.easing.Linear;

	/**
	 *
	 * 场景角色死亡击飞移动状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-11 下午5:25:12
	 *
	 */
	public class DeadLaunchMoveState extends MoveState
	{
		private var _stateReference : DeadLaunchMoveStateReference;
		private var _totalTime : int;
		private static var tempVector3D : Vector3D = new Vector3D();

		public function DeadLaunchMoveState()
		{
			super(RoleStateType.CONTROL_DEAD_LAUNCH_MOVE);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_stateReference = null;
				if (_ref is DeadLaunchMoveStateReference)
				{
					_stateReference = _ref as DeadLaunchMoveStateReference;
					doLaunch();
				}
				else
					throw new Error("死亡击飞移动状态引用必须是DeadLaunchMoveStateReference类型！");
			}
		}

		private function doLaunch() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true, offsetY: true});

				var dist : int = _stateReference.beatDistance;
				var launchHeight : int = _stateReference.launchHeight;
				var selfX : int = (_machine.owner as SceneRole).x;
				var selfZ : int = (_machine.owner as SceneRole).z;
				var atkorX : int = _stateReference.atkorPos.x;
				var atkorY : int = _stateReference.atkorPos.y;
				var angle : int = MathUtil.getAngle(atkorX, atkorY, selfX, selfZ);
				var dx : int = MathUtil.getDxByAngle(dist, angle);
				var dy : int = MathUtil.getDyByAngle(dist, angle);

				var targetX : int = selfX + dx;
				var targetZ : int = selfZ + dy;
				tempVector3D.setTo(targetX, 0, targetZ);
				var districtWithPath : DistrictWithPath = SceneManager.getDistrict((_machine.owner as SceneRole).sceneName);
				if (PathFinderUtil.isSolid(districtWithPath, tempVector3D))
				{
					var forwardPos : Vector3D = PathFinderUtil.getForwardPointInSide(districtWithPath, (_machine.owner as SceneRole).position, tempVector3D);
					targetX = forwardPos.x;
					targetZ = forwardPos.z;
					dist = MathUtil.getDistance(selfX, selfZ, targetX, targetZ);
				}
				_totalTime = dist / _stateReference.beatSpeed * 1000;

				(_machine.owner as SceneRole).faceToGround(atkorX, atkorY, 0);
				TweenLite.to(_machine.owner as SceneRole, _totalTime * 0.001, {x: targetX, z: targetZ, ease: Linear.easeNone, overwrite: 0, onComplete: onMoveComplete});
				if (launchHeight > 0)
					TweenLite.to(_machine.owner as SceneRole, _totalTime * 0.5 * 0.001, {offsetY: launchHeight, ease: Cubic.easeOut, overwrite: 0, onComplete: onJumpOffComplete});
			}
		}

		private function onMoveComplete() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				(_machine.owner as SceneRole).offsetY = 0;
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true, offsetY: true});
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
				var launchHeight : int = _stateReference.launchHeight;
				if (launchHeight <= 0)
					transition(RoleStateType.ACTION_DEATH);
			}
		}

		private function onJumpOffComplete() : void
		{
			TweenLite.to(_machine.owner as SceneRole, _totalTime * 0.5 * 0.001, {offsetY: 0, ease: Cubic.easeIn, overwrite: 0, onComplete: onJumpFallComplete});
		}

		private function onJumpFallComplete() : void
		{
		}

		override public function leave() : void
		{
			super.leave();
			stopLaunch();
		}

		private function stopLaunch() : void
		{
			stopJump();
			if (_machine && !_machine.isDisposed)
			{
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x: true, z: true, offsetY: true});
			}
		}

		private function stopJump() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				(_machine.owner as SceneRole).offsetY = 0;
			}
		}

		override public function dispose() : void
		{
			_stateReference = null;
			super.dispose();
		}
	}
}
