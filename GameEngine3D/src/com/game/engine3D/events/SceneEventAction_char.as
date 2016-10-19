package com.game.engine3D.events
{
	/**
	 * 主角状态相关类型(主要包括角色状态、角色角度)
	 * @author Carver
	 */
	public class SceneEventAction_char
	{
		/**
		 * 角色状态更新
		 * data:  SceneCharacter
		 */
		public static const CHAR_STATUS_CHANGED:String		= "SceneEventAction_status.CHAR_STATUS_CHANGED";
		/**
		 * 角色逻辑角度更新
		 * data:  SceneCharacter
		 */
		public static const CHAR_LOGICANGLE_CHANGED:String		= "SceneEventAction_status.CHAR_LOGICANGLE_CHANGED";
//		/**
//		 * 角色旋转角度更新
//		 * data:  SceneCharacter
//		 */
//		public static const CHAR_ROTATION_CHANGED:String		= "SceneEventAction_status.CHAR_ROTATION_CHANGED";
	}
}