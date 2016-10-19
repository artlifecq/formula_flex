package com.rpgGame.coreData.info.dailyTask
{
	/**
	 * 日常
	 * @author luguozheng
	 * 
	 */	
	public class DailyTaskData
	{
		/** 任务类型【 偷经、密信、偷猪 】 **/
		public var type:int = 0;
		/** 任务名字 **/
		public var name:String = "11";
		/** 任务等级 **/
		public var level:int = 1;
		/** 任务时间 **/
		public var time:String;
		/** 任务完成次数 **/
		public var count:int;
		
		
		public function DailyTaskData()
		{
		}
	}
}