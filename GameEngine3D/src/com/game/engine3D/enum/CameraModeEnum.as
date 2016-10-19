package com.game.engine3D.enum
{
	/**
	 * 摄像机模式
	 @author Guodong.Zhang
	 * 创建时间：2015-8-19 下午2:04:53
	 */
	public class CameraModeEnum
	{
		/**跟随目标模式*/
		public static const LOCK_ON_TARGET:int = 1;
		/**直接摄像机视角*/
		public static const DIRECT_CAMERA:int = 2;
		/**定点拍摄模式*/
		public static const FIXED_CAMERA_LOOK_AT:int = 3;
		/**定向拍摄模式*/
		public static const FIXED_TARGET_LOOK_AT_TARGET:int = 4;
	}
}