package com.game.engine2D.vo
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.events.SceneCameraEvent;
	import com.game.engine2D.scene.SceneCamera;
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.scene.display.BindableSprite;
	
	import away3d.containers.ObjectContainer3D;
	
	public class HeadBindableContainer extends BindableSprite implements IInstancePoolClass
	{
		static private var _pool:InstancePool = new InstancePool("HeadBindableContainer_pool", 1000);
		private var _sceneCamera:SceneCamera;
		private var _syncContainer:HeadNameContainer;
		private var _headAlpha:Number = 1.0;
		private var _isDisposed:Boolean;
		private var _isDestroyed:Boolean;
		
		public function HeadBindableContainer()
		{
			super();
		}
		
		public function get headAlpha():Number
		{
			return _headAlpha;
		}

		public function set headAlpha(value:Number):void
		{
			_headAlpha = value;
			this.alpha = value;
			
		}

		override public function bind(bindTarget : ObjectContainer3D, syncTarget : Object = null) : void
		{
			if (sceneCamera)
				_sceneCamera.addEventListener(SceneCameraEvent.CAMERA_SCALE_UPDATE, onSceneCameraScaleUpdate);
			super.bind(bindTarget, syncTarget);
		}
		
		public function syncPosition(container:HeadNameContainer):void
		{
			_syncContainer = container;
		}
		
		private function onSceneCameraScaleUpdate(e:*):void
		{
			updateTranform();
		}		
		
		private function get sceneCamera():SceneCamera
		{
			_sceneCamera ||= Scene.scene.sceneCamera;
			return _sceneCamera;
		}
		
		override public function updateTranform():void
		{
			if (sceneCamera)
				this.scale = 1.0/_sceneCamera.scale;
			super.updateTranform();
			this.visible = _visible;
			this.alpha = _headAlpha;
			if (_syncContainer)
			{
				_syncContainer.x = this.x;
				_syncContainer.y = this.y;
				_syncContainer.visible = _visible;
				_syncContainer.alpha = _headAlpha;
			}
		}
		
		public function set headVisible(value:Boolean):void
		{
			_visible = value;
		}
		
		public function instanceDestroy():void
		{
			_isDestroyed = true;
			this.dispose();
		}
		
		public function instanceDispose():void
		{
			bind(null, null);
			if (_sceneCamera)
				_sceneCamera.removeEventListener(SceneCameraEvent.CAMERA_SCALE_UPDATE, onSceneCameraScaleUpdate);
			_sceneCamera = null;
			_bindOffset = null;
			_visible = false;
			_syncContainer = null;
			_isDisposed = true;
		}
		
		public function reSet($parameters:Array):void
		{
			_visible = true;
			_headAlpha = 1.0;
			_isDisposed = false;
			alpha = 1;
		}
		
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function get isDisposed():Boolean
		{
			return _isDisposed;
		}
		
		static public function recycle($obj:HeadBindableContainer):void
		{
			if ($obj)
			{
				_pool.disposeObj($obj);
			}
		}
		
		static public function create():HeadBindableContainer
		{
			var sprite:HeadBindableContainer = _pool.createObj(HeadBindableContainer) as HeadBindableContainer;
			return sprite;
		}
	}
}