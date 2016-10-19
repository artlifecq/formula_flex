package com.game.engine2D.events
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
		public static const SCENE:String = "SceneEvent.scene";  
		/**
		 * 场景鼠标交互
		 */
		public static const INTERACTIVE:String = "SceneEvent.interactive";  
		/**
		 * 角色状态变化
		 */
		public static const CHAR:String = "SceneEvent.char"; 
		
		/**
		 * 场景拖拽时间
		 */
		public static const DORP_IN:String = "SceneEvent.dorpIn"; 
	}
}