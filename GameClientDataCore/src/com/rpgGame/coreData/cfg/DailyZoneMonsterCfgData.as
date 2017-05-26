package com.rpgGame.coreData.cfg
{
	
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	import com.rpgGame.coreData.clientConfig.Q_zone;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 *每日副本刷怪数据库
	 *@author dik
	 *2017-5-6上午11:38:27
	 */
	public class DailyZoneMonsterCfgData
	{
		private static var allMap:HashMap;
		private static var _typeList:Dictionary;
		public function DailyZoneMonsterCfgData()
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
			var info:Q_dailyzone_monster;
			var typelist:Array;
			for(var i:int=0;i<num;i++){
				info=arr[i];
				allMap.add(info.q_id,info);
				var key1:String = getKey(info.q_daily_zoneId,info.q_diff_level);
				typelist = _typeList[key1];
				if(typelist==null)
				{
					typelist = new Array();
					_typeList[key1] = typelist;
				}
				typelist.push(info);
			}
			
			
			for(var key:* in _typeList)
			{
				typelist= _typeList[key] as Array;
				_typeList[key] = typelist.sortOn("q_wave",Array.NUMERIC);
			}
		}
		
		private static function getKey(type:int,level:int):String
		{
			return type.toString()+"_"+level.toString();
		}
		
		public static function getZoneCfg(id:int):Q_dailyzone_monster
		{
			return allMap.getValue(id);
		}
		
		public static function getTypeList(type:int,level:int = 0):Array
		{
			var key1:String = getKey(type,level);
			return _typeList[key1];
		}
		
		
		
	}
}