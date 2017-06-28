package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_horse;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class HorseConfigData
	{
		private static var _maxCount:int;
		public static function get maxCount():int
		{
			return _maxCount;
		}
		private static var _datas:Dictionary;
		public static function setConfig( data:ByteArray):void
		{
			if( data == null )
				return;
			_datas = new Dictionary();
			var arr : Array = data.readObject();
			for each(var info :Q_horse in arr) {
				_datas[info.q_id] = info;
			}
			_maxCount = arr.length;
		}
		
		public static function getMountDataById( id:int ):Q_horse
		{
			return _datas[id];
		}
		
		
	}
}