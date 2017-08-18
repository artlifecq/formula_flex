package com.rpgGame.app.sender
{
	import com.rpgGame.coreData.enum.EnumDaTiPropType;

	public class DaTiSender extends BaseSender
	{
		/**
		 * 请求最新的题目
		 */
		public static function reqExamGetQuestion():void
		{
			_bytes.clear();
//			SocketConnection_protoBuffer.send(ExamModuleMessages.C2S_EXAM_GET_QUESTION, _bytes);
		}
		
		/**
		 * 回答问题 varint32 answer
		 *
		 * answerIndex答案索引，从0开始
		 *
		 */
		public static function reqExamAnswerQuestion(answerIndex:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(answerIndex);
//			SocketConnection_protoBuffer.send(ExamModuleMessages.C2S_EXAM_ANSWER_QUESTION, _bytes);
		}
		
		/**
		 * 去除错误答案/使用双倍积分
		 * byte 0-表示去除错误答案 /1-表示使用双倍积分
		 */
		public static function reqExamRemoveWrongAnswer(propType:int):void
		{
			_bytes.clear();
			var type:int;
			switch(propType)
			{
				case EnumDaTiPropType.REMOVE_WRONG:
					type = 0;
					break;
				case EnumDaTiPropType.DOUBLE_SCORE:
					type = 1;
					break;
			}
			_bytes.writeVarint32(type);
//			SocketConnection_protoBuffer.send(ExamModuleMessages.C2S_EXAM_USE_GOOD_ANSWER, _bytes);
		}
		
		/**
		 * 打开面板获取英雄自己的答题数据
		 */
		public static function reqExamSelfData():void
		{
			_bytes.clear();
//			SocketConnection_protoBuffer.send(ExamModuleMessages.C2S_EXAM_SELF_DATA, _bytes);
		}
		
		/**
		 * 从善如流
		 */
		public static function reqExamFollowMsg():void
		{
			_bytes.clear();
//			SocketConnection_protoBuffer.send(ExamModuleMessages.C2S_EXAM_FOLLOW_MSG, _bytes);
		}
	}
}