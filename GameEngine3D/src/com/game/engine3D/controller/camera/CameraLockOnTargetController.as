package com.game.engine3D.controller.camera
{
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.mainCore.core.controller.KeyController;
	
	import flash.display.InteractiveObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.ui.Multitouch;
	
	import away3d.controllers.LockedOnPlayerController;
	import away3d.events.Event;
	
	import gs.TweenLite;
	import gs.easing.Linear;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 镜头跟随目标控制器
	 * @ author Guodong.Zhang
	 * 创建时间：2015-8-18 下午2:16:04
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-03-16 下午3:05:12
	 */
	public class CameraLockOnTargetController extends LockedOnPlayerController
	{
		public var mouseWheelCallback : Function;
		public var minDist : Number = 0;
		public var maxDist : Number = int.MAX_VALUE;
		public var degTweenDuration : Number = 0;
		public var distTweenDuration : Number = 0;
		private var _listenerTarget : InteractiveObject;
		private var _mouseOutDetected : Boolean = false;
		private var _pan : Point = new Point();
		private var _isMouseDown : Boolean;
		private var _isMouseRightDown : Boolean;
		private var _ispanning : Boolean;
		private var _distance : Number = 0;
		private var _enable : Boolean = false;
		private var _mouseLeftControlable : Boolean = true; // 是否启用鼠标左键拖动镜头。Note:OSX平台下面按住右键之后，stage不会在触发MouseMove事件，以及更新stage.mouseX,stage.mouseY。Windows平台下面Air可能会出现上述问题
		private var _mouseRightControlable : Boolean = true;
		private var _mouseDownPosition : Point = new Point(); // 鼠标按下位置

		public function get mouseLeftControlable() : Boolean
		{
			return _mouseLeftControlable;
		}

		public function get mouseRightControlable() : Boolean
		{
			return _mouseRightControlable;
		}

		public function set mouseRightControlable(value : Boolean) : void
		{
			_mouseRightControlable = value;
		}

		/**
		 * 是否启用坐标拖动镜头
		 * @param value
		 *
		 */
		public function set mouseLeftControlable(value : Boolean) : void
		{
			_mouseLeftControlable = value;
		}

		public function get mouseDownPosition() : Point
		{
			return _mouseDownPosition;
		}

		public function get enable() : Boolean
		{
			return _enable;
		}

		public function set enable(value : Boolean) : void
		{
			_enable = value;
		}

		private var _mouseWheelSpeed : Number = 5;

		/**鼠标滚轮速度*/
		public function get mouseWheelSpeed() : Number
		{
			return _mouseWheelSpeed;
		}

		public function set mouseWheelSpeed(value : Number) : void
		{
			_mouseWheelSpeed = value;
		}

		private var _mouseRightSpeed : Number = 0.8;

		/**鼠标滚轮速度*/
		public function get mouseRightSpeed() : Number
		{
			return _mouseRightSpeed;
		}

		public function set mouseRightSpeed(value : Number) : void
		{
			_mouseRightSpeed = value;
		}

		private var _xDegControlable : Boolean = true;

		public function get xDegControlable() : Boolean
		{
			return _xDegControlable;
		}

		/**是否能控制水平角度旋转视角*/
		public function set xDegControlable(value : Boolean) : void
		{
			_xDegControlable = value;
		}

		private var _yDegControlable : Boolean = true;

		public function get yDegControlable() : Boolean
		{
			return _yDegControlable;
		}

		/**是否能控制垂直角度旋转视角*/
		public function set yDegControlable(value : Boolean) : void
		{
			_yDegControlable = value;
		}

		private var _distanceControlable : Boolean;

		/**是否能控制滚轮调整*/
		public function set distanceControlable(value : Boolean) : void
		{
			_distanceControlable = value;
		}

		private var _xDeg : Number = 0;

		/**水平角度*/
		public function set xDeg(value : Number) : void
		{
			_xDeg = value;
			TweenLite.killTweensOf(this, false, {panAngle: true});
			if (degTweenDuration > 0)
			{
				TweenLite.to(this, degTweenDuration, {panAngle: -(180 - _xDeg), ease: Linear.easeNone, overwrite: 0});
			}
			else
			{
				panAngle = -(180 - _xDeg);
			}
			EventManager.dispatchEvent(SceneEvent.CAMERA_PAN_CHANGE);
		}

		public function get xDeg() : Number
		{
			return _xDeg;
		}

		private var _yDeg : Number = 0;

		/**垂直角度*/
		public function set yDeg(value : Number) : void
		{
			_yDeg = value;
			if (_yDeg > maxTiltAngle)
				_yDeg = maxTiltAngle;
			else if (_yDeg < minTiltAngle)
				_yDeg = minTiltAngle;
			TweenLite.killTweensOf(this, false, {tiltAngle: true});
			if (degTweenDuration > 0)
			{
				TweenLite.to(this, degTweenDuration, {tiltAngle: _yDeg, ease: Linear.easeNone, overwrite: 0});
			}
			else
			{
				tiltAngle = _yDeg;
			}
			EventManager.dispatchEvent(SceneEvent.CAMERA_TILT_CHANGE);
		}

		public function get yDeg() : Number
		{
			return _yDeg;
		}

		/**摄像机与目标的距离*/
		override public function set distance(val : Number) : void
		{
			_distance = val;
			if (val > maxDist)
			{
				_distance = maxDist;
			}
			else if (val < minDist)
			{
				_distance = minDist;
			}
			else
			{
				_distance = val;
			}
			TweenLite.killTweensOf(this, false, {superDistance: true});
			if (distTweenDuration > 0)
			{
				TweenLite.to(this, distTweenDuration, {superDistance: _distance, ease: Linear.easeNone, overwrite: 0});
			}
			else
			{
				superDistance = _distance;
			}
			EventManager.dispatchEvent(SceneEvent.CAMERA_DISTANCE_CHANGE);
		}

		override public function get distance() : Number
		{
			return _distance;
		}

		public function set superDistance(val : Number) : void
		{
			super.distance = val;
		}

		public function get superDistance() : Number
		{
			return super.distance;
		}

		public function get active() : Boolean
		{
			return enable && !_mouseOutDetected;
		}

		public function CameraLockOnTargetController()
		{
			super(null, null);
		}

		public function updateControl() : void
		{
			if (_listenerTarget)
			{
				if (_distanceControlable)
				{
					_listenerTarget.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
				}
				else
				{
					_listenerTarget.removeEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
				}
				if (_yDegControlable || _xDegControlable)
				{
					startMouseRightControl();
				}
				else
				{
					stopMouseRightControl();
				}
			}
		}

		public function startControl($listenerTarget : InteractiveObject) : void
		{
			_listenerTarget = $listenerTarget;
			enable = true;
			endPanning();
			_isMouseDown = false;
			_isMouseRightDown = false;
			if (_distanceControlable)
			{
				_listenerTarget.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
			}
			if (_yDegControlable || _xDegControlable)
			{
				startMouseRightControl();
			}
		}

		public function stopControl() : void
		{
			enable = false;
			endPanning();
			_isMouseDown = false;
			_isMouseRightDown = false;
			if (_listenerTarget)
			{
				_listenerTarget.removeEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
				stopMouseRightControl();
			}
		}

		public function forceStopPanning() : void
		{
			endPanning();
			_isMouseDown = false;
			_isMouseRightDown = false;
		}

		private function startMouseRightControl() : void
		{
			_listenerTarget.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			_listenerTarget.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_listenerTarget.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_listenerTarget.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_listenerTarget.addEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
			_listenerTarget.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onMouseRightDown);
			_listenerTarget.addEventListener(MouseEvent.RIGHT_MOUSE_UP, onMouseRightUp);
			Stage3DLayerManager.stage3DProxy.addEventListener(away3d.events.Event.ENTER_FRAME, loop);
		}

		private function stopMouseRightControl() : void
		{
			_listenerTarget.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			_listenerTarget.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_listenerTarget.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_listenerTarget.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_listenerTarget.removeEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
			_listenerTarget.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onMouseRightDown);
			_listenerTarget.removeEventListener(MouseEvent.RIGHT_MOUSE_UP, onMouseRightUp);
			Stage3DLayerManager.stage3DProxy.removeEventListener(away3d.events.Event.ENTER_FRAME, loop);
		}

		public function get isMouseRightDown() : Boolean
		{
			return _isMouseRightDown;
		}

		public function get isMouseDown() : Boolean
		{
			return _isMouseDown;
		}

		private function loop(e : away3d.events.Event) : void
		{
			if (active)
			{
				if (_isMouseDown)
				{
					if (_mouseLeftControlable)
					{
						if (!_ispanning)
						{
							startPanning();
						}
					}
					else if (KeyController.instance.isKeyDown(Keyboard.CONTROL))
					{
						if (!_ispanning)
							startPanning();
					}
					else
					{
						if (_ispanning)
							endPanning();
					}
				}
				else
				{
					if (!_isMouseRightDown)
					{
						if (_ispanning)
							endPanning();
					}
				}
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
			if (_yDegControlable)
			{
				yDeg += (dy * mouseRightSpeed);
			}
			if (_xDegControlable)
			{
				xDeg += (dx * mouseRightSpeed);
			}

		}

		private function checkIfMoved(dx : Number, dy : Number) : Boolean
		{
			if (Multitouch.supportsGestureEvents)
			{
				if (Math.abs(dx) > 10 || Math.abs(dy) > 10)
					return true;
			}
			else
			{
				if (Math.abs(dx) > 1 || Math.abs(dy) > 1)
					return true;
			}
			return false;
		}

		private function onMouseWheel(event : MouseEvent) : void
		{
			if (Stage3DLayerManager.hitTestStarling(event.stageX, event.stageY))
			{
				return;
			}

			if (active)
			{
				if (mouseWheelCallback != null)
				{
					mouseWheelCallback(event);
				}
				else
				{
					distance -= _mouseWheelSpeed * event.delta;
				}
			}
		}

		private function onMouseRightDown(e : MouseEvent) : void
		{
			_isMouseRightDown = true;
			if (!_mouseRightControlable)
			{
				return;
			}
			if (active)
			{
				var stage : Stage = Stage3DLayerManager.stage;
				if (stage)
				{
					//鼠标右键down的时候，会触发mouseLeave事件，所以先必须移除leave事件的监听
					stage.removeEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
					stage.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
					_mouseDownPosition.setTo(stage.mouseX, stage.mouseY);
				}
				startPanning();
			}
		}

		private function onMouseRightUp(e : MouseEvent) : void
		{
			_isMouseRightDown = false;
			if (!_mouseRightControlable)
			{
				return;
			}
			var stage : Stage = Stage3DLayerManager.stage;
			if (stage)
			{
				stage.addEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
				stage.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			}
			endPanning();
		}

		private function startPanning() : void
		{
			if (active)
			{
				var stage : Stage = Stage3DLayerManager.stage;
				if (!stage)
					return;
				if(Stage3DLayerManager.hitTestStarling(stage.mouseX, stage.mouseY))
				{
					return;
				}
				_pan.x = stage.mouseX;
				_pan.y = stage.mouseY;
				if (!_ispanning)
				{
					EventManager.dispatchEvent(SceneEvent.CAMERA_START_PANNING);
					_ispanning = true;
				}
			}
		}

		private function endPanning() : void
		{
			if (_ispanning)
			{
				EventManager.dispatchEvent(SceneEvent.CAMERA_END_PANNING);
				_ispanning = false;
			}
		}

		public function get ispanning() : Boolean
		{
			return _ispanning;
		}

		private function onMouseDown(event : MouseEvent) : void
		{
			_isMouseDown = true;
			if (!_mouseLeftControlable)
			{
				return;
			}
			if (active)
			{
				var stage : Stage = Stage3DLayerManager.stage;
				if (stage)
				{
					//鼠标右键down的时候，会触发mouseLeave事件，所以先必须移除leave事件的监听
					stage.removeEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
					stage.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
					_mouseDownPosition.setTo(stage.mouseX, stage.mouseY);
				}
				startPanning();
			}
		}

		private function onMouseUp(event : MouseEvent) : void
		{
			_isMouseDown = false;
			if (!_mouseLeftControlable)
			{
				return;
			}
			var stage : Stage = Stage3DLayerManager.stage;
			if (stage)
			{
				stage.addEventListener(flash.events.Event.MOUSE_LEAVE, onMouseLeave);
				stage.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			}
			endPanning();
		}

		private function onMouseOver(event : MouseEvent) : void
		{
			_mouseOutDetected = false;
		}

		private function onMouseOut(event : MouseEvent) : void
		{
			_mouseOutDetected = true;
			endPanning();
			_isMouseDown = false;
			_isMouseRightDown = false;
		}

		private function onMouseLeave(event : flash.events.Event) : void
		{
			_mouseOutDetected = true;
			endPanning();
			_isMouseDown = false;
			_isMouseRightDown = false;
		}
	}
}
