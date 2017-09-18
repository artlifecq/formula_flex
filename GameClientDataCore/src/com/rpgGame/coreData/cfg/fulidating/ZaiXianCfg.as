package com.rpgGame.coreData.cfg.fulidating
{
	import com.rpgGame.coreData.clientConfig.Q_online;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class ZaiXianCfg
	{
		private static var _dataDic:Dictionary;
		private static var _onlineArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			_onlineArr=[];
			var arr : Array = data.readObject();
			for each(var info :Q_online in arr) {
				_dataDic[info.q_id] = info;
				_onlineArr.push(info.q_id);
			}
			_onlineArr.sort(short);
		}
		
		private static function short(time1:int,time2:int):int
		{
			if(time1<time2) return -1;
			else if(time1>time2) return 1;
			return 0;
		}
		
		public static function getOnLineArr():Array
		{
			return _onlineArr;
		}
		
		public static function getCfgById(id:int):Q_online
		{
			return _dataDic[id];
		}
	}
}