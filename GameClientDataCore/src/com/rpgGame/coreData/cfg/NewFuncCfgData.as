package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class NewFuncCfgData
	{
		private static var _map:HashMap;

		public static function get alldata():Array
		{
			return _map.getValues();
		}
		private static var _typelists:HashMap;
		public static function setup( byte:ByteArray ):void
		{
			var _list:Array = byte.readObject();
			_map = new HashMap();
			_typelists = new HashMap();
			var typelist:Array;
			for each ( var info:Q_newfunc in _list )
			{
				_map.add( info.q_id, info );
				typelist = _typelists.getValue(info.q_main_id) as Array;
				if(typelist == null)
				{
					typelist = new Array();
					_typelists.add(info.q_main_id,typelist);
				}
				typelist.push(info);
			}
		}
		
		public static function getdataById(id:int):Q_newfunc
		{
			return _map.getValue(id) as Q_newfunc;
		}
		
		public static function getListById(id:int):Array
		{
			return _typelists.getValue(id) as Array;
		}
		
	}
}