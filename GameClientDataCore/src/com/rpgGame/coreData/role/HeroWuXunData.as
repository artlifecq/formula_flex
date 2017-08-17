package com.rpgGame.coreData.role
{
	

	/**
	 *
	 * 英雄武勋数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-28 上午10:30:12
	 *
	 */
	public class HeroWuXunData
	{
		/** 当前的武勋，可以用来买东西 **/
		public var wuXun : Number;
		/** 总共获得的武勋 **/
		public var totalWuXun : Number;
		/** 今天击杀别人获得的武勋 **/
		public var todayKillAddWuXun : Number;
		/** 击杀别人总共获得的武勋 **/
		public var totalKillAddWuXun : Number;
		/** 今天其他途径获得的武勋 **/
		public var todayOtherAddWuXun : Number;
		/** 其他途径总共获得的武勋 **/
		public var totalOtherAddWuXun : Number;
		/** 英雄获得武勋日志 **/
		public var addWuXunRecords : Vector.<HeroAddWuXunRecord>;

		public function HeroWuXunData()
		{
		}

//		public function setConfig(cfg : CountryModuleWuXunProto) : void
//		{
//			wuXun = cfg.wuXun?cfg.wuXun.toNumber():0;
//			totalWuXun = cfg.totalWuXun?cfg.totalWuXun.toNumber():0;
//			todayKillAddWuXun = cfg.todayKillAddWuXun?cfg.todayKillAddWuXun.toNumber():0;
//			totalKillAddWuXun = cfg.totalKillAddWuXun?cfg.totalKillAddWuXun.toNumber():0;
//			todayOtherAddWuXun = cfg.todayOtherAddWuXun?cfg.todayOtherAddWuXun.toNumber():0;
//			totalOtherAddWuXun = cfg.totalOtherAddWuXun?cfg.totalOtherAddWuXun.toNumber():0;
//
//			addWuXunRecords = new Vector.<HeroAddWuXunRecord>();
//			for each (var recordProto : AddWuXunRecordProto in cfg.records)
//			{
//				var recordData : HeroAddWuXunRecord = new HeroAddWuXunRecord();
//				recordData.setConfig(recordProto);
//				addWuXunRecords.push(recordData);
//			}
//		}
	}
}
