package com.rpgGame.coreData.info.item
{
	public class UpgradeItemData
	{
		public var itemVec:Vector.<UpgradeItemInfo>;
		
		/** 非替代物品 **/
		public var itemId:int;
		/** 背包物品总数量，包括了替代物品**/
		public var itemTotalCount:int;
		/** 消耗数量**/
		public var needItemCount:int;
		
		public function UpgradeItemData()
		{
			itemVec = new Vector.<UpgradeItemInfo>();
		}
		
		public function get isHasItem():Boolean
		{
			return itemTotalCount >= needItemCount;
		}
		
		
	}
}