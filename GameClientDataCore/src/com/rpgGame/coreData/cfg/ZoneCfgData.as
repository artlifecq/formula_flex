package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_zone;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *副本配置数据
	 *@author dik
	 *2017-5-6上午11:38:27
	 */
	public class ZoneCfgData
	{
		private static var allMap:HashMap;
		
		public function ZoneCfgData()
		{
		}
		
		/**
		 *设置所有配置 
		 * @param data
		 * 
		 */
		public static function setup(data : ByteArray) : void
		{
			allMap=new HashMap();
			var arr : Array = data.readObject();
			var num:int=arr.length;
			var info:Q_zone;
			for(var i:int=0;i<num;i++){
				info=arr[i];
				allMap.add(info.q_id,info);
			}
		}
		
		public static function getZoneCfg(id:int):Q_zone
		{
			return allMap.getValue(id);
		}
	}
}