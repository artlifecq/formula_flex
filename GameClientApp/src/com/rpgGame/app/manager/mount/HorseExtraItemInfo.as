package com.rpgGame.app.manager.mount
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.goods.BackPackManager;
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
		private var _id:int;
		public function get clientItemInfo():ClientItemInfo
		{
			return _clientItemInfo;
		}

		public function HorseExtraItemInfo(id:int):void
		{
			_id = id;
			_global = GlobalSheetData.getSettingInfo(id);
			var item:ItemInfo = new ItemInfo();
			item.itemModelId = _global.q_int_value;
			_clientItemInfo = ItemUtil.convertClientItemInfo(item);
			_maxCountLists = JSONUtil.decode( _global.q_string_value);
		}
		
		public function  get eatType():int
		{
			if(_id==506)
				return 1;
			else
				return 2;
		}
		
		public function getMaxByLevel(level:int):int
		{
			if(_maxCountLists.hasOwnProperty(level))
				return int(_maxCountLists[level]);
			else
				return 0;
		}
		
		public function bagHaveCount():int
		{
			return BackPackManager.instance.getBagItemsCountById(_clientItemInfo.cfgId);
		}
		
		public function canUseItem(level:int,num:int):Boolean
		{
			var canuse:int = getMaxByLevel(level);
			return canuse>Math.max(num,0);
		}
		
		public var useCount:int;
		private static var _list:Dictionary;
		private static var _itemPropIds:Object;
		public static function createInfo():void
		{
			_list = new Dictionary();
			_list[506] = new HorseExtraItemInfo(506);
			_list[507] = new HorseExtraItemInfo(507);
			_itemPropIds = new Object();
			var items:Object = JSONUtil.decode( GlobalSheetData.getSettingInfo(510).q_string_value);
			for(var key:String in items)
			{
				_itemPropIds[int(key)] = int(items[key]);
			}
		}
		public static function getItemPropsByJob(job:int):int
		{
			if(_itemPropIds.hasOwnProperty(job))
				return _itemPropIds[job];
			else
				return _itemPropIds[1];
		}
		public static function getinfobyId(id:int):HorseExtraItemInfo
		{
			return _list[id];
		}
		
	}
}