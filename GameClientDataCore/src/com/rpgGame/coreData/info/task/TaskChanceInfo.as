package com.rpgGame.coreData.info.task
{
	/**
	 *
	 * 单个机缘任务数据
	 * @author zgd
	 * 创建时间：2014-4-11 下午4:28:33
	 * 
	 */
	public class TaskChanceInfo
	{
		/** 任务品质，0-白色 1-绿色 2-蓝色 3-紫色 4-橙色 */	
		public var quality:int;
		/** 吞噬奖励百分比 */
		public var swallowPercent:int;
		/** 列表头像 */
		public var headImg:String;
		/**任务数据*/
		public var taskInfo:TaskInfo;
		
		public function TaskChanceInfo()
		{
		}
	}
}
