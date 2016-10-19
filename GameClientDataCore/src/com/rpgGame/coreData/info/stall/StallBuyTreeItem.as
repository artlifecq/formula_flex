package com.rpgGame.coreData.info.stall
{
	import com.rpgGame.coreData.cfg.item.ItemCfgData;

	public class StallBuyTreeItem
	{
		public function StallBuyTreeItem()
		{
		}
		
		public var itemId : int;
		
		public var typeName:String;
		
		public function get itemName():String
		{
			return ItemCfgData.getItemName(itemId);
		}
	}
}