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
	public class Q_nine_tower
	{
		 /**  塔层数 */
		public var q_tower_id:int;
		 /**  下层 */
		public var q_next_tower:int;
		 /**  积分条件 */
		public var q_score:int;
		 /**  当前层奖励 */
		public var q_tower_reward:String;
		 /**  击杀玩家积分 */
		public var q_kill_player:int;
		 /**  击杀怪物积分 */
		public var q_kill_monster:int;
		 /**  死亡降层几率（万分比） */
		public var q_per:int;
		 /**  副本id */
		public var q_zoneID:int;
		 /**  进入点 */
		public var q_enter_map:String;
		 /**  复活点 */
		public var q_revive_position:String;

	}
}
		