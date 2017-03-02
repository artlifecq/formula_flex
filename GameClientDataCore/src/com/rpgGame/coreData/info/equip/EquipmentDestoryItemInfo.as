package com.rpgGame.coreData.info.equip
{
	import com.rpgGame.coreData.info.item.ClientItemInfo;

	/**
	 * 装备拆解用于显示的单个数据 
	 * @author Mandragora
	 * 
	 */	
	public class EquipmentDestoryItemInfo
	{
		public function EquipmentDestoryItemInfo()
		{
		}
		private var _lower:int;
		private var _upper:int;
		
		public var itemInfo : ClientItemInfo;
		
		public function getSubCount():String
		{
			if(!itemInfo)
				return "";
			return itemInfo.name + itemInfo.count * _lower + "~" + _upper * itemInfo.count;
		}

		/**
		 * 下限值
		 */
		public function get lower():int
		{
			return _lower;
		}

		/**
		 * @private
		 */
		public function set lower(value:int):void
		{
			if(value < 1)
				value = 1;
			_lower = value;
		}

		/**
		 * 上限 
		 */
		public function get upper():int
		{
			return _upper;
		}

		/**
		 * @private
		 */
		public function set upper(value:int):void
		{
			if(value < 1)
				value = 1;
			_upper = value;
		}


	}
}
