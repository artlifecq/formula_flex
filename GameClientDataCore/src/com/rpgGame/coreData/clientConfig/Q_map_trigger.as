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
	public class Q_map_trigger
	{
		 /**  触发ID */
		public var q_id:int;
		 /**  名字 */
		public var q_name:String;
		 /**  副本ID */
		public var q_zone_Id:int;
		 /**  难度等级(副本之间难度不冲突,没有区分默认0) */
		public var q_diff_level:int;
		 /**  前置触发条件ID1,2,3 */
		public var q_pre_trigger:String;
		 /**  触发类型(1区域触发，2波数完成触发) */
		public var q_trigger_type:int;
		 /**  触发区域id */
		public var q_trigger_area_id:int;
		 /**  怪物触发ID(只支持状态触发) */
		public var q_monsterId:int;
		 /**  怪物触发状态(1进入战斗状态，2退出战斗状态) */
		public var q_monsterState:int;
		 /**  生成区域阻挡ID列表20103,20104 */
		public var q_area_id:String;
		 /**  场景特效ID列表1,2,3 (对应场景特效表) */
		public var q_effectIds:String;
		 /**  移除区域阻挡ID列表20103,20104 */
		public var q_area_remove_id:String;
		 /**  移除特效ID列表1,2,3 (对应场景特效表) */
		public var q_remove_effectIds:String;
		 /**  触发波数 */
		public var q_trigger_wave:int;
		 /**  波数 */
		public var q_wave:int;
		 /**  传送类型（0全图玩家传送） */
		public var q_transfer_type:int;
		 /**  传送X坐标 */
		public var q_x:int;
		 /**  传送Y坐标 */
		public var q_y:int;
		 /**  重置触发ID列表 */
		public var q_reset_triggers:String;

	}
}
		