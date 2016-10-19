package com.game.engine3D.events
{

	/**
	 * 引擎总事件类
	 * @author Carver
	 */
	public class SceneEvent
	{
		/**
		 * 场景状态变化
		 */
		public static const SCENE : String = "SceneEvent.scene";
		/**
		 * 场景鼠标交互
		 */
		public static const INTERACTIVE : String = "SceneEvent.interactive";
		/**
		 * 角色状态变化
		 */
		public static const CHAR : String = "SceneEvent.char";

		/**
		 * 场景拖拽时间
		 */
		public static const DORP_IN : String = "SceneEvent.dorpIn";
		/**
		 * 摄像机拖动视角开始
		 */
		public static const CAMERA_START_PANNING : String = "SceneEvent.cameraStartPanning";
		/**
		 * 摄像机拖动视角结束
		 */
		public static const CAMERA_END_PANNING : String = "SceneEvent.cameraEndPanning";
		/**
		 * 摄像机距离改变
		 */
		public static const CAMERA_DISTANCE_CHANGE : String = "SceneEvent.cameraDistanceChange";
		/**
		 * 摄像机转角改变
		 */
		public static const CAMERA_PAN_CHANGE : String = "SceneEvent.cameraPanChange";
		/**
		 * 摄像机仰角改变
		 */
		public static const CAMERA_TILT_CHANGE : String = "SceneEvent.cameraTiltChange";
		/**
		 * GameScene3D._entityAreaDirectionalLight属性被重置 
		 */        
		public static const VALIDATE_AREA_DIRECTIONALLIGHT : String = "SceneEvent.validateAreaDirectionallight";
	}
}
