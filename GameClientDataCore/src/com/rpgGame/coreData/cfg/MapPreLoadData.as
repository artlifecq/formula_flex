package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_map_preload;
	import com.rpgGame.coreData.clientConfig.Q_special_activities;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class MapPreLoadData
	{
		public function MapPreLoadData()
		{
		}
		
		private static var preMap:HashMap;
		
		public static function setup( data:ByteArray ):void
		{
			preMap=new HashMap();
			var arr : Array = data.readObject();
			var num:int=arr.length;
			var info:Q_map_preload;
			for(var i:int=0;i<num;i++){
				info=arr[i];
				preMap.add(info.q_map_id,info);
			}
		}
		
		/**
		 * 根据地图id获取预加载图集信息
		 * @param mapId
		 * @return 
		 * 
		 */
		public static function getPreLoadInfo(mapId:int):Q_map_preload
		{
			return preMap.getValue(mapId);
		}
	}
}