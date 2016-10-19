package com.rpgGame.coreData.info.task.target
{

	/**
	 *
	 * 客户端任务信息
	 * @author L.L.M.Sunny
	 * 创建时间：2016-07-22 下午5:25:12
	 *
	 */
	public class TaskClientTaskInfo extends BaseTaskTargetInfo
	{
		/**客户端任务类型*/
		public var clientTaskType : int;
		/**客户端任务*/
		private var _clientTask : String;

		public function TaskClientTaskInfo()
		{
		}

		public function set clientTask(value : String) : void
		{
			_clientTask = value;
			if (_clientTask)
			{
				var values : Array = _clientTask.split("|");
				npcId = int(values[0]);
				npcDialog = String(values[1]);
			}
		}
	}
}
