package com.rpgGame.coreData.info.task.target
{
	/**
	 *
	 * 升级类目标数据
	 * @author zgd
	 * 创建时间：2014-4-14 下午5:21:53
	 * 
	 */
	public class TaskTargetUpgradeInfo extends BaseTaskTargetInfo
	{
		/**等级*/
		public var upgradeLvl:int;
		/**建议挂机杀怪ID*/
		public var upgradeRecommendMonsterIDArr:Array;
		
		public function TaskTargetUpgradeInfo()
		{
			super();
		}
	}
}
