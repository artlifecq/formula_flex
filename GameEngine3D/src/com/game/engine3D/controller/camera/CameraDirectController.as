package com.game.engine3D.controller.camera
{
	import com.game.engine3D.manager.Stage3DLayerManager;

	import flash.display.InteractiveObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Vector3D;

	import away3d.entities.Entity;
	import away3d.events.Event;

	/**
	 * 镜头直接控制
	 @author Guodong.Zhang
	 * 创建时间：2015-8-18 下午2:20:29
	 */
	public class CameraDirectController
	{
		private var _listenerTarget : InteractiveObject;
		private var _pan : Point = new Point();
		private var _mouseOutDetected : Boolean = false;
		private var _ispanning : Boolean;

		private var _mouseRightSpeed : Number = 0.8;

		/**鼠标右键速度*/
		public function get mouseRightSpeed() : Number
		{
			return _mouseRightSpeed;
		}

		public function set mouseRightSpeed(value : Number) : void
		{
			_mouseRightSpeed = value;
		}

		/**水平角度*/
		public function get rotationY() : Number
		{
			return _rotation.y;
		}

		public function set rotationY(value : Number) : void
		{
			_rotation.y = value;
			if (_targetObject)
				_targetObject.rotationY = _rotation.y;
		}

		/**垂直角度*/
		public function get rotationX() : Number
		{
			return _rotation.x;
		}

		public function set rotationX(value : Number) : void
		{
			_rotation.x = value;
			if (_targetObject)
				_targetObject.rotationX = _rotation.x;
		}

		/**滚动角度*/
		public function get rotationZ() : Number
		{
			return _rotation.z;
		}

		public function set rotationZ(value : Number) : void
		{
			_rotation.z = value;
			if (_targetObject)
				_targetObject.rotationZ = _rotation.z;
		}

		private var _position : Vector3D = new Vector3D();

		public function get position() : Vector3D
		{
			return _position;
		}

		public function set position(value : Vector3D) : void
		{
			_position = value;
			if (_targetObject)
				_targetObject.position = _position;
		}

		private var _rotation : Vector3D = new Vector3D();

		public function get rotation() : Vector3D
		{
			return _rotation;
		}

		public function set rotation(value : Vector3D) : void
		{
			_rotation = value;
			if (_targetObject)
				_targetObject.rotateTo(_rotation.x * 57.3, _rotation.y * 57.3, _rotation.z * 57.3);
		}

		private var _targetObject : Entity;

		/**控制的镜头*/
		public function get targetObject() : Entity
		{
			return _targetObject;
		}

		public function set targetObject(value : Entity) : void
		{
			_targetObject = value;
			if (_targetObject)
			{
				_targetObject.position = _position;
				_targetObject.rotateTo(_rotation.x * 57.3, _rotation.y * 57.3, _rotation.z * 57.3);
			}
		}

		private var _xRotateControlable : Boolean = true;

		/**是否能控制水平角度旋转视角*/
		public function set xRotateControlable(value : Boolean) : void
		{
			_xRotateControlable = value;
		}

		private var _yRotateControlable : Boolean = true;

		/**是否能控制垂直角度旋转视角*/
		public function set yRotateControlable(value : Boolean) : void
		{
			_yRotateControlable = value;
		}

		public function get active() : Boolean
		{
			return !_mouseOutDetected;
		}

		public function CameraDirectController()
		{
		}

		public function startControl($listenerTarget : InteractiveObject) : void
		{
			_listenerTarget = $listenerTarget;
			_listenerTarget.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_listenerTarget.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_listenerTarget.addEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
			_listenerTarget.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onMouseRightDown);
			_listenerTarget.addEventListener(MouseEvent.RIGHT_MOUSE_UP, onMouseRightUp);
			Stage3DLayerManager.stage3DProxy.addEventListener(away3d.events.Event.ENTER_FRAME, loop);
		}

		public function stopControl() : void
		{
			if (_listenerTarget)
			{
				_listenerTarget.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
				_listenerTarget.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
				_listenerTarget.removeEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
				_listenerTarget.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onMouseRightDown);
				_listenerTarget.removeEventListener(MouseEvent.RIGHT_MOUSE_UP, onMouseRightUp);
				Stage3DLayerManager.stage3DProxy.removeEventListener(away3d.events.Event.ENTER_FRAME, loop);
			}
		}

		private function onMouseRightDown(e : MouseEvent) : void
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
		}

		private function onMouseRightUp(e : MouseEvent) : void
		{
			var stage : Stage = Stage3DLayerManager.stage;
			if (!stage)
				return;
			stage.addEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
			stage.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_ispanning = false;
		}

		private function loop(e : away3d.events.Event) : void
		{
			if (active)
			{
				if (_ispanning)
				{
					updateMouseRotation();
				}
			}
		}

		private function updateMouseRotation() : void
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
			if (_xRotateControlable)
			{
				rotationX += (dy * _mouseRightSpeed);
			}
			if (_yRotateControlable)
			{
				rotationY += (dx * _mouseRightSpeed);
			}
		}

		private function checkIfMoved(dx : Number, dy : Number) : Boolean
		{
			if (dx != 0 || dy != 0)
			{
				return true;
			}
			return false;
		}

		private function onMouseOver(event : MouseEvent) : void
		{
			_mouseOutDetected = false;
		}

		private function onMouseOut(event : MouseEvent) : void
		{
			_mouseOutDetected = true;
			_ispanning = false;
		}

		private function onMouseLeave(event : flash.events.Event) : void
		{
			_mouseOutDetected = true;
			_ispanning = false;
		}
	}
}
