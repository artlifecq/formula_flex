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
	public class Q_warflag
	{
		 /**  战旗id */
		public var q_id:int;
		 /**  战旗名称 */
		public var q_name:String;
		 /**  下一阶战旗id */
		public var q_next_id:int;
		 /**  战旗面板展示用造型资源编号 */
		public var q_panel_show_id:String;
		 /**  战旗成长丹使用最大数量 */
		public var q_chengzhang_num:int;
		 /**  战旗资质丹使用最大数量 */
		public var q_zhizi_num:int;
		 /**  每次进阶消耗银两数量 */
		public var q_need_money:int;
		 /**  每次进阶所需材料ID( json格式 ) */
		public var q_need_items:String;
		 /**  属性id([兵家,墨家,医家]) */
		public var q_attid:String;
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
		 /**  成功进阶后的奖励 */
		public var q_update_gift:String;
		 /**  进阶成功是否全服公告 */
		public var q_is_notice:int;
		 /**  公告内容 */
		public var q_notice:String;

	}
}
		