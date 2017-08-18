package com.rpgGame.coreData.info.familyWar
{
	

	public class FamilyWarCfgData
	{
		public function FamilyWarCfgData()
		{
		}
		public static var  war_prepare_duration : Number;// 战斗在开始前多久可以进入副本
		public static var  war_duration : Number ; // 战斗时长
		public static var  family_leader_level_limit : int ; // 族长需要的等级
		public static var  bid_min_limit : int; // 单次竞标的底价
		public static var  bid_reset_build_token_count : Number; // 在竞标需要的建设令牌>=该值时，重置下次竞标需要的令牌为0
		public static var  bid_start_before_war_start_duration : Number ; // 竞标是在战斗开始多久之前开启
		public static var  bid_duration : Number ; // 竞标正常从开始到结束需要的时长
		public static var  bid_delay_duration : Number; // 竞标每次延时延时的时长
		public static var  bid_can_delay_times : int; // 竞标期间能够延时的次数
		public static var  bid_can_delay_before_end  : Number; // 竞标结束之前多少毫秒内算竞标延时
//		public static var  king_family_membe_prize : PrizeProto ; // 王帮奖励
//		public static function setup(cfg:KingWarMiscProto):void
//		{
//			
//			war_prepare_duration = cfg.warPrepareDuration?cfg.warPrepareDuration.toNumber():0;
//			war_duration = cfg.warDuration?cfg.warDuration.toNumber():0;
//			family_leader_level_limit = cfg.guildLeaderLevelLimit;
//			bid_min_limit = cfg.bidMinLimit;
//			trace(FamilyWarCfgData.bid_min_limit);
//			bid_start_before_war_start_duration = cfg.bidStartBeforeWarStartDuration.toNumber();
//			bid_reset_build_token_count = cfg.bidResetBuildTokenCount.toNumber();
//			bid_duration = cfg.bidDuration.toNumber();
//			bid_delay_duration = cfg.bidDelayDuration.toNumber();
//			bid_can_delay_times = cfg.bidCanDelayTimes;
//			bid_can_delay_before_end = cfg.bidCanDelayBeforeEnd.toNumber();
//			king_family_membe_prize = cfg.kingGuildMembePrize;
//		}
	}
}