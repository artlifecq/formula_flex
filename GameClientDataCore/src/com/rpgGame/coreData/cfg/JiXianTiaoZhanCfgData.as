package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_limitchallenge;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class JiXianTiaoZhanCfgData
	{
		private static var _dataDic : Dictionary;
		
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			var arr : Array = data.readObject();
			for each (var info :Q_limitchallenge in arr)
			{
				_dataDic[info.q_id] = info;
			}
		}
		
		public static function getModById(id:int):Q_limitchallenge
		{
			return _dataDic[id];
		}
	}
}