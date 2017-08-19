package com.rpgGame.app.task
{
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.info.task.target.TaskAreaExplorationInfo;
	import com.rpgGame.coreData.info.task.target.TaskFollowEscortInfo;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 提供方法把后端发过来的任务数据Proto解析成易读对象
	 * @author zgd
	 * 创建时间：2014-4-12 下午6:12:09
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-06-02 下午3:05:12
	 */
	public class TaskInfoDecoder
	{
		private static var _currentEscortInfo : TaskFollowEscortInfo = null;

		public static function get currentEscortInfo() : TaskFollowEscortInfo
		{
			return _currentEscortInfo;
		}

		public static function setCurrentEscortInfo(value : TaskFollowEscortInfo) : void
		{
			if (_currentEscortInfo == value)
				return;
			_currentEscortInfo = value;
			EventManager.dispatchEvent(TaskEvent.TASK_AREA_INFO_CHANGE);
		}

		private static var _currentExplorationInfo : TaskAreaExplorationInfo = null;

		public static function get currentExplorationInfo() : TaskAreaExplorationInfo
		{
			return _currentExplorationInfo;
		}

		public static function setCurrentExplorationInfo(value : TaskAreaExplorationInfo) : void
		{
			if (_currentExplorationInfo == value)
				return;
			_currentExplorationInfo = value;
			EventManager.dispatchEvent(TaskEvent.TASK_AREA_INFO_CHANGE);
		}

		/**
		 * 解析一个任务章节数据
		 * @param chapterProto
		 * @param chapterInfo
		 */
//		public static function decodeChapterTaskProto(chapterProto : ChapterTaskProto, chapterInfo : TaskChapterInfo, taskInfo : TaskInfo) : void
//		{
//			if (chapterProto.hasChapter) // 当前剧情任务属于第几章，1表示第一章
//			{
//				chapterInfo.order = chapterProto.chapter;
//			}
//			if (chapterProto.hasComplteChapterCount) // 当前已经完成的任务个数，客户端根据该值 / taskConfig.getChapterTaskCount 可以算出本章任务完成百分比
//			{
//				chapterInfo.completedTaskCount = chapterProto.complteChapterCount;
//			}
//			if (chapterProto.completedTask) // 本章已完成的任务名列表
//			{
//				var len : int = chapterProto.completedTask.length;
//				for (var i : int; i < len; i++)
//				{
//					var byte : ByteArray = chapterProto.completedTask[i];
//					chapterInfo.addCompletedTaskName(byte.toString());
//				}
//			}
//			if (chapterProto.hasBaseTask) // 任务详情
//			{
//				decodeTaskProto(chapterProto.baseTask, taskInfo);
//				chapterInfo.addDataInfo(taskInfo.dataInfo);
//			}
//		}

		/**
		 * 解析一个任务数据
		 * @param taskProto
		 * @param taskInfo
		 *
		 */
//		public static function decodeTaskProto(taskProto : TaskProto, taskInfo : TaskInfo) : void
//		{
//			taskInfo.progressList = taskProto.progresses;
//			if (taskProto.hasId)
//			{
//				taskInfo.id = taskProto.id;
//			}
//			if (taskProto.hasData)
//			{
//				taskInfo.dataInfo = new TaskDataInfo();
//				decodeTaskDataProto(taskProto.data, taskInfo.dataInfo);
//			}
//		}

		/**
		 * 解析一个任务详细数据
		 * @param dataProto
		 * @param dataInfo
		 *
		 */
//		public static function decodeTaskDataProto(dataProto : TaskDataProto, dataInfo : TaskDataInfo) : void
//		{
//			if (dataProto.hasName)
//			{
//				dataInfo.name = BytesUtil.bytes2UTF(dataProto.name);
//			}
//			if (dataProto.hasDesc)
//			{
//				dataInfo.desc = BytesUtil.bytes2UTF(dataProto.desc);
//			}
//
////			dataInfo.acceptDialogType = dataProto.acceptDialogType;
////			dataInfo.acceptSound = dataProto.acceptSound;
////			dataInfo.acceptTarget = decodeTaskTargetProto( dataProto.acceptTarget );
////			
////			dataInfo.completeDialogType = dataProto.completeDialogType;
////			dataInfo.completeSound = dataProto.completeSound;
////			dataInfo.completeTarget = decodeTaskTargetProto( dataProto.completeTarget );
//
////			dataInfo.setAcceptDialog( dataProto.acceptDialog );
////			dataInfo.setCompleteDialog( dataProto.completeDialog );
//
//			dataInfo.setPrizeInfo(dataProto.fixPrize, dataProto.selectablePrize);
//
//			var arr : Array;
//			var len : int;
//			var i : int;
//			//目标
//			if (dataProto.target)
//			{
//				arr = dataProto.target;
//				len = arr.length;
//				var targetInfo : BaseTaskTargetInfo;
//				var targetProto : TaskTargetProto;
//				for (i = 0; i < len; i++)
//				{
//					targetProto = arr[i];
//					targetInfo = decodeTaskTargetProto(targetProto);
//					dataInfo.addTargetInfo(targetInfo);
//				}
//			}
//		}

		/**
		 * 解析一个任务目标数据
		 * @param targetProto
		 * @param targetInfo
		 *
		 */
//		public static function decodeTaskTargetProto(targetProto : TaskTargetProto) : BaseTaskTargetInfo
//		{
//			if (targetProto == null)
//				return null;
//			var targetInfo : BaseTaskTargetInfo;
//			if (targetProto.replyNpc)
//			{
//				var replyTargetInfo : TaskTargetReplyInfo = new TaskTargetReplyInfo();
//				replyTargetInfo.npcId = targetProto.replyNpc.npcId;
//				replyTargetInfo.npcDialog = targetProto.replyNpc.npcDialog ? BytesUtil.readRemainUTF(targetProto.replyNpc.npcDialog) : null;
//				replyTargetInfo.npcExamQuestion = targetProto.replyNpc.npcExamQuestion;
//				replyTargetInfo.npcExamSelections = targetProto.replyNpc.npcExamSelections;
//				replyTargetInfo.npcExamAnswer = targetProto.replyNpc.npcExamAnswer;
//				targetInfo = replyTargetInfo;
//				targetInfo.type = TaskTargetType.TASK_TARGET_REPLY_NPC;
//			}
//			else if (targetProto.killMonster)
//			{
//				var monsterTargetInfo : TaskTargetMonsterInfo = new TaskTargetMonsterInfo();
//				monsterTargetInfo.killMonsterId = targetProto.killMonster.killMonsterId;
//				monsterTargetInfo.killMonsterCount = targetProto.killMonster.killMonsterCount;
//				targetInfo = monsterTargetInfo;
//				targetInfo.type = TaskTargetType.TASK_TARGET_KILL_MONSTER;
//			}
//			else if (targetProto.dropGoods)
//			{
//				var monsterGoodsTargetInfo : TaskTargetMonsterGoodsInfo = new TaskTargetMonsterGoodsInfo();
//				monsterGoodsTargetInfo.dropGoodsMonsterId = targetProto.dropGoods.dropGoodsMonsterId;
//				monsterGoodsTargetInfo.dropGoodsCount = targetProto.dropGoods.dropGoodsCount;
//				monsterGoodsTargetInfo.dropGoodsName = targetProto.dropGoods.dropGoodsName.toString();
//				targetInfo = monsterGoodsTargetInfo;
//				targetInfo.type = TaskTargetType.TASK_TARGET_KILL_MONSTER_AND_COLLECT;
//			}
//			else if (targetProto.collectGoods)
//			{
//				var gatherTargetInfo : TaskTargetGatherGoodsInfo = new TaskTargetGatherGoodsInfo();
//				gatherTargetInfo.collectGoodsType = targetProto.collectGoods.collectGoodsType;
//				gatherTargetInfo.collectGoodsCount = targetProto.collectGoods.collectGoodsCount;
//				targetInfo = gatherTargetInfo;
//				targetInfo.type = TaskTargetType.TASK_TARGET_GATHER;
//			}
//			else if (targetProto.upgradeLevel)
//			{
//				var upgradeTargetInfo : TaskTargetUpgradeInfo = new TaskTargetUpgradeInfo();
//				upgradeTargetInfo.upgradeLvl = targetProto.upgradeLevel.upgradeLevel;
//				upgradeTargetInfo.upgradeRecommendMonsterIDArr = targetProto.upgradeLevel.upgradeRecommendMonster;
//				targetInfo = upgradeTargetInfo;
//				targetInfo.type = TaskTargetType.TASK_TARGET_LEVEL_UP;
//			}
//			else if (targetProto.depotGoods)
//			{
//				var bagGoodsTargetInfo : TaskTargetBagGoodsInfo = new TaskTargetBagGoodsInfo();
//				bagGoodsTargetInfo.depotGoodsCount = targetProto.depotGoods.depotGoodsCount;
//				bagGoodsTargetInfo.depotGoodsId = targetProto.depotGoods.depotGoodsId;
//				targetInfo = bagGoodsTargetInfo;
//				targetInfo.type = TaskTargetType.TASK_TARGET_DEDUCT_BACKPACK_GOODS;
//			}
//			else if (targetProto.searchArea)
//			{
//				var explorationInfo : TaskAreaExplorationInfo = new TaskAreaExplorationInfo();
//				explorationInfo.targetArea = targetProto.searchArea.searchArea;
//				targetInfo = explorationInfo;
//				targetInfo.type = TaskTargetType.TASK_AREA_EXPLORATION;
//			}
//			else if (targetProto.sentNpc)
//			{
//				var escortInfo : TaskFollowEscortInfo = new TaskFollowEscortInfo();
//				escortInfo.npcId = targetProto.sentNpc.setNpcAcceptNpc;
//				escortInfo.npcDialog = targetProto.sentNpc.setNpcAcceptNpcDialog;
//				escortInfo.targetArea = targetProto.sentNpc.setNpcTargetArea;
//				targetInfo = escortInfo;
//				targetInfo.type = TaskTargetType.TASK_FOLLOW_ESCORT;
//			}
//			else if (targetProto.vehiclePlayer)
//			{
//				var vehiclePlayerInfo : TaskVehiclePlayerInfo = new TaskVehiclePlayerInfo();
//				vehiclePlayerInfo.npcId = targetProto.vehiclePlayer.vehiclePlayerNpc;
//				targetInfo = vehiclePlayerInfo;
//				targetInfo.type = TaskTargetType.TASK_VEHICLE_PLAYER;
//			}
//			else if (targetProto.finishStoryDungeon)
//			{
//				var storyDungeonInfo : TaskStoryDungeonInfo = new TaskStoryDungeonInfo();
//				storyDungeonInfo.npcId = targetProto.finishStoryDungeon.enterStoryDungeonNpcId;
//				targetInfo = storyDungeonInfo;
//				targetInfo.type = TaskTargetType.TASK_FINISH_STORY_DUNGEON;
//			}
//			else if (targetProto.clientTask)
//			{
//				var clientTaskInfo : TaskClientTaskInfo = new TaskClientTaskInfo();
//				clientTaskInfo.clientTaskType = targetProto.clientTask.clientTaskType;
//				clientTaskInfo.clientTask = targetProto.clientTask.clientTask;
//				targetInfo = clientTaskInfo;
//				targetInfo.type = TaskTargetType.TASK_CLIENT_TASK;
//			}
//
//			if (targetInfo)
//			{
//				targetInfo.triggerId = targetProto.clientEvent;
//			}
//			return targetInfo;
//		}

		/**
		 * 解析一个剧情任务数据
		 * @param storyTaskProto
		 *
		 */
//		public static function decodeStoryProto(storyTaskProto : StoryTaskProto) : void
//		{
//			var taskInfo : TaskInfo = new TaskInfo();
//			decodeTaskProto(storyTaskProto.baseTask, taskInfo);
//			TaskManager.storyTaskInfo = taskInfo;
//		}

		/**
		 * 解析一个机缘任务数据
		 * @param chanceProto
		 * @param chanceInfo
		 *
		 */
//		public static function decodeChanceProto(chanceProto : ChanceTaskProto, chanceInfo : TaskChanceInfo) : void
//		{
//			chanceInfo.swallowPercent = chanceProto.swallowPercent;
//			chanceInfo.quality = chanceProto.quality;
//			chanceInfo.headImg = chanceProto.headImage;
//			chanceInfo.taskInfo = new TaskInfo();
//			decodeTaskProto(chanceProto.baseTask, chanceInfo.taskInfo);
//		}

		/**
		 * 解析一个日常任务
		 * @param dailyProto
		 * @param dailyInfo
		 *
		 */
//		public static function decodeDailyProto(dailyProto : DailyTaskProto, dailyInfo : TaskDailyInfo) : void
//		{
//			dailyInfo.taskInfo = new TaskInfo();
//			decodeTaskProto(dailyProto.baseTask, dailyInfo.taskInfo);
//			dailyInfo.diffiStar = dailyProto.diffiStar;
//			dailyInfo.prizeStar = dailyProto.prizeStar;
//			dailyInfo.round = dailyProto.round;
//		}


	/**
	 * 解析一个帮会任务
	 * @param dailyProto
	 * @param dailyInfo
	 *
	 */
//		public static function decodeGuildProto(dailyProto:GuildTaskProto,guildInfo:TaskGuildInfo):void
//		{
//			guildInfo.taskInfo = new TaskInfo();
//			decodeTaskProto(dailyProto.baseTask,guildInfo.taskInfo);
//			guildInfo.round = dailyProto.round;
//		}

	}
}
