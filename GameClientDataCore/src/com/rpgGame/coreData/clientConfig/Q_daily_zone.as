package com.rpgGame.coreData.clientConfig
{
	/**
	* 
	*  根据模块config 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改具体的config文件】
	* @author NEIL
	* 
	*/
	public class Q_daily_zone
	{
		 /**   日常副本ID */
		public var q_id:int;
		 /**    */
		public var q_combat_type:int;
		 /**    */
		public var q_bgicon:String;
		 /**  副本ID */
		public var q_zone_id:int;
		 /**  挑战限制等级 */
		public var q_limit_level:int;
		 /**  计数枚举 */
		public var q_count_type:String;
		 /**  总波数 */
		public var q_wave_total:int;
		 /**  通关奖励（实际发奖励的时候用，在结算面板那里显示） */
		public var q_rewards_show:String;
		 /**  首通奖励展示 */
		public var q_special_rewards_show:String;
		 /**  前端面板展示奖励（供前端在进入副本面板展示，因为有些面板不会展示经验和金币的奖励） */
		public var q_rewards_client:String;
		 /**  限时时间（秒） */
		public var q_zone_time:int;
		 /**  免费进入次数 */
		public var q_enter_num:int;
		 /**  VIP可购买次数[vip等级,次数,单价] */
		public var q_vip_can_buy:String;
		 /**  推荐通关战斗力 */
		public var q_combat:int;
		 /**  星数判定条件[条件(1表示杀怪总数2表示剩余时间),1星值,2星值,3星值] 如：[1,10,20,30]表示 杀怪总数 1星10只，2星达到20只，3星达到30只  [2,10,20,30]表示副本剩余时间 1星10秒，2星20秒，3星30秒  各取区间. */
		public var q_star_condition:String;
		 /**  扩展字段(1.经验副本根据玩家等级) */
		public var q_other:String;

	}
}
		