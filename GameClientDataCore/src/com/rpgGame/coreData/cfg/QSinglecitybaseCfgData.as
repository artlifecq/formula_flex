package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_singlecitybase;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 26_3单服城池基础表.xlsx	 
	 * @author dik
	 * 
	 */
	public class QSinglecitybaseCfgData
	{
		private static var _typeMap:HashMap;
		
		public function QSinglecitybaseCfgData()
		{
		}
		
		public static function setup(data : ByteArray) : void 
		{
			var arr : Array = data.readObject();
			_typeMap=new HashMap();
			for each(var info : Q_singlecitybase in arr) {
				_typeMap.add(info.q_id,info);
			}
		}
		
		/**
		 *根据城市id获取城市的配置 
		 * @param cityID
		 * @return 
		 * 
		 */
		public static function getCityCfg(cityID:int):Q_singlecitybase
		{
			return _typeMap.getValue(cityID);
		}
	}
}