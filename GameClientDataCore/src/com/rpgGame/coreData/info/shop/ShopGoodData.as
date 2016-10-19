package com.rpgGame.coreData.info.shop
{
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;

	import app.message.ShopGoodsProto;
	import app.message.TaxType;

	/**
	 * 商品item
	 * @author lpp
	 */
	public class ShopGoodData
	{
		/**属于哪个商店*/
		public var shopId : int = -1;
		/** 商品index */
		public var goodsIndex : int;
		/** 商品所在的分页ID */
		public var tabIndex : int;

		//-----------------------------静态配置

		/** 货币类型 */
		public var priceType : int;
		/** 售价 */
		public var price : int;
		/** 限时开始时间，0表示不限时  */
		public var startTime : Number = -1;
		/** 限时结束时间，0表示不限时 */
		public var endTime : Number = -1;
		/** 促销标示，0无热销，1热销中，2折扣，3热销+折扣  */
		public var promotion : int;
		/** 原价 */
		public var showPrice : int;
		/** 物品数据  */
		public var itemInfo : ItemInfo;
		/** 商城商品描述 */
		public var goodsDesc : String;

		public function setData(goodsProto : ShopGoodsProto, shopId : int, tabIndex : int, goodsIndex : int) : void
		{
			this.shopId = shopId;
			this.tabIndex = tabIndex;
			this.goodsIndex = goodsIndex;

			if (goodsProto == null)
				return;

			priceType = goodsProto.priceType;
			price = goodsProto.price;

			if (goodsProto.startTime != null)
				startTime = goodsProto.startTime.toNumber();

			if (goodsProto.endTime != null)
				endTime = goodsProto.endTime.toNumber();

			promotion = goodsProto.promotion;
			showPrice = goodsProto.showPrice;
			goodsDesc = goodsProto.desc;

			itemInfo = ItemUtil.wrapperProtoToItemInfo(goodsProto.goodsWrapper);
			itemInfo.priceType = priceType;
			itemInfo.price = price;
			itemInfo.taxType = TaxType.SHOP_TAX_CONFIG;
		}
	}
}
