package com.rpgGame.coreData.cfg
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class NewFuncCfgData
	{
		private static var _map:HashMap;

		public static function alldata():Array
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
				var ids:Array = JSONUtil.decode(info.q_main_id) as Array;
				var length:int = ids.length;
				for(var i:int = 0;i<length;i++)
				{
					typelist = _typelists.getValue(ids[i]) as Array;
					if(typelist == null)
					{
						typelist = new Array();
						_typelists.add(ids[i],typelist);
					}
					typelist.push(info);
				}
			}
		}
		
		public static function getdataById(id:String):Q_newfunc
		{
			return _map.getValue(id) as Q_newfunc;
		}
		
		public static function getListById(id:int):Array
		{
			return _typelists.getValue(id) as Array;
		}
		
	}
}