package com.rpgGame.coreData.type
{

	public class TaskTargetType
	{
		/**
		 * 0-回复任务
		 */
		public static const TASK_TARGET_REPLY_NPC : int = 0;
		/**
		 * 1-杀怪任务
		 */
		public static const TASK_TARGET_KILL_MONSTER : int = 1;
		/**
		 * 2-杀怪收集任务
		 */
		public static const TASK_TARGET_KILL_MONSTER_AND_COLLECT : int = 2;
		/**
		 * 3-采集任务
		 */
		public static const TASK_TARGET_GATHER : int = 3;
		/**
		 * 4-升级任务
		 */
		public static const TASK_TARGET_LEVEL_UP : int = 4;
		/**
		 * 5-扣背包物品任务
		 */
		public static const TASK_TARGET_DEDUCT_BACKPACK_GOODS : int = 5;
		/**
		 * 6-区域搜索
		 */
		public static const TASK_AREA_EXPLORATION : int = 6;
		/**
		 * 7-通关剧情副本
		 */
		public static const TASK_FINISH_STORY_DUNGEON : int = 7;
		/**
		 * 9-跟随护送任务
		 */
		public static const TASK_FOLLOW_ESCORT : int = 9;
		/**
		 * 10-搭乘固定路线载具
		 */
		public static const TASK_VEHICLE_PLAYER : int = 10;
		/**
		 * 11-客户端任务
		 */
		public static const TASK_CLIENT_TASK : int = 11;


		/* 飞行传送的任务type类型和本地使用的不同 */
		/** 剧情 */
		public static const TASK_TYPE_FLY_CHAPTER : int = 0;
		/** 日常 */
		public static const TASK_TYPE_FLY_DAYLY : int = 2;
		/** 机缘 */
		public static const TASK_TYPE_FLY_CHANCE : int = 1;
		/** 帮会 */
		public static const TASK_TYPE_FLY_GUILD : int = 3;


		/**NPC功能列表**/
		public static const PANEL_TALK : int = 1;
		/**接受任务，完成任务等列表**/
		public static const PANEL_STATE : int = 2;
	}
}
