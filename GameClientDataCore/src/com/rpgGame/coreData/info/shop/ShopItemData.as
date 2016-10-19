package com.rpgGame.coreData.info.shop
{
	import app.message.ShopGoodsProto;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;

	public class ShopItemData
	{
		/** 商店ID */
		private var _shopType:int;
		/** 物品Index */
		private var _index:int;
		/** 物品消耗 */
		private var _cost:int;
		/** 物品信息 */
		private var _itemInfo:ItemInfo;
		
		public function ShopItemData(shopType:int,index:int,goodProto:ShopGoodsProto)
		{
			_shopType = shopType;
			_index = index;
			_cost = goodProto.price;
			_itemInfo = ItemUtil.wrapperProtoToItemInfo(goodProto.goodsWrapper);
		}
		
		/** 个人兑换商店ID */
		public function get shopType():int
		{
			return _shopType;
		}
		
		/** 商品index */
		public function get index():int
		{
			return _index;
		}
		
		/** 物品消耗 */
		public function get cost():int
		{
			return _cost;
		}
		
		/** 物品信息 */
		public function get itemInfo():ItemInfo
		{
			return _itemInfo;
		}
	}
}