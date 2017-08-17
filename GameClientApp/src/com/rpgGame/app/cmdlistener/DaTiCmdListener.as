package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.DaTiManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.DaTiSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.DaTiEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.DaTiCfgData;
	
	import gs.TweenLite;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	public class DaTiCmdListener extends BaseBean
	{
		public function DaTiCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_QUESTION_UPDATE,onExamQuestionUpdate);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_GET_QUESTION,onExamGetQuestion);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_GET_QUESTION_FAIL,onExamGetQuestionFail);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_ANSWER_QUESTION,onExamAnswerQuestion);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_ANSWER_QUESTION_FAIL,onExamAnswerQuestionFail);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_USE_GOOD_ANSWER_SUCCESS,onExamUseGoodAnswer);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_USE_GOOD_FAIL,onExamUseGoodAnswerFail);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_SELF_DATA,onExamSelfData);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_SELF_DATA_FAIL,onExamSelfDataFail);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_FINISH_BROADCAST,onExamFinishBroadcast);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_FINISH_MSG,onExamFinishMsg);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_FINISH_RANK_MSG,onExamFinishRankMsg);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_FOLLOW_MSG,onExamFollowMsg);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_EXAM_FOLLOW_FAIL,onExamFollowMsgFail);
//			SocketConnection_protoBuffer.addCmdListener(ExamModuleMessages.S2C_UPDATE_RANK,onExamUpdateRank);
			finish();
		}
		
		/**
		 * 问题更新，广播全服
		 *
		 * 客户端收到这个消息时，如果英雄可以答题，则发送消息请求最新的题目
		 */
		private function onExamQuestionUpdate(buffer:ByteBuffer):void
		{
//			trace("QQQQQQQQQQQQQQQ-onExamQuestionUpdate",getTimer());
			if(!DaTiManager.levelNotReach)
			{
				DaTiSender.reqExamGetQuestion();
			}
		}
		
		/**
		 * 请求最新的题目 bytes ExamQuestionProto
		 *
		 * 注意，该消息已被压缩，读取之前先解压一下
		 */
//		private function onExamGetQuestion(buffer:ByteBuffer):void
//		{
////			trace("QQQQQQQQQQQQQQQ-onExamGetQuestion",getTimer());
//			var uncompressData : ByteBuffer = new ByteBuffer();
//			buffer.readBytes(uncompressData);
//			buffer = uncompressData;
//			buffer.uncompress(); // 解压一下
//			var questionProto:ExamQuestionProto = new ExamQuestionProto();
//			questionProto.mergeFrom(buffer);
//			DaTiManager.preQuestion = DaTiManager.currentQuestion;
//			DaTiManager.preSelectedAnserIndex = DaTiManager.currentSelectedAnserIndex;
//			DaTiManager.preAnswerIsRight = DaTiManager.currentAnswerIsRight;
//			DaTiManager.currentQuestion = questionProto;
//			DaTiManager.currentSelectedAnserIndex = -1;
//			DaTiManager.currentAnswerIsRight = false;
//			DaTiManager.currentAnswerEndTime = questionProto.startTime.toNumber() + DaTiCfgData.answerTime;
//			EventManager.dispatchEvent(DaTiEvent.GET_QUESTION);
//		}
		
		/**
		 * 请求最新题目失败，附带byte错误码 1、答题还未开始或者已经结束 2、英雄等级不足
		 */
		private function onExamGetQuestionFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readByte();
			switch(errID)
			{
				case 1:
					if(!ClientConfig.isRelease)
					{
						NoticeManager.mouseFollowNotify("答题还未开始或者已经结束");
					}
					break;
				case 2:
					NoticeManager.mouseFollowNotify("英雄等级不足");
					break;
			}
		}
		
		/**
		 * 回答问题成功 if (byteArray.available) // 后面还有数据，说明回答正确 varint32 英雄积分
		 */
		private function onExamAnswerQuestion(buffer:ByteBuffer):void
		{
			if(buffer.bytesAvailable)
			{
				var score:int = buffer.readVarint32();
				DaTiManager.currentAnswerIsRight = true;
				DaTiManager.score = score;
			}
			EventManager.dispatchEvent(DaTiEvent.ANSWER_SELECTED);
		}
		
		/**
		 * 回答问题失败，
		 * 附带byte错误码
		 * 1、英雄等级不足
		 * 2、您已错过本题，请等下道题！
		 * 3、这道题已经回答过了
		 * 4、双倍积分次数不足
		 * 5、答案索引无效（0-3）
		 * 6、已经使用道具完成过了
		 */
		private function onExamAnswerQuestionFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readByte();
			switch(errID)
			{
				case 1:
					NoticeManager.mouseFollowNotify("英雄等级不足");
					break;
				case 2:
					NoticeManager.mouseFollowNotify("您已错过本题，请等下道题！");
					break;
				case 3:
					NoticeManager.mouseFollowNotify("这道题已经回答过了");
					break;
				case 4:
					NoticeManager.mouseFollowNotify("双倍积分次数不足");
					break;
				case 5:
					NoticeManager.mouseFollowNotify("答案索引无效（0-3）");
					break;
				case 6:
					NoticeManager.mouseFollowNotify("已经使用道具完成过了");
					break;
			}
		}
		
		/**
		 * 去除错误答案 / 使用双倍积分 成功
		 * byte 0-表示去除错误答案 /1-表示使用双倍积分
		 * 客户端自己将去除错误次数-1 并且在三个错误答案中随机出2个错误答案
		 */
		private function onExamUseGoodAnswer(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			switch(type)
			{
				case 0:
					DaTiManager.removeWrongRemainCount--;
					EventManager.dispatchEvent(DaTiEvent.REMOVE_WRONG_SUCCESS);
					break;
				case 1:
					DaTiManager.doubleScoreRemainCount--;
					EventManager.dispatchEvent(DaTiEvent.DOUBLE_SCORE_SUCCESS);
					break;
			}
		}
		
		/**
		 * 去除错误答案/ 使用双倍积分 失败，
		 *
		 * byte 0-表示去除错误答案 /1-表示使用双倍积分
		 *
		 * 附带byte错误码
		 * 1、英雄等级不足
		 * 2、您已错过本题，请等下道题！
		 * 3、这道题已经回答过了
		 * 4、去除错误答案次数不足
		 * 5、你已经使用了该道具
		 * 6、双倍积分次数不足
		 *
		 */
		private function onExamUseGoodAnswerFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readByte();
			switch(errID)
			{
				case 1:
					NoticeManager.mouseFollowNotify("英雄等级不足");
					break;
				case 2:
					NoticeManager.mouseFollowNotify("您已错过本题，请等下道题！");
					break;
				case 3:
					NoticeManager.mouseFollowNotify("这道题已经回答过了");
					break;
				case 4:
					NoticeManager.mouseFollowNotify("去除错误答案次数不足");
					break;
				case 5:
					NoticeManager.mouseFollowNotify("你已经使用了该道具");
					break;
				case 6:
					NoticeManager.mouseFollowNotify("双倍积分次数不足");
					break;
			}
		}
		
		/**
		 * 获取英雄答题数据成功 
		 * varint32 答到第几题，0表示一题都没回答
		 * varint32 双倍积分使用次数
		 * varint32 排错使用次数
		 * varint32 从善如流使用次数
		 * varint32 答题积分
		 * varint32 当前排名
		 * varint32 当前总经验
		 * varint32 答对的题数目
		 */
		private function onExamSelfData(buffer:ByteBuffer):void
		{
			buffer.readVarint32();
			var doubleCountUsed:int = buffer.readVarint32();
			var removeCountUsed:int = buffer.readVarint32();
			var followCountUsed:int = buffer.readVarint32();
			DaTiManager.doubleScoreRemainCount = DaTiCfgData.doubleScoreMaxTimes - doubleCountUsed;
			DaTiManager.removeWrongRemainCount = DaTiCfgData.removeWrongAnswerTimes - removeCountUsed;
			DaTiManager.followOtherRemainCount = DaTiCfgData.followMaxTimes - followCountUsed;
			var score:int = buffer.readVarint32();
			var ranking:int = buffer.readVarint32();
			DaTiManager.score = score;
			DaTiManager.ranking = ranking;
			EventManager.dispatchEvent(DaTiEvent.PANEL_INFO_INIT);
			EventManager.dispatchEvent(DaTiEvent.SELF_RANKING_CHANGED);
		}
		
		/**
		 * 获取英雄数据失败，
		 * 附带byte错误码
		 * 1、答题还未开始或者已经结束
		 * 2、英雄等级不足
		 * 3、已经花钱完成过了
		 */
		private function onExamSelfDataFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readByte();
			switch(errID)
			{
				case 1:
					NoticeManager.mouseFollowNotify("答题还未开始或者已经结束");
					break;
				case 2:
					NoticeManager.mouseFollowNotify("英雄等级不足");
					break;
				case 3:
					NoticeManager.mouseFollowNotify("已经花钱完成过了");
					break;
			}
		}
		
		/**
		 * 答题结束广播 if (byteArray.available) // 如果没有数据，则说明没有第1,2,3名 不用提示了，否则有几个提示几个
		 * varint64 heroID bytes 第一名名字 varint64 heroID bytes 第2名名字 varint64 heroID
		 * bytes 第3名名字
		 */
		private function onExamFinishBroadcast(buffer:ByteBuffer):void
		{
//			trace("QQQQQQQQQQQQQQQ-onExamFinishBroadcast");
			var numArr:Array = ["一","二","三"];
			var index:int;
			while(buffer.bytesAvailable)
			{
				var heroID:Number = buffer.readVarint64();
				var heroName:String = buffer.readUTF();
				var numStr:String = numArr[index];
				var message:String = "知识竞赛结束！恭喜" + heroName + "获得第" + numStr + "名";
				NoticeManager.systemSwitchNotify(message);
				NoticeManager.chatSystemNotify(message);
				index++;
			}
		}
		
		/**
		 *
		 *
		 * 答题结算面板个人信息
		 *  varint32 答对
		 *  varint32 答错
		 *  varint32得分
		 *  varint32排名
		 *  varint32 经验
		 *
		 */
		private function onExamFinishMsg(buffer:ByteBuffer):void
		{
			var rightCount:int = buffer.readVarint32();
			var wrongCount:int = buffer.readVarint32();
			var score:int = buffer.readVarint32();
			var ranking:int = buffer.readVarint32();
			var exp:int = buffer.readVarint32();
			DaTiManager.rightCount = rightCount;
			DaTiManager.wrongCount = wrongCount;
			DaTiManager.score = score;
			DaTiManager.ranking = ranking;
			DaTiManager.exp = exp;
			TweenLite.delayedCall(DaTiCfgData.showAnswerTime/1000,showResult);
		}
		
		private function showResult():void
		{
			AppManager.hideApp(AppConstant.DA_TI_PANEL);
			AppManager.showAppNoHide(AppConstant.DA_TI_RESULT_PANEL);
			DaTiManager.setup();
			EventManager.dispatchEvent(DaTiEvent.UI_RESET_DA_TI_PANEL);
		}
		
		/**
		 * 答题结算面板排行信息 跟S2C_EXAM_GET_QUESTION一样 只是协议号不同
		 *
		 * bytes ExamQuestionProto
		 *
		 * 注意，该消息已被压缩，读取之前先解压一下
		 */
//		private function onExamFinishRankMsg(buffer:ByteBuffer):void
//		{
//			var uncompressData : ByteBuffer = new ByteBuffer();
//			buffer.readBytes(uncompressData);
//			buffer = uncompressData;
//			buffer.uncompress(); // 解压一下
//			var questionProto:ExamQuestionProto = new ExamQuestionProto();
//			questionProto.mergeFrom(buffer);
//			questionProto.question = null;
////			trace("QQQQQQQQQQQQQQQ-onExamFinishRankMsg:",questionProto.question,getTimer());
//			DaTiManager.preQuestion = DaTiManager.currentQuestion;
//			DaTiManager.preSelectedAnserIndex = DaTiManager.currentSelectedAnserIndex;
//			DaTiManager.preAnswerIsRight = DaTiManager.currentAnswerIsRight;
//			DaTiManager.currentQuestion = questionProto;
//			DaTiManager.currentSelectedAnserIndex = -1;
//			DaTiManager.currentAnswerIsRight = false;
//			DaTiManager.currentRank = questionProto;
//			EventManager.dispatchEvent(DaTiEvent.GET_QUESTION);
//		}
		
		/**
		 * 从善如流成功 varint32 答案
		 *
		 */
		private function onExamFollowMsg(buffer:ByteBuffer):void
		{
			var answerIndex:int = buffer.readVarint32();
			DaTiManager.currentSelectedAnserIndex = answerIndex;
			DaTiManager.followOtherRemainCount--;
			EventManager.dispatchEvent(DaTiEvent.FOLLOW_OTHER_SUCCESS);
		}
		
		/**
		 * 从善如流失败，附带byte错误码
		 * 1、英雄等级不足
		 * 2、您已错过本题，请等下道题！
		 * 3、这道题已经回答过了
		 * 4、从善如流次数不足
		 * 5、你已经使用了从善如流
		 */
		private function onExamFollowMsgFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readByte();
			switch(errID)
			{
				case 1:
					NoticeManager.mouseFollowNotify("英雄等级不足");
					break;
				case 2:
					NoticeManager.mouseFollowNotify("您已错过本题，请等下道题！");
					break;
				case 3:
					NoticeManager.mouseFollowNotify("这道题已经回答过了");
					break;
				case 4:
					NoticeManager.mouseFollowNotify("从善如流次数不足");
					break;
				case 5:
					NoticeManager.mouseFollowNotify("你已经使用了从善如流");
					break;
			}
		}
		
		/**
		 * 更新排名  varint32
		 *
		 */
		private function onExamUpdateRank(buffer:ByteBuffer):void
		{
			var ranking:int = buffer.readVarint32();
//			trace("QQQQQQQQQQQQQQQ-onExamUpdateRank-ranking:",ranking);
			DaTiManager.ranking = ranking;
			EventManager.dispatchEvent(DaTiEvent.SELF_RANKING_CHANGED);
		}
	}
}