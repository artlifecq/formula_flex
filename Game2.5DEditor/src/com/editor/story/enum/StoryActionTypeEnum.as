package com.editor.story.enum
{
	/**
	 * 剧情行为类型枚举
	 * @author Administrator
	 * 
	 */
	public class StoryActionTypeEnum
	{
		/**镜头控制*/
		public static const CAMERA:int = 1;
		/**创建模型*/
		public static const CREATE_ROLE:int = 2;
		/**移除模型*/
		public static const REMOVE_ROLE:int = 3;
		/**模型行走*/
		public static const ROLE_WALK:int = 4;
		/**模型做动作*/
		public static const ROLE_DO_ACTION:int = 5;
		/**模型转向*/
		public static const ROLE_FACE_TO:int = 6;
		/**模型换装*/
		public static const ROLE_CHANGE_RES:int = 7;
		/**模型缩放*/
		public static const ROLE_ZOOM:int = 8;
		/**底部文本*/
		public static const TEXT_1:int = 9;
		/**创建特效*/
		public static const EFFECT_CREATE:int = 10;
		/**结束剧情*/
		public static const END:int = 11;
		/**移除特效*/
		public static const EFFECT_REMOVE:int = 12;
		/**添加音效*/
		public static const ADD_SOUND:int = 13;
		/**镜头模型*/
		public static const ADD_CAMERA_ROLE:int = 14;
		/**人物介绍*/
		public static const ADD_ROLE_INFO:int = 15;
		/**机关控制*/
		public static const ROLE_CONTROL:int = 16;
		/**隐藏角色*/
		public static const HIDE_ROLE:int = 17;
	}
}