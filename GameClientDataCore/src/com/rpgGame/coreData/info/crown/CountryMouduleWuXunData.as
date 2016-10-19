package com.rpgGame.coreData.info.crown
{
	import app.message.CountryModuleObjProto.CountryModuleWuXunProto;
	import app.message.CountryModuleObjProto.CountryModuleWuXunProto.AddWuXunRecordProto;

	public class CountryMouduleWuXunData
	{
		public function CountryMouduleWuXunData()
		{
		}
		
		/**
		 *当前的武勋，可以用来买东西 
		 */		
		public var  wuXun :int; // 
		/**
		 * 总共获得的武勋 
		 */		
		public var  totalWuXun :int ; // 
		/**
		 *今天击杀别人获得的武勋 
		 */		
		public var  todayKillAddWuXun:int; // 
		/**
		 *击杀别人总共获得的武勋 
		 */		
		public var  totalKillAddWuXun:int; // 
		/**
		 * 今天其他途径获得的武勋
		 */		
		public var  todayOtherAddWuXun:int ; // 
		/**
		 *其他途径总共获得的武勋 
		 */		
		public var  totalOtherAddWuXun:int ; // 
		/**
		 * 武勋日志 
		 */		
		public var addWuXunDatas : Vector.<AddWuXunRecordData>;
		
		public function setup(cfg:CountryModuleWuXunProto):void
		{
			wuXun = cfg.wuXun?cfg.wuXun.toNumber():0;
			totalWuXun=cfg.totalWuXun?cfg.totalWuXun.toNumber():0;
			todayKillAddWuXun=cfg.todayKillAddWuXun?cfg.todayKillAddWuXun.toNumber():0;
			totalKillAddWuXun=cfg.totalKillAddWuXun?cfg.totalKillAddWuXun.toNumber():0;
			todayOtherAddWuXun=cfg.todayOtherAddWuXun?cfg.todayOtherAddWuXun.toNumber():0;
			totalOtherAddWuXun=cfg.totalOtherAddWuXun?cfg.totalOtherAddWuXun.toNumber():0;
			addWuXunDatas = new Vector.<AddWuXunRecordData>();
			var addWuXun : AddWuXunRecordData;
			for each(var addWuXunProto : AddWuXunRecordProto in cfg.records)
			{
				addWuXun = new AddWuXunRecordData();
				addWuXun.setup(addWuXunProto);
				addWuXunDatas.push(addWuXun);
			}
		}
	}
}