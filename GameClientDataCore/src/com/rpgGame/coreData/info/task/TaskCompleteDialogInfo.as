package com.rpgGame.coreData.info.task
{
	

	/**
	 *
	 * 完成任务对话				原古剑的完成对白的proto已经删除，这个暂留
	 * @author zgd
	 * 创建时间：2014-4-11 下午5:37:07
	 * 
	 */
	public class TaskCompleteDialogInfo
	{
		/**对白对象名称，name == SELF表明是要用玩家自己的名字*/
		public var targetName:String;
		public var targetRes:String;
		public var soundRes:String;
		public var dialogStr:String;
		
		public function TaskCompleteDialogInfo()
		{
		}
		
	}
}
