package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.clientConfig.Q_zone;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 *副本配置数据
	 *@author dik
	 *2017-5-6上午11:38:27
	 */
	public class DailyZoneCfgData
	{
		private static var allMap:HashMap;
		private static var _typeList:Dictionary;
		public function DailyZoneCfgData()
		{
		}
		
		/**
		 *设置所有配置 
		 * @param data
		 * 
		 */
		public static function setup(data : ByteArray) : void
		{
			allMap=new HashMap();
			_typeList = new Dictionary();
			var arr : Array = data.readObject();
			var num:int=arr.length;
			var info:Q_daily_zone;
			for(var i:int=0;i<num;i++){
				info=arr[i];
				allMap.add(info.q_id,info);
				var typelist:Array = _typeList[info.q_combat_type];
				if(typelist==null)
				{
					typelist = new Array();
					_typeList[info.q_combat_type] = typelist;
				}
				typelist.push(info);
			}
			for(var key:int in _typeList)
			{
				_typeList[key] = (_typeList[key] as Array).sortOn("q_limit_level",Array.NUMERIC);
			}
		}
		
		public static function getZoneCfg(id:int):Q_daily_zone
		{
			return allMap.getValue(id);
		}
		
		public static function getTypeList(type:int):Array
		{
			return _typeList[type];
		}
		
		public static function getZoneCfgbyType(type:int,limitlevel:int):Q_daily_zone
		{
			var list:Array=getTypeList(type);
			for(var i:int=0;i<list.length;i++)
			{
				var q_mod:Q_daily_zone=list[i] as Q_daily_zone;
				if(q_mod.q_limit_level==limitlevel)
				{
					return q_mod;
				}
			}
			return null;
		}
	}
}