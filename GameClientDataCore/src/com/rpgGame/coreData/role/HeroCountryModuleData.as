package com.rpgGame.coreData.role
{
	import app.message.CountryModuleObjProto;

	/**
	 *
	 * 英雄国家模块数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-28 上午10:30:12
	 *
	 */
	public class HeroCountryModuleData
	{
		/** 是否有领取今天的俸禄 **/
		public var hasCollectSalary : Boolean;
		/** 今天是否被邀请为官员了 **/
		public var isTodayBeenSetOfficer : Boolean;
		/** 今天是否发过国家捐献 **/
		public var isCountryDonate : Boolean;
		/** 今天设置禁言的次数 **/
		public var setDontTalkTimes : int;
		/** 今天囚禁别人的次数 **/
		public var captivityTimes : int;
		/** 禁言结束时间 **/
		public var officerSetUntalkEndTime : Number;
		/** 囚禁结束时间 **/
		public var captivityEndTime : Number;
		/** 武勋 **/
		public var wuXunData : HeroWuXunData;

		public function HeroCountryModuleData()
		{
		}

		public function setConfig(cfg : CountryModuleObjProto) : void
		{
			if (!cfg)
				return;
			hasCollectSalary = cfg.hasCollectSalary;
			isTodayBeenSetOfficer = cfg.isTodayBeenSetOfficer;
			isCountryDonate = cfg.isCountryDonate;
			setDontTalkTimes = cfg.setDontTalkTimes;
			captivityTimes = cfg.captivityTimes;
			officerSetUntalkEndTime = cfg.officerSetUntalkEndTime.toNumber();
			captivityEndTime = cfg.captivityEndTime.toNumber();
			wuXunData = new HeroWuXunData();
			wuXunData.setConfig(cfg.wuXun);
		}
	}
}
