package com.rpgGame.coreData.info.equip
{
	import org.client.mainCore.ds.HashMap;

	public class EquipmentDestoryInfo
	{
		public function EquipmentDestoryInfo()
		{
			items = new HashMap();
		}
		private var items : HashMap;
		
		private var index : int = -1;
		
		public var moneyCost : int;
		
		public function addItem(itemInfo : EquipmentDestoryItemInfo):void
		{
			index++;
			items.add(index,itemInfo);
		}
		
		public function getItem(index:int):EquipmentDestoryItemInfo
		{
			return items.getValue(index);
		}
		
		public function get ItemsLen():int
		{
			return items.length;
		}
		
	}
}