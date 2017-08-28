package com.rpgGame.coreData.cfg
{
	import com.gameClient.utils.JSONUtil;
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
		
		public static function getCityNameById(cityID:int):String
		{
			var cfg:Q_singlecitybase=getCityCfg(cityID);
			if(cfg){
				return cfg.q_name;
			}
			return null;
		}
		
		/**
		 * 通过配置和阵营获取上交位置
		 * @param cfg
		 * @param camp
		 * @return 
		 * 
		 */
		public static function getSubmitPoint(cfg:Q_singlecitybase,camp:int):Array
		{
			var result:Array;
			var points:Array=JSONUtil.decode(cfg.q_submit_point);
			if(!points){
				return result;
			}
			for(var i:int=0;i<points.length;i++){
				if(points[i][2]==camp){
					result=points[i];
				}
			}
			return result;
		}
	}
}