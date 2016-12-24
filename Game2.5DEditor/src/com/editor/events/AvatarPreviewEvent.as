package com.editor.events
{

	/**
	 * 预览区事件
	 * @author zgd
	 *
	 */
	public class AvatarPreviewEvent
	{
		/**选择了新动作，携带动作类型，由RoleTypeEnum枚举*/
		public static const SELECTED_ACTION : String = "SELECTED_ACTION";
		/**选择了新的角度*/
		public static const SELECTED_ROTATION_Y : String = "SELECTED_ROTATION_Y";
		/**选择了新的缩放比例,携带缩放值Number*/
		public static const SELECTED_SCALE : String = "SELECTED_SCALE";
		/**选择了新的模型，携带模型资源名称*/
		//public static const SELECTED_FILE : String = "SELECTED_AVATAR_ID";

		/**设置了新动作，携带动作类型，由RoleTypeEnum枚举*/
		public static const SET_ACTION : String = "SET_ACTION";
		/**设置了新的角度*/
		public static const SET_ROTATION_Y : String = "SET_ROTATION_Y";
		/**设置了新的缩放比例,携带缩放值Number*/
		public static const SET_SCALE : String = "SET_SCALE";
		/**设置了新的动画速度,携带缩放值Number*/
		public static const SET_ANIMATION_SPEED : String = "SET_SCALE";
		/**设置身体资源，携带资源名称*/
		public static const SELECTED_RES : String = "SELECTED_RES";

	}
}
