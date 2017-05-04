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
	public class Q_mission_section
	{
		 /**  等级（[xx级_类型id）  3:环式任务 4：帮会任务 */
		public var q_mission_lvsec:String;
		 /**  任务随机区间([任务id,任务id,任务id]) */
		public var q_mission_randomid:String;
		 /**  对应等级完成任务获得的奖励(JSON) */
		public var q_single_reward:String;
		 /**  N环任务额外奖励（JsoN） */
		public var q_sec_rewards:String;
		 /**  随机怪物id */
		public var q_monsters:String;

	}
}
		