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
	public class Q_scene_monster
	{
		 /**  刷怪编号 */
		public var q_id:int;
		 /**  刷怪地图编号 */
		public var q_mapid:int;
		 /**  怪物ID */
		public var q_monster_model:int;
		 /**  刷新坐标点X */
		public var q_x:int;
		 /**  刷新坐标点Y */
		public var q_y:int;
		 /**  重生时间脱离怪物数据库控制变更为：0本规则不启用， >0则为变更后的重生时间，单位：秒 */
		public var q_relive:int;
		 /**  攻击类型脱离怪物数据库控制变更为：0本规则不启用，1变更为被动攻击类怪物，2变更为主动攻击类怪物 */
		public var q_attack:int;
		 /**  巡逻间隔 */
		public var q_patrol_time:int;
		 /**  巡逻几率 */
		public var q_patrol_pro:int;
		 /**  是否隐藏 */
		public var q_whether_display:int;

	}
}
		