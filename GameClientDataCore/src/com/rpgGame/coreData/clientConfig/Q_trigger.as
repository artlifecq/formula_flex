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
	public class Q_trigger
	{
		 /**  触发ID */
		public var q_id:int;
		 /**  名字 */
		public var q_name:String;
		 /**  前置触发条件ID1,2,3 */
		public var q_pre_trigger:String;
		 /**  触发类型(1区域触发，2波数完成触发) */
		public var q_trigger_type:int;
		 /**  触发区域id */
		public var q_trigger_area_id:int;
		 /**  生成区域阻挡ID列表20103,20104 */
		public var q_area_id:String;
		 /**  场景特效ID列表1,2,3 (对应场景特效表) */
		public var q_effectIds:String;
		 /**  触发波数 */
		public var q_trigger_wave:int;
		 /**  波数 */
		public var q_wave:int;

	}
}
		