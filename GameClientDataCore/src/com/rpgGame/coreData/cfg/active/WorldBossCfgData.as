package com.rpgGame.coreData.cfg.active
{
	import com.rpgGame.coreData.clientConfig.Q_world_boss;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class WorldBossCfgData
	{
		private static var dataMap:HashMap;
		
		public function WorldBossCfgData()
		{
		}
		
		public static function setup( data:ByteArray ):void
		{
			var arr : Array = data.readObject();
			var num:int=arr.length;
			var cfg:Q_world_boss;
			var info:BossActInfo;
			for(var i:int=0;i<num;i++){
				cfg=arr[i];
				info=ActivetyDataManager.getActInfoById(cfg.q_id) as BossActInfo;
				info.worldBossCfg=cfg;
			}
		}
	}
}