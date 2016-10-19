package com.rpgGame.app.manager.task
{
	import com.game.engine3D.utils.MathUtil;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.collect.CollectManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.task.TaskInfoDecoder;
	import com.rpgGame.app.cmdlistener.enum.EmEvenTrackType;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.events.toujing.TouJingEvent;
	import com.rpgGame.coreData.cfg.collect.CollectCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.cfg.task.TaskCfgData;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.collect.CollectObjcetInfo;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.info.task.TaskChanceInfo;
	import com.rpgGame.coreData.info.task.TaskChapterInfo;
	import com.rpgGame.coreData.info.task.TaskDailyInfo;
	import com.rpgGame.coreData.info.task.TaskGuildInfo;
	import com.rpgGame.coreData.info.task.TaskInfo;
	import com.rpgGame.coreData.info.task.target.BaseTaskTargetInfo;
	import com.rpgGame.coreData.info.task.target.TaskAreaExplorationInfo;
	import com.rpgGame.coreData.info.task.target.TaskClientTaskInfo;
	import com.rpgGame.coreData.info.task.target.TaskFollowEscortInfo;
	import com.rpgGame.coreData.info.task.target.TaskTargetGatherGoodsInfo;
	import com.rpgGame.coreData.info.task.target.TaskTargetReplyInfo;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.NPCFunctionType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.type.TaskTargetType;
	import com.rpgGame.coreData.type.TaskType;
	
	import flash.geom.Point;
	
	import app.message.ChanceTaskProto;
	import app.message.MonsterDataProto;
	import app.message.TaskModuleObjProto;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	/**
	 * 任务数据管理
	 * @author zgd
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-06-02 下午3:05:12
	 */
	public class TaskManager
	{
		/**当前主线任务选择了那个奖励**/
		public static var curSelectPrizeIndex : int = 0;

		/** 任务腾翔卷轴免费传送VIP等级 */
		public static var FREE_FLY_VIP : int = 1;
		/**是否在采集*/
		public static var isCollecting : Boolean;
		/**剧情任务当前章数据*/
		public static var currentChapterInfo : TaskChapterInfo;
		/**剧情任务章节数据列表*/
		private static var _chapterInfoHash : HashMap = new HashMap();
		private static var _preTaskType : int = -1;

		/**前一个任务类型*/
		public static function get preTaskType() : int
		{
			return _preTaskType;
		}

		/**当前章号*/
		public static function get currentChapter() : int
		{
			return currentChapterInfo ? currentChapterInfo.order : 0;
		}

		private static var _currentSection : int = 1;

		/**当前节数，1表示第一节*/
		public static function get currentSection() : int
		{
			return _currentSection;
		}

		private static var _currentCountInSection : int = 1;

		/**当前节中的任务序号，1表示第一个*/
		public static function get currentCountInSection() : int
		{
			return _currentCountInSection;
		}

		private static var _currentMainTaskInfo : TaskInfo;

		/**当前任务信息*/
		public static function get currentMainTaskInfo() : TaskInfo
		{
			if (_currentMainTaskInfo)
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
			return null;
		}

		/**
		 * @private
		 */
		public static function set currentMainTaskInfo(value : TaskInfo) : void
		{
			if (_currentMainTaskInfo)
			{
				if (value == null || _currentMainTaskInfo.id != value.id)
				{
					if (_currentMainTaskInfo.dataInfo)
					{
						var targetInfo : BaseTaskTargetInfo = _currentMainTaskInfo.dataInfo.getTargetInfoAt(0);
						if (targetInfo != null)
						{
							_preTaskType = targetInfo.type;
						}
					}
				}
			}
			_currentMainTaskInfo = value;
			var arr : Array = TaskCfgData.getStoryTaskSectionByCountInChapter(currentChapterInfo.order, currentChapterInfo.completedTaskCount + 1);
			if (arr)
			{
				_currentSection = arr[0];
				_currentCountInSection = arr[1];
			}
		}

		private static var _mainLineTaskInfo : TaskInfo;

		/**
		 * 主线任务信息
		 * @param value
		 *
		 */
		public static function set mainLineTaskInfo(value : TaskInfo) : void
		{
			_mainLineTaskInfo = value;
			if (_mainLineTaskInfo)
			{
				_mainLineTaskInfo.type = TaskType.TASK_TYPE_MAIN_LINE;
			}
			updateMainTaskInfo();
		}

		private static var _storyTaskInfo : TaskInfo;

		/**
		 * 剧情副本任务信息
		 * @param value
		 *
		 */
		public static function set storyTaskInfo(value : TaskInfo) : void
		{
			_storyTaskInfo = value;
			if (_storyTaskInfo)
			{
				_storyTaskInfo.type = TaskType.TASK_TYPE_STORY_DUNGEON;
			}
			updateMainTaskInfo();
		}

		public static function completeTask(taskId : int) : void
		{
			if (_storyTaskInfo && _storyTaskInfo.id == taskId)
			{
				_storyTaskInfo = null;
			}
			if (_mainLineTaskInfo && _mainLineTaskInfo.id == taskId)
			{
				_mainLineTaskInfo = null;
			}
			updateMainTaskInfo();
		}

		public static function updateMainTaskInfo() : void
		{
			if (_storyTaskInfo)
			{
				currentMainTaskInfo = _storyTaskInfo;
			}
			else
			{
				currentMainTaskInfo = _mainLineTaskInfo;
			}

			ClientTriggerManager.clearTaskTrigger();
			var escortInfo : TaskFollowEscortInfo = null;
			var explorationInfo : TaskAreaExplorationInfo = null;
			if (_currentMainTaskInfo && _currentMainTaskInfo.dataInfo)
			{
				var targetVec : Vector.<BaseTaskTargetInfo> = _currentMainTaskInfo.dataInfo.getAllTargetInfo();
				for each (var targetInfo : BaseTaskTargetInfo in targetVec)
				{
					if (targetInfo is TaskFollowEscortInfo)
					{
						escortInfo = targetInfo as TaskFollowEscortInfo;
					}
					else if (targetInfo is TaskAreaExplorationInfo)
					{
						explorationInfo = targetInfo as TaskAreaExplorationInfo;
					}
					ClientTriggerManager.taskTrigger(targetInfo);
				}
			}
			TaskInfoDecoder.setCurrentEscortInfo(escortInfo);
			TaskInfoDecoder.setCurrentExplorationInfo(explorationInfo);

			EventManager.dispatchEvent(TaskEvent.TASK_UPDATE_NEW_TASK);
		}

		/**今天已吞噬机缘任务个数*/
		public static var chanceTaskSwallowedCount : int;
		/**今天已接受机缘任务个数*/
		public static var chanceTaskAcceptedCount : int;
		/**根据品质(0-白 1-绿 2-蓝 3-紫 4-橙)排列的今天元宝完成任务的个数*/
		private static var _chanceTaskAutoCompleteList : Array;
		/**日常任务数据*/
		public static var dailyTaskInfo : TaskDailyInfo;
		/** 一键完成奖励 */
		public static var onekeyPrize : PrizeInfo;
		/**帮会任务数据*/
		public static var guildTaskInfo : TaskGuildInfo;


		public static function setTaskProto(heroTaskProto : TaskModuleObjProto) : void
		{
			if (heroTaskProto == null)
				return;

			//密信
			MiXinManager.setHero(heroTaskProto.miXinTask, heroTaskProto.acceptMiXinTimes);
			//偷猪
			TouZhuManager.setHero(heroTaskProto.touZhuTask, heroTaskProto.touZhuTimes);
			//偷经
			TouJingManager.setHero(heroTaskProto.touJingTask, heroTaskProto.touJingTimes);

			//			FREE_FLY_VIP = VipCfgData.getTaskTransFreeLvl();
			FREE_FLY_VIP = 3;
			currentChapterInfo = new TaskChapterInfo();

			//主线任务
			if (heroTaskProto.doingChapterTask)
			{
				var taskInfo : TaskInfo = new TaskInfo();
				TaskInfoDecoder.decodeChapterTaskProto(heroTaskProto.doingChapterTask, currentChapterInfo, taskInfo);
				mainLineTaskInfo = taskInfo;
			}
			else
			{
				currentChapterInfo.order = TaskCfgData.getStoryTaskTotalCount();
				currentChapterInfo.completedTaskCount = TaskCfgData.getStoryTaskChapterNumber(currentChapterInfo.order);
			}
			addChapterInfo(currentChapterInfo);
			//机缘任务
			chanceTaskSwallowedCount = heroTaskProto.chanceTaskSwallowedCount;
			chanceTaskAcceptedCount = heroTaskProto.chanceTaskAcceptedCount;
			_chanceTaskAutoCompleteList = heroTaskProto.chanceTaskAutoCompleteCount.concat();
			var arr : Array = heroTaskProto.chanceTask;
			var len : int = arr.length;
			var chanceProto : ChanceTaskProto;
			for (var i : int = 0; i < len; i++)
			{
				chanceProto = arr[i];
				var chanceInfo : TaskChanceInfo = new TaskChanceInfo();
				TaskInfoDecoder.decodeChanceProto(chanceProto, chanceInfo);
					//addChanceInfo(chanceInfo);
			}
			//日常任务
			if (heroTaskProto.hasDoingDailyTask)
			{
				dailyTaskInfo = new TaskDailyInfo();
				TaskInfoDecoder.decodeDailyProto(heroTaskProto.doingDailyTask, dailyTaskInfo);
			}
			//帮会任务
			//			if(heroTaskProto.hasDoingGuildTask)
			//			{
			//				guildTaskInfo = new TaskGuildInfo();
			//				TaskInfoDecoder.decodeGuildProto(heroTaskProto.doingGuildTask,guildTaskInfo);
			//			}
		}

		/**
		 * 添加剧情任务章数据
		 * @param chapterInfo
		 *
		 */
		public static function addChapterInfo(chapterInfo : TaskChapterInfo) : void
		{
			_chapterInfoHash.add(chapterInfo.order, chapterInfo);
		}

		/**
		 * 是否有某章的数据
		 * @param order
		 * @return
		 *
		 */
		public static function hasChapterInfo(order : int) : Boolean
		{
			return _chapterInfoHash.getValue(order) != null;
		}

		/**
		 * 根据章节序号获取章数据
		 * @param order
		 * @return
		 *
		 */
		public static function getChapterInfo(order : int) : TaskChapterInfo
		{
			return _chapterInfoHash.getValue(order);
		}

		/**
		 * 根据章节号和节中的任务序号获取任务名称
		 * @param chapter 1表示第一章
		 * @param section 1表示第一节
		 * @param countInSection 1表示第一个
		 * @return
		 *
		 */
		public static function getStoryTaskName(chapter : int, section : int, countInSection : int) : String
		{
			var chapterInfo : TaskChapterInfo = getChapterInfo(chapter);
			if (chapterInfo)
			{
				if (_mainLineTaskInfo && chapter == currentChapter && section == currentSection && countInSection == currentCountInSection)
				{
					return _mainLineTaskInfo.dataInfo.name;
				}
				return chapterInfo.getTaskNameBySection(section, countInSection);
			}
			return null;
		}

		/**
		 * 改变机缘元宝完成次数
		 * @param quality
		 * @param count
		 *
		 */
		public static function changeThanceTaskAutoCompleteList(quality : int, count : int) : void
		{
			_chanceTaskAutoCompleteList[quality] = count;
		}

		/**
		 * 检测当前剧情任务是否达成，注意不是提交
		 * @return
		 *
		 */
		public static function checkCurrentChapterTaskComplete() : Boolean
		{
			var taskInfo : TaskInfo = currentMainTaskInfo;
			if (taskInfo && taskInfo.getProgressNumAt(0) == 0)
			{
				return false;
			}
			return true;
		}


		//		public static function checkStartLayerStory():Boolean
		//		{
		//			var layerStoryTargetInfo:TaskTargetLayerStory = TaskManager.getLayerStoryTargetInfo();
		//			if(layerStoryTargetInfo)
		//			{
		//				if(MapManager.curtMapID == layerStoryTargetInfo.sceneId)
		//				{
		//					var leftTileX:int = layerStoryTargetInfo.startX;
		//					var rightTileX:int = layerStoryTargetInfo.endX;
		//					var topTileY:int = layerStoryTargetInfo.startY;
		//					var bottomTileY:int = layerStoryTargetInfo.endY;
		//					var tileX:int = MainManager.actor.tile_x;
		//					var tileY:int = MainManager.actor.tile_y;
		//					if(MainManager.actor.isIn1Jump)
		//					{
		//						var jumpData:JumpData = MainManager.actor.userData.jumpData;
		//						if(jumpData)
		//						{
		//							tileX = jumpData.jump_targetP.x;
		//							tileY = jumpData.jump_targetP.y;
		//						}
		//					}
		//					if(tileX >= leftTileX && tileX <= rightTileX && tileY >= topTileY && tileY <= bottomTileY)
		//					{
		//						return true;
		//					}
		//				}
		//			}
		//			return false;
		//		}

		/**
		 * 检测npc是否是主线任务回复npc
		 * @param id
		 * @return
		 *
		 */
		public static function checkHasReplyNpcInStoryTask(npcId : int) : Boolean
		{
			var taskInfo : TaskInfo = currentMainTaskInfo;
			if (taskInfo)
			{
				var replyTargetInfo : TaskTargetReplyInfo = taskInfo.dataInfo.getTargetInfoAt(0) as TaskTargetReplyInfo;
				if (replyTargetInfo)
				{
					if (replyTargetInfo.npcId == npcId)
					{
						return true;
					}
				}
			}
			return false;
		}

		public static function getReplyNpcId() : int
		{
			var taskInfo : TaskInfo = currentMainTaskInfo;
			if (taskInfo)
			{
				var replyTargetInfo : TaskTargetReplyInfo = taskInfo.dataInfo.getTargetInfoAt(0) as TaskTargetReplyInfo;
				if (replyTargetInfo)
				{
					return replyTargetInfo.npcId;
				}
			}
			return 0;
		}

		public static function getReplyInfo() : TaskTargetReplyInfo
		{
			var taskInfo : TaskInfo = currentMainTaskInfo;
			if (taskInfo != null)
			{
				return taskInfo.dataInfo.getTargetInfoAt(0) as TaskTargetReplyInfo;
			}
			return null;
		}

		public static function getClientTaskInfo() : TaskClientTaskInfo
		{
			var taskInfo : TaskInfo = currentMainTaskInfo;
			if (taskInfo != null)
			{
				return taskInfo.dataInfo.getTargetInfoAt(0) as TaskClientTaskInfo;
			}
			return null;
		}

		/**
		 * 获取含有指定采集怪的任务
		 * @param collectType
		 * @return
		 *
		 */
		public static function getTaskIdHasCollectObj(collectType : int) : int
		{
			var taskInfo : TaskInfo = currentMainTaskInfo;
			if (taskInfo)
			{
				var collectTargetInfo : TaskTargetGatherGoodsInfo = taskInfo.dataInfo.getTargetInfoAt(0) as TaskTargetGatherGoodsInfo;
				if (collectTargetInfo)
				{
					if (collectTargetInfo.collectGoodsType == collectType)
					{
						return currentMainTaskInfo.id;
					}
				}
			}
			return -1;
		}

		public static function checkChapterCanRepaired(_chapterIndex : int) : Boolean
		{
			var currentOrder : int = currentChapterInfo.order
			return (_chapterIndex < currentOrder || (_chapterIndex == currentOrder && currentChapterInfo.completedTaskCount == TaskCfgData.getStoryTaskChapterNumber(currentOrder)));
		}

		/**  根据章节索引判断任务是否完成 */
		public static function checkIsTaskCmpByChapterSection(chapter : int, section : int, indexInSection : int) : Boolean
		{
			var isTaskCmp : Boolean = false;
			if (chapter < TaskManager.currentChapter)
			{
				isTaskCmp = true;
			}
			else if (chapter == TaskManager.currentChapter)
			{
				if (section < TaskManager.currentSection)
				{
					isTaskCmp = true;
				}
				else if (section == TaskManager.currentSection)
				{
					if (indexInSection < TaskManager.currentCountInSection)
					{
						isTaskCmp = true;
					}
				}
			}
			return isTaskCmp;
		}

		//-----------------------------------------------

		//-------------------------------------------------

		/**
		 * 点击NPC时判断打开什么面板
		 * @param npcId
		 *
		 */
		public static function checkDialogToNpc(npcId : Number) : void
		{
			var role : SceneRole = SceneManager.getScene().getSceneObjByID(npcId, SceneCharType.NPC) as SceneRole;
			if (role)
			{
				var monsterData : MonsterData = role.data as MonsterData;
				if (!monsterData.fixDirection)
				{
					role.faceToGround(MainRoleManager.actor.x, MainRoleManager.actor.z);
				}
			}
			var npcModelId : int = SceneManager.getSceneNpcModelId(npcId);
			if (!NpcCfgData.isTransNpc(npcModelId))
			{
				//点击护国寺，追踪栏选中夺经标签，策划要求的
				if (TouJingManager.isTouJingNpc(npcModelId))
				{
					EventManager.dispatchEvent(TouJingEvent.TOU_JING_NPC, EmEvenTrackType.TOU_JING);
				}

				//点击护鸡毛信任务的npc，追踪栏选中鸡毛信标签，策划要求的
				if (MiXinManager.isAccpetMiXinNpc(npcModelId) || MiXinManager.isSubmitMiXinNpc(npcModelId) || MiXinManager.isCompleteMiXinNpc(npcModelId))
				{
					EventManager.dispatchEvent(TouJingEvent.MI_XIN_NPC, EmEvenTrackType.SECRET_MESSAGE);
				}
				
				//点击运镖任务npc
				if ( YunBiaoManager.isAcceptBiaoNpc(npcModelId) || YunBiaoManager.isRefleshNpc(npcModelId) ||YunBiaoManager.isCompleteNpc(npcModelId) )
				{
					EventManager.dispatchEvent(TouJingEvent.YUN_BIAO, EmEvenTrackType.YUN_BIAO);
				}

				AppManager.showAppNoHide(AppConstant.TASK_DIAILOG_FUNC_PANEL, npcId);
				return;
			}

			//检查这个传送NPC当前身上是否有主线任务
			if (checkHasReplyNpcInStoryTask(npcModelId))
			{
				AppManager.showAppNoHide(AppConstant.TASK_DIAILOG_FUNC_PANEL, npcId);
				return;
			}

			//检查这个传送NPC当前身上是否有支线任务

			//这个传送NPC无任务那么直接打开传送面板
			AppManager.showAppNoHide(AppConstant.TASK_DIAILOG_FUNC_PANEL, npcId);
			EventManager.dispatchEvent(TaskEvent.TASK_SHOW_FRONTIER_TRANS);
		}


		//----------------------消息相关 
		/**
		 * 采集
		 * @param taskId
		 * @param objectID
		 * @param sceneID
		 * @param posx
		 * @param posy
		 *
		 */
		public static function collectItemTask(taskId : int, objectID : int, collectGoodsType : int, sceneID : int, posx : int, posy : int) : void
		{
			if (taskId == -1)
			{
				NoticeManager.showHint(EnumHintInfo.TASK_COLLECT_FAIL1);
				return;
			}
			var collectInfo : CollectObjcetInfo = CollectCfgData.getRandomColloct(collectGoodsType);
			if (collectInfo == null)
			{
				return;
			}

			CollectManager.show(collectInfo.collectShow ? collectInfo.collectShow : "采集" + collectInfo.name, 3000, onCollectComplete, [taskId, objectID]);
		}

		private static function onCollectComplete(args : Array) : void
		{
			var taskId : int = args[0];
			var objectID : int = args[1];
			TaskSender.reqTaskCollectGoods(taskId, objectID);
		}

		//---------------------------------------
		/**
		 * 完成任务后，如果下一个是回复并且那个NPC就在旁边就打开完成任务面板
		 *
		 */
		public static function checkOpenTaskDiailogPanel() : void
		{
			if (TaskManager.currentMainTaskInfo == null)
				return;

			var targeInfo : BaseTaskTargetInfo = TaskManager.currentMainTaskInfo.dataInfo.getTargetInfoAt(0);
			if (targeInfo == null || targeInfo.type != TaskTargetType.TASK_TARGET_REPLY_NPC)
				return;

			var replyInfo : TaskTargetReplyInfo = targeInfo as TaskTargetReplyInfo;
			if (isLeaveNpc(replyInfo.npcId))
				return;
			var sceneRole : SceneRole = SceneManager.getSceneNpcByModelId(replyInfo.npcId);
			if (!sceneRole)
				return;
			var sceneNpcId : Number = sceneRole.id;
			AppManager.showAppNoHide(AppConstant.TASK_DIAILOG_FUNC_PANEL, sceneNpcId);
			EventManager.dispatchEvent(TaskEvent.TASK_ACCEPT_OR_FINISH, NPCFunctionType.MAIN_LINE_TASK, TaskManager.currentMainTaskInfo.id);
		}

		/**
		 * 是否远离某个NPC
		 * @param npc
		 * @return
		 *
		 */
		private static function isLeaveNpc(npc : int) : Boolean
		{
			var npcData : MonsterDataProto = MonsterDataManager.getData(npc);
			if (npcData == null)
				return true;

			var pos : Point = MonsterDataManager.getMonsterPosition(npcData);
			var distance : Number = MathUtil.getDistanceNoSqrt(pos.x, pos.y, MainRoleManager.actor.position.x, MainRoleManager.actor.position.z)
			var farDistance : int = npcData.npc.farDistance;
			if (distance > farDistance * farDistance || npcData.sceneId != SceneSwitchManager.currentMapId)
				return true;

			return false;
		}
	}
}
