package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_convoy;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class HuBaoData
	{
		private static var _dataDic : Dictionary;
		private static var _maxLv:int=0;
		private static var _acceptNpc:int=0;
		private static var _destinationNpc:int=0;
		
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			var arr : Array = data.readObject();
			for each (var info :Q_convoy in arr)
			{
				_dataDic[info.q_girl_id] = info;
				if(_maxLv<info.q_girl_id) _maxLv=info.q_girl_id;
				if(_acceptNpc == 0) _acceptNpc=info.q_accept;
				if(_destinationNpc == 0) _destinationNpc = info.q_destination;
			}
		}
		
		public static function get msxLv():int
		{
			return _maxLv;
		}
		
		public static function get acceptNpc():int
		{
			return _acceptNpc;
		}
		
		public static function get destinationNpc():int
		{
			return _destinationNpc;
		}
		
		public static function isMax(lv:int):Boolean
		{
			return lv == _maxLv;
		}
		
		public static function getmodByLv(lv:int):Q_convoy
		{
			return _dataDic[lv];
		}
		
		public static function isTaskNpc(id:int):Boolean
		{
			if(id == _acceptNpc || id == _destinationNpc) return true;
			return false;
		}
		
		public static function getEffByLv(lv:int):String
		{
			return (_dataDic[lv] as Q_convoy).q_nameurl;
		}
	}
}