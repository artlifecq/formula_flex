package com.game.engine2D.controller
{
	import com.game.engine2D.scene.SceneCamera;
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.display.InteractiveObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import away3d.animators.CameraVibrateAnimator;
	import away3d.cameras.Camera3D;
	import away3d.cameras.iCamera3DAnimator;
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Entity;
	import away3d.events.Event;
	import away3d.events.Object3DEvent;

	/**
	 * 2.5D 摄像机控制类 
	 * 主要用来控制camera3d 的位置。根据主角的位置，来调整camera3d的位置
	 * @author guoqing.wen
	 * 
	 */
	public class CameraFrontController
	{
		public static var LOCK_DISTANCE:Number = 100000;
		public static var LOCK_NEAR_FAR:Number = 120000;
		
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
		
		/**
		 * 设置镜头的位置 
		 * @param px
		 * @param py
		 * 
		 */		
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
//                screenVibration();
			}
		}
		
		public static function screenVibration():void
		{
            if (null == _camera) {
                return;
            }
			_camera.y = _lookAtPosition.y;
			for each(var animator:iCamera3DAnimator in  _camera.camera3DAnimators)
			{
				var cameraVibrateAnimator:CameraVibrateAnimator = animator as CameraVibrateAnimator;
				if(cameraVibrateAnimator) {
					_camera.y += animator.offset;
                }
			}
		}
		
		public static function onSceneTranform(e:Object3DEvent) : void
		{
			var lookAtPosition:Vector3D = _target.scenePosition;
			lookAt(lookAtPosition.x, lookAtPosition.z);
		}
		
		////////////////////////////////////////////////////////////////////////////////
		//
		// 以下为测试代码，主要用来监听鼠标滚轮，鼠标右键的事件，
		// 1.鼠标滚轮，主要用来控制缩放值
		// 2.鼠标右键，主要用来控制光照方向，用来调整阴影等
		//
		///////////////////////////////////////////////////////////////////////////////
		private static var _targetObject:Entity;
		/**控制的光照*/
		public static function get targetObject():Entity
		{
			return _targetObject;
		}
		public static function set targetObject(value:Entity):void
		{
			_targetObject = value;
		}
		
		private static var _sceneCamera:SceneCamera;
		public static function get sceneCamera():SceneCamera
		{
			return _sceneCamera;
		}
		public static function set sceneCamera(value:SceneCamera):void
		{
			_sceneCamera = value;
		}
		
		private static var _listenerTarget:InteractiveObject;
		private static var _pan : Point = new Point();
		private static var _mouseOutDetected : Boolean = false;
		private static var _ispanning : Boolean;
		
		private static var _mouseRightSpeed : Number = 0.8;
		/**鼠标右键速度*/
		public static function get mouseRightSpeed():Number
		{
			return _mouseRightSpeed;
		}
		public static function set mouseRightSpeed(value:Number):void
		{
			_mouseRightSpeed = value;
		}
		
		private static var _xDeg : Number = 0;
		/**水平角度*/
		public static function get xDeg():Number
		{
			return _xDeg;
		}
		public static function set xDeg(value:Number):void
		{
			_xDeg = value;
			if(_targetObject)
			{
				_targetObject.rotationY = _xDeg;
			}
		}
		
		private static var _yDeg : Number = 0;
		/**垂直角度*/
		public static function get yDeg():Number
		{
			return _yDeg;
		}
		public static function set yDeg(value:Number):void
		{
			_yDeg = value;
			if(_targetObject)
			{
				_targetObject.rotationX = _yDeg;
			}
		}
		
		private static var _xDegControlable:Boolean = true;
		/**是否能控制水平角度旋转视角*/
		public static function set xDegControlable(value:Boolean):void
		{
			_xDegControlable = value;
		}
		
		private static var _yDegControlable:Boolean = true;
		/**是否能控制垂直角度旋转视角*/
		public static function set yDegControlable(value:Boolean):void
		{
			_yDegControlable = value;
		}

		
		public static function get active() : Boolean
		{
			return !_mouseOutDetected;
		}
		
		public static function startControl($listenerTarget:InteractiveObject):void
		{
			_listenerTarget = $listenerTarget;
			_listenerTarget.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_listenerTarget.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_listenerTarget.addEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
			_listenerTarget.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onMouseRightDown);
			_listenerTarget.addEventListener(MouseEvent.RIGHT_MOUSE_UP, onMouseRightUp);
			_listenerTarget.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
			Stage3DLayerManager.stage3DProxy.addEventListener(away3d.events.Event.ENTER_FRAME, loop);
		}
		
		public static function stopControl():void
		{
			if(_listenerTarget)
			{
				_listenerTarget.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
				_listenerTarget.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
				_listenerTarget.removeEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
				_listenerTarget.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onMouseRightDown);
				_listenerTarget.removeEventListener(MouseEvent.RIGHT_MOUSE_UP, onMouseRightUp);
				_listenerTarget.removeEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
				Stage3DLayerManager.stage3DProxy.removeEventListener(away3d.events.Event.ENTER_FRAME, loop);
			}
		}
		
		private static function onMouseRightDown(e : MouseEvent) : void
		{
			if (active)
			{
				var stage : Stage = Stage3DLayerManager.stage;
				if (!stage)
					return;
				//鼠标右键down的时候，会触发mouseLeave事件，所以先必须移除leave事件的监听
				stage.removeEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
				stage.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
				_pan.x = stage.mouseX;
				_pan.y = stage.mouseY;
				_ispanning = true;
			}
			if(distance != 1.15)
			{
				distance = 1.15;
				sceneCamera.updateScale(distance);
			}
		}
		
		private static function onMouseRightUp(e : MouseEvent) : void
		{
			var stage : Stage = Stage3DLayerManager.stage;
			if (!stage)
				return;
			stage.addEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
			stage.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_ispanning = false;
		}
		
		private static function loop(e : away3d.events.Event) : void
		{
			if (active)
			{
				if (_ispanning)
				{
					updateMouseRotation();
				}
			}
		}
		
		private static function updateMouseRotation() : void
		{
			var stage : Stage = Stage3DLayerManager.stage;
			if (!stage)
				return;
			var dx : Number = stage.mouseX - _pan.x;
			var dy : Number = stage.mouseY - _pan.y;
			
			if (!checkIfMoved(dx, dy))
			{
				return;
			}
			_pan.x = stage.mouseX;
			_pan.y = stage.mouseY;
			if(_yDegControlable)
			{
				yDeg += (dy * _mouseRightSpeed);
			}
			if(_xDegControlable)
			{
				xDeg += (dx * _mouseRightSpeed);
			}
		}
		
		private static function checkIfMoved(dx : Number, dy : Number) : Boolean
		{
			if (dx != 0 || dy != 0)
			{
				return true;
			}
			return false;
		}
		
		private static function onMouseOver(event : MouseEvent) : void
		{
			_mouseOutDetected = false;
		}
		
		private static function onMouseOut(event : MouseEvent) : void
		{
			_mouseOutDetected = true;
			_ispanning = false;
		}
		
		private static function onMouseLeave(event : flash.events.Event) : void
		{
			_mouseOutDetected = true;
			_ispanning = false;
		}
		
		private static var _mouseWheelSpeed : Number = 0.01;
		
		/**鼠标滚轮速度*/
		public static function get mouseWheelSpeed() : Number
		{
			return _mouseWheelSpeed;
		}
		
		public static function set mouseWheelSpeed(value : Number) : void
		{
			_mouseWheelSpeed = value;
		}
		
		public static var distance:Number=1;
		private static function onMouseWheel(event : MouseEvent) : void
		{
			distance += _mouseWheelSpeed * event.delta;
			if(distance <= 0.2)
			{
				distance = 0.2;
			}
			else if(distance > 5)
			{
				distance = 5;
			}
			sceneCamera.updateScale(distance);
		}
	}
}