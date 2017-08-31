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
	public class Q_scene_monster_area
	{
		 /**  刷怪编号 */
		public var q_id:int;
		 /**  刷怪地图编号 */
		public var q_mapid:int;
		 /**  怪物ID */
		public var q_monster_model:int;
		 /**  阵营属性（争霸战使用，0无阵营） */
		public var q_camp:int;
		 /**  刷怪数量 */
		public var q_monster_num:int;
		 /**  刷新中心点X（格子坐标） */
		public var q_center_x:int;
		 /**  刷新中心点Y（格子坐标） */
		public var q_center_y:int;
		 /**  刷新半径（格子数量） */
		public var q_radius:int;
		 /**  怪物出生Buff（怪物出生携带，配置buff表对应ID） */
		public var q_buff:String;
		 /**  Buff持续时间（单位：毫秒，-1为永久携带，Buff表中时间与此处时间，此处时间优先级最高） */
		public var q_buff_time:String;
		 /**  NPC闲话 */
		public var q_speak:String;
		 /**  NPC闲话出现概率百分比 */
		public var q_speak_probability:int;
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
		 /**  怪物朝向角度(不填为随机,值为:右, 右下, 下, 左下, 左, 左上, 上, 右上) */
		public var q_direction:String;

	}
}
		