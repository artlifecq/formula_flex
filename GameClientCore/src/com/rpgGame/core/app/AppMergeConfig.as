package com.rpgGame.core.app
{
	import flash.utils.Dictionary;

	/**
	 * app面板共存配置  
	 * @author fly.liuyang
	 * 
	 */	
	public class AppMergeConfig
	{
		private static var _configDic:Dictionary = new Dictionary();//共存面板；
		
//		_configDic[AppConstant.BACK_PACK_PANEL] = [AppConstant.SMALL_SHOP_PANEL,AppConstant.STORE_PANEL
//			,AppConstant.BACK_PACK_PANEL,AppConstant.WU_XING_SUI_PIAN_EXCHANGE_PANEL]
//		_configDic[AppConstant.STORE_PANEL] = [AppConstant.STORE_PANEL,AppConstant.BACK_PACK_PANEL,AppConstant.MOUNT_UPGRADE_PANEL];
		_configDic[AppConstant.MAIL_PANEL] = [AppConstant.MAIL_PANEL,AppConstant.BACK_PACK_PANEL,];
		_configDic[AppConstant.ROLE_PANEL] = [AppConstant.ROLE_PANEL, AppConstant.SHOP_PANEL, AppConstant.BACK_PACK_PANEL,,AppConstant.STORAGE_PANEL];
		_configDic[AppConstant.BACK_PACK_PANEL] = [AppConstant.ROLE_PANEL,AppConstant.MAIL_PANEL,AppConstant.SHOP_PANEL, AppConstant.BACK_PACK_PANEL,AppConstant.STORAGE_PANEL,AppConstant.STALL_PANEL,AppConstant.STALL_SELL_PANEL,AppConstant.STALL_BUY_PANEL,AppConstant.STALL_BUY_GOODS_FROM_STALL,AppConstant.STALL_SELL_GOODS_TO_STALL];
		_configDic[AppConstant.STORAGE_PANEL] = [AppConstant.ROLE_PANEL,AppConstant.BACK_PACK_PANEL,,AppConstant.STORAGE_PANEL];
		_configDic[AppConstant.SHOP_PANEL] = [AppConstant.ROLE_PANEL, AppConstant.SHOP_PANEL,AppConstant.BACK_PACK_PANEL];
		_configDic[AppConstant.STALL_PANEL] = [AppConstant.BACK_PACK_PANEL,AppConstant.STALL_SELL_PANEL,AppConstant.STALL_BUY_PANEL,AppConstant.STALL_BUY_GOODS_FROM_STALL,AppConstant.STALL_SELL_GOODS_TO_STALL];
		_configDic[AppConstant.STALL_SELL_PANEL] = [AppConstant.BACK_PACK_PANEL,AppConstant.STALL_PANEL];
		_configDic[AppConstant.STALL_BUY_PANEL] = [AppConstant.BACK_PACK_PANEL,AppConstant.STALL_PANEL];
		_configDic[AppConstant.STALL_BUY_GOODS_FROM_STALL] = [AppConstant.BACK_PACK_PANEL,AppConstant.STALL_PANEL];
		_configDic[AppConstant.STALL_SELL_GOODS_TO_STALL] = [AppConstant.BACK_PACK_PANEL,AppConstant.STALL_PANEL];
		
//		_configDic[AppConstant.ROLE_UP_PANEL] = [AppConstant.C_ROLE_PANEL,AppConstant.ROLE_UP_PANEL];
//		_configDic[AppConstant.SMALL_SHOP_PANEL] = [AppConstant.SMALL_SHOP_PANEL,AppConstant.BACK_PACK_PANEL];
//		_configDic[AppConstant.FRIEND_PANEL] = [AppConstant.FRIEND_PANEL,AppConstant.FRIEND_GOLD_FEED_PANEL,AppConstant.FRIEND_FIND_PANEL];
//		_configDic[AppConstant.FRIEND_FIND_PANEL] = [AppConstant.FRIEND_PANEL,AppConstant.FRIEND_FIND_PANEL];
//		_configDic[AppConstant.FRIEND_GOLD_FEED_PANEL] = [AppConstant.FRIEND_PANEL,AppConstant.FRIEND_GOLD_FEED_PANEL];
//		_configDic[AppConstant.MOUNT_UPGRADE_PANEL] = [AppConstant.C_ROLE_PANEL,AppConstant.MOUNT_UPGRADE_PANEL];
//		_configDic[AppConstant.FIGHT_POWER_ORIGIN_PANEL] = [AppConstant.TO_STRONG_PANEL, AppConstant.FIGHT_POWER_ORIGIN_PANEL];
//		_configDic[AppConstant.WU_XING_SUI_PIAN_EXCHANGE_PANEL] = [AppConstant.BACK_PACK_PANEL,AppConstant.WU_XING_SUI_PIAN_EXCHANGE_PANEL];
//		_configDic[AppConstant.TRADE_PANEL] = [AppConstant.TRADE_PANEL,AppConstant.BACK_PACK_PANEL];
//		_configDic[AppConstant.STALL_PANEL] = [AppConstant.STALL_PANEL,AppConstant.BACK_PACK_PANEL];		
		
		private static var _mutexDic:Dictionary = new Dictionary();//互斥面板；
		_mutexDic[AppConstant.GM_PANEL] = [AppConstant.ROLE_PANEL,AppConstant.BACK_PACK_PANEL];
		_mutexDic[AppConstant.BACK_PACK_PANEL] = [AppConstant.EQUIP_CHANGE];
		_mutexDic[AppConstant.EQUIP_CHANGE] = [AppConstant.BACK_PACK_PANEL];
		_mutexDic[AppConstant.STALL_SELL_GOODS_TO_STALL] = [AppConstant.STALL_BUY_GOODS_FROM_STALL];
		_mutexDic[AppConstant.STALL_BUY_PANEL] = [AppConstant.STALL_SELL_PANEL];
		_mutexDic[AppConstant.STALL_BUY_GOODS_FROM_STALL] = [AppConstant.STALL_SELL_GOODS_TO_STALL];
		_mutexDic[AppConstant.STALL_SELL_PANEL] = [AppConstant.STALL_BUY_PANEL];
//		_mutexDic[AppConstant.C_ROLE_PANEL] = [AppConstant.STORE_PANEL,AppConstant.SMALL_SHOP_PANEL/*,AppConstant.TRADE_PANEL,AppConstant.STALL_PANEL*/];
//		_mutexDic[AppConstant.SMALL_SHOP_PANEL] = [AppConstant.C_ROLE_PANEL,AppConstant.STORE_PANEL/*,AppConstant.TRADE_PANEL,AppConstant.STALL_PANEL*/];
//		_mutexDic[AppConstant.TRADE_PANEL] = [AppConstant.C_ROLE_PANEL,AppConstant.STORE_PANEL,AppConstant.SMALL_SHOP_PANEL,AppConstant.STALL_PANEL];
//		_mutexDic[AppConstant.STALL_PANEL] = [AppConstant.C_ROLE_PANEL,AppConstant.STORE_PANEL,AppConstant.SMALL_SHOP_PANEL,AppConstant.TRADE_PANEL];		
		
		
		public static function getMergeArrByAppInfo( appName:String ):Array
		{
			var arr:Array = _configDic[ appName ];
			arr = ( arr == null ) ? [] : arr;
			return arr; 
		}
		
		public static function getMutexArrByAppInfo( appName:String ):Array
		{
			var arr:Array = _mutexDic[ appName ];
			arr = ( arr == null ) ? [] : arr;
			return arr;
		}
		
	}
}