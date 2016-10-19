package com.rpgGame.coreData.info.task.target
{

	/**
	 *
	 * 任务目标数据基类
	 * @author zgd
	 * 创建时间：2014-4-14 下午5:00:53
	 *
	 */
	public class BaseTaskTargetInfo
	{
		/**
		 * 任务目标类型TaskType定义
		 */
		public var type : int;
		/**回复的Npc Id*/
		public var npcId : int;
		/**Npc任务面板说的话*/
		public var npcDialog : String;
		/**触发器id*/
		public var triggerId : int;

		public function BaseTaskTargetInfo()
		{
		}
	}
}
