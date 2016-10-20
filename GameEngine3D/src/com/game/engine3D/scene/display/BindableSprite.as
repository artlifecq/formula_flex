package com.game.engine3D.scene.display
{
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.core.math.Matrix3DUtils;
	import away3d.events.Object3DEvent;
	
	import starling.display.Sprite;

	/**
	 *
	 * 可绑定显示对象
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 上午11:12:28
	 *
	 */
	public class BindableSprite implements IBindable
	{
		protected var _view : View3D;
		/** 容器 **/
		protected var _container : Sprite;
		/**模型挂接**/
		protected var _bindTarget : ObjectContainer3D;
		/**偏移位移**/
		protected var _bindOffset : Vector3D;
		protected var _visible:Boolean = true;

		public function BindableSprite()
		{
			super();
		}

		public function set container(value : Sprite) : void
		{
			if (_container)
			{
				if (_container.parent)
					_container.parent.removeChild(_container);
				_container.dispose();
			}
			_container = value;
			if(_container)
			{
				_container.visible = _visible;
			}
		}

		public function get container() : Sprite
		{
			return _container;
		}

		public function get bindTarget() : ObjectContainer3D
		{
			return _bindTarget;
		}

		public function set bindTarget(value : ObjectContainer3D) : void
		{
			if (_bindTarget)
			{
				_bindTarget.removeEventListener(Object3DEvent.SCENE_CHANGED, onBindTargetSceneChanged);
				_bindTarget.removeEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onBindTargetSceneTransformChanged);
			}
			_bindTarget = value;
			if (_bindTarget)
			{
				container = new Sprite();
				if (_bindTarget.scene)
					view = _bindTarget.scene.view;
				_bindTarget.addEventListener(Object3DEvent.SCENE_CHANGED, onBindTargetSceneChanged);
				_bindTarget.addEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onBindTargetSceneTransformChanged);
			}
			else
			{
				container = null;
				view = null;
			}
		}

		private function set view(value : View3D) : void
		{
			if (_view)
			{
				_view.camera.removeEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onCameraSceneTransformChanged);
				_view.stage.removeEventListener(Event.RESIZE, onViewResize);
			}
			_view = value;
			if (_view)
			{
				_view.camera.addEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onCameraSceneTransformChanged);
				_view.stage.addEventListener(Event.RESIZE, onViewResize);
				updateTranform();
			}
		}

		public function get bindOffset() : Vector3D
		{
			return _bindOffset;
		}

		public function set bindOffset(value : Vector3D) : void
		{
			_bindOffset = value;
		}

		/**
		 * 更新变换
		 */
		public function updateTranform() : void
		{
			if (_view == null || _bindTarget == null || _container == null)
				return;

			var pos3D : Vector3D = _bindTarget.scenePosition;
			if (_bindOffset)
				pos3D = pos3D.add(_bindOffset);

			var pos2D : Vector3D = _view.project(pos3D, Matrix3DUtils.CALCULATION_VECTOR3D);
			if (pos2D.z > 0 && pos2D.z < 4000)
			{
				//取整，否则会浮点模糊@Sunny.L.L.M 20150814
				_container.visible = _visible;
				_container.x = Math.round(pos2D.x);
				_container.y = Math.round(pos2D.y);
			}
			else
			{
				_container.visible = false;
			}
		}

		private function onBindTargetSceneChanged(e : Object3DEvent) : void
		{
			if (_bindTarget.scene)
				view = _bindTarget.scene.view;
			else
				view = null;
		}

		/**
		 * 更新坐标
		 * @param e
		 */
		private function onBindTargetSceneTransformChanged(e : Object3DEvent) : void
		{
			updateTranform();
		}

		/**
		 * 摄像机变化
		 * @param e
		 */
		private function onCameraSceneTransformChanged(e : Object3DEvent) : void
		{
			updateTranform();
		}

		/**
		 * 屏幕变化
		 * @param e
		 */
		private function onViewResize(e : Event) : void
		{
			updateTranform();
		}

		/**
		 * 是否可见
		 * @param value:Boolean
		 */
		public function set visible(value : Boolean) : void
		{
			_visible = value;
			if (_container)
				_container.visible = value;
		}

		public function get visible() : Boolean
		{
			return (_container && _container.visible);
		}

		public function dispose() : void
		{
			bindTarget = null;
			container = null;
			_bindOffset = null;
			_visible = true;
		}
	}
}
