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
	public class Q_zone
	{
		 /**  副本编号 */
		public var q_id:int;
		 /**  副本类型 */
		public var q_zone_type:int;
		 /**  副本关联地图编号[xxxx,xxxx] */
		public var q_mapid:String;
		 /**  副本名称 */
		public var q_name:String;
		 /**  副本存在时间（毫秒） */
		public var q_exist_time:int;
		 /**  副本没有人后删除副本时间（毫秒） 0表示没人也不删除 至少需要存在1分钟 */
		public var q_check_time:int;
		 /**  副本重置时间 [年][月][日][周][1110,1200] */
		public var q_reset_time:String;
		 /**  进入等级限制 */
		public var q_level:int;
		 /**  进入最少人数限制 */
		public var q_min_num:int;
		 /**  进入最多人数限制 */
		public var q_max_num:int;
		 /**  脚本编号（0是没有的） */
		public var q_isscript:int;
		 /**  进入地图的默认坐标x */
		public var q_x:int;
		 /**  进入地图的默认坐标y */
		public var q_y:int;
		 /**  在副本死亡是，禁止弹出通用死亡面板 1 禁止 */
		public var q_show_die_panel:int;
		 /**  对应q_mapid字段每个地图的最大波数 */
		public var q_max_wave:String;
		 /**  副本面板描述 */
		public var q_desc:String;

	}
}
		