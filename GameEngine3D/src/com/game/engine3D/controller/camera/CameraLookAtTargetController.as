package com.game.engine3D.controller.camera
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;
	import away3d.controllers.LookAtController;
	import away3d.entities.Entity;
	import away3d.events.Event;
	
	/**
	 * 镜头定点看向指定目标控制
	 @author Guodong.Zhang
	 * 创建时间：2015-8-18 下午2:20:11
	 */
	public class CameraLookAtTargetController extends LookAtController
	{
		public function CameraLookAtTargetController(targetObject:Camera3D=null, lookAtObject:ObjectContainer3D=null)
		{
			super(targetObject, lookAtObject);
		}
		
		public function startControl():void
		{
			Stage3DLayerManager.stage3DProxy.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function stopControl():void
		{
			Stage3DLayerManager.stage3DProxy.removeEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e : Event) : void
		{
			update();
		}

	}
}