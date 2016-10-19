package com.rpgGame.coreData.cfg.equip
{
	import com.rpgGame.coreData.clientConfig.EquipRefineTimesInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class EquipRefineTimesCfgData
	{
		public function EquipRefineTimesCfgData()
		{
		}
		private static var _map : HashMap = new HashMap();
		
		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : EquipRefineTimesInfo in arr)
			{
				_map.add(info.refineTimes, info);
			}
		}
		
		public static function getInfoByRefineTimes(refine:int):EquipRefineTimesInfo
		{
			return _map.getValue(refine);
		}
	}
}