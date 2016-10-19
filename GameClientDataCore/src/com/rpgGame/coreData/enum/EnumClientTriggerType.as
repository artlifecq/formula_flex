package com.rpgGame.coreData.enum
{

	/**
	 *
	 * 客户端触发类型
	 * @author L.L.M.Sunny
	 * 创建时间：2016-07-12 上午11:03:17
	 *
	 */
	public class EnumClientTriggerType
	{
		/**
		 * 场景动态生成一些特效
		 */
		public static const SCENE_BORN_EFFECT : int = 1;
		/**
		 * 给目标加上特效等
		 */
		public static const TARGET_ADD_EFFECT : int = 2;
		/**
		 * 触发剧情对话
		 */
		public static const PLOT_DIALOG : int = 3;
		/**
		 * 添加NPC
		 */
		public static const ADD_NPC : int = 4;
		/**
		 * 移除NPC
		 */
		public static const REMOVE_NPC : int = 5;
		/**
		 * 区域触发
		 */
		public static const AREA_TRIGGER : int = 6;
		/**
		 * 击杀统计
		 */
		public static const KILL_STATISTIC : int = 7;
		/**
		 * 场景动态生成采集物
		 */
		public static const SCENE_BORN_COLLECT : int = 8;
		/**
		 * 冒泡对话
		 */
		public static const BUBBLE_DIALOG : int = 9;

		public function EnumClientTriggerType()
		{
		}
	}
}
