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
	public class Q_fightsoul_path
	{
		/**  类型id */
		public var q_id:int;
		/**  类型(1:系统,2:任务,3NPC) */
		public var q_type:int;
		/**  参数（类型1对应新功能开启表ID，类型2不填，3对应刷新表NPCID） */
		public var q_arg:int;
		/**  展示名称 */
		public var q_name:String;
		/**  需要完成次数 */
		public var q_total:int;
		/**  单次经验 */
		public var q_reward:int;
		
	}
}
