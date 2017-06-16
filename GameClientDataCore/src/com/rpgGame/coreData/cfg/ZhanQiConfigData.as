package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_warflag;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class ZhanQiConfigData
	{
		private static var _maxCount:int;
		public static function get maxCount():int
		{
			return _maxCount;
		}
		
		public static var _maxLevel:int=0;
		public static function get maxLevel():int
		{
			return _maxLevel;
		}
		
		private static var _datas:Dictionary;
		
		public static function setConfig( data:ByteArray):void
		{
			if( data == null )
				return;
			_datas = new Dictionary();
			var arr : Array = data.readObject();
			for each(var info :Q_warflag in arr) {
				_datas[info.q_id] = info;
				if(_maxLevel<info.q_id)
					_maxLevel=	info.q_id;
			}
			_maxCount = arr.length;
		}
		
		public static function getZhanQiDataById( id:int ):Q_warflag
		{
			return _datas[id];
		}
	}
}