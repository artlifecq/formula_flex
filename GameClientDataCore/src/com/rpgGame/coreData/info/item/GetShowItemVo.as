package com.rpgGame.coreData.info.item
{
	import flash.utils.ByteArray;
	
	import app.message.GoodsProto;

	/**
	 * 收到展示的物品的数据 
	 * @author fly.liuyang
	 * 
	 */	
	public class GetShowItemVo 
	{
		/**标识这个数据的Key**/
		public var itemLog:int;
		
		//物品的位置信息(背包物品为位置id，身上装备为10000+位置id）
//		public var posType:int;
		public var cfgId:Number;
		public var name:String;
		public var quality:int;
//		public var showPos:int;
		//完整的物品
		private var _itemInfo:ItemInfo;
		//动态属性proto ary
		public var dynamicGoodsBytes:ByteArray;
		
		public function GetShowItemVo() 
		{
			name = "";
			quality = 0;
//			showPos = 0;
//			_itemInfo = null;
			dynamicGoodsBytes = null;
		}
		
		public function setLocalItemInfo(value:ItemInfo):void
		{
			_itemInfo = value;
		}
		
		public function get itemInfo():ItemInfo
		{
			return _itemInfo;
		}

		/** 解码下发的动态数据 */
		public function decode(chatGods:GoodsProto):void
		{
			cfgId = chatGods.id;
			parseItemInfo();
		}
		
		public function parseItemInfo():void
		{
		}
		
	}

}