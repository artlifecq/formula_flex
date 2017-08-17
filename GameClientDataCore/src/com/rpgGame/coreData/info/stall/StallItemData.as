package com.rpgGame.coreData.info.stall
{
	import com.rpgGame.coreData.info.item.ClientItemInfo;

	/**
	 *  摆摊物品
	 * @author mandragora
	 * 
	 */	
	public class StallItemData
	{
		public function StallItemData()
		{
		}
		
		public var price : int;
		/**
		 * 如果是直接拖上来的物品，就读这个 
		 */		
		public var item : ClientItemInfo;
		
		private var _index : int;
		/**我也不知道这玩意儿干嘛的，后端说买卖的时候要带上这个，自己用的时候不需要**/
		public var flag : int;
		/**
		 * 改变的数量，如果大于０就是加，小于就减，等于就是没有改变 
		 */		
		public var changeItem : ClientItemInfo;
		
		public function clear():void
		{
			price = 0;
			item = null;
			flag = 0;
		}
		
//		public function setupSellProto(proto:StallSellGoodsProto):void
//		{
//			_index = proto.idx;
//			if(proto.goods)
////				item = ItemUtil.convertGoodsProtoToItemInfo(proto.goods);
//			flag = proto.flag;
//			price = proto.price;
//			if(num==0)
//				clear();
//		}
//		
//		public function setupBuyProto(proto:StallBuyGoodsProto):void
//		{
//			_index = proto.idx;
//			item = new ClientItemInfo(proto.goodsId);
//			item.count = proto.buyCount;
//			flag = proto.flag;
//			price = proto.buyPrice;
//			if(num==0)
//				clear();
//		}
		
		public function get itemId():int
		{
			return item?item.cfgId:0;
		}
		
		public function get bagIndex():int
		{
			return item?item.index:-1;
		}

		public function get index():int
		{
			return _index;
		}
		
		public function setIndex(index:int):void
		{
			_index = index;
		}

		public function get num():int
		{
			return item?item.count:0;
		}

		public function set num(value:int):void
		{
			if(!item)
				return;
			item.count = value;
		}

		
	}
}