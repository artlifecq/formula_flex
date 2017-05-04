package com.rpgGame.coreData.cfg.cheats
{

	
	import com.rpgGame.coreData.clientConfig.Q_cheats;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class CheatsCfg
	{
		public function CheatsCfg()
		{
		}
		private static var _dataDic:Dictionary;
		private static var _dataArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			_dataArr = data.readObject();
			
			for each(var info : Q_cheats in _dataArr) {
				_dataDic[info.q_id] = info;
			}
		}
		public static function getCheats(id:int):Q_cheats
		{
			return _dataDic[id];
		}

		public static function get dataArr():Array
		{
			return _dataArr;
		}

	}
}