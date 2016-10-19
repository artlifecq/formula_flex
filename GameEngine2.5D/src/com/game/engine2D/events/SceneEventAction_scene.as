package com.game.engine2D.events
{
	/**
	 * 引擎场景事件类型(主要包括：场景刷帧前、场景刷帧)
	 * @author Carver
	 */
	public class SceneEventAction_scene
	{		
		/**
		 * 场景刷帧之前
		 * data:  null
		 */
		public static const SCENE_BEFORE_RENDER:String		= "SceneEventAction_status.SCENE_BEFORE_RENDER";
		/**
		 * 场景刷帧之后
		 * data:  null
		 */
		public static const SCENE_RENDER:String		= "SceneEventAction_status.SCENE_RENDER";
		
		/**
		 * 刷帧
		 * data:  null
		 */
		public static const SCENE_ENTER_FRAME:String		= "SceneEventAction_status.SCENE_ENTER_FRAME";
	}
}