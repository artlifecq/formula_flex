package com.game.engine3D.events
{

	/**
	 *
	 * 场景交互事件类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-9 下午2:25:33
	 *
	 */
	public class SceneEventAction3D
	{
		/**
		 * 场景地图弹起
		 */
		public static const SCENE_MAP_MOUSE_UP : String = "scene_map_mouse_up";
		/**
		 * 场景地图按下
		 */
		public static const SCENE_MAP_MOUSE_DOWN : String = "scene_map_mouse_down";
		/**
		 * 场景地图滑动
		 */
		public static const SCENE_MAP_MOUSE_MOVE : String = "scene_map_mouse_move";
		/**
		 * 场景实体弹起
		 */
		public static const SCENE_ENTITY_MOUSE_UP : String = "scene_entity_mouse_up";
		/**
		 * 场景实体按下
		 */
		public static const SCENE_ENTITY_MOUSE_DOWN : String = "scene_entity_mouse_down";
		/**
		 * 场景实体滑过
		 */
		public static const SCENE_ENTITY_MOUSE_OVER : String = "scene_entity_mouse_over";
		/**
		 * 场景实体移出
		 */
		public static const SCENE_ENTITY_MOUSE_OUT : String = "scene_entity_mouse_out";
		/**
		 * 场景实体右键弹起
		 */
		public static const SCENE_ENTITY_MOUSE_RIGHT_UP : String = "scene_entity_right_mouse_up";
		/**
		 * 场景实体右键按下
		 */
		public static const SCENE_ENTITY_MOUSE_RIGHT_DOWN : String = "scene_entity_right_mouse_down";

		public function SceneEventAction3D()
		{
		}
	}
}
