package com.rpgGame.coreData.cfg.fulidating
{
	import com.rpgGame.coreData.clientConfig.Q_upgrade;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class DengJiCfg
	{
		private static var _dataDic:Dictionary;
		private static var _lvArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			_lvArr=[];
			var arr : Array = data.readObject();
			for each(var info :Q_upgrade in arr) {
				_dataDic[info.q_level] = info;
				_lvArr.push(info.q_level);
			}
		}
		
		public static function getLvArr():Array
		{
			return _lvArr;
		}
		
		public static function getCfgByLv(lv:int):Q_upgrade
		{
			return _dataDic[lv];
		}
	}
}