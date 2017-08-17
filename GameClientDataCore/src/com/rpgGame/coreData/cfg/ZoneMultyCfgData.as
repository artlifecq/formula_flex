package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_zone;
	import com.rpgGame.coreData.clientConfig.Q_zone_multy;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * 多人副本配置表
	 * @author yt
	 * 2017-5-11下午14:26:20
	 */	
	public class ZoneMultyCfgData
	{
		private static var _dataDic : Dictionary = new Dictionary();
		public static function setup(data : ByteArray) : void {
			var arr : Array = data.readObject();
			for each(var info :Q_zone_multy in arr) {
				_dataDic[info.q_zone_id] = info;
			}
		}
		/**根据副本ID多人副本信息*/
		public static function getZoneMultyByID(id : int) : Q_zone_multy 
		{
			return _dataDic[id];
		}
		
		/**返回多人副本列表信息*/
		public static function getZoneMultyList() : Vector.<Q_zone_multy> 
		{
			var relist:Vector.<Q_zone_multy>=new Vector.<Q_zone_multy>();
			var zone:Q_zone;
			for each(var info :Q_zone_multy in _dataDic) {
				zone=ZoneCfgData.getZoneCfg(info.q_zone_id);
				if(zone.q_zone_type==12)
				{
					relist.push(info);
				}
				
			}
			
			return relist;
		}
		
		/**返回多人副本id列表*/
		public static function getMultyIdList() :Array
		{
			var relist:Array=new Array();
			var zone:Q_zone;
			for each(var info :Q_zone_multy in _dataDic) {
				zone=ZoneCfgData.getZoneCfg(info.q_zone_id);
				if(zone.q_zone_type==12)
				{
					relist.push(info.q_zone_id);
				}
				
			}
			/*
			for each(var info :Q_zone_multy in _dataDic) {
				relist.push(info.q_zone_id);
			}*/
			
			relist.sort(onSort);
			
			return relist;
		}
		private static function onSort(a : int, b : int) : int
		{
			var zoneDataA:Q_zone=ZoneCfgData.getZoneCfg(a);
			var zoneDataB:Q_zone=ZoneCfgData.getZoneCfg(b);
			if(zoneDataA&&zoneDataB)
			{
				if (zoneDataA.q_level > zoneDataB.q_level)
				{
					return 1;
				}
				else
				{
					return -1;
				}
			
			}
			
			return 0;
		}
		/**根据下标返回副本id列表*/
		public static function getZoneIdByID(id:int) :int
		{
			var relist:Array=getMultyIdList();
			if(id>=0&&id<relist.length)
			{
				return relist[id];
			}
			return 0;
		}
		
		/**根据副本ID判断是否是多人副本*/
		public static function isZoneMultyByID(id : int) : Boolean
		{
			return _dataDic[id]!=null;
		}
		public function ZoneMultyCfgData()
		{
			
		}
	}
}