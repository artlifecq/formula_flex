package com.rpgGame.coreData.type
{
	/**
	 *
	 * 扣物品的类型
	 * @author fly.liuyang
	 * 创建时间：2014-11-14 下午3:21:38
	 * 
	 */
	public class CostItemType
	{
		
		//'购买类型'
		//		0-全物品(意味着玩家有足够的物品，不需要购买或者不能够购买)
		//		1-礼金购买(客户端需要验证礼金是否足够)，
		//		2-元宝购买(客户端需要验证元宝是否足够)，
		
		/** 全物品的方式 */
		public static const ALL_ITEM:int = 0;
		/** 物品不够礼金购买 */
		public static const USE_LIJIN:int = 1;
		/** 物品不够元宝购买 */
		public static const USE_YUANBAO:int = 2;
	}
}