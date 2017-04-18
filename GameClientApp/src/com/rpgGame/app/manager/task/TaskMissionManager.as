package com.rpgGame.app.manager.task
{
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.task.bean.TaskInfo;

	public class TaskMissionManager
	{
		/**最后完成主线任务id*/
		private static var _taskModelId: int;
		/**当天已经完成日常任务的次数*/
		private static var _dailyTaskTimes: int;
		/**当前主线任务信息*/
		private static var _currentMainTaskInfo : TaskInfo;
		/**当前支线任务信息*/
		private static var _currentDailyTaskInfo : TaskInfo;
		/**当前环式任务信息*/
		private static var _currentTreasuerTaskInfo : TaskInfo;
		
		
		
	

		public static function setCurrentTaskInfo(value: Vector.<TaskInfo>) : void
		{
			for each(var task:TaskInfo in value)
			{
				if(task.taskSubType==TaskType.MAINTYPE_MAINTASK)
				{
					setCurrentMainTaskInfo(task);
				}
				else if(task.taskSubType==TaskType.MAINTYPE_DAILYTASK)
				{
					//currentMainTaskInfo(task);
				}
				else if(task.taskSubType==TaskType.MAINTYPE_TREASUREBOX)
				{
					//currentMainTaskInfo(task);
				}
				
			}
		}
		
		
		
		/**当前支线任务信息*/
		public static function get currentDailyTaskInfo() : TaskInfo
		{
			
			return _currentDailyTaskInfo;
		}
		
		/**当前是否有支线任务*/
		public static function get haveDailyTask() :Boolean
		{
			if(_currentDailyTaskInfo!=null)
			{
				return true;
			}
			return false;
		}
		
		/**设置支线任务信息*/
		public static function setCurrentDailyTaskInfo(value : TaskInfo) : void
		{
			
			_currentDailyTaskInfo=value;
		}
		/**当前环式任务信息*/
		public static function get currentTreasuerTaskInfo() : TaskInfo
		{
			
			return _currentTreasuerTaskInfo;
		}
		
		/**当前是否有环式任务*/
		public static function get haveTreasuerTask() :Boolean
		{
			if(_currentTreasuerTaskInfo!=null)
			{
				return true;
			}
			return false;
		}
		
		/**设置环式任务信息*/
		public static function setCurrentTreasuerTaskInfo(value : TaskInfo) : void
		{
			
			_currentTreasuerTaskInfo=value;
		}
		
		
		/**当前主线任务信息*/
		public static function get currentMainTaskInfo() : TaskInfo
		{
			/*if (_currentMainTaskInfo)
			{
			var sceneData : SceneData = MapDataManager.currentScene
			if (_currentMainTaskInfo.type == TaskType.TASK_TYPE_MAIN_LINE)
			{
			if (sceneData && sceneData.isNormalScene)
			return _currentMainTaskInfo;
			}
			else if (_currentMainTaskInfo.type == TaskType.TASK_TYPE_STORY_DUNGEON)
			{
			if (sceneData && sceneData.isStoryDungeonScene)
			return _currentMainTaskInfo;
			}
			}
			return null;*/
			return _currentMainTaskInfo;
		}

		/**
		 * 设置当前任务信息
		 */
		public static function setCurrentMainTaskInfo(value : TaskInfo) : void
		{
			if(value == null)return;
			if (_currentMainTaskInfo)
			{
				if (value == null || _currentMainTaskInfo.taskId != value.taskId)
				{
					/*if (_currentMainTaskInfo.dataInfo)
					{
						var targetInfo : BaseTaskTargetInfo = _currentMainTaskInfo.dataInfo.getTargetInfoAt(0);
						if (targetInfo != null)
						{
							_preTaskType = targetInfo.type;
						}
					}*/
				}
			}
			_currentMainTaskInfo = value;
			/*var arr : Array = TaskCfgData.getStoryTaskSectionByCountInChapter(currentChapterInfo.order, currentChapterInfo.completedTaskCount + 1);
			if (arr)
			{
				_currentSection = arr[0];
				_currentCountInSection = arr[1];
			}*/
		}
		
		
		
		
		
		
		
		
		
		/**最后完成主线任务id*/
		public static function get taskModelId():int
		{
			return _taskModelId;
		}
		/**最后完成主线任务id*/
		public static function set taskModelId(value:int):void
		{
			_taskModelId = value;
		}
		
		/**当天已经完成日常任务的次数*/
		public static function get dailyTaskTimes():int
		{
			return _dailyTaskTimes;
		}
		/**当天已经完成日常任务的次数*/
		public static function set dailyTaskTimes(value:int):void
		{
			_dailyTaskTimes = value;
		}
		
		public function TaskMissionManager()
		{
		}
	}
}