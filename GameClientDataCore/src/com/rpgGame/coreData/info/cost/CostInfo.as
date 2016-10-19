package com.rpgGame.coreData.info.cost
{
	

	/**
	 * 消耗抛出的数据 
	 * @author Mandragora
	 * 
	 */	
	public class CostInfo
	{
		public function CostInfo()
		{
		}
		/**
		 * 类型 (对应ConstCheckTypeEnum)
		 */		
		public var type : uint ;
		/**
		 * 如果是物品才会有这个 
		 */		
		public var costItem : CostItem;
		/**
		 * 数量 
		 */		
		public var costMoneyNum : uint;
	}
}