package com.rpgGame.coreData.info.task.target
{
	

	/**
	 *
	 * 跟随护送任务信息
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-20 上午10:25:12
	 *
	 */
	public class TaskFollowEscortInfo extends BaseTaskTargetInfo
	{
		/**护送Npc 区域*/
//		public var targetArea : AreaDataProto;
		/**护送Npc Id*/
		public var roleId : Number = 0;
		/**护送Npc 坐标x*/
		public var rolePosX : Number = 0;
		/**护送Npc 坐标y*/
		public var rolePosY : Number = 0;

		public function TaskFollowEscortInfo()
		{
		}
	}
}
