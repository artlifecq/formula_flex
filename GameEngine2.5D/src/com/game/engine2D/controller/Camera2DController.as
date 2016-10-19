package com.game.engine2D.controller
{
	import com.game.engine3D.config.GlobalConfig;
	
	import flash.geom.Vector3D;
	
	import away3d.animators.CameraVibrateAnimator;
	import away3d.cameras.Camera3D;
	import away3d.cameras.iCamera3DAnimator;
	import away3d.containers.ObjectContainer3D;
	import away3d.core.math.MathConsts;
	import away3d.events.Object3DEvent;

	/**
	 * 2D 摄像机控制类 
	 * @author guoqing.wen
	 * 
	 */
	public class Camera2DController
	{
		private static var LOCK_CAMERA_DEGREE:Number = GlobalConfig.MAP_2D_CAMERA_ANGLE;
		private static var LOCK_DISTANCE:Number = 2200;
		private static var LOCK_Y_FACTOR:Number = 1;
		
		private static var _target : ObjectContainer3D;
		private static var _camera : Camera3D;
		
		public function Camera2DController()
		{
		}
		
		/**
		 * 初始化和重置控制器
		 * @param $target 镜头跟随的目标（显示对象）
		 * @param $targetObj 镜头跟随的目标（数据对象，比如sceneRole）
		 * @param $listenerTarget 侦听鼠标事件的对象，传空会用舞台侦听
		 * @param $camera 控制的镜头对象，传空会用Stage3DLayerManager.camera
		 *
		 */
		public static function initcontroller($camera : Camera3D, $target : ObjectContainer3D = null) : void
		{
			if(_target)$target.removeEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onSceneTranform);
			_target = $target;
			_camera = $camera;
			if(_target){
				$target.addEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onSceneTranform);
				onSceneTranform(null);
			}
			
		}
		
		public static function destoryController() : void
		{
			if(_target){
				_target.removeEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onSceneTranform);
			}
			_target = null;
			_camera = null;
		}
		
		static private var _lookAtPosition:Vector3D = new Vector3D();
		public static function lookAt(px:Number, py:Number) : void
		{
			//trace("lookAt:",px, py);
			if(isNaN(px))px = 0;
			if(isNaN(py))py = 0;
			if(_lookAtPosition.x != px || _lookAtPosition.z != py)
			{
				_lookAtPosition.setTo(px, 0, py);
				_camera.x = _lookAtPosition.x + LOCK_DISTANCE * Math.sin(180 * MathConsts.DEGREES_TO_RADIANS) * Math.cos(LOCK_CAMERA_DEGREE * MathConsts.DEGREES_TO_RADIANS);
				_camera.z = _lookAtPosition.z + LOCK_DISTANCE * Math.cos(180 * MathConsts.DEGREES_TO_RADIANS) * Math.cos(LOCK_CAMERA_DEGREE * MathConsts.DEGREES_TO_RADIANS);
				_camera.y = _lookAtPosition.y + LOCK_DISTANCE * Math.sin(LOCK_CAMERA_DEGREE * MathConsts.DEGREES_TO_RADIANS) * LOCK_Y_FACTOR;
				_camera.lookAt(_lookAtPosition);
				
				for each(var animator:iCamera3DAnimator in  _camera.camera3DAnimators)
				{
					var cameraVibrateAnimator:CameraVibrateAnimator = animator as CameraVibrateAnimator;
					if(cameraVibrateAnimator)
						_camera.y += animator.offset;
				}
			}
		}
		
		public static function onSceneTranform(e:Object3DEvent) : void
		{
			var lookAtPosition:Vector3D = _target.scenePosition;
			lookAt(lookAtPosition.x, lookAtPosition.z);
		}
	}
}