package com.rpgGame.coreData.cfg.model
{
	import com.rpgGame.coreData.clientConfig.AvatarClothesRes;
	import com.rpgGame.coreData.clientConfig.BaZhenTuRes;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class BaZhenTuResCfgData
	{
		
		private static var _map : HashMap;
		
		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : BaZhenTuRes in arr)
			{
				_map.add(info.type, info);
			}
		}
		
		public static function getInfo(type : int) :BaZhenTuRes
		{
			return _map.getValue(type);
		}
		
		public function BaZhenTuResCfgData()
		{
		}
	}
}