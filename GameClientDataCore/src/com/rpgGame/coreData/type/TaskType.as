package com.rpgGame.coreData.type
{

	public class TaskType
	{
		
		
		/**主线任务*/
		public static var MAINTYPE_MAINTASK:int = 1;
		/**支线任务*/
		public static var MAINTYPE_DAILYTASK:int = 2;
		/**环式任务*/
		public static var MAINTYPE_TREASUREBOX:int = 3;
		/**帮会日常任务*/
		public static var MAINTYPE_GUILDDAILYTASK:int = 4;
		/**天降礼金任务*/
		public static var LIJIN_TASK:int = 5;
		
		/** 任务子类型（1为NPC类型，2打怪数量，3收集物品，4采集任务,5使用道具,6进入副本*/
		/**1为对话类型*/
		public static var SUB_CONVERSATION:int = 1;
		/**2为打怪数量*/
		public static var SUB_MONSTER:int = 2;
		/**3杀怪获得道具*/
		public static var SUB_ITEM:int = 3;
		/**4采集任务*/
		public static var SUB_GATHER:int = 4;
		/**5使用道具*/
		public static var SUB_USEITEM:int = 5;
		/**6副本*/
		public static var SUB_QUIT_ZONE:int = 6;
		
		/**10其它挂机*/
		public static var SUB_GUAJI:int = 10;
		
		
		
		
		
		/** 主线任务 */
		public static const TASK_TYPE_MAIN_LINE : int = 1;
		/** 剧情副本任务 */
		public static const TASK_TYPE_STORY_DUNGEON : int = 2;

		public function TaskType()
		{
		}
	}
}
