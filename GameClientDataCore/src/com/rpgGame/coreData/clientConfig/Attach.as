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
	public class Attach
	{
		 /**  ID */
		public var q_id:int;
		 /**  绑定器类型（1技能伤害） */
		public var q_type:int;
		 /**  资源路径 */
		public var q_res:int;
		 /**  技能编号 */
		public var q_skill:int;
		 /**  范围BUFF（进入添加，出界移除） */
		public var q_enterBuff:int;
		 /**  执行次数（超过次数则会被移除,0不移除） */
		public var q_executeCount:int;
		 /**  开始冷却时间 */
		public var q_startDuration:int;
		 /**  延迟移除时间(毫秒) */
		public var q_removeDuration:int;
		 /**  检查范围 */
		public var q_range:int;
		 /**  持续时间（0为一直持续） */
		public var q_time:int;

	}
}
		