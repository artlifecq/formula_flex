package com.rpgGame.coreData.info.task.target
{

	/**
	 *
	 * 扣背包物品类目标数据
	 * @author zgd
	 * 创建时间：2014-4-14 下午5:23:53
	 * 
	 */
	public class TaskTargetBagGoodsInfo extends BaseTaskTargetInfo
	{
		/**收集物品的cfgId*/
		public var depotGoodsId:int;
		/**收集总个数*/
		public var depotGoodsCount:int;
		
		public function TaskTargetBagGoodsInfo()
		{
			super();
		}
	}
}
