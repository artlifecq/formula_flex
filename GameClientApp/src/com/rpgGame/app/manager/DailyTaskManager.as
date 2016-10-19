package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.manager.task.TouZhuManager;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.coreData.cfg.task.TouJingCfgData;
	import com.rpgGame.coreData.cfg.task.TouZhuCfgData;
	import com.rpgGame.coreData.info.dailyTask.DailyTaskData;
	import com.rpgGame.coreData.type.DailyTaskType;

	public class DailyTaskManager
	{
		public function DailyTaskManager()
		{
			
		}
		
		/**
		 * 得到日常任务
		 * @return 
		 * 
		 */		
		public static function getDailyTaskData():Vector.<DailyTaskData>
		{
			var taskDataVect:Vector.<DailyTaskData> = new Vector.<DailyTaskData>;
			
			taskDataVect.push( getTouZhuData() );
			taskDataVect.push( getSecretMessageData() );
			taskDataVect.push( getTouJingData() );
			
			return taskDataVect;
		}
		
		/**
		 * 偷猪
		 * @return 
		 * 
		 */		
		private static function getTouZhuData():DailyTaskData
		{
			var taskData:DailyTaskData = new DailyTaskData();
			taskData.level = 1;
			taskData.type = DailyTaskType.TOU_ZHU;
			taskData.name = "偷猪";
			taskData.time = TimeUtil.getRuleTime( TouZhuManager.getTouZhuTime(), TouZhuCfgData.duration );
			return taskData;
		}
		
		/**
		 * 密信
		 * @return 
		 * 
		 */		
		private static function getSecretMessageData():DailyTaskData
		{
			var taskData:DailyTaskData = new DailyTaskData();
			taskData.level = 2;
			taskData.type = DailyTaskType.SECRET_MESSAGE;
			taskData.name = "密信";
//			taskData.time = TimeUtil.getRuleTime( MiXinManager.getMiXinTime(), MiXinCfgData.duration );
			return taskData;
		}
		
		/**
		 * 偷经
		 * @return 
		 * 
		 */		
		private static function getTouJingData():DailyTaskData
		{
			var taskData:DailyTaskData = new DailyTaskData();
			taskData.level = 1;
			taskData.type = DailyTaskType.TOU_JING;
			taskData.name = "偷经";
			taskData.count = TouJingManager.touJingCount;
			taskData.time = TimeUtil.getRuleTime( TouJingManager.getTouJingTime(), TouJingCfgData.duration );
			return taskData;
		}
	}
}