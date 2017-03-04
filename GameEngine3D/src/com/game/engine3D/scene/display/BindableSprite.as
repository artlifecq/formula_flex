package com.game.engine3D.scene.display
{
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.engine3D.vo.BaseObjSyncInfo;
	
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.core.math.Matrix3DUtils;
	import away3d.events.Event;
	import away3d.events.LensEvent;
	import away3d.events.Object3DEvent;
	
	import starling.display.Sprite;

	/**
	 *
	 * 可绑定显示对象
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 上午11:12:28
	 *
	 */
	public class BindableSprite extends Sprite implements IBindable
	{
		protected var _view : View3D;
		/**模型挂接**/
		protected var _bindTarget : ObjectContainer3D;
		/**同步挂接**/
		protected var _syncTarget : Object;
		/**偏移位移**/
		protected var _bindOffset : Vector3D;
		protected var _visible : Boolean = true;

		public function BindableSprite()
		{
			super();
		}

		/**
		 *
		 * @param value ObjectContainer3D 或者 BaseObj3D
		 *
		 */
		public function bind(bindTarget : ObjectContainer3D, syncTarget : Object = null) : void
		{
			var baseObj3D : BaseObj3D = null;
			var container3D : ObjectContainer3D = null;
			if (_syncTarget is BaseObj3D)
			{
				baseObj3D = BaseObj3D(_syncTarget);
				baseObj3D.removeSyncInfo(this);
			}
			else if (_syncTarget is ObjectContainer3D)
			{
				container3D = ObjectContainer3D(_syncTarget);
				container3D.removeEventListener(Object3DEvent.SCENE_CHANGED, onBindTargetSceneChanged);
				container3D.removeEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onBindTargetSceneTransformChanged);
			}
			if (_bindTarget)
			{
				_bindTarget.removeEventListener(Object3DEvent.SCENE_CHANGED, onBindTargetSceneChanged);
				_bindTarget.removeEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onBindTargetSceneTransformChanged);
			}
			_bindTarget = bindTarget;
			_syncTarget = syncTarget;
			if (_syncTarget is BaseObj3D)
			{
				baseObj3D = BaseObj3D(_syncTarget);
				var syncInfo : BaseObjSyncInfo = new BaseObjSyncInfo(this);
				baseObj3D.addSyncInfo(syncInfo);
			}
			else if (_syncTarget is ObjectContainer3D)
			{
				container3D = ObjectContainer3D(_syncTarget);
				container3D.addEventListener(Object3DEvent.SCENE_CHANGED, onBindTargetSceneChanged);
				container3D.addEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onBindTargetSceneTransformChanged);
			}
			if (_bindTarget)
			{
				_bindTarget.addEventListener(Object3DEvent.SCENE_CHANGED, onBindTargetSceneChanged);
				_bindTarget.addEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onBindTargetSceneTransformChanged);
				if (_bindTarget.scene)
					view = _bindTarget.scene.view;
				else
					view = null;
			}
		}

		private function set view(value : View3D) : void
		{
			if (_view)
			{
				_view.camera.removeEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onCameraSceneTransformChanged);
				_view.camera.removeEventListener(LensEvent.MATRIX_CHANGED, onCameraSceneTransformChanged);
			}
			_view = value;
			if (_view)
			{
				_view.camera.addEventListener(Object3DEvent.SCENETRANSFORM_CHANGED, onCameraSceneTransformChanged);
				_view.camera.addEventListener(LensEvent.MATRIX_CHANGED, onCameraSceneTransformChanged);
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
			if (_bindTarget && _view)
			{
				var pos3D : Vector3D = _bindTarget.scenePosition;
				if (_bindOffset)
					pos3D = pos3D.add(_bindOffset);

				var pos2D : Vector3D = _view.project(pos3D, Matrix3DUtils.CALCULATION_VECTOR3D);
				if (pos2D.z > 0 && pos2D.z < 4000)
				{
					//取整，否则会浮点模糊@Sunny.L.L.M 20150814
					this.visible = _visible;
					this.x = Math.round(pos2D.x);
					this.y = Math.round(pos2D.y);
				}
				else
				{
					this.visible = false;
				}
			}
			else
			{
				this.visible = false;
			}
		}

		private function onBindTargetSceneChanged(e : Object3DEvent) : void
		{
			if (_bindTarget && _bindTarget.scene)
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
		private function onCameraSceneTransformChanged(e : Event) : void
		{
			updateTranform();
		}

		override public function dispose() : void
		{
			bind(null, null);
			_bindOffset = null;
			_visible = false;
			super.dispose();
		}
	}
}
