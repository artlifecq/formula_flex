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
	public class Q_special_activities
	{
		 /**  活动编号 */
		public var q_activity_id:int;
		 /**  活动名称 */
		public var q_activity_name:String;
		 /**  活动类型（0普通 1开服活动） */
		public var q_activity_type:int;
		 /**  活动时间（[[-1],[-1],[-1],[1,3,4,5],[1200,2200],[-1]]） */
		public var q_activity_time:String;
		 /**  活动时间展示 */
		public var q_activity_timeshow:String;
		 /**  活动限制等级 */
		public var q_activity_limit_level:int;
		 /**  对应的活动脚本编号 */
		public var q_activity_script_id:int;
		 /**  活动名称图片资源编号 */
		public var q_activity_page_id:int;
		 /**  每日允许参与次数（-1无限） */
		public var q_in_time:int;
		 /**  提示面板信息 */
		public var q_iformation:String;
		 /**  活动开放说明 */
		public var q_desc:String;
		 /**  开服后几天开放 */
		public var q_open_day:int;
		 /**  提示描述 */
		public var q_tips:String;
		 /**  展示奖励 */
		public var q_show_item:String;
		 /**  日常描述 */
		public var q_text:String;
		 /**  主要奖励描述 */
		public var q_main_reward_desc:String;
		 /**  关联NPC */
		public var q_npc:int;
		 /**  关联副本ID */
		public var q_zone:int;
		 /**  是否为帮会活动（1是，0否） */
		public var q_gang:int;

	}
}
		