package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_tipsinfo;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * 35Tips信息表.xlsx
	 * @author dik
	 * 
	 */
	public class TipsCfgData
	{
		
		private static var _dataDic:Dictionary;
		
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			var arr : Array = data.readObject();
			
			for each(var info : Q_tipsinfo in arr) {
				_dataDic[info.q_id] = info;
			}
		}
		
		public function TipsCfgData()
		{
		}
		
		public static function getTipsInfo(id:int):Q_tipsinfo
		{
			if(_dataDic[id]){
				return _dataDic[id];
			}
		
			var info:Q_tipsinfo=new Q_tipsinfo();
			info.q_describe="蛋疼的策划赶紧去配置35Tips信息表.xlsx，"+id+"的tips文字";
			return info;
		}
	}
}