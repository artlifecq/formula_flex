package com.rpgGame.coreData.info.task.target
{

	/**
	 *
	 * 回复类目标数据
	 * @author zgd
	 * 创建时间：2014-4-14 下午4:58:52
	 *
	 */
	public class TaskTargetReplyInfo extends BaseTaskTargetInfo
	{
		/**Npc题目*/
		public var npcExamQuestion : String;
		/**Npc答题选项*/
		public var npcExamSelections : Array;
		/**Npc答题答案*/
		public var npcExamAnswer : int;

		public function TaskTargetReplyInfo()
		{
		}
	}
}
