package com.game.engine2D.events
{
	/**
	 * 交互（鼠标和键盘）事件类型
	 * @author Carver
	 */
	public class SceneEventAction_interactive
	{
//		/**
//		 * 鼠标点击
//		 * data:  [e:MouseEvent,sc:SceneCharacter,map:MapTile]
//		 */
//		public static const CLICK:String			= "SceneEventAction_interactive.CLICK";  
		/**
		 * 鼠标双击
		 * data:  SceneEventAction_interactive_data
		 * 返回的MouseEvent为第二次鼠标按下的事件
		 */
		public static const DOUBLE_CLICK:String	= "SceneEventAction_interactive.DOUBLE_CLICK";  
		/**
		 * 鼠标按下
		 * data:  SceneEventAction_interactive_data
		 */
		public static const MOUSE_DOWN:String		= "SceneEventAction_interactive.MOUSE_DOWN";
		/**
		 * 鼠标提起
		 * data:  SceneEventAction_interactive_data
		 */
		public static const MOUSE_UP:String		= "SceneEventAction_interactive.MOUSE_UP";
		/**
		 * 鼠标经过
		 * data: SceneEventAction_interactive_data
		 */
		public static const MOUSE_MOVE:String		= "SceneEventAction_interactive.MOUSE_MOVE";  
		/**
		 * 鼠标移出
		 * data: SceneEventAction_interactive_data
		 */
		public static const MOUSE_OUT:String		= "SceneEventAction_interactive.MOUSE_OUT";  
		/**
		 * 场景被拖入对象
		 * data: SceneEventAction_interactive_data
		 */
		public static const DROP_IN:String		= "SceneEventAction_interactive.DROP_IN";  
		
		/**
		 * 鼠标按下
		 * data: SceneEventAction_interactive_data
		 */
		public static const RIGHT_MOUSE_DOWN:String		= "SceneEventAction_interactive.RIGHT_MOUSE_DOWN"; 
		/**
		 * 鼠标提起
		 * data: SceneEventAction_interactive_data
		 */
		public static const RIGHT_MOUSE_UP:String		= "SceneEventAction_interactive.RIGHT_MOUSE_UP"; 
	}
}