package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.info.shop.ShopData;
	
	import app.message.ShopConfig;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 商店
	 * @author luguozheng
	 * 
	 */	
	public class ShopCfgData
	{
		private static var _map:HashMap;
		private static var _buyBackCapacity:int;
		private static var _durabilityRepairCost:int;
		
		setup();
		public static function setup():void
		{
			_map = new HashMap();
//			_shopItemInfoMap = new HashMap();
			_buyBackCapacity = 0;
		}
		
		/**
		 * 设置数据
		 * @param cfg
		 * 
		 */		
		public static function setConfig(cfg:ShopConfig):void
		{
			if( cfg == null )
				return;
			
			var shopData:ShopData = new ShopData();
			shopData.setData( cfg.systemShop );
			_map.add( shopData.id, shopData );
			
			shopData = new ShopData();
			shopData.setData( cfg.depotShop );
			_map.add( shopData.id, shopData );
			
			_buyBackCapacity = cfg.buyBackCapacity;
			_durabilityRepairCost = cfg.repairCost;
			
//			initSelfExchangeShop(cfg.selfExchangeShop);
		}
		
		public static function getData(id:uint):ShopData
		{
			return _map.getValue(id);
		}
		
		public static function get buyBackCapacity():int
		{
			return _buyBackCapacity;
		}
		
		public static function get durabilityRepairCost():int
		{
			return _durabilityRepairCost;
		}
		
		//------------------------------客户端购买物品已有的配置---------------------------------
//		/** 所有客户端物品购买配置  */
//		private static var _shopItemInfoMap:HashMap;
//		
//		/** 添加shopItemInfo */
//		public static function addShopItemInfo(shopItemInfo:ShopItemInfo):void
//		{
//			_shopItemInfoMap.add(shopItemInfo.itemInfo.cfgId + "_" + shopItemInfo.priceType,shopItemInfo);
//		}
//		
//		/** 
//		 * 获取客户端已经有的shopItemInfo 
//		 * @param cfgId
//		 * @param priceType
//		 * */
//		public static function getShopItemInfoByCfgId( cfgId:int, priceType:int ):ShopItemInfo
//		{
//			return _shopItemInfoMap.getValue(cfgId + "_" + priceType);
//		}
		
		
		//--------------------------个人兑换商店相关(带定时刷新)--------------------------
//		/** 个人兑换商店配置 */
//		private static var _selfExchangeShopCfgHash:HashMap;
//		/** 初始化个人兑换商店配置 */
//		private static function initSelfExchangeShop(selfExchangeShopArr:Array):void
//		{
//			_selfExchangeShopCfgHash = new HashMap();
//			for each( var selfExchShopCfg:SelfExchangeShopConfigProto in selfExchangeShopArr )
//			{
//				_selfExchangeShopCfgHash.add(selfExchShopCfg.shopType,selfExchShopCfg);
//			}
//		}
//		
//		/** 
//		 * 获取个人兑换商店数据 
//		 * @param type SelfExchangeShopType
//		 * */
//		public static function getSelfExchangeShopCfgByType(type:int):SelfExchangeShopConfigProto
//		{
//			return _selfExchangeShopCfgHash.getValue(type);
//		}
//		
//		/** 获取个人兑换商店最大刷新次数 */
//		public static function getSelfExchangeShopRefreshMaxTimeByType(type:int):int
//		{
//			var selfExchShopCfg:SelfExchangeShopConfigProto = getSelfExchangeShopCfgByType(type);
//			if(selfExchShopCfg)
//			{
//				return selfExchShopCfg.refreshCost.length;
//			}
//			return 0;
//		}
//		
//		/** 
//		 * 获得个人兑换商店刷新消耗 
//		 * * @param type SelfExchangeShopType
//		 * * @param time 次数
//		 * */
//		public static function getSelfExchangeShopRefreshCostByTypeAndTime(type:int,time:int):int
//		{
//			var selfExchShopCfg:SelfExchangeShopConfigProto = getSelfExchangeShopCfgByType(type);
//			if( selfExchShopCfg )
//			{
//				time = Math.min(selfExchShopCfg.refreshCost.length-1,time);
//				return selfExchShopCfg.refreshCost[time];
//			}
//			return 0;
//		}
	}
}