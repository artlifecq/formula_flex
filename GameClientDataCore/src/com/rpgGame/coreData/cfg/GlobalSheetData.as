package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_global;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class GlobalSheetData
	{
		private static var _dataDic : Dictionary;
		
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			
			var arr : Array = data.readObject();
			for each (var info :Q_global in arr)
			{
				_dataDic[info.q_id] = info;
			}
		}
		
		public static function getSettingInfo(key : int) : Q_global
		{
			return _dataDic[key];
		}
		public static function getIntValue(key : int) : int
		{
			var tmp:Q_global=getSettingInfo(key);
			if (tmp) 
			{
				return tmp.q_int_value;
			}
			return 0;
		}
		public static function getStrValue(key : int) : String
		{
			var tmp:Q_global=getSettingInfo(key);
			if (tmp) 
			{
				return tmp.q_string_value;
			}
			return "";
		}
	}
}