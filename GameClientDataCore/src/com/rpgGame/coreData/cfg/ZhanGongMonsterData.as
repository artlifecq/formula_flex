package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_meritorious_monster;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class ZhanGongMonsterData
	{
		private static var _dataDic : Dictionary;
		
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			var arr : Array = data.readObject();
			for each (var info :Q_meritorious_monster in arr)
			{
				_dataDic[info.q_id] = info;
			}
		}
		
		public static function getPointById(id:int):Q_meritorious_monster
		{
			return _dataDic[id];
		}
	}
}