package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_backpack_grid;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class GridOpenCfg
	{
		private static var _dataDic : Dictionary;
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			var arr : Array = data.readObject();
			for each (var info :Q_backpack_grid in arr)
			{
				_dataDic[info.q_backpack_q_grid] = info;
			}
		}
		
		public static function getCfgById(id:String):Q_backpack_grid
		{
			return _dataDic[id];
		}
	}
}