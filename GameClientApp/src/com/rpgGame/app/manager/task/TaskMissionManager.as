package com.rpgGame.app.manager.task
{
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.task.bean.TaskInfo;

	public class TaskMissionManager
	{
		/**最后完成主线任务id*/
		private static var _taskModelId: int;
		/**当天已经完成日常任务的次数*/
		private static var _dailyTaskTimes: int;
		/**当前主线任务服务器信息*/
		private static var _currentMainTaskInfo : TaskInfo;
		private static var _currentMainTaskData : Q_mission_base;
		private static var _currentMainTaskIsfinish:Boolean
		
		/**当前支线任务信息*/
		private static var _currentDailyTaskInfo : TaskInfo;
		/**当前环式任务信息*/
		private static var _currentTreasuerTaskInfo : TaskInfo;
		/**主线任务是否完成*/
		public static function get currentMainTaskIsfinish():Boolean
		{
			return _currentMainTaskIsfinish;
		}

		/**
		 * @private
		 */
		public static function set currentMainTaskIsfinish(value:Boolean):void
		{
			_currentMainTaskIsfinish = value;
		}

		/**当前主线任务配置信息*/
		public static function get currentMainTaskData():Q_mission_base
		{
			return _currentMainTaskData;
		}

		/**
		 * @private
		 */
		public static function set currentMainTaskData(value:Q_mission_base):void
		{
			_currentMainTaskData = value;
		}
		
		public static function setCurrentTaskInfo(value: Vector.<TaskInfo>) : void
		{
			if(value!=null&&value.length>0)
			{
				for each(var task:TaskInfo in value)
				{
					setTaskInfo(task);
				}
			}
			
		}
		
		public static function setTaskInfo(task:TaskInfo) : void
		{
			var taskData:Q_mission_base;
			if(task!=null)
			{
				taskData=TaskMissionCfgData.getTaskByID(task.taskModelId);
			}
			
			if(taskData!=null)
			{
				if(taskData.q_mission_mainType==TaskType.MAINTYPE_MAINTASK)
				{
					setCurrentMainTaskInfo(task,taskData);
				}
				else if(taskData.q_mission_mainType==TaskType.MAINTYPE_DAILYTASK)
				{
					//currentMainTaskInfo(task);
				}
				else if(taskData.q_mission_mainType==TaskType.MAINTYPE_TREASUREBOX)
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
			return _currentMainTaskInfo;
		}

		/**
		 * 设置当前任务信息
		 */
		public static function setCurrentMainTaskInfo(value : TaskInfo,taskData:Q_mission_base) : void
		{
			if(value == null)return;
			if (_currentMainTaskInfo&&value&&_currentMainTaskInfo.taskId != value.taskId)
			{
				currentMainTaskIsfinish=false;
			}
			_currentMainTaskInfo = value;
			_currentMainTaskData=taskData;
		}
		
		
		
		/**
		 * 检测npc是否是主线任务回复npc
		 * @param id
		 * @return
		 *
		 */
		public static function checkHasReplyNpcInStoryTask(npcId : int) : Boolean
		{
			if (_currentMainTaskData)
			{
				if (_currentMainTaskData.q_finish_npc == npcId)
				{
					return true;
				}
			}
			return false;
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