package com.rpgGame.app.sender
{
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.coreData.info.item.UpgradeItemListVo;
	import com.rpgGame.coreData.type.CostItemType;
	import com.rpgGame.netData.map.message.ReqPlayerStopMessage;
	import com.rpgGame.netData.task.message.ReqfinishTaskMessage;
	
	import app.cmd.TaskModuleMessages;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.data.long;

	/**
	 * 任务协议发送
	 * @author zgd
	 * ModuleID==13
	 */
	public class TaskSender extends BaseSender
	{
		
		
		
		
		
		
		/**
		 * 
		 * @param tid 任务id
		 * @param multiple 奖励倍数
		 * 
		 */		
		public static function SendfinishTaskMessage(tid:long,multiple=1):void
		{
			var msg:ReqfinishTaskMessage = new ReqfinishTaskMessage();
			msg.taskId=tid;
			msg.multiple=multiple;
			SocketConnection.send(msg);
		}
		
		
		
		
		
		
		
		
		/**
		 *  秒杀剩余所有帮会任务
		 */
		public static function reqAutoCompleteAllGuildTask() : void
		{
			_bytes.clear();
//			SocketConnection.send(TaskModuleMessages.C2S_TASK_AUTO_COMPLETE_ALL_GUILD_TASK,_bytes);
		}

		/**
		 * 秒杀当前帮会任务
		 */
		public static function reqAutoCompleteGuildTask() : void
		{
			_bytes.clear();
//			SocketConnection.send(TaskModuleMessages.C2S_TASK_AUTO_COMPLETE_GUILD_TASK,_bytes);
		}

		/**
		 * 领取任务虚拟背包物品
		 */
		public static function reqCollectTaskGoodsList() : void
		{
			_bytes.clear();
//			SocketConnection.send(TaskModuleMessages.C2S_COLLECT_TASK_GOODS_LIST,_bytes);
		}

		/**
		 * 回复NPC任务完成，发送C2S_TASK_REPLY_NPC_TASK消息，附带以下信息
		 * varint32 taskId
		 * varitn64 npc在场景中的id
		 * varint32 答题选择的答案(无论怎么都要带上，不是答题，就发送0)
		 * if(完成任务[该任务是最后一个任务了目标了]){
		 *      varint32 领取的奖励的下标
		 * }
		 * 服务器返回S2C_TASK_REPLY_NPC_TASK消息
		 */
		public static function reqTaskCompleteReplyNpc(taskId : int, npcId : Number, prizeIndex : int = 0, answerIndex : int = 0) : void
		{
//			if (ReqLockUtil.isReqLocked(TaskModuleMessages.C2S_TASK_REPLY_NPC_TASK))
//				return;
//			ReqLockUtil.lockReq(TaskModuleMessages.C2S_TASK_REPLY_NPC_TASK, 5000);

			_bytes.clear();
			_bytes.writeVarint32(taskId);
			_bytes.writeVarint64(npcId);
			_bytes.writeVarint32(answerIndex);
			_bytes.writeVarint32(prizeIndex);

			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_TASK_REPLY_NPC_TASK, _bytes);
		}

		/**
		 * 完成护送任务
		 *
		 * varint32 任务id
		 */
		public static function reqTaskCompleteSentNpc(taskId : int) : void
		{
//			if (ReqLockUtil.isReqLocked(TaskModuleMessages.C2S_COMPLETE_SENT_NPC))
//				return;
//			ReqLockUtil.lockReq(TaskModuleMessages.C2S_COMPLETE_SENT_NPC, 5000);

			_bytes.clear();
			_bytes.writeVarint32(taskId);

			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_COMPLETE_SENT_NPC, _bytes);
		}

		/**
		 * 完成区域探索
		 *
		 * varint32 任务id
		 */
		public static function reqTaskCompleteAreaSearch(taskId : int) : void
		{
//			if (ReqLockUtil.isReqLocked(TaskModuleMessages.C2S_COMPLETE_AREA_SEARCH))
//				return;
//			ReqLockUtil.lockReq(TaskModuleMessages.C2S_COMPLETE_AREA_SEARCH, 5000);

			_bytes.clear();
			_bytes.writeVarint32(taskId);

			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_COMPLETE_AREA_SEARCH, _bytes);
		}

		/**
		 * 完成客户端任务1次
		 *
		 * varint32 任务id
		 * varint32 任务类型
		 */
		public static function reqTaskCompleteClientTask(taskId : int, clientTaskType : int) : void
		{
//			if (ReqLockUtil.isReqLocked(TaskModuleMessages.C2S_COMPLETE_CLIENT_TASK))
//				return;
//			ReqLockUtil.lockReq(TaskModuleMessages.C2S_COMPLETE_CLIENT_TASK, 5000);

			_bytes.clear();
			_bytes.writeVarint32(taskId);
			_bytes.writeVarint32(clientTaskType);

			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_COMPLETE_CLIENT_TASK, _bytes);
		}

		/**
		 *  降低日常任务难度
		 */
		public static function reqReduceEveryDayDiffiStar() : void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_TASK_REDUCE_DIFFI_STAR, _bytes);
		}

		/**
		 * 增加日常任务奖励
		 */
		public static function reqEveryDayTaskAddPrizeStar() : void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_TASK_ADD_PRIZE_STAR, _bytes);
		}

		/**
		 * 秒杀剩余所有日常任务
		 */
		public static function reqAutoCompleteAllEveryDayTask() : void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_TASK_AUTO_COMPLETE_ALL_DAILY_TASK, _bytes);
		}


		/**
		 * @param chanceId 秒杀机缘任务，任务ID
		 */
		public static function reqChanceAutoComplete(chanceId : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(chanceId);
			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_TASK_AUTO_COMPLETE_CHANCE_TASK, _bytes);
		}

		/**
		 *  吞噬机缘任务
		 * @param passiveTask 被吞噬ID
		 * @param initiativeTask 吞噬id
		 * @param yuanbaoBool 是否是元宝吞噬
		 */
		public static function reqChanceTaskSwallow(passiveTask : int, initiativeTask : int, yuanbaoBool : Boolean) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(passiveTask);
			_bytes.writeVarint32(initiativeTask);
			_bytes.writeBoolean(yuanbaoBool);
			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_TASK_SWALLOW_TASK, _bytes);
		}

		/**
		 *  发送请求章节任务列表消息
		 * @param id 章节ID
		 */
		public static function reqTaskRequestCompletedChapter(id : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(id);
			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_TASK_REQUEST_COMPLETED_CHAPTER_TASK, _bytes);
		}

		/**
		 * 发送采集物品(采集进度结束后)
		 * @param taskId 任务ID
		 * @param objectId 采集物体ID（不是采集物品类型，采集物品ID，全局唯一的那个）
		 * @author david
		 */
		public static function reqTaskCollectGoods(taskId : int, objectId : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(taskId);
			_bytes.writeVarint32(objectId);
			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_TASK_COLLECT_GOODS, _bytes);
		}

		/**
		 * 任务传送，附带下面的消息
		 * varint32 taskTypeIndex 任务类型和子任务Index，下面有说明
		 * if (机缘任务) // 如果是机缘任务，再写一个任务ID
		 *     varint32 机缘任务ID
		 *
		 * if(非Vip或VIP等级不足){
		 *      要附带数据具体参考[这里]({% post_url 2014-11-08-物品消耗 %})
		 * }
		 *
		 *
		 * (任务类型) type 0-剧情任务 1-机缘任务 2-日常任务 3-家族任务
		 * (子任务Index) index 从0开始，第一个子任务为0
		 * (升级任务打坐传送) isDazuo 0-默认值 1-升级任务打坐传送
		 *
		 * taskTypeIndex = (isDazuo <<< 6) | (index << 3) | type
		 *
		 * 传送成功，会收到切场景的消息
		 */
		public static function reqTaskTransport(taskTypeIndex : int, chanceTaskId : int, isVipTrans : Boolean, upgradeItemListVo : UpgradeItemListVo) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(taskTypeIndex);
			if (chanceTaskId != -1)
			{
				_bytes.writeVarint32(chanceTaskId);
			}

			if (!isVipTrans)
			{
				if (upgradeItemListVo == null || !upgradeItemListVo.isItemEnough)
				{
					_bytes.writeBoolean(false);
					_bytes.writeVarint32(CostItemType.USE_YUANBAO);
				}
				else
				{
//					_bytes.writeVarint32(CostItemType.ALL_ITEM);
					_bytes.writeBytes(upgradeItemListVo.getByte());
				}
			}
			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_TASK_TRANSPORT, _bytes);
		}

		/**
		 * 领取护送npc
		 *
		 * varint32 任务id
		 * varint64 场景中的npcid
		 */
		public static function reqAcceptSentNpc(taskId : int, npcId : Number) : void
		{
//			if (ReqLockUtil.isReqLocked(TaskModuleMessages.C2S_ACCEPT_SENT_NPC))
//				return;
//			ReqLockUtil.lockReq(TaskModuleMessages.C2S_ACCEPT_SENT_NPC, 5000);

			_bytes.clear();
			_bytes.writeVarint32(taskId);
			_bytes.writeVarint64(npcId);
			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_ACCEPT_SENT_NPC, _bytes);
		}
	}
}
