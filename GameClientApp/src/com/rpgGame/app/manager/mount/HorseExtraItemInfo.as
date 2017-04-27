package com.rpgGame.app.manager.mount
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	import flash.utils.Dictionary;

	public class HorseExtraItemInfo
	{
		private var _global:Q_global;
		private var _clientItemInfo:ClientItemInfo;
		private var _maxCountLists:Object;
		public function get clientItemInfo():ClientItemInfo
		{
			return _clientItemInfo;
		}

		public function HorseExtraItemInfo(id:int):void
		{
			_global = GlobalSheetData.getSettingInfo(id);
			var item:ItemInfo = new ItemInfo();
			item.itemModelId = _global.q_int_value;
			_clientItemInfo = ItemUtil.convertClientItemInfo(item);
			_maxCountLists = JSONUtil.decode( _global.q_string_value);
		}
		
		public function getMaxByLevel(level:int):int
		{
			if(_maxCountLists.hasOwnProperty(level))
				return int(_maxCountLists[level]);
			else
				return 0;
		}
		private static var _list:Dictionary;
		public static function createInfo():void
		{
			_list = new Dictionary();
			_list[506] = new HorseExtraItemInfo(506);
			_list[507] = new HorseExtraItemInfo(507);
		}
		
		public static function getinfobyId(id:int):HorseExtraItemInfo
		{
			return _list[id];
		}
		
	}
}