package com.rpgGame.coreData.info.shop
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.netData.shop.bean.ShopItemInfo;
	
	/**
	 *分页 
	 ShopVor Administrator
	 * 
	 */	
	public class ShopVo
	{
		private var _shopType:int;		private var _shopPageItems:HashMap;
		private var _shopPageTitles:Array;
		public function ShopVo(type:int)
		{
			_shopType=type;
			_shopPageItems=new HashMap();
			_shopPageTitles=[];
		}
		
		public function get shopType():int
		{
			return _shopType;
		}
		public function updateShopItem(data:ShopItemInfo):ShopItemVo
		{
			var arr:Array=_shopPageItems.getValue(data.pageType);
			if (arr) 
			{
				for each (var vo:ShopItemVo in arr) 
				{
					if (vo.data.shopItemId==data.shopItemId) 
					{
						vo.setData(data);
						return vo;
					}
				}
			}
			return null;
		}
		public function setItemsData(list:Vector.<ShopItemInfo>):void
		{
			_shopPageItems.clear();
			_shopPageTitles.length=0;
			for each (var info:ShopItemInfo in list) 
			{
				var vo:ShopItemVo=new ShopItemVo();
				vo.setData(info);
				var listPage:Array=_shopPageItems.getValue(info.pageType);
				if (!listPage) 
				{
					listPage=new Array();
					_shopPageItems.put(info.pageType,listPage);
					_shopPageTitles.push(info.pageTitle);
				}
				listPage.push(vo);
			}
			
		}
		public function getShopItems(pageArr:Array,itemId:int):Array
		{
			var ret:Array=[];
			if (pageArr==null) 
			{
				pageArr=shopPageTypes;
			}
			for each (var type:int in pageArr) 
			{
				var tmp:Array=getPageShopItems(type);
				for each (var vo:ShopItemVo in tmp) 
				{
					if (vo.getItemConfig().q_id==itemId) 
					{
						ret.push(vo);
					}
				}
			}
			return ret;
		}
		
		public function getJiXianShopItems(locationType:int):Array
		{
			var ret:Array=[];
			for each (var type:int in shopPageTypes) 
			{
				var tmp:Array = getPageShopItems(type);
				for each (var vo:ShopItemVo in tmp) 
				{
					if (vo.getItemConfig().q_type==15&&vo.getItemConfig().q_location==locationType) 
					{
						ret.push(vo);
					}
				}
			}
			return ret;
		}
		
		public function get shopPageTitles():Array
		{
			return _shopPageTitles;
		}
		public function get shopPageTypes():Array
		{
			return _shopPageItems.keys();
		}
		public function getPageShopItems(pgType:int):Array
		{
			return _shopPageItems.getValue(pgType);
		}
	}
}