package com.rpgGame.coreData.cfg.fulidating
{
	import com.rpgGame.coreData.clientConfig.Q_sign_accumulate;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class SignCfg
	{
		private static var _dataDic:Dictionary;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			var arr : Array = data.readObject();
			for each(var info :Q_sign_accumulate in arr) {
				_dataDic[info.q_day] = info;
			}
		}
		
		public static function getCfgByDay(day:int):Q_sign_accumulate
		{
			return _dataDic[day];
		}
	}
}