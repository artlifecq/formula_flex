package com.rpgGame.coreData.info.task.target
{

	/**
	 *
	 * 杀怪收集物品类目标数据
	 * @author zgd
	 * 创建时间：2014-4-14 下午5:11:49
	 * 
	 */
	public class TaskTargetMonsterGoodsInfo extends BaseTaskTargetInfo
	{
		/**掉落物品的怪物配置ID*/
		public var dropGoodsMonsterId:int;
		/**收集总个数*/
		public var dropGoodsCount:int;
		public var dropGoodsName:String;
		
		public function TaskTargetMonsterGoodsInfo()
		{
			super();
		}
	}
}
