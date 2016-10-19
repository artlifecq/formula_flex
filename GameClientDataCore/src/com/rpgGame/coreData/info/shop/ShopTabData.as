package com.rpgGame.coreData.info.shop
{
	import app.message.ShopTabProto;

	/**
	 * 商店类型总数据
	 * @author lpp
	 */
	public class ShopTabData
	{
		/**标签页索引，该索引可能不是连续的（购买物品消息中需要提供）**/
		public var index:int;
		/**标签页名字**/
		public var tabName:String;
		/**商品列表**/
		public var goodsVect:Vector.<ShopGoodData>;
		public var buyBackVect:Vector.<ShopBuyBackGoodsData>;
		
		public function ShopTabData()
		{
			goodsVect = new Vector.<ShopGoodData>;
		}
		
		public function setData( tabProto:ShopTabProto, shopId:int ):void
		{
			if( tabProto == null )
				return;
			
			index = tabProto.index;
			
			if( tabProto.name != null ) 
				tabName = tabProto.name.toString();
			
			var len:int = tabProto.goodsList.length;
			var shopGoodData:ShopGoodData;
			for( var i:int = 0; i < len; i++ )
			{
				shopGoodData = new ShopGoodData();
				shopGoodData.setData( tabProto.goodsList[i], shopId, index, i );
				goodsVect.push( shopGoodData );
			}
		}
	}
}