package com.game.engine2D.controller
{
	import flash.geom.Vector3D;
	
	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;
	import away3d.events.Object3DEvent;

	/**
	 * 2.5D 摄像机控制类 
	 * @author guoqing.wen
	 * 
	 */
	public class CameraFrontController
	{
		public static var LOCK_DISTANCE:Number = 2200;
		
		private static var _target : ObjectContainer3D;
		private static var _camera : Camera3D;
		
		public function CameraFrontController()
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
			if(_lookAtPosition.x != px || _lookAtPosition.y != py)
			{
				_lookAtPosition.setTo(px, py, 0);
				_camera.x = _lookAtPosition.x;
				_camera.y = _lookAtPosition.y;
				_camera.z = - LOCK_DISTANCE;
				_camera.lookAt(_lookAtPosition);
				
				/*for each(var animator:iCamera3DAnimator in  _camera.camera3DAnimators)
				{
					var cameraVibrateAnimator:CameraVibrateAnimator = animator as CameraVibrateAnimator;
					if(cameraVibrateAnimator)
						_camera.y += animator.offset;
				}*/
			}
		}
		
		public static function onSceneTranform(e:Object3DEvent) : void
		{
			var lookAtPosition:Vector3D = _target.scenePosition;
			lookAt(lookAtPosition.x, lookAtPosition.y);
		}
	}
}