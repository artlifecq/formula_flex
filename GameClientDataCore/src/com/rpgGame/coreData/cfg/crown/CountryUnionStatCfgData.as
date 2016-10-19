package com.rpgGame.coreData.cfg.crown
{
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class CountryUnionStatCfgData
	{
		public function CountryUnionStatCfgData()
		{
		}
		public static var map : HashMap;
		public static function setup(data : ByteArray):void
		{
			
//			var arr : Array = data.readObject();
			map = new HashMap();
			map.add(0,"未结盟");
			map.add(1,"申请中");
			map.add(2,"待结盟");
			map.add(3,"结盟");
			map.add(4,"待解盟");
		}
		
		public static function getUnionStat(stat:int):String
		{
			return map.getValue(stat);
		}
	}
}