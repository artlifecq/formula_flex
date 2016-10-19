package com.game.engine3D.controller
{
	import com.game.engine3D.controller.camera.CameraDirectController;
	import com.game.engine3D.controller.camera.CameraLockOnTargetController;
	import com.game.engine3D.controller.camera.CameraLookAtTargetController;
	import com.game.engine3D.enum.CameraModeEnum;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.vo.BaseObj3D;

	import flash.display.InteractiveObject;
	import flash.geom.Vector3D;

	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;
	import away3d.core.math.MathConsts;

	/**
	 * 镜头控制器
	 @author Guodong.Zhang
	 * 创建时间：2015-8-18 上午11:55:33
	 */
	public class CameraController
	{
		private static var _target : ObjectContainer3D;
		private static var _targetObj : BaseObj3D;
		private static var _camera : Camera3D;
		private static var _listenerTarget : InteractiveObject;

		private static var _lockedOnPlayerController : CameraLockOnTargetController;

		public static function get lockedOnPlayerController() : CameraLockOnTargetController
		{
			if (_lockedOnPlayerController == null)
			{
				_lockedOnPlayerController = new CameraLockOnTargetController();
			}
			return _lockedOnPlayerController;
		}

		private static var _lookAtController : CameraLookAtTargetController;

		public static function get lookAtController() : CameraLookAtTargetController
		{
			if (_lookAtController == null)
			{
				_lookAtController = new CameraLookAtTargetController();
			}
			return _lookAtController;
		}

		private static var _directController : CameraDirectController;

		public static function get directController() : CameraDirectController
		{
			if (_directController == null)
			{
				_directController = new CameraDirectController();
			}
			return _directController;
		}

		private static var _mode : int;

		public static function set mode(value : int) : void
		{
			switch (value)
			{
				case CameraModeEnum.LOCK_ON_TARGET:
					switchToLockOnControl();
					break;
				case CameraModeEnum.DIRECT_CAMERA:
					switchToDirectControl();
					break;
				case CameraModeEnum.FIXED_CAMERA_LOOK_AT:
					switchToFixedCameraLookAtControl();
					break;
				case CameraModeEnum.FIXED_TARGET_LOOK_AT_TARGET:
					switchToFixedTargetLookAtControl();
					break;
			}
		}

		public static function get mode() : int
		{
			return _mode;
		}

		public static function get active() : Boolean
		{
			if (_mode == CameraModeEnum.LOCK_ON_TARGET)
			{
				return lockedOnPlayerController.enable && lockedOnPlayerController.active;
			}
			return true;
		}

		public static function closeOperate() : void
		{
			_lockedOnPlayerController.enable = false;
		}

		public static function openOperate() : void
		{
			_lockedOnPlayerController.enable = true;
		}

		public static function forceStopPanning() : void
		{
			lockedOnPlayerController.forceStopPanning();
		}

		public static function update() : void
		{
			if (_mode == CameraModeEnum.LOCK_ON_TARGET && lockedOnPlayerController)
			{
				lockedOnPlayerController.update();
			}
		}

		/**
		 * 初始化和重置控制器
		 * @param $target 镜头跟随的目标（显示对象）
		 * @param $targetObj 镜头跟随的目标（数据对象，比如sceneRole）
		 * @param $listenerTarget 侦听鼠标事件的对象，传空会用舞台侦听
		 * @param $camera 控制的镜头对象，传空会用Stage3DLayerManager.camera
		 *
		 */
		public static function initcontroller($camera : Camera3D, $target : ObjectContainer3D, $targetObj : BaseObj3D = null, $listenerTarget : InteractiveObject = null) : void
		{
			_target = $target;
			_targetObj = $targetObj;
			_camera = $camera;
			_listenerTarget = $listenerTarget ? $listenerTarget : Stage3DLayerManager.stage;
		}

		/**
		 * 初始化和重置跟随锁定目标控制器，此函数只负责初始化配置，要启动此模式需调用switchToLockOnControl()
		 * @param $offsetY 偏移量
		 * @param $xDeg 水平角度
		 * @param $yDeg 垂直角度
		 * @param $distance 镜头离目标的距离
		 * @param $distanceControl 是否可以通过滚轮控制距离
		 * @param $minDistance 最小距离
		 * @param $maxDistance 最大距离
		 * @param $yDegControl 是否可以鼠标右键控制垂直角度
		 * @param $minTiltAngle 最小垂直角度
		 * @param $maxTiltAngle 最大垂直角度
		 * @param $xDegControl 是否可以鼠标右键控制水平角度
		 *
		 */
		public static function initLockOnControl($offsetY : Number, $xDeg : Number, $yDeg : Number, 
												 $distance : Number, $distanceControl : Boolean = false, 
												 $yDegControl : Boolean = false, $xDegControl : Boolean = true, 
												 $minDistance : int = 0, $maxDistance : int = 0, 
												 $minTiltAngle : int = 0, $maxTiltAngle : int = 0, 
												 checkBlock : Boolean = false, blockMinDistance : int = 0, $mouseWheelCallback : Function = null) : void
		{
			lockedOnPlayerController.mouseWheelCallback = $mouseWheelCallback;
			lockedOnPlayerController.minDist = $minDistance;
			lockedOnPlayerController.maxDist = $maxDistance;
			lockedOnPlayerController.minTiltAngle = $minTiltAngle;
			lockedOnPlayerController.maxTiltAngle = $maxTiltAngle;
			lockedOnPlayerController.lookAtObject = _target;
			lockedOnPlayerController.targetObject = _camera;
			lockedOnPlayerController.offsetY = $offsetY;
			lockedOnPlayerController.xDeg = $xDeg;
			lockedOnPlayerController.yDeg = $yDeg;
			lockedOnPlayerController.distance = $distance;
			lockedOnPlayerController.distanceControlable = $distanceControl;
			lockedOnPlayerController.xDegControlable = $xDegControl;
			lockedOnPlayerController.yDegControlable = $yDegControl;

			//智能摄相机设置
			lockedOnPlayerController.view = Stage3DLayerManager.getView();
			lockedOnPlayerController.checkBlock = checkBlock;
			lockedOnPlayerController.minDistance = blockMinDistance;
		}

		public static function switchToLockOnControl() : void
		{
			if (_mode == CameraModeEnum.LOCK_ON_TARGET)
			{
				return;
			}
			stopControl();
			if (_mode > 0)
			{
				if (_mode == CameraModeEnum.DIRECT_CAMERA)
				{
					_target.transform = _camera.transform;
					_target.moveForward(lockedOnPlayerController.distance);
					if (_targetObj)
					{
						_targetObj.x = _target.x;
						_targetObj.y = _target.y;
						_targetObj.z = _target.z;
					}
				}
				if (_mode != CameraModeEnum.LOCK_ON_TARGET)
				{
					if (_targetObj)
					{
						_targetObj.y -= lockedOnPlayerController.offsetY;
					}
					else
					{
						_target.y -= lockedOnPlayerController.offsetY;
					}
				}
				var vec3D : Vector3D = _target.position.clone();
				var subVector : Vector3D = _camera.position.subtract(vec3D);
				lockedOnPlayerController.distance = subVector.length;
				lockedOnPlayerController.yDeg = Math.asin(subVector.y / lockedOnPlayerController.distance) * MathConsts.RADIANS_TO_DEGREES;
				lockedOnPlayerController.xDeg = Math.atan2(subVector.x, subVector.z) * MathConsts.RADIANS_TO_DEGREES + 180;
			}

			lockedOnPlayerController.lookAtObject = _target;
			lockedOnPlayerController.targetObject = _camera;
			lockedOnPlayerController.update(true);
			lockedOnPlayerController.startControl(_listenerTarget);
			_mode = CameraModeEnum.LOCK_ON_TARGET;
		}

		public static function switchToFixedCameraLookAtControl() : void
		{
			if (_mode == CameraModeEnum.FIXED_CAMERA_LOOK_AT)
			{
				return;
			}
			stopControl();
			if (_mode == CameraModeEnum.LOCK_ON_TARGET)
			{
				if (_targetObj)
				{
					_targetObj.y += lockedOnPlayerController.offsetY;
				}
				else
				{
					_target.y += lockedOnPlayerController.offsetY;
				}
			}
			else if (_mode == CameraModeEnum.DIRECT_CAMERA)
			{
				_target.transform = _camera.transform;
				_target.moveForward(lockedOnPlayerController.distance);
				if (_targetObj)
				{
					_targetObj.x = _target.x;
					_targetObj.y = _target.y;
					_targetObj.z = _target.z;
				}
			}
			lookAtController.lookAtObject = _target;
			lookAtController.targetObject = _camera;
			lookAtController.startControl();
			_mode = CameraModeEnum.FIXED_CAMERA_LOOK_AT;
		}

		public static function switchToFixedTargetLookAtControl() : void
		{
			if (_mode == CameraModeEnum.FIXED_TARGET_LOOK_AT_TARGET)
			{
				return;
			}
			if (_mode != CameraModeEnum.FIXED_CAMERA_LOOK_AT)
			{
				switchToFixedCameraLookAtControl();
			}
			_mode = CameraModeEnum.FIXED_TARGET_LOOK_AT_TARGET;
		}

		public static function switchToDirectControl() : void
		{
			if (_mode == CameraModeEnum.DIRECT_CAMERA)
			{
				return;
			}
			stopControl();
			directController.targetObject = _camera;
			directController.xDeg = _camera.rotationY;
			directController.yDeg = _camera.rotationX;
			directController.startControl(_listenerTarget);
			_mode = CameraModeEnum.DIRECT_CAMERA;
		}

		public static function stopControl() : void
		{
			lockedOnPlayerController.lookAtObject = null;
			lockedOnPlayerController.targetObject = null;
			lockedOnPlayerController.stopControl();
			if (lookAtController)
			{
				lookAtController.stopControl();
				lookAtController.lookAtObject = null;
				lookAtController.targetObject = null;
			}
			if (directController)
			{
				directController.targetObject = null;
				directController.stopControl();
			}
		}
	}
}
