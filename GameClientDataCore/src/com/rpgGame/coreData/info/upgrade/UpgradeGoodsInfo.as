package com.rpgGame.coreData.info.upgrade
{
	
	
	public class UpgradeGoodsInfo
	{
		
		/** 进阶需要的物品id **/
		public var cfgId:int = 0; 
		
		/** 替代的物品id列表，如果有数据，说明消耗的时候可以用这种物品代替 **/
		public var substituteGoods:Array;
		/** 消耗需要的物品个数，客户端需要通过该字段计算发送量已经玩家是否有这么多物品 **/
		public var upgradeGoodsCount:int;
//		public function UpgradeGoodsInfo( proto:UpgradeGoodsInfoProto )
//		{
//			if( proto == null )
//				return;
//			
//			cfgId = proto.upgradeGoods;
//			substituteGoods = proto.substituteGoods;
//			upgradeGoodsCount = proto.upgradeGoodsCount;
//		}
	}
}