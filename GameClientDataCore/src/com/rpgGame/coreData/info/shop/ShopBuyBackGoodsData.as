package com.rpgGame.coreData.info.shop
{
	import com.rpgGame.coreData.info.item.ItemUtil;
	
	import app.message.AllBuyBackGoodsProto.BuyBackGoodsProto;

	/**
	 * 回购物品的数据
	 * @author luguozheng
	 * 
	 */	
	public class ShopBuyBackGoodsData extends ShopGoodData
	{
		/**此物品可购回的过期时间**/
		public var expireTime:Number;
		
		public function ShopBuyBackGoodsData()
		{
		}
		
		public function setBuyBackData( buyBackProto:BuyBackGoodsProto):void
		{
			if( buyBackProto == null )
				return;
			
			if( buyBackProto.expireTime != null )
				expireTime = buyBackProto.expireTime.toNumber();
			
			itemInfo = ItemUtil.convertGoodsProtoToItemInfo( buyBackProto.goods );
			
		}
		
	}
}