package com.rpgGame.coreData.info.task
{
	import com.rpgGame.coreData.cfg.task.TaskCfgData;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 剧情任务单个章节数据
	 * @author zgd
	 * 创建时间：2014-4-11 下午4:27:03
	 * 
	 */
	public class TaskChapterInfo
	{
		/**章节序号，1为第一章*/
		public var order:int;
		/**已完成的任务名称列表*/
		private var completedTaskNames:Vector.<String>;
		/**已完成任务个数*/
		public var completedTaskCount:int;
		/**任务详细数据列表,用名称做key*/
		private var _taskDataInfoHash:HashMap;
		
		public function TaskChapterInfo()
		{
			_taskDataInfoHash = new HashMap();
			completedTaskNames = new Vector.<String>();
		}
		
		public function addDataInfo(dataInfo:TaskDataInfo):void
		{
			_taskDataInfoHash.add(dataInfo.name,dataInfo);
		}
		
		public function addCompletedTaskName(value:String):void
		{
			completedTaskNames.push(value);
		}
		
		/**
		 * 根据任务节数和在节中的序号获取任务名称
		 * @param section 1表示第一节
		 * @param countInSection 1表示第一个
		 * @return 
		 * 
		 */
		public function getTaskNameBySection( section:int, countInSection:int ):String
		{
			return TaskCfgData.getStoryTaskChapterName( order );
		}
		
		/**
		 * 得到所有任务数量
		 * @return 
		 * 
		 */		
		public function getAllTaskDataCount():int
		{
			return _taskDataInfoHash.getValues().length;
		}
		
		/**
		 * 得到所有任务详细数据
		 * @return 
		 * 
		 */		
		public function getAllTaskData():Array
		{
			return _taskDataInfoHash.getValues().sort( sortByIndex );
		}
		
		public function sortByIndex( dataInfo1:TaskDataInfo, dataInfo2:TaskDataInfo ):int
		{
			if( dataInfo1.index < dataInfo2.index )
				return -1;
			
			if( dataInfo1.index > dataInfo2.index )
				return 1;
			
			return 0;
		}
	}
}
