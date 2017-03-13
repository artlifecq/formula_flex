package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_tipsinfo;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

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
			return _dataDic[id];
		}
	}
}