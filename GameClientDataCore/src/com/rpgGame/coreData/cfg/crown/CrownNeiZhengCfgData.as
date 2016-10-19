package com.rpgGame.coreData.cfg.crown
{
	import com.rpgGame.coreData.clientConfig.CrownNeiZhenInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class CrownNeiZhengCfgData
	{
		public function CrownNeiZhengCfgData()
		{
		}
		private static var map : HashMap;
		public static function setup(byte : ByteArray):void
		{
			var array : Array = byte.readObject();
			map= new HashMap();
			for each(var crown : CrownNeiZhenInfo in array)
			{
				map.add(crown.index,crown.name);
			}
		}
		
		public static function getNeiZhengName(i:int):String
		{
			return map.getValue(i);
		}
	}
}