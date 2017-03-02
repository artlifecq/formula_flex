package com.rpgGame.coreData.info.stall
{
	import com.rpgGame.coreData.cfg.item.ItemConfig;

	public class StallBuyTreeItem
	{
		public function StallBuyTreeItem()
		{
		}
		
		public var itemId : int;
		
		public var typeName:String;
		
		public function get itemName():String
		{
			return ItemConfig.getItemName(itemId);
		}
	}
}