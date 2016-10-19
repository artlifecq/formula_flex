package com.rpgGame.coreData.info.task.target
{
	/**
	 *
	 * 杀怪类目标数据
	 * @author zgd
	 * 创建时间：2014-4-14 下午5:09:34
	 * 
	 */
	public class TaskTargetMonsterInfo extends BaseTaskTargetInfo
	{
		/**击败怪物的ID*/
		public var killMonsterId:int;
		/**击败总个数*/
		public var killMonsterCount:int;
		
		public function TaskTargetMonsterInfo()
		{
			super();
		}
	}
}
