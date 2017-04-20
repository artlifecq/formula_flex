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
	public class Q_mission_segment
	{
		 /**  任务对话id */
		public var q_segment_id:int;
		 /**  任务对话挂在哪个npc下（填写npc_id） */
		public var q_mission_npc:int;
		 /**  npc调用对话内容（可配置多个，当有多句对话时，使用‘%’隔开） */
		public var q_npcTalk_information:String;
		 /**  玩家点击的对话内容（个数与npc调用对话个数一致，可配置多个，当有多句对话时，使用‘%’隔开。对话段数与npc的一致） */
		public var q_palyerClickTalk:String;

	}
}
		