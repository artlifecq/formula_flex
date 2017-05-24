package com.rpgGame.coreData.enum
{
	public class TriggerTypeEnum
	{
		
		/**
		 * 生成动态阻挡
		 */
		public static const SCENE_ADD_OBSTACLE : int = 1;
		/**
		 *移除动态阻挡
		 */
		public static const SCENE_REMOVE_OBSTACLE : int = 2;
		/**
		 * 刷怪
		 */
		public static const ADD_MONSTER : int = 3;
		
		/**
		 * 触发剧情对话
		 */
		public static const PLOT_DIALOG : int = 4;
		/**
		 * 生成场景物
		 */
		public static const SCENE_ROLE: int = 5;
		
		
		public function TriggerTypeEnum()
		{
		}
	}
}