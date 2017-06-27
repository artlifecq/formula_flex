package com.rpgGame.coreData.cfg
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class NewFuncCfgData
	{
		private static var _map:HashMap;
		private static var _sortList:Vector.<Q_newfunc>;
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
			_sortList = new Vector.<Q_newfunc>();
			var typelist:Array;
			for each ( var info:Q_newfunc in _list )
			{
				_map.add( info.q_id.toString(), info );
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
				if(info.q_notiveneedshow==1)
					_sortList.push(info);
			}
			
			var sort:Function = function(q1:Q_newfunc,q2:Q_newfunc):int{
				if(q1.q_level < q2.q_level)
					return -1;
				else if(q1.q_level > q2.q_level)
					return 1;
				else
					return 0;
			};
			_sortList.sort(sort);
		}
		
		
		public static function getSortList():Vector.<Q_newfunc>
		{
			return _sortList;
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