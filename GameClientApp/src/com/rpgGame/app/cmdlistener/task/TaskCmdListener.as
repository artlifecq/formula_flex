package com.rpgGame.app.cmdlistener.task
{
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.task.TaskInfoDecoder;
	import com.rpgGame.app.ui.main.taskDiailog.TaskDiailogNarrator;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.task.TaskCfgData;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.info.task.TaskChanceInfo;
	import com.rpgGame.coreData.info.task.TaskChapterInfo;
	import com.rpgGame.coreData.info.task.TaskDailyInfo;
	import com.rpgGame.coreData.info.task.TaskDataInfo;
	import com.rpgGame.coreData.info.task.TaskGuildInfo;
	import com.rpgGame.coreData.info.task.TaskInfo;
	import com.rpgGame.coreData.info.task.target.BaseTaskTargetInfo;
	import com.rpgGame.coreData.info.task.target.TaskFollowEscortInfo;
	import com.rpgGame.coreData.lang.LangNoticeInfo;
	import com.rpgGame.coreData.lang.LangTask;
	import com.rpgGame.coreData.utils.ProtoParseToInfo;

	import flash.utils.ByteArray;

	import app.cmd.TaskModuleMessages;
	import app.message.ChanceTaskProto;
	import app.message.DailyTaskProto;
	import app.message.PrizeProto;
	import app.message.StoryTaskProto;
	import app.message.TaskDataProto;
	import app.message.TaskProto;
	import app.message.TaskTargetProto;

	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	import utils.TimerServer;

	/**
	 * 任务
	 * 任务系统消息处理  ModuleID==13
	 * @author zgd
	 *
	 */
	public class TaskCmdListener extends BaseBean
	{
		public function TaskCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_REQUEST_COMPLETED_CHAPTER_TASK, onRecTaskRequestCompletedChapter);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_REQUEST_COMPLETED_CHAPTER_TASK_FAIL, onRecTaskRequestCompletedChapterFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_NEW_CHAPTER_TASK, onRecTaskNewChapter);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_COMPLETE_TASK, onRecTaskComplete);
//			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_NEW_CHANGE_TASK, onRecTaskNewChange);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_SWALLOW_TASK, onRecChanceTaskSwallowSuccess);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_SWALLOW_TASK_FAIL, onRecChanceTaskSwallowFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_AUTO_COMPLETE_CHANCE_TASK, onRecChanceTaskAutoCompleteSuccess);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_AUTO_COMPLETE_CHANCE_TASK_FAIL, onRecChanceTaskAutoCompleteFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_REDUCE_DIFFI_STAR, onRecReduceEveryDayDiffiStar);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_REDUCE_DIFFI_STAR_FAIL, onRecReduceEveryDayDiffiStarFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_ADD_PRIZE_STAR, onRecEveryDayTaskAddPrizeStar);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_ADD_PRIZE_STAR_FAIL, onRecEveryDayTaskAddPrizeStarFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_NEW_DAILY_TASK, onRecNewEveryDayTask);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_AUTO_COMPLETE_ALL_DAILY_TASK, onRecAutoCompleteAllEveryDayTask);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_AUTO_COMPLETE_ALL_DAILY_TASK_FAIL, onRecAutoCompleteAllEveryDayTaskFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_UPDATE_PROGRESS, onRecTaskUpdateProgress);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_REPLY_NPC_TASK, onRecTaskCompleteReplyNpc);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_COLLECT_GOODS_FAIL, onRecTaskCollectGoodsFail);
//			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_GOODS_LIST, onRecTaskInventedGoodsList);
//			SocketConnection.addCmdListener(TaskModuleMessages.S2C_COLLECT_TASK_GOODS_LIST_FAIL, onRecTaskInventedGoodsListFail);
//			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_NEW_GUILD_TASK, onRecNewGuildTask);
//			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_AUTO_COMPLETE_GUILD_TASK_FAIL, onRecAutoCompleteGuildTaskFail);
//			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_AUTO_COMPLETE_ALL_GUILD_TASK, onRecAutoCompleteAllGuildTask);
//			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_AUTO_COMPLETE_ALL_GUILD_TASK_FAIL, onRecAutoCompleteGuildTaskFail);
//			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_REMOVE_GUILD_TASK, onRecRemoveGuildTask);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_SCENE_TASK_TRANSPORT, onRecSceneTaskTransport);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_TRANSPORT_FAIL, onRecTaskTransportFail);
//			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_NEW_FUNCTION, onRecTaskNewFunction);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_ACCEPT_SENT_NPC, onRecAcceptSentNpc);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_ACCEPT_SENT_NPC_FAIL, onRecAcceptSentNpcFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_SENT_NPC_DEAD, onRecSentNpcDead);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_SENT_NPC_DISAPPEAR, onRecSentNpcDisappear);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_COMPLETE_SENT_NPC_FAIL, onRecCompleteSentNpcFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_COMPLETE_AREA_SEARCH_FAIL, onRecCompleteAreaSearchFail);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_TASK_NEW_STORY_TASK, onRecTaskNewStoryTask);
			SocketConnection.addCmdListener(TaskModuleMessages.S2C_COMPLETE_CLIENT_TASK_FAIL, onRecCompleteClientTaskFail);

			finish();
		}

		/**
		 *  查看已完成任务章节列表 ，未查看的请求，同一章节只请求一次
		 */
		private function onRecTaskRequestCompletedChapter(buffer : ByteBuffer) : void
		{
			var uncompressData : ByteBuffer = new ByteBuffer();
			buffer.readBytes(uncompressData);
			uncompressData.uncompress();
			var order : int = uncompressData.readVarint32(); //第几章，1表示第一章
			var chapterInfo : TaskChapterInfo = TaskManager.getChapterInfo(order);
			if (!chapterInfo)
			{
				chapterInfo = new TaskChapterInfo();
				chapterInfo.order = order;
			}
			var dataInfo : TaskDataInfo;
			var index : int = 1;
			while (uncompressData.bytesAvailable)
			{
				var size : int = uncompressData.readVarint32(); // TaskDataProto的数据长度
				var protoBytes : ByteBuffer = new ByteBuffer();
				var dataProto : TaskDataProto = new TaskDataProto();
				uncompressData.readBytes(protoBytes, 0, size);
				dataProto.mergeFrom(protoBytes);
				dataInfo = new TaskDataInfo();
				TaskInfoDecoder.decodeTaskDataProto(dataProto, dataInfo);
				chapterInfo.addCompletedTaskName(dataInfo.name);
				chapterInfo.addDataInfo(dataInfo);

				dataInfo.index = index;
				index++;
			}
			TaskManager.addChapterInfo(chapterInfo);
			EventManager.dispatchEvent(TaskEvent.TASK_STORY_COMPLETED_CHAPTER_INFO_ADDED, order);
		}

		/**
		 * 请求查看章节详细任务信息错误
		 * 附带Byte错误码
		 * 1、章节ID不合法
		 * 2、章节未开放
		 */
		private function onRecTaskRequestCompletedChapterFail(buffer : ByteBuffer) : void
		{
			var failid : int = buffer.readVarint32();
			switch (failid)
			{
				case 1:
					NoticeManager.showHint(EnumHintInfo.TASK_REQUES_MAIN_LINE_FAIL1);
					break;
				case 2:
					NoticeManager.showHint(EnumHintInfo.TASK_REQUES_MAIN_LINE_FAIL2);
					break;
			}
		}

		/**
		 *  接受到新的剧情任务
		 */
		private function onRecTaskNewChapter(buffer : ByteBuffer) : void
		{
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_TASK_REPLY_NPC_TASK);
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_COMPLETE_SENT_NPC);
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_COMPLETE_AREA_SEARCH);
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_COMPLETE_CLIENT_TASK);

			var uncompressData : ByteBuffer = new ByteBuffer();
			buffer.readBytes(uncompressData);
			buffer = uncompressData;
			buffer.uncompress(); // 解压一下

			var order : int = buffer.readVarint32(); // 任务的章节数
			var taskProto : TaskProto = new TaskProto();
			taskProto.mergeFrom(buffer);

			var taskInfo : TaskInfo = new TaskInfo();
			TaskInfoDecoder.decodeTaskProto(taskProto, taskInfo);

			var currentChapterInfo : TaskChapterInfo = TaskManager.currentChapterInfo;
			if (order != currentChapterInfo.order)
			{
				currentChapterInfo = new TaskChapterInfo();
				currentChapterInfo.order = order;
				TaskManager.currentChapterInfo = currentChapterInfo;
			}

			currentChapterInfo.addDataInfo(taskInfo.dataInfo);
			TaskManager.addChapterInfo(currentChapterInfo);

			taskInfo.dataInfo.index = currentChapterInfo.completedTaskCount + 1;

			//给NPC添加一个图标
//			var npcId:int = TaskManager.getReplyNpcId();
//			if(npcId > 0)
//			{
//				var sceneChar:SceneChar = Scene.scene.getSceneObjByID(npcId,SceneCharType.NPC) as SceneChar;
//				if(sceneChar)
//				{
//					var icon:NpcTaskIcon = new NpcTaskIcon();
//					sceneChar.headFace.addTopDisplayIcon(icon,EnumHeadFaceIconID.TOP_NPC_TASK);
//				}
//			}

			var npcRole : SceneRole = SceneManager.getSceneNpcByModelId(TaskManager.getReplyNpcId());
			if (npcRole != null)
				TaskUtil.tryAddTaskIco(npcRole);

			TaskManager.mainLineTaskInfo = taskInfo;

			TimerServer.add(shwoJieShouRenWuEffect, 5 * 1000);

//			if (AutoFightManager.isHook)//这里主要是让挂机中完成任务的时候捡完东西再走，避免显得机械
//			{
//				AutoFightManager.setCompleteCallback(TaskActionManager.autoRunChapterTask,[true,true]);
//			}
//			else
//			{
//				TaskActionManager.autoRunChapterTask(true,true);
//			}

			if (taskInfo.dataInfo.hasAcceptDialog)
			{
				TaskDiailogNarrator.getInstance().show(taskInfo.dataInfo.acceptDialogVect);
			}

			TaskManager.checkOpenTaskDiailogPanel();
		}

		private function shwoJieShouRenWuEffect() : void
		{
			if (TaskManager.currentMainTaskInfo)
			{
				NoticeManager.systemSwitchNotify("接受任务 $", [TaskManager.currentMainTaskInfo.dataInfo.name]);
					//EffectUtil.showEffect(MainRoleManager.actor,RenderUnitID.TASK, RenderUnitType.TASK, EffectUrl.JIE_SHOU_REN_WU, 1, 0, 0 );
			}
		}

		private function taskCompleteTask(taskId : int) : void
		{
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_TASK_REPLY_NPC_TASK);
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_COMPLETE_SENT_NPC);
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_COMPLETE_AREA_SEARCH);
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_COMPLETE_CLIENT_TASK);

			if (TaskManager.currentMainTaskInfo)
			{
				var currentChapterInfo : TaskChapterInfo = TaskManager.currentChapterInfo;
				currentChapterInfo.completedTaskCount++;
				currentChapterInfo.addCompletedTaskName(TaskManager.currentMainTaskInfo.dataInfo.name);
				if (currentChapterInfo.completedTaskCount == TaskCfgData.getStoryTaskChapterNumber(currentChapterInfo.order))
				{
					if (currentChapterInfo.order == TaskCfgData.getStoryTaskTotalCount())
					{
						EventManager.dispatchEvent(TaskEvent.TASK_STORY_ALL_CHAPTER_COMPLETED);
					}
				}

				NoticeManager.systemSwitchNotify("完成任务 $", [TaskManager.currentMainTaskInfo.dataInfo.name]);

				var npcRole : SceneRole = SceneManager.getSceneNpcByModelId(TaskManager.getReplyNpcId());
				if (npcRole != null)
					TaskUtil.tryRemoveTaskIco(npcRole);

				EventManager.dispatchEvent(TaskEvent.TASK_STORY_COMPLETE_TASK, taskId);

				//检测是否显示剧情对话
				if (TaskManager.currentMainTaskInfo.dataInfo.hasCompleteDialog())
				{
					TaskDiailogNarrator.getInstance().show(TaskManager.currentMainTaskInfo.dataInfo.completeDialogVect);
				}

				TaskManager.completeTask(taskId);
				TaskInfoDecoder.setCurrentEscortInfo(null);
				TaskInfoDecoder.setCurrentExplorationInfo(null);
				ClientTriggerManager.clearTaskTrigger();
			}
		}

		/**
		 * 领取护送npc成功
		 */
		private function onRecAcceptSentNpc(buffer : ByteBuffer) : void
		{
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_ACCEPT_SENT_NPC);
		}

		/**
		 * 领取护送npc失败，返回varint32错误码
		 *
		 * 1. 距离npc过远
		 * 2. 当前已经有领取护送的npc了
		 * 3. 服务器bug
		 * 4. 你已经死了
		 * 5. 没有找到该护送任务
		 */
		private function onRecAcceptSentNpcFail(buffer : ByteBuffer) : void
		{
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_ACCEPT_SENT_NPC);
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangTask.TASK_ACCEPT_SENT_NPC_FAIL_FAIL1;
					break;
				case 2:
					failReason = LangTask.TASK_ACCEPT_SENT_NPC_FAIL_FAIL2;
					break;
				case 3:
					failReason = LangTask.TASK_ACCEPT_SENT_NPC_FAIL_FAIL3;
					break;
				case 4:
					failReason = LangTask.TASK_ACCEPT_SENT_NPC_FAIL_FAIL4;
					break;
				case 5:
					failReason = LangTask.TASK_ACCEPT_SENT_NPC_FAIL_FAIL5;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 任务护送的npc死亡了
		 *
		 * varint32 任务id
		 */
		private function onRecSentNpcDead(buffer : ByteBuffer) : void
		{
			var taskId : int = buffer.readVarint32();
			if (TaskManager.currentMainTaskInfo && TaskManager.currentMainTaskInfo.id == taskId)
			{
				var escortInfo : TaskFollowEscortInfo = TaskInfoDecoder.currentEscortInfo;
				if (escortInfo)
				{
					escortInfo.roleId = 0;
					EventManager.dispatchEvent(TaskEvent.TASK_TARGET_PROGRESS_UPDATED, [TaskManager.currentMainTaskInfo.id, 0]);
				}
			}
		}

		/**
		 * 护送任务的npc消失了
		 *
		 * varint32 任务id
		 */
		private function onRecSentNpcDisappear(buffer : ByteBuffer) : void
		{
			var taskId : int = buffer.readVarint32();
			if (TaskManager.currentMainTaskInfo && TaskManager.currentMainTaskInfo.id == taskId)
			{
				var escortInfo : TaskFollowEscortInfo = TaskInfoDecoder.currentEscortInfo;
				if (escortInfo)
				{
					escortInfo.roleId = 0;
					EventManager.dispatchEvent(TaskEvent.TASK_TARGET_PROGRESS_UPDATED, [TaskManager.currentMainTaskInfo.id, 0]);
				}
			}
		}

		/**
		 * 完成护送任务失败，返回varint32错误码
		 *
		 * 1. 护送对象距离目标点过远
		 * 2. 自己不在目标范围内
		 * 3. 当前不是护送任务
		 */
		private function onRecCompleteSentNpcFail(buffer : ByteBuffer) : void
		{
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_COMPLETE_SENT_NPC);
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangTask.TASK_COMPLETE_SENT_NPC_FAIL_FAIL1;
					break;
				case 2:
					failReason = LangTask.TASK_COMPLETE_SENT_NPC_FAIL_FAIL2;
					break;
				case 3:
					failReason = LangTask.TASK_COMPLETE_SENT_NPC_FAIL_FAIL3;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 完成区域探索失败，返回varint32错误码
		 *
		 * 1. 不在目标区域内
		 */
		private function onRecCompleteAreaSearchFail(buffer : ByteBuffer) : void
		{
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_COMPLETE_AREA_SEARCH);
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangTask.TASK_COMPLETE_AREA_SEARCH_FAIL1;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 完成客户端任务失败，返回varint32错误码
		 *
		 * 1. 不是客户端任务
		 */
		private function onRecCompleteClientTaskFail(buffer : ByteBuffer) : void
		{
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_COMPLETE_CLIENT_TASK);
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangTask.TASK_COMPLETE_CLIENT_TASK_FAIL1;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 完成一个任务
		 * varint32 taskId
		 */
		private function onRecTaskComplete(buffer : ByteBuffer) : void
		{
			var taskId : int = buffer.readVarint32();
			taskCompleteTask(taskId);
		}

		/**
		 *  接受到新的机缘任务
		 * @param buffer
		 */
		private function onRecTaskNewChange(buffer : ByteBuffer) : void
		{
			var chanceProto : ChanceTaskProto = new ChanceTaskProto();
			chanceProto.mergeFrom(buffer);
			var chanceInfo : TaskChanceInfo = new TaskChanceInfo();
			TaskInfoDecoder.decodeChanceProto(chanceProto, chanceInfo);
//			TaskManager.addChanceInfo(chanceInfo);
//			TaskManager.chanceTaskAcceptedCount++;
		}

		/**
		 *  机缘任务吞噬成功
		 * 吞噬成功，附带以下信息
		 * varint32 今天已吞噬任务的个数
		 * varint32 被吞噬任务ID，在列表中找到这个任务，删除掉
		 * varint32 吞噬任务ID
		 * varint32 吞噬奖励百分比（这个是最新的值直接显示这个值）
		 * bytes PrizeProto 吞噬获得的任务奖励
		 */
		private function onRecChanceTaskSwallowSuccess(buffer : ByteBuffer) : void
		{
			TaskManager.chanceTaskSwallowedCount = buffer.readVarint32();
			var passiveTaskID : int = buffer.readVarint32();
			//TaskManager.removeChanceInfo(passiveTaskID);
			var initiativeTaskID : int = buffer.readVarint32();
//			var chanceInfo : TaskChanceInfo = TaskManager.getChanceInfo(initiativeTaskID);
//			chanceInfo.swallowPercent = buffer.readVarint32();
//			var prizeProto : PrizeProto = new PrizeProto();
//			prizeProto.mergeFrom(buffer);
//			var prizeInfo : PrizeInfo = ProtoParseToInfo.decodePrizeProto(prizeProto);
//			chanceInfo.taskInfo.dataInfo.prizeInfo = prizeInfo;
		}

		/**
		 * 吞噬失败，附带Byte错误码
		 * 1、被吞噬任务没找到，客户端发送的ID有问题
		 * 2、吞噬任务没找到，客户端发送的ID有问题
		 * 3、吞噬任务ID与被吞噬任务ID相同
		 * 4、今日吞噬次数已达上限
		 * 5、元宝不足（元宝吞噬）
		 */
		private function onRecChanceTaskSwallowFail(buffer : ByteBuffer) : void
		{
			var errID : int = buffer.readVarint32();
			switch (errID)
			{
				case 1:
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_3));
					break;
				case 2:
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_4));
					break;
				case 3:
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_5));
					break;
				case 4:
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_6));
					break;
				case 5:
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_7));
					break;
			}
		}

		/**
		 *
		 * 秒杀机缘任务成功
		 * varint32 任务品质，0-白色任务 1-绿色任务 2-蓝色任务 3-紫色任务 4-橙色任务
		 * varint32 已使用秒杀任务次数
		 */
		private function onRecChanceTaskAutoCompleteSuccess(buffer : ByteBuffer) : void
		{
			var quality : int = buffer.readVarint32();
			var count : int = buffer.readVarint32();
			TaskManager.changeThanceTaskAutoCompleteList(quality, count);
		}

		/**
		 * 秒杀机缘任务失败，附带Byte错误码
		 * 1、任务没找到，客户端发送任务ID无效
		 * 2、元宝不足
		 * 3、今日秒杀机缘任务已达最大次数
		 */
		private function onRecChanceTaskAutoCompleteFail(buffer : ByteBuffer) : void
		{
			var errID : int = buffer.readVarint32();
			switch (errID)
			{
				case 1:
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_8));
					break;
				case 2:
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_9));
					break;
				case 3:
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_10));
					break;
			}
		}

		/**
		 * 降低日常任务难度
		 * bytes 任务目标
		 */
		private function onRecReduceEveryDayDiffiStar(buffer : ByteBuffer) : void
		{
			var dailyInfo : TaskDailyInfo = TaskManager.dailyTaskInfo;
			var targetProto : TaskTargetProto;
			var targetInfo : BaseTaskTargetInfo;
			while (buffer.bytesAvailable)
			{
				var length : int = buffer.readVarint32();
				var bytes : ByteArray = new ByteArray();
				buffer.readBytes(bytes, 0, length);
				targetProto = new TaskTargetProto();
				targetProto.mergeFrom(bytes);
				targetInfo = TaskInfoDecoder.decodeTaskTargetProto(targetProto);
				dailyInfo.taskInfo.dataInfo.clearTargetInfo();
				dailyInfo.taskInfo.dataInfo.addTargetInfo(targetInfo);
			}
		}

		/**
		 * 降低日常任务难度失败，附带Byte错误码
		 * 1、当前没有日常任务，今天所有的日常任务都完成了
		 * 2、铜钱不足
		 * 3、任务已经是最低难度了
		 */
		private function onRecReduceEveryDayDiffiStarFail(buffer : ByteBuffer) : void
		{
			var errID : int = buffer.readVarint32();
			switch (errID)
			{
				case 1:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_11));
					break;
				}
				case 2:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_12));
					break;
				}
				case 3:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_13));
					break;
				}
			}
		}

		/**
		 * 增加日常任务奖励
		 * bytes PrizeProto 奖励
		 */
		private function onRecEveryDayTaskAddPrizeStar(buffer : ByteBuffer) : void
		{
			var prizeProto : PrizeProto = new PrizeProto();
			prizeProto.mergeFrom(buffer);
			var prizeInfo : PrizeInfo = ProtoParseToInfo.decodePrizeProto(prizeProto);
			var dailyInfo : TaskDailyInfo = TaskManager.dailyTaskInfo;
//			dailyInfo.taskInfo.dataInfo.prizeInfo = prizeInfo;
			dailyInfo.prizeStar = 10;
		}

		/**
		 * 增加日常任务奖励失败，附带Byte错误码
		 * 1、当前没有日常任务，今天所有的日常任务都完成了
		 * 2、铜钱不足
		 * 3、奖励已经是最高星级了
		 */
		private function onRecEveryDayTaskAddPrizeStarFail(buffer : ByteBuffer) : void
		{
			var errID : int = buffer.readVarint32();
			switch (errID)
			{
				case 1:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_14));
					break;
				}
				case 2:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_15));
					break;
				}
				case 3:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_16));
					break;
				}
			}
		}

		/**
		 * 接受新的日常任务
		 * bytes DailyTaskProto，参考任务面板中DailyTaskProto的解析
		 */
		private function onRecNewEveryDayTask(buffer : ByteBuffer) : void
		{
			var dailyProto : DailyTaskProto = new DailyTaskProto();
			dailyProto.mergeFrom(buffer);
			var dailyInfo : TaskDailyInfo = new TaskDailyInfo();
			TaskInfoDecoder.decodeDailyProto(dailyProto, dailyInfo);
			TaskManager.dailyTaskInfo = dailyInfo;
		}

		/**
		 * 秒杀剩余所有日常任务成功
		 * bytes PrizeProto 满星任务奖励
		 */
		private function onRecAutoCompleteAllEveryDayTask(buffer : ByteBuffer) : void
		{
			var prizeProto : PrizeProto = new PrizeProto();
			prizeProto.mergeFrom(buffer);
			var prizeInfo : PrizeInfo = ProtoParseToInfo.decodePrizeProto(prizeProto);
			TaskManager.onekeyPrize = prizeInfo;
		}

		/**
		 * 秒杀剩余所有日常任务失败，附带Byte错误码
		 * 1、当前没有日常任务，今天所有的日常任务都完成了
		 * 2、元宝不足
		 */
		private function onRecAutoCompleteAllEveryDayTaskFail(buffer : ByteBuffer) : void
		{
			var errID : int = buffer.readVarint32();
			switch (errID)
			{
				case 1:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_17));
					break;
				}
				case 2:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_18));
					break;
				}
				case 3:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_19));
					break;
				}
			}
		}

		/**
		 * 更新任务，附带以下信息
		 * varint32 taskId
		 * varint32 index 第几个任务目标，0表示第一个目标
		 * varint32 progress
		 */
		private function onRecTaskUpdateProgress(buffer : ByteBuffer) : void
		{
			var taskId : int = buffer.readVarint32();
			var targetIndex : int = buffer.readVarint32();
			var progress : int = buffer.readVarint32();
			var currentChapterInfo : TaskChapterInfo = TaskManager.currentChapterInfo;
			if (currentChapterInfo && TaskManager.currentMainTaskInfo && taskId == TaskManager.currentMainTaskInfo.id) //剧情任务
			{
				TaskManager.currentMainTaskInfo.changeProgress(targetIndex, progress);
			}
			else
			{
				var chanceInfo : TaskChanceInfo; // = TaskManager.getChanceInfo(taskId);
				if (chanceInfo) //机缘任务
				{
					chanceInfo.taskInfo.changeProgress(targetIndex, progress);
						//to do...
				}
				else
				{
					var dailyInfo : TaskDailyInfo = TaskManager.dailyTaskInfo;
					if (dailyInfo && taskId == dailyInfo.taskInfo.id) //日常任务
					{
						dailyInfo.taskInfo.changeProgress(targetIndex, progress);
							//to do...
					}
					else
					{
						var guildInfo : TaskGuildInfo = TaskManager.guildTaskInfo;
						if (guildInfo && taskId == guildInfo.taskInfo.id) //帮会任务
						{
							guildInfo.taskInfo.changeProgress(targetIndex, progress);
								//to do...
						}
					}
				}
			}
			EventManager.dispatchEvent(TaskEvent.TASK_TARGET_PROGRESS_UPDATED, [taskId, targetIndex]);
		}

		/**
		 * 有2种情况，失败时返回S2C_TASK_COMPLETE_REPLY_NPC_TASK消息
		 * byte 结果，1-任务不是回复NPC任务，2-与NPC距离过远，3-任务不存在
		 */
		private function onRecTaskCompleteReplyNpc(buffer : ByteBuffer) : void
		{
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_TASK_REPLY_NPC_TASK);
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_COMPLETE_SENT_NPC);
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_COMPLETE_AREA_SEARCH);
			ReqLockUtil.unlockReq(TaskModuleMessages.C2S_COMPLETE_CLIENT_TASK);

			var failId : int = buffer.readVarint32();
			switch (failId)
			{
				case 1:
					NoticeManager.showHint(EnumHintInfo.TASK_MAIN_LINE_FAIL1);
					break;
				case 2:
					NoticeManager.showHint(EnumHintInfo.TASK_MAIN_LINE_FAIL2);
					break;
				case 3:
					NoticeManager.showHint(EnumHintInfo.TASK_MAIN_LINE_FAIL3);
					break;
				case 4:
					NoticeManager.showHint(EnumHintInfo.TASK_MAIN_LINE_FAIL4);
					break;
				case 5:
					NoticeManager.showHint(EnumHintInfo.TASK_MAIN_LINE_FAIL5);
					break;
			}
		}

		/**
		 * 采集失败
		 * 1、任务不存在，客户端发送的任务ID无效
		 * 2、客户端发送了任务不需要的采集物品（1、任务不是采集任务 2、任务需要的采集物品不是这个 3、这个物品已经采集完成了）
		 * 3、发送的任务采集任务物品
		 * 4、英雄距离采集物品太远
		 * @param buffer
		 *
		 */
		private function onRecTaskCollectGoodsFail(buffer : ByteBuffer) : void
		{
			var failId : int = buffer.readByte();
			switch (failId)
			{
				case 1:
					NoticeManager.showHint(EnumHintInfo.TASK_COLLECT_FAIL1);
					break;
				case 2:
					NoticeManager.showHint(EnumHintInfo.TASK_COLLECT_FAIL2);
					break;
				case 3:
					NoticeManager.showHint(EnumHintInfo.TASK_COLLECT_FAIL3);
					break;
				case 4:
					NoticeManager.showHint(EnumHintInfo.TASK_COLLECT_FAIL4);
					break;

			}
		}

		/**
		 * 任务虚拟背包，附带背包中的数据
		 * while(byteArray.availiable)
		 *     int slen = byteArray.readVarInt32(); // 物品静态数据长度
		 *     bytes 物品静态数据
		 *     int dlen = byteArray.readVarInt32(); // 物品动态数据长度
		 *     bytes 物品静态数据
		 */
		private function onRecTaskInventedGoodsList(buffer : ByteBuffer) : void
		{
			while (buffer.bytesAvailable)
			{
				var staticData : ByteArray = new ByteArray();
				var dynamicData : ByteArray = new ByteArray();
				var slen : int = buffer.readVarint32() // 物品静态数据长度
				buffer.readBytes(staticData, 0, slen) // 物品静态数据

				slen = buffer.readVarint32(); // 物品动态数据长度
				buffer.readBytes(dynamicData, 0, slen); // 物品动态数据
					//to do...
			}
		}

		/**
		 * 领取任务虚拟背包物品失败，附带byte错误码
		 * 1、虚拟背包中根本就没有物品
		 * 2、背包空间不足
		 */
		private function onRecTaskInventedGoodsListFail(buffer : ByteBuffer) : void
		{
			var failId : int = buffer.readVarint32();
			switch (failId)
			{
				case 1:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_23));
					break;
				}
				case 2:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_24));
					break;
				}
			}
		}

		/**
		 * 接受新的帮会任务
		 * bytes GuildTaskProto，参考任务面板中GuildTaskProto的解析
		 */
		private function onRecNewGuildTask(buffer : ByteBuffer) : void
		{
//			var guildTaskProto:GuildTaskProto = new GuildTaskProto();
//			guildTaskProto.mergeFrom(buffer);
//			var guildTaskInfo:TaskGuildInfo = new TaskGuildInfo();
//			TaskInfoDecoder.decodeGuildProto(guildTaskProto,guildTaskInfo);
//			TaskManager.guildTaskInfo = guildTaskInfo;
		}

		/**
		 * 秒杀任务失败，附带byte错误码
		 * 1、当前没有帮会任务，今天所有的帮会任务都完成了
		 * 2、元宝不足
		 */
		private function onRecAutoCompleteGuildTaskFail(buffer : ByteBuffer) : void
		{
			var failId : int = buffer.readVarint32();
			switch (failId)
			{
				case 1:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_25));
					break;
				}

				case 2:
				{
					NoticeManager.showHint(LanguageConfig.getText(LangNoticeInfo.TaskCmdListener_26));
					break;
				}
			}
		}

		/**
		 * 秒杀剩余所有帮会任务
		 */
		private function onRecAutoCompleteAllGuildTask(buffer : ByteBuffer) : void
		{
			var guildTaskInfo : TaskGuildInfo = TaskManager.guildTaskInfo;
//			TaskManager.onekeyPrize = guildTaskInfo.taskInfo.dataInfo.prizeInfo;
		}

		/**
		 * 移除帮会任务
		 */
		private function onRecRemoveGuildTask(buffer : ByteBuffer) : void
		{
			TaskManager.guildTaskInfo = null;
		}

		/**
		 * 任务传送成功(无参数,只表示成功)
		 */
		private function onRecSceneTaskTransport(buffer : ByteBuffer) : void
		{

		}

		/**
		 * 任务传送失败
		 */
		private function onRecTaskTransportFail(buffer : ByteBuffer) : void
		{
			var errId : int = buffer.readByte();
			switch (errId)
			{
				case 1:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL1);
					break;
				case 2:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL2);
					break;
				case 3:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL3);
					break;
				case 4:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL4);
					break;
				case 5:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL5);
					break;
				case 6:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL6);
					break;
				case 7:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL7);
					break;
				case 8:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL8);
					break;
				case 9:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL9);
					break;
				case 10:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL10);
					break;
				case 11:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL11);
					break;
				case 12:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL12);
					break;
				case 13:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL13);
					break;
				case 14:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL14);
					break;
				case 15:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL15);
					break;
				case 16:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL16);
					break;
				case 17:
					NoticeManager.showHint(EnumHintInfo.TASK_TRANSPORT_FAIL17);
					break;
				case 17:
					NoticeManager.showHint("当前状态无法使用任务传送");
					break;
			}
		}

		/**
		 * 新功能开启
		 * varint32 新功能ID（参考TaskRelatedFunction）
		 */
		private function onRecTaskNewFunction(buffer : ByteBuffer) : void
		{
		}

		/**
		 * 接受新的剧情任务
		 * bytes StoryTaskProto
		 */
		private function onRecTaskNewStoryTask(buffer : ByteBuffer) : void
		{
			var uncompressData : ByteBuffer = new ByteBuffer();
			buffer.readBytes(uncompressData);
			var storyTaskProto : StoryTaskProto = new StoryTaskProto();
			storyTaskProto.mergeFrom(uncompressData);
			var taskInfo : TaskInfo = new TaskInfo();
			TaskInfoDecoder.decodeStoryProto(storyTaskProto);
		}
	}
}
