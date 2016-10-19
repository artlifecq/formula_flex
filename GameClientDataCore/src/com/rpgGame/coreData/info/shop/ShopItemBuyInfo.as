package com.rpgGame.coreData.info.shop
{
	

	/**
	 *
	 * 物品购买结果数据
	 * @author EC
	 * 创建时间：2014-4-12 下午4:10:01
	 * 
	 */
	public class ShopItemBuyInfo
	{
		/**物品名称*/
		public var itemName:String = "";
		/**品质*/
		public var quality:int = 0;
		/**个数*/
		public var count:int;
		/**消费类型 0-铜钱 1-礼金  2-元宝*/
		public var priceType:int;
		/**消费金额*/
		public var cost:int;
		/**物品在商店中的位置（商店飞物品到仓库）*/
		public var goodsIndex:int;
		/**背包格子位置（如果一个格子都没读到，就不飞物品了）*/
//		public var gridIdArr:Array = [];
		public function ShopItemBuyInfo()
		{
		}
	}
}