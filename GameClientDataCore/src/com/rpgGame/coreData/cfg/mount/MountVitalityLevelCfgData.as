package com.rpgGame.coreData.cfg.mount
{
	import com.rpgGame.coreData.clientConfig.MountVitalityLevelInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 坐骑根骨等级对应标示配置 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountVitalityLevelCfgData
	{
		public function MountVitalityLevelCfgData()
		{
		}
		private static var _map : HashMap = new HashMap();
		
		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : MountVitalityLevelInfo in arr)
			{
				_map.add(info.vitalityLevel, info);
			}
		}
		
		public static function getInfoByMountVitalityLevel(refine:int):MountVitalityLevelInfo
		{
			return _map.getValue(refine);
		}
	}
}