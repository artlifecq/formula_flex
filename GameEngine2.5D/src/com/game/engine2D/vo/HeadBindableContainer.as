package com.game.engine2D.vo
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.events.SceneCameraEvent;
	import com.game.engine2D.scene.SceneCamera;
	import com.game.engine3D.scene.display.BindableSprite;
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	
	import away3d.containers.ObjectContainer3D;
	
	public class HeadBindableContainer extends BindableSprite implements IPoolClass
	{
		static private var _pool:Pool = new Pool("HeadBindableContainer_pool", 1000);
		private var _sceneCamera:SceneCamera;
		
		public function HeadBindableContainer()
		{
			super();
		}
		
		override public function set bindTarget(value:ObjectContainer3D):void
		{
			if (sceneCamera)
				_sceneCamera.addEventListener(SceneCameraEvent.CAMERA_SCALE_UPDATE, onSceneCameraScaleUpdate);
			super.bindTarget = value;
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
			if (_container && sceneCamera)
				_container.scale = 1.0/_sceneCamera.scale;
			super.updateTranform();
		}
		
		override public function dispose():void
		{
			if (_sceneCamera)
				_sceneCamera.removeEventListener(SceneCameraEvent.CAMERA_SCALE_UPDATE, onSceneCameraScaleUpdate);
			_sceneCamera = null;
			super.dispose();
		}
		
		public function reSet($parameters:Array):void
		{
			this.visible = true;
		}
		
		static public function recycle($pool:HeadBindableContainer):void
		{
			if ($pool)
			{
				_pool.disposeObj($pool);
			}
		}
		
		static public function create():HeadBindableContainer
		{
			var sprite:HeadBindableContainer = _pool.createObj(HeadBindableContainer) as HeadBindableContainer;
			return sprite;
		}
	}
}