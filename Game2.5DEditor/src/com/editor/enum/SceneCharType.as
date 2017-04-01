package com.editor.enum
{


	/**
	 * 角色类型
	 * @author Carver
	 */
	public class SceneCharType
	{
		/**
		 * 虚拟体
		 * 此类型只参与渲染 0
		 */
		public static const DUMMY : String = rEnum.ENUM_START(0).toString();
		/** 玩家 1 **/
		public static const PLAYER : String = rEnum.next.toString();
		/** 怪物  2 **/
		public static const MONSTER : String = rEnum.next.toString();
		/** 怪物tb  3 **/
		public static const MONSTER_TB : String = rEnum.next.toString();
		/** 坐骑tb  5 **/
		public static const MOUNT_TB : String = rEnum.next.toString();
		/** 传送门tb  6 **/
		public static const TRANS_TB : String = rEnum.next.toString();
		/** 剧情角色 **/
		public static const STORY_ROLE : String = rEnum.next.toString();
		/** 剧情特效 **/
		public static const STORY_EFFECT : String = rEnum.next.toString();
		/** 场景飞行技能 **/
		public static const SCENE_FLY_SPELL : String = rEnum.next.toString();
		/** 场景受击特效 **/
		public static const SCENE_HURT_EFFECT : String = rEnum.next.toString();
		/** 刀光特效 **/
		public static const KNIFE_LIGHT_EFFECT : String = rEnum.next.toString();
		/** 场景自身特效 **/
		public static const SCENE_SELF_EFFECT : String = rEnum.next.toString();
		/** 场景目标特效 **/
		public static const SCENE_DEST_EFFECT : String = rEnum.next.toString();
		/** 鼠标点击特效 **/
		public static const MOUSE_CLICK_EFFECT : String = rEnum.next.toString();
		/** 预览玩家 **/
		public static const PREVIEW_PLAYER : String = rEnum.next.toString();
		/** 虚拟摄像机 **/
		public static const DUMMY_CAMERA : String = rEnum.next.toString();
	}
}
