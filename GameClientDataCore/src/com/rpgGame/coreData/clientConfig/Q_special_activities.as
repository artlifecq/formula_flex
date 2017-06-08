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
		 /**  活动类型（0综合 1开服活动） */
		public var q_activity_type:int;
		 /**  活动时间（[[-1],[-1],[-1],[1,3,4,5],[1200,2200],[-1]]） */
		public var q_activity_time:String;
		 /**  活动时间展示 */
		public var q_activity_timeshow:String;
		 /**  活动限制等级 */
		public var q_activity_limit_level:int;
		 /**  对应的活动脚本编号 */
		public var q_activity_script_id:int;
		 /**  提前公告时间（格式：5,4,3,2,1) */
		public var q_announcement_time:String;
		 /**  面板提前公告时间（提前分钟） */
		public var q_panel_pre_time:int;
		 /**  公告内容(【活动】开心问答,将｛@｝分钟后开始,请各位做好准备) */
		public var q_notice:String;
		 /**  公告传送(不填直接去参加活动，填了跳转到对应面板) */
		public var q_notice_trans:String;
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
		 /**  展示奖励 */
		public var q_rewards:String;
		 /**  日常描述 */
		public var q_text:String;
		 /**  关联NPC */
		public var q_npc:int;
		 /**  关联副本ID */
		public var q_zone:int;
		 /**  是否为帮会活动（1是，0否） */
		public var q_guide:int;

	}
}
		