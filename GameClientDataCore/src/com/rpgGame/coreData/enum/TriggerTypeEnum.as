package com.rpgGame.coreData.enum
{
	public class TriggerTypeEnum
	{
		
		/**
		 * 生成动态阻挡
		 */
		public static const SCENE_OBSTACLE : int = 1;
		/**
		 * 刷怪
		 */
		public static const ADD_MONSTER : int = 1;
		
		/**
		 * 触发剧情对话
		 */
		public static const PLOT_DIALOG : int = 3;
		/**
		 * 生成场景物
		 */
		public static const SCENE_ROLE: int = 4;
		
		
		public function TriggerTypeEnum()
		{
		}
	}
}