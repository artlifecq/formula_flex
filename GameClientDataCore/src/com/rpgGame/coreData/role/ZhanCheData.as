package com.rpgGame.coreData.role
{
	
	/**
	 * 国战战车场景数据
	 * GuoDong.Zhang
	 * 2016-8-16
	 */
	public class ZhanCheData extends RoleData
	{
		public var ownerName : String = "";
		/**主人所属国家*/
		public var ownerCountry:int;
		/**战车配置ID*/
		public var modelID:int;
		
		public function ZhanCheData(type:int)
		{
			super(type);
		}
	}
}