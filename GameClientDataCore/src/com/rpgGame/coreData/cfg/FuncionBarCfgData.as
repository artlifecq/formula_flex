package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class FuncionBarCfgData
	{
		private static var _map:HashMap;
		private static var _maptypeList:HashMap;
		private static var _keyMapTypeList:HashMap;
		public function FuncionBarCfgData()
		{
		}

		public static function setup( byte:ByteArray ):void
		{
			var _list:Array = byte.readObject();
			_map = new HashMap();
			_maptypeList = new HashMap();
			_keyMapTypeList = new HashMap();
			var list:Array;
			for each ( var info:FunctionBarInfo in _list )
			{
				_map.add( info.id, info );
				var key1:String = getKeys(info.type,info.row);
				list = _maptypeList.getValue(key1);
				if(list==null)
				{
					list = new Array();
					_maptypeList.add(key1,list);
				}
				list.push(info);
				
				list = _keyMapTypeList.getValue(info.type);
				if(list==null)
				{
					list = new Array();
					_keyMapTypeList.add(info.type,list);
				}
				if(list.indexOf(info.row)<0)
					list.push(info.row);
			}
			
			var keys:Array = _maptypeList.keys();
			for(var i:int = 0;i<keys.length;i++)
			{
				var key:String = keys[i];
				list = _maptypeList.getValue(key);
				_maptypeList.add( key, list.sortOn("order", Array.NUMERIC));
			}
		}
		
		
		/**
		 *获取所有功能信息 
		 * @return 
		 * 
		 */
		public static function getAllBarInfos():Array
		{
			return _map.getValues();
		}

		/**
		 * 根据功能id获取活动条的信息
		 * @param id
		 * @return
		 */
		public static function getActivityBarInfo( id:int ):FunctionBarInfo
		{
			return _map.getValue( id ) as FunctionBarInfo;
		}
		
		private static function getKeys(type:int,row:int):String
		{
			return type.toString()+"_"+row;
		}
		
		/**
		 * 根据区域获取窗口信息列表 
		 * @param type  0:功能区域，1：活动区域
		 * @param row 行数
		 * @return 
		 * 
		 */
		public static function getInfoListbyType(type:int,row:int = 0):Array
		{
			return _maptypeList.getValue(getKeys(type,row));
		}
		
		
		public static function getinfoRows(type:int):Array
		{
			return _keyMapTypeList.getValue(type);
		}
	}
}
