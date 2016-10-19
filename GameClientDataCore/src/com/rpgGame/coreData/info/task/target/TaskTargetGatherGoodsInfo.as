package com.rpgGame.coreData.info.task.target
{
	/**
	 *
	 * 采集类目标数据
	 * @author zgd
	 * 创建时间：2014-4-14 下午5:15:12
	 *
	 */
	public class TaskTargetGatherGoodsInfo extends BaseTaskTargetInfo
	{
		/**采集物品类型*/
		public var collectGoodsType : int;
		/**采集个数*/
		public var collectGoodsCount : int;

		public function TaskTargetGatherGoodsInfo()
		{
			super();
		}
	}
}
