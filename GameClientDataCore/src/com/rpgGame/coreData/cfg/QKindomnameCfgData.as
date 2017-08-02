package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_kindomname;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 26_4王城区服名称对照表.xlsx
	 * @author dik
	 * 2017-8-2
	 */
	public class QKindomnameCfgData
	{
		private static var zonesMap:HashMap;
		
		
		public function QKindomnameCfgData()
		{
		}
		
		public static function setup(data : ByteArray) : void 
		{
			zonesMap=new HashMap();
			var arr : Array = data.readObject();
			for each(var info : Q_kindomname in arr){
				zonesMap.add(info.q_zones,info);
			}
		}
		
		public static function getInfoByZone(zone:int):Q_kindomname
		{
			return zonesMap.getValue(zone);
		}
	}
}