package com.rpgGame.coreData.cfg.country
{
	

	/**
	 *
	 * 国家杂项配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-28 上午10:30:12
	 *
	 */
	public class CountryMiscCfgData
	{
		/** 税收下限 **/
		public static var taxRateLower : Number;
		/** 税收上限 **/
		public static var taxRateUpper : Number;
		/** 军费补贴额度下限 **/
		public static var militarySubsidyLower : Number;
		/** 军费补贴最多能够占总量的百分比 **/
		public static var militarySubsidyPerInTotal : Number;
		/** 补贴百分比下限 **/
		public static var militarySubsidyPerLower : Number;
		/** 补贴百分比上限 **/
		public static var militarySubsidyPerUpper : Number;
		/** 单次军费补贴的上限 **/
		public static var militarySubsidyLowerPerTimes : int;
		/** 强国维护费 **/
		public static var strongMaintainFee : int;
		/** 普国维护费 **/
		public static var normalMaintainFee : int;
		/** 弱国维护费 **/
		public static var weakMaintainFee : int;
		/** 强国复活花费的百分比 **/
		public static var strongReliveCostPercent : Number;
		/** 普国复活花费的百分比 **/
		public static var normalReliveCostPercent : Number;
		/** 弱国复活花费的百分比 **/
		public static var weakReliveCostPercent : Number;
		/** 结盟需要的银两 **/
		public static var unionNeedMoney : int;
		/** 禁卫申请数量上限 **/
		public static var jinWeiApplicantUpper : int;
		/** 结盟等待cd **/
		public static var waitUnionReplyCd : Number;
		/** 每天自动减少的外交值 **/
		public static var autoReduceUnionAmount : int;
		/** 解盟cd **/
		public static var liftUnionCd : Number;
		/** 禁言时长，有几种不同的类型 **/
		public static var untalkTimeDuration : Array;
		/** 囚禁时长，有几种不同的类型 **/
		public static var captivityDuration : Array;
		/**投票经验**/
		public static var voteExp : int;
		/**投票时间**/
		public static var voteTimeData:String;
		/**投票持续时间**/
		public static var voteDuration : Number;

//		public static function setConfig(cfg : CountryMiscProto) : void
//		{
//			trace(cfg.voteTimeData,"      ",cfg.voteDuration.toNumber());
//			voteExp = cfg.voteExp;
//			taxRateLower = cfg.taxRateLower;
//			taxRateUpper = cfg.taxRateUpper;
//			militarySubsidyLower = cfg.militarySubsidyLower.toNumber();
//			militarySubsidyPerInTotal = cfg.militarySubsidyPerInTotal;
//			militarySubsidyPerLower = cfg.militarySubsidyPerLower;
//			militarySubsidyPerUpper = cfg.militarySubsidyPerUpper;
//			militarySubsidyLowerPerTimes = cfg.militarySubsidyUpperPerTimes;
//			strongMaintainFee = cfg.strongMaintainFee;
//			normalMaintainFee = cfg.normalMaintainFee;
//			weakMaintainFee = cfg.weakMaintainFee;
//			strongReliveCostPercent = Number(cfg.strongReliveCostPercent/ 100);
//			normalReliveCostPercent = Number(cfg.normalReliveCostPercent/ 100);
//			weakReliveCostPercent = Number(cfg.weakReliveCostPercent/ 100);
//			unionNeedMoney = cfg.unionNeedMoney;
//			jinWeiApplicantUpper = cfg.jinWeiApplicantUpper;
//			waitUnionReplyCd = cfg.waitUnionReplyCd.toNumber();
//			autoReduceUnionAmount = cfg.autoReduceUnionAmount;
//			liftUnionCd = cfg.liftUnionCd.toNumber();
//			untalkTimeDuration = cfg.untalkTimeDuration;
//			captivityDuration = cfg.captivityDuration;
//		}

		public function CountryMiscCfgData()
		{
		}
	}
}
