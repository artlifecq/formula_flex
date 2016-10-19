package com.rpgGame.coreData.info.task
{

	/**
	 *
	 * 单个日常任务数据
	 * @author zgd
	 * 创建时间：2014-4-11 下午4:29:40
	 * 
	 */
	public class TaskDailyInfo
	{
		/**任务详情*/
		public var taskInfo:TaskInfo;
		/**任务奖励星级*/
		public var prizeStar:int;
		/**难度星级*/
		public var diffiStar:int;
		/** 今天正在进行的日常任务环数，1表示第一环*/
		public var round:int;
		
		public function TaskDailyInfo()
		{
		}
	}
}
