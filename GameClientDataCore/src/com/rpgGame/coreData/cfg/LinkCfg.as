package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_hyperlinksMenu;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class LinkCfg
	{
		private static var _dataDic : Dictionary;
		private static var _keys:Array;
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			_keys=[];
			var arr : Array = data.readObject();
			for each (var info :Q_hyperlinksMenu in arr)
			{
				_dataDic[info.q_show_type] = info;
				_keys.push(info.q_show_type);
			}
		}
		
		public static function get keys():Array
		{
			return _keys;
		}
		
		public static function getCfgByType(type:String):Q_hyperlinksMenu
		{
			return _dataDic[type];
		}
	}
}