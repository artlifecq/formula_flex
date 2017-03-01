package com.rpgGame.app.manager.chat
{
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 * 聊天中展示的物品数据管理
	 * zhangguodong
	 * 2016-10-9
	 */
	public class ChatGoodsManager
	{
		private static var idCounter:int;
		private static var _itemInfoMap:HashMap = new HashMap();
		
		public static function addItemInfo(itemInfo:ClientItemInfo):String
		{
			idCounter++;
			var key:String = idCounter.toString();
			_itemInfoMap.add(key,itemInfo);
			return key;
		}
		
		public static function getItemInfo(key:String):ClientItemInfo
		{
			return _itemInfoMap.getValue(key);
		}
	}
}