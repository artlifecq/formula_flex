package com.rpgGame.coreData.info.crown
{
	import app.message.CountryModuleObjProto;

	public class CountryModuleData
	{
		public function CountryModuleData()
		{
		}
		/**
		 * 是否领取俸禄了 
		 */		
		public var hasCollectSalary:Boolean;
		/**
		 *今天是否被邀请为官员了 
		 */		
		public var isTodayBeenSetOfficer:Boolean=false; // 
		/**
		 *今天是否发过国家捐献 
		 */		
		public var isCountryDonate:Boolean=false; // 
		/**
		 *今天设置禁言的次数 
		 */		
		public var setDontTalkTimes:int; // 
		/**
		 *今天囚禁别人的次数 
		 */		
		public var captivityTimes:int; // 
		/**
		 *禁言结束时间 
		 */		
		public var officerSetUntalkEndTime:Number; // 
		/**
		 * 囚禁结束时间 
		 */		
		public var captivityEndTime:Number; //
		/**
		 *武勋 
		 */		
		public var countryModuleWuXun : CountryMouduleWuXunData;
		/**今天是否投票了**/
		public var isTodayVote : Boolean = false;
		
		public function setup(cfg:CountryModuleObjProto):void
		{
			this.isTodayVote = cfg.isTodayVote;
			this.captivityEndTime = cfg.captivityEndTime.toNumber();
			hasCollectSalary = cfg.hasCollectSalary;
			isTodayBeenSetOfficer = cfg.isTodayBeenSetOfficer;
			isCountryDonate = cfg.isCountryDonate;
			setDontTalkTimes = cfg.setDontTalkTimes;
			captivityTimes = cfg.captivityTimes;
			officerSetUntalkEndTime = cfg.officerSetUntalkEndTime.toNumber();
			trace("禁言："+(officerSetUntalkEndTime));
			captivityEndTime = cfg.captivityEndTime.toNumber();
			countryModuleWuXun = new CountryMouduleWuXunData();
			countryModuleWuXun.setup(cfg.wuXun);
		}
	}
}
