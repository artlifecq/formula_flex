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
	public class Q_horse
	{
		 /**  坐骑id */
		public var q_id:int;
		 /**  坐骑名称 */
		public var q_name:String;
		 /**  下一阶坐骑id */
		public var q_next_id:int;
		 /**  坐骑面板展示用造型资源编号 */
		public var q_panel_show_id:int;
		 /**  场景中骑乘用造型资源路径 */
		public var q_scene_show_url:String;
		 /**  获得本阶坐骑后学会的坐骑被动技能[ID,ID,ID] */
		public var q_skill_id:String;
		 /**  属性id */
		public var q_attid:int;
		 /**  上马读条时间（毫秒） */
		public var q_ride_time:int;
		 /**  本阶坐骑允许的最大技能等级 */
		public var q_max_skilllevel:int;
		 /**  坐骑自身可升最大等级 */
		public var q_max_horselevel:int;
		 /**  进阶操作所需人物等级 */
		public var q_need_playerlevel:int;
		 /**  每次进阶消耗银两数量 */
		public var q_need_money:int;
		 /**  每次进阶所需材料ID( json格式 ) */
		public var q_need_items:String;
		 /**  进阶成功所需最小次数 */
		public var q_up_num_min:int;
		 /**  进阶成功所需最大次数 */
		public var q_up_num_max:int;
		 /**  服务器端成功率万分比 */
		public var q_up_probability:int;
		 /**  每次失败增加祝福值区间min */
		public var q_blessnum_min:int;
		 /**  每次失败增加祝福值区间max */
		public var q_blessnum_max:int;
		 /**  祝福值上限值 */
		public var q_blessnum_limit:int;
		 /**  进阶成功是否全服公告 */
		public var q_is_notice:int;
		 /**  成功进阶后的奖励 */
		public var q_update_gift:String;
		 /**  公告内容 */
		public var q_notice:String;

	}
}
		