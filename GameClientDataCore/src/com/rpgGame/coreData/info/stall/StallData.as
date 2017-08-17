package com.rpgGame.coreData.info.stall
{
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.RoleType;

	public class StallData extends RoleData
	{
		public function StallData()
		{
			super(RoleType.TYPE_STALL);
		}
		public var playerId : Number;
		
		public var stallId : int;
		
		public var stallType : int ;
		
		public var stallSellList : Vector.<StallItemData> = new Vector.<StallItemData>();
		
		public var stallBuyList : Vector.<StallItemData> = new Vector.<StallItemData>();
		
		public var stallName : String;
		
		public var startStallTime : Number;
		
		public var endStallTime : Number;
		/**
		 * 版本号，用来判断是不是需要再请求数据的 
		 */		
		public var version : int = 0;
		
//		public function setup(proto:StallDetailProto):void
//		{
//			if(!proto)
//				return;
//			stallId = proto.stallId;
//			version = proto.stallVersion;
//			var stallItem : StallItemData;
//			clearStallSellItem();
//			if(proto.sellGoods && stallSellList.length)
//			{
//				var sellGoods : StallSellGoodsProto;
//				for(var i:int;i<proto.sellGoods.length;i++)
//				{
//					sellGoods = proto.sellGoods[i];
//					if(sellGoods)
//					{
//						stallItem = getStallSellItem(sellGoods.idx);
//						if(stallItem)
//							stallItem.setupSellProto(sellGoods);
//					}
//				}
//			}
//			clearStallBuyItem();
//			if(proto.buyGoods && stallBuyList.length)
//			{
//				var buyGoods : StallBuyGoodsProto;
//				for(i = 0;i<proto.buyGoods.length;i++)
//				{
//					buyGoods = proto.buyGoods[i];
//					if(buyGoods)
//					{
//						stallItem = getStallBuyIndex(buyGoods.idx);
//						if(stallItem)
//							stallItem.setupBuyProto(buyGoods);
//					}
//				}
//			}
//		}
		
		public function getStallSellItem(index:int):StallItemData
		{
			for each(var stallItem : StallItemData in stallSellList)
			{
				if(stallItem && stallItem.index == index)
					return stallItem;
			}
			return null;
		}
		public function getStallBuyIndex(index:int):StallItemData
		{
			for each(var stallItem : StallItemData in stallBuyList)
			{
				if(stallItem && stallItem.index == index)
					return stallItem;
			}
			return null;
		}
		
		private function clearStallSellItem():void
		{
			for each(var stallItem : StallItemData in stallSellList)
			{
				if(stallItem)
					stallItem.clear();
			}
		}
		private function clearStallBuyItem():void
		{
			for each(var stallItem : StallItemData in stallBuyList)
			{
				if(stallItem)
					stallItem.clear();
			}
		}
		
		public function clearStall():void
		{
			clearStallBuyItem();
			clearStallSellItem();
		}
		
		public function get sellGoodsCount():int
		{
			var result : int = 0;
			for each(var stallItem : StallItemData in stallSellList)
			{
				if(stallItem && stallItem.itemId && stallItem.num)
					result ++;
			}
			return result;
		}
		public function get buyGoodsCount():int
		{
			var result : int = 0;
			for each(var stallItem : StallItemData in stallBuyList)
			{
				if(stallItem && stallItem.itemId && stallItem.num)
					result ++;
			}
			return result;
		}
	}
}