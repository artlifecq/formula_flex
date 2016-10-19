package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.shop.ShopManager;
	import com.rpgGame.app.sender.ShopSender;
	import com.rpgGame.app.utils.UpgradeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.controller.PromptSetControl;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.ShopCfgData;
	import com.rpgGame.coreData.enum.PromptSaveNameEnum;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.shop.ShopBuyBackGoodsData;
	import com.rpgGame.coreData.info.shop.ShopData;
	import com.rpgGame.coreData.info.shop.ShopGoodData;
	import com.rpgGame.coreData.info.shop.ShopTabData;
	
	import app.message.AllBuyBackGoodsProto;
	import app.message.Quality;
	import app.message.ShopProto;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *NPC商店Manager
	 * @author wewell
	 */
	public class SmallShopItemManager
	{
		
		private static var _buyBackGoodsDataVect:Vector.<ShopBuyBackGoodsData> = new Vector.<ShopBuyBackGoodsData>;
		
		private static var _buyBackShopTabData:ShopTabData;
		
		/** npc商城数据 */
		private static var _npcShopDataMap:HashMap = new HashMap();
		
		//------------------------
		/**
		 * 设置回购物品的数据
		 * @param buyBackGoodsDatasList
		 * @param buyBackGoodsExpireTime
		 * @param buyGoodsCount
		 */	
		public static function setBackBuyData( goodsProto:AllBuyBackGoodsProto ):void
		{
			if( goodsProto == null )
				return;
			 
			var len:int = goodsProto.allGoods.length;
			var buyBackGoodsData:ShopBuyBackGoodsData;
			for( var i:int = 0; i < len; i++ )
			{
				buyBackGoodsData = new ShopBuyBackGoodsData();
				buyBackGoodsData.setBuyBackData( goodsProto.allGoods[i]);
				
				_buyBackGoodsDataVect.push( buyBackGoodsData );
			}
			updateBuyBackTab();
		}
		
		private static function updateBuyBackTab():void
		{
			if(_buyBackShopTabData == null)
			{
				_buyBackShopTabData = new ShopTabData();
			}
			_buyBackShopTabData.tabName = "回购";
			_buyBackShopTabData.buyBackVect = _buyBackGoodsDataVect;
		}
		
		/**
		 * 转换回购物品数据 
		 * 
		 */
		private static function convertData(buyBackGoodsId:Array,buyBackGoodsExpireTime:Array,buyGoodsCount:Array):ShopTabData
		{
			return null;
		}
		
		//添加回购物品；
		public static function addBackBuyItem( data:ShopBuyBackGoodsData ):ShopBuyBackGoodsData
		{
			if( data == null )
				return null;
			
			if( _buyBackGoodsDataVect.length >= ShopCfgData.buyBackCapacity )
			{
				_buyBackGoodsDataVect.shift();
			}
			
			_buyBackGoodsDataVect.push( data );
			
			updateBuyBackTab();
			return data;
		}
		
		//删除回购物品；
		public static function delBackBuyItem( index:int ):ShopBuyBackGoodsData
		{
			if( index >= _buyBackGoodsDataVect.length )
				return null;
			
			if( _buyBackGoodsDataVect.length < 1)
				return null;
			
			var data:ShopBuyBackGoodsData = _buyBackGoodsDataVect[index];
			_buyBackGoodsDataVect.splice( index, 1 );
			return data;
		}
		
		public static function getBuyBackTabData():ShopTabData
		{
			return _buyBackShopTabData;
		}
		//------------------------------------------
		/**
		 * 转换npc商店数据 
		 * @param shopProto
		 * 
		 */
		public static function convertNpcShopProto(shopProto:ShopProto):void
		{
			if( shopProto == null )
				return;
			
			var shopData:ShopData = new ShopData();
			shopData.setData( shopProto );
			
			_npcShopDataMap.add( shopData.id, shopData );
		}
		
		/**
		 * 是否已经请求过这个NPC商店的数据
		 * @param shopId
		 * 
		 */		
		public static function hasNpcDataById( shopId:int ):Boolean
		{
			return getNpcDatabyId( shopId ) != null;
		}
		
		/**
		 * 得到某个NPC商店的数据
		 * @param shopId
		 * @return 
		 * 
		 */		
		public static function getNpcDatabyId(shopId:int):ShopData
		{
			return _npcShopDataMap.getValue( shopId );
		}
		
		public static function getShopTabGoods(shopId:int, tabIndex:int):ShopTabData
		{
			var shopData:ShopData = getNpcDatabyId( shopId);
			if( shopData == null )
			{
				return null;
			}
			//最后一页为加购页
			if(tabIndex == getShopTabNames(shopId).length - 1)
			{
				return getBuyBackTabData();
			}
			return shopData.tabVect[ tabIndex ];
		}
		
		private static var _shopTabs:Object;
		public static function getShopTabNames(shopId:int):Array
		{
			var shopData:ShopData =  getNpcDatabyId( shopId);
			if( shopData == null )
			{
				return null;
			}
			if(_shopTabs == null)
			{
				_shopTabs = {};
			}
			var tabs:Array = _shopTabs[shopId];
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
			if(!ClientConfig.isBanShu)tabs.push("回购");
			_shopTabs[shopId] = tabs;
			
			return tabs;
		}
		
		//-------------------------------------------
		
		/**
		 * 购买物品
		 * @param goodsData
		 * @param count
		 * 
		 */		
		public static function reqBuyGoods( goodsData:ShopGoodData, count:int = 1):void
		{
			if( goodsData == null )
				return;
		
			if( !UpgradeUtil.isSomeMoneyEnough(goodsData.priceType, goodsData.price * count, true ) )
				return;
			
			var npcId:int = ShopManager.currentNpcId;
			ShopSender.reqBuyGoods( goodsData.shopId, goodsData.tabIndex, goodsData.goodsIndex, count, npcId );
		}
		
		
		/**
		 * 卖出物品发送C2S_SELL_GOODS，附带以下信息
		 * byte 卖出物品的位置(背包中)
		 */	
		public static  function reqSellGoods( itemInfo:ItemInfo ):void
		{
			if(!itemInfo)return;
			var isAlert:Boolean = PromptSetControl.instance.isAlert(PromptSaveNameEnum.SHOP_SELL_ITEM_ALERT);
			if(itemInfo.quality >= Quality.GREEN && isAlert)
			{
				AppManager.showAppNoHide(AppConstant.SHOP_SELL_PANEL, itemInfo);
				return;
			}
			ShopSender.reqSellGoods( itemInfo.index );
		}
	}
}