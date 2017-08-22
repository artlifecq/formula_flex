package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.InitPlayerInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *玩家初始化数据
	 * @author dik
	 * 
	 */
	public class InitPlayerInfoCfgData
	{
		private static var _map:HashMap=new HashMap();
		
		public function InitPlayerInfoCfgData()
		{
		}
		
		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			for each(var info:InitPlayerInfo in arr){
				_map.add(info.job+"_"+info.sex,info);
			}
		}
		
		/**
		 *获取初始化信息 
		 * @param job
		 * @param sex
		 * @return 
		 * 
		 */
		public static function getInitInfo(job:int,sex:int):InitPlayerInfo
		{
			return _map.getValue(job+"_"+sex);
		}
	}
}