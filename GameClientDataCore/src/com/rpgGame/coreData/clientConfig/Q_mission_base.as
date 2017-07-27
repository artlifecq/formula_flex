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
	public class Q_mission_base
	{
		 /**  任务唯一id(10000-10009）主线;（20000-20009）支线;（30000-30009）环式 */
		public var q_mission_id:int;
		 /**  任务名称 */
		public var q_name:String;
		 /**  前置任务id */
		public var q_needMission:String;
		 /**  自动接取的下一个任务ID 0是没有 */
		public var q_next_task:int;
		 /**  任务类型(1主线2支线3环式4帮会任务5天降元宝) */
		public var q_mission_mainType:int;
		 /**  任务子类型（1为对话类型，2杀怪数量，3杀怪获得道具，4采集获取道具,5使用道具完成任务,6挑战副本）2/4/6类型任务均需自动完成及接取 */
		public var q_mission_type:int;
		 /**  任务完成条件 */
		public var q_finish_information_str:String;
		 /**  完成任务npc 没有npc为0 */
		public var q_finish_npc:int;
		 /**  完成任务需求文字描述 */
		public var q_finish_describe:String;
		 /**  自动寻路信息 */
		public var q_pathing:String;
		 /**  支线任务对应打开面板编号 */
		public var q_emid:String;
		 /**  是否使用系统神行符(1使用，0不使用。默认 0)为1时必须配寻路点 */
		public var q_fly:int;
		 /**  任务奖励信息id(调用t_mission_reword表) */
		public var q_reword_id:int;
		 /**  任务完成阶段信息（任务对话id） */
		public var q_deal_mission:String;
		 /**  任务描述（可控制部分字体颜色，使用<font color='16进制颜色'>文本</font>） */
		public var q_describe:String;
		 /**  是否自动完成(0 手动   1 自动) */
		public var q_self_motion:int;
		 /**  是否自动接取下一个（后端自动接取）(0 否  1 是) */
		public var q_auto_next:int;
		 /**  任务接取等级（填0 表示没有等级条件限制） */
		public var q_needLevel:int;
		 /**  章节ID */
		public var q_party_id:int;
		 /**  章节名 */
		public var q_party_name:String;
		 /**  章节子ID */
		public var q_node_id:int;
		 /**  接受时显示npc(逗号隔开) */
		public var q_acc_show_npc:String;
		 /**  接受时隐藏npc */
		public var q_acc_hide_npc:String;
		 /**  完成时显示npc */
		public var q_end_show_npc:String;
		 /**  完成时隐藏npc */
		public var q_end_hide_npc:String;
		 /**  接任务后的剧情怪物(怪物ID,数量,地图,ID,坐标),如果只写怪物ID,就会在接任务后在玩家附近刷1个怪物 */
		public var q_drama_monster:String;
		 /**  达成条件后显示npc */
		public var q_accomplish_show_npc:String;
		 /**  达成条件后隐藏npc */
		public var q_accomplish_hide_npc:String;
		 /**  一个周期内可接次数 */
		public var q_accept:int;
		 /**  是否自动跑（0自动继续任务，1跑到指定位置打怪） */
		public var q_auto_run:int;
		 /**  任务完成阶段气泡信息（填写对话气泡id，可填写多个） */
		public var q_deal_bubble:String;
		 /**  一个周期内可完成次数 */
		public var q_completions:int;
		 /**  任务重置周期,0永久,1每天,2每周,3每月 */
		public var q_reset_period:int;
		 /**  是否可重复完成 */
		public var q_complete_more:int;
		 /**  是否可重复接受 */
		public var q_accept_more:int;
		 /**  是否显示任务奖励(1是 0否) */
		public var q_is_show_rewards:int;
		 /**  任务完成时限(秒,0无时限) */
		public var q_time_limit:int;
		 /**  组包ID（1：主线任务，2：日常任务，3：宝箱任务，4：帮会任务） */
		public var q_group:int;
		 /**  接任务阶段信息的对话（任务对话id。可配置多个id‘,’隔开） */
		public var q_receive_mission:String;
		 /**  接任务阶段气泡信息（填写对话气泡id，分割） */
		public var q_receive_bubble:String;
		 /**  进行中而未完成任务对话信息（当任务处于进行中而未完成状态时，点击完成任务npc时显示的对话信息） */
		public var q_undeal_mission:String;
		 /**  任务中的冒泡 */
		public var q_undeal_bubble:String;
		 /**  任务名称 */
		public var q_mission_name:String;
		 /**  完成任务后是否没收任务道具(0没收,1不收) */
		public var q_finish_iscollectitem:int;
		 /**  任务完成条件,数值类（该字段未用到） */
		public var q_finish_information_int:int;

	}
}
		