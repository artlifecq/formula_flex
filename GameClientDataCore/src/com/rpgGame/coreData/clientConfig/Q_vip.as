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
	public class Q_vip
	{
		 /**  VIP等级(1为月卡，2为季卡，3为半年卡) */
		public var q_vipid:int;
		 /**    */
		public var q_vip_name:String;
		 /**  剩余有效时间（单位s） */
		public var q_effectivetime:int;
		 /**  商城表对应出售ID */
		public var q_shopItemId:int;
		 /**  BUFF栏显示的BUFF */
		public var q_attribute_bufficon:int;
		 /**  墨者令(前端用) */
		public var q_mo_tokenID:int;
		 /**  打怪经验加成(万分比) */
		public var q_expaddtion_killmonster:int;
		 /**  美人活动次数增加({hug:拥抱,flower:送花,kiss:亲吻,ml:洞房}) */
		public var q_girl_activities_add:String;
		 /**  副本购买次数+ */
		public var q_zone_buy_add:String;
		 /**    */
		public var q_vip_privileges:String;
		 /**  人物属性加成(属性表id) */
		public var q_attr_id:int;
		 /**  VIP激活奖励 */
		public var q_first_gift:String;

	}
}
		