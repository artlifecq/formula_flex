package com.rpgGame.app.manager.shop
{
	import com.rpgGame.coreData.cfg.ShopCfgData;
	import com.rpgGame.coreData.info.shop.ShopData;
	import com.rpgGame.coreData.info.shop.ShopTabData;

	/**
	 *  商店
	 * @author wewell
	 * 
	 */	
	public class ShopManager
	{
		public static var isBuyMaxCount:Boolean;
		public static var currentShopId:int;
		public static var currentNpcId:Number=0;
		
		private static var _shopTabs:Object;
		
		public static function getShopTabGoods(shopType:int, tabIndex:int):ShopTabData
		{
			var shopData:ShopData = ShopCfgData.getData( shopType);
			if( shopData == null )
			{
				return null;
			}
			return shopData.tabVect[ tabIndex ];
		}
		
		public static function getShopTabNames(shopType:int):Array
		{
			var shopData:ShopData = ShopCfgData.getData( shopType);
			if( shopData == null )
			{
				return null;
			}
			if(_shopTabs == null)
			{
				_shopTabs = {};
			}
			var tabs:Array = _shopTabs[shopType];
			if(tabs)
			{
				return tabs;
			}
			
			var tabLen:int = shopData.tabVect.length;
			tabs = [];
			for(var i:int = 0; i<tabLen; i++)
			{
				var shopTabData:ShopTabData = shopData.tabVect[ i ];
				tabs[i] = shopTabData.tabName;
			}
			_shopTabs[shopType] = tabs;
			
			return tabs;
		}
		
		public static var inSellMode:Boolean;
		public static var inRepairMode:Boolean;
	}
}