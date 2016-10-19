package com.rpgGame.coreData.cfg.biao
{
	/**
	 * 镖车杂数据 
	 * @author 陈鹉光
	 * 
	 */	
	public class BiaoMiscData
	{
		/** 每天能够接受多少次 **/
		public var  can_acess_per_day:int;
		/** 每天能够增镖的次数 **/
		public var  can_add_biao_times_per_day:int;
		/** 破坏的镖车累计最大的次数 **/
		public var  destroy_accum_max_times:int;
		/** 镖车被摧毁增加的奖励百分比 **/
		public var  destroy_add_exp_percent:int;
		/** 镖车过期时长 **/
		public var  biao_expire_duration:Number;
		/** 镖车能够在每个镖车处刷新的次数 **/
		public var  per_npc_max_can_refresh_times:int;
		/** 镖车在npc处刷新的时间间隔 **/
		public var  npc_refreh_duration:Number;
		/** 国运活动能够开启的最小小时 **/
		public var  guo_yun_start_min_hour:int;
		/** 国运活动能够开启的最大小时 **/
		public var  guo_yun_start_max_hour:int;
		/** 国运活动时长，单位毫秒 **/
		public var  guo_yun_duration:Number;
		/** 国运开始后，弱国的保护时长，单位毫秒 **/
		public var  guo_yun_weak_protect_time:Number;
		/**  国运期间经验加成**/
		public var guo_yun_exp_additional:int;
		/**  上镖车距离镖车的最大距离是多少才可以上车**/
		public var up_to_biao_max_distance:int;
		/**  验镖的npc,验镖必须按照这个顺序来验镖**/
		public var check_biao_npcs:Array;
		
	}
}