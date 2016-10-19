package com.rpgGame.coreData.cfg.task
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.utils.ProtoParseToInfo;
	
	import app.message.TaskConfig;
	import app.message.AllChapterTaskConfig.ChapterTaskConfig;
	
	/**
	 *
	 * 任务配置数据
	 * @author zgd
	 * 创建时间：2014-4-8 下午12:00:33
	 * 
	 */
	public class TaskCfgData
	{
		/**剧情任务配置列表*/
		private static var _storyTaskChapterArr:Array;
		/**根据品质(0-白 1-绿 2-蓝 3-紫 4-橙)排列的元宝完成机缘任务花费的元宝数列表*/
		private static var _chanceTaskAutoCompleteCostVec:Vector.<int>;
		/**根据品质(0-白 1-绿 2-蓝 3-紫 4-橙)排列的每天元宝完成机缘任务的次数限制列表*/
		private static var _chanceTaskAutoCompleteLimitVec:Vector.<int>;
		/**根据品质(0-白 1-绿 2-蓝 3-紫 4-橙)排列的普通吞噬机缘任务获得的最小加成百分比列表*/
		private static var _chanceTaskSwallowMinPercentVec:Vector.<int>;
		/**根据品质(0-白 1-绿 2-蓝 3-紫 4-橙)排列的普通吞噬机缘任务获得的最大加成百分比列表*/
		private static var _chanceTaskSwallowMaxPercentVec:Vector.<int>;
		private static var _chanceTaskAcceptableCount:int;
		private static var _chanceTaskMaxCount:int;
		private static var _chanceTaskSwallowableCount:int;
		private static var _chanceTaskSwallowableVipAddCount:int;
		private static var _chanceTaskSwallowCost:int;
		/**每日日常任务最大环数*/
		private static var _dailyTaskMaxRound:int;
		/**日常任务额外奖励，完成当天所有日常任务获得*/
		private static var _dailyTaskExtraPrizeInfo:PrizeInfo;
		/**难度到1星消耗（铜钱）*/
		private static var _dailyTaskReduceDiffiCost:int;
		/**奖励到10星消耗（铜钱）*/
		private static var _dailyTaskAddPrizeCost:int;
		/**秒杀1环日常任务的消耗（元宝）*/
		private static var _dailyTaskAutoCompleteCost:int;
		/**每日帮会任务最大环数*/
		private static var guildTaskMaxRound:int;
		/** 帮会任务额外奖励，完成当天所有帮会任务获得*/
		private static var guildTaskExtraPrizeInfo:PrizeInfo;
		/**秒杀1环帮会任务的消耗（元宝）*/
		private static var guildTaskAutoCompleteCost:int;
		
		
		/** 设置配置常量数据。(四种帮贡物品... */
		public static function setConfig(config:TaskConfig):void
		{
			if( config == null )
				return;
			//密信
			MiXinCfgData.setConfig( config.miXinConfig );
			//偷猪
			TouZhuCfgData.setConfig( config.touZhuConfig );
			//偷经
			TouJingCfgData.setConfig( config.touJingConfig );
			
			//剧情任务
			if(config.hasChapterTask)
				_storyTaskChapterArr = config.chapterTask.data;
			else
				GameLog.addShow("剧情任务读取失败");
			var len:int;
			var i:int;
			var value:int;
			//机缘任务
			var arr:Array;
			if(config.hasChanceTask)
			{
				_chanceTaskAcceptableCount = config.chanceTask.chanceTaskAcceptableCount;
				_chanceTaskMaxCount = config.chanceTask.chanceTaskMaxCount;
				_chanceTaskSwallowableCount = config.chanceTask.chanceTaskSwallowableCount;
				_chanceTaskSwallowableVipAddCount = config.chanceTask.chanceTaskSwallowableVipAddCount;
				_chanceTaskSwallowCost = config.chanceTask.chanceTaskSwallowCost;
				
				arr = config.chanceTask.autoCompleteCost;
				if(arr)
				{
					len = arr.length;
					_chanceTaskAutoCompleteCostVec = new Vector.<int>();
					for (i = 0; i < len; i++) 
					{
						value = arr[i];
						_chanceTaskAutoCompleteCostVec[i] = value;
					}
				}
				
				arr = config.chanceTask.autoCompleteLimit;
				if(arr)
				{
					len = arr.length;
					_chanceTaskAutoCompleteLimitVec = new Vector.<int>();
					for(i = 0;i < len ; i++) 
					{
						value = arr[i];
						_chanceTaskAutoCompleteLimitVec.push(value);
					}
				}
				arr = config.chanceTask.swallowMinPercent;
				if(arr)
				{
					len = arr.length;
					_chanceTaskSwallowMinPercentVec = new Vector.<int>();
					for(i = 0;i < len; i++) 
					{
						value = arr[i];
						_chanceTaskSwallowMinPercentVec.push(value);
					}
				}
				arr = config.chanceTask.swallowMaxPercent;
				if(arr)
				{
					len = arr.length;
					_chanceTaskSwallowMaxPercentVec = new Vector.<int>();
					for(i = 0;i < len; i++) 
					{
						_chanceTaskSwallowMaxPercentVec.push(int(arr[i]));
					}
				}
			}
			
			//日常任务
			if(config.hasDailyTask)
			{
				_dailyTaskMaxRound = config.dailyTask.dailyTaskMaxRound;
				_dailyTaskExtraPrizeInfo = ProtoParseToInfo.decodePrizeProto(config.dailyTask.dailyTaskExtraPrize);
				_dailyTaskReduceDiffiCost = config.dailyTask.dailyTaskReduceDiffiCost;
				_dailyTaskAddPrizeCost = config.dailyTask.dailyTaskAddPrizeCost;
				_dailyTaskAutoCompleteCost = config.dailyTask.dailyTaskAutoCompleteCost;
			}
			//帮会任务
			//			guildTaskMaxRound = config.guildTaskMaxRound;
			//			guildTaskExtraPrizeInfo = ProtoParseToInfo.decodePrizeProto(config.guildTaskExtraPrize);
			//			guildTaskAutoCompleteCost = config.guildTaskAutoCompleteCost;
			
			//---------------
		}
		
		/**
		 * 获取剧情任务总章数
		 * @return 
		 * 
		 */
		public static function getStoryTaskTotalCount():int
		{
			return _storyTaskChapterArr ? _storyTaskChapterArr.length : 0;
		}
		
		/**
		 * 得到某章的数据
		 * @param chapter   1为第一章
		 * @return 
		 * 
		 */		
		public static function getStoryTaskData(chapter:int):ChapterTaskConfig
		{
			if( chapter < 1 )
				chapter = 1;
			
			if( chapter >= _storyTaskChapterArr.length )
				chapter = _storyTaskChapterArr.length;
			
			return _storyTaskChapterArr[ chapter -1 ];
		}
		
		/**
		 * 获取全部剧情任务
		 * @return 
		 * 
		 */
		public static function getStoryAllTask():Array
		{
			return _storyTaskChapterArr.concat();
		}
		
		/**
		 * 根据章、和任务在章中的序号获取节号和任务在节中的序号
		 * @param chapter 1表示第一章
		 * @param countInChapter 1表示第一个
		 * @return 一个数组，[节号(1表示第一节)，任务在节中的序号(1表示第一个)]
		 * 
		 */
		public static function getStoryTaskSectionByCountInChapter( chapter:int, countInChapter:int ):Array
		{
			if( _storyTaskChapterArr != null )
			{
				var index:int = chapter - 1;
				if( index >= 0 && index < _storyTaskChapterArr.length )
				{
					var taskCfg:ChapterTaskConfig = _storyTaskChapterArr[index];
					var len:int = taskCfg.chapterTaskCount;
					var totalCount:int;
					var count:int = len;
					if(countInChapter <= totalCount + count)
					{
						return [ 1,countInChapter - totalCount];
					}
					totalCount += count;
				}
			}
			return null;
		}
		
		/**
		 * 根据章序号获取章名
		 * @param chapter 1表示第一章
		 * @return 
		 * 
		 */
		public static function getStoryTaskChapterName( chapter:int ):String
		{
			if(_storyTaskChapterArr)
			{
				var index:int = chapter - 1;
				if(index >= 0 && index < _storyTaskChapterArr.length)
				{
					var taskCfg:ChapterTaskConfig = _storyTaskChapterArr[index];
					return taskCfg.chapterName.toString();
				}
			}
			return null;
		}
		
		/**
		 * 根据章序号获取图标
		 * @param chapter 1表示第一章
		 * @return 
		 * 
		 */
		public static function getStoryTaskChapterIcon(chapter:int):String
		{
			if(_storyTaskChapterArr)
			{
				var index:int = chapter - 1;
				if(index >= 0 && index < _storyTaskChapterArr.length)
				{
					var taskCfg:ChapterTaskConfig = _storyTaskChapterArr[index];
					return taskCfg.chapterIcon.toString();
				}
			}
			return null;
		}
		
		/**
		 * 根据章序号获取章节标题
		 * @param chapter 1表示第一章
		 * @return 
		 * 
		 */
		public static function getStoryTaskChapterTitle( chapter:int ):String
		{
			if(_storyTaskChapterArr)
			{
				var index:int = chapter - 1;
				if(index >= 0 && index < _storyTaskChapterArr.length)
				{
					var taskCfg:ChapterTaskConfig = _storyTaskChapterArr[index];
					return taskCfg.chapterTitle.toString();
				}
			}
			return null;
		}
		
		/**
		 * 根据章序号获取描述
		 * @param chapter 1表示第一章
		 * @return 
		 * 
		 */
		public static function getStoryTaskChapterDesc(chapter:int):String
		{
			if(_storyTaskChapterArr)
			{
				var index:int = chapter - 1;
				if(index >= 0 && index < _storyTaskChapterArr.length)
				{
					var taskCfg:ChapterTaskConfig = _storyTaskChapterArr[index];
					return taskCfg.chapterDesc.toString();
				}
			}
			return null;
		}
		
		/**
		 * 根据章序号获取任务个数
		 * @param chapter 1表示第一章
		 * @return 
		 * 
		 */
		public static function getStoryTaskChapterNumber(chapter:int):int
		{
			if( _storyTaskChapterArr != null )
			{
				var index:int = chapter - 1;
				if(index >= 0 && index < _storyTaskChapterArr.length)
				{
					var taskCfg:ChapterTaskConfig = _storyTaskChapterArr[index];
					return taskCfg.chapterTaskCount;
				}
			}
			return 0;
		}
		//-----------------------------------------------
		//-----------------------------------------------
		/**
		 * 根据品质(0-白 1-绿 2-蓝 3-紫 4-橙)获取元宝完成机缘任务花费的元宝数
		 * @param quality
		 * @return 
		 * 
		 */
		public static function getChanceTaskAutoCompleteCost(quality:int):int
		{
			return _chanceTaskAutoCompleteCostVec[quality];
		}
		
		/**
		 * 根据品质(0-白 1-绿 2-蓝 3-紫 4-橙)获取每天元宝完成机缘任务的次数限制
		 * @param quality
		 * @return 
		 * 
		 */
		public static function getChanceTaskAutoCompleteLimit(quality:int):int
		{
			return _chanceTaskAutoCompleteLimitVec[quality];
		}
		
		/**
		 * 根据品质(0-白 1-绿 2-蓝 3-紫 4-橙)获取普通吞噬机缘任务获得的最小加成百分比列表
		 * @param quality
		 * @return 
		 * 
		 */
		public static function getChanceTaskSwallowMinPercent(quality:int):int
		{
			return _chanceTaskSwallowMinPercentVec[quality];
		}
		
		/**
		 * 根据品质(0-白 1-绿 2-蓝 3-紫 4-橙)排列的普通吞噬机缘任务获得的最大加成百分比列表
		 * @param quality
		 * @return 
		 * 
		 */
		public static function getChanceTaskSwallowMaxPercent(quality:int):int
		{
			return _chanceTaskSwallowMaxPercentVec[quality];
		}
		
		/**每天可接受机缘任务的总数*/
		public static function get chanceTaskAcceptableCount():int
		{
			return _chanceTaskAcceptableCount;
		}
		
		/**机缘任务列表最大个数*/
		public static function get chanceTaskMaxCount():int
		{
			return _chanceTaskMaxCount;
		}
		
		/**每日可吞噬机缘任务个数*/
		public static function get chanceTaskSwallowableCount():int
		{
			return _chanceTaskSwallowableCount;
		}
		
		/**吞噬任务个数VIP加成个数*/
		public static function get chanceTaskSwallowableVipAddCount():int
		{
			return _chanceTaskSwallowableVipAddCount;
		}
		
		/**元宝吞噬机缘任务花费的元宝数*/
		public static function get chanceTaskSwallowCost():int
		{
			return _chanceTaskSwallowCost;
		}
		
		
	}
}
