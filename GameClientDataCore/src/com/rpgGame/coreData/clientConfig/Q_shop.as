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
	public class Q_shop
	{
		 /**  物品id */
		public var q_id:int;
		 /**  商店ID */
		public var q_shop_id:int;
		 /**  商店类型(1 热销道具;2 变强道具;3礼金商城;4 Vip商城;5 常用道具) */
		public var q_sub_shop_type:int;
		 /**  页签前面名称(文字展示) */
		public var q_sub_tab_name:String;
		 /**  VIP等级限制 */
		public var q_vip_level:int;
		 /**  价格类型(3元宝;4银两;5礼金;6绑银) */
		public var q_price_type:int;
		 /**  折扣价格(没有折扣价不填) */
		public var q_discount_price:int;
		 /**  价格 */
		public var q_price:int;
		 /**  是否全服限购(0否;1是) */
		public var q_global_limit:int;
		 /**  限购类型(0无限制;1每日限购;2每周限购) */
		public var q_quota_type:int;
		 /**  限购个数 */
		public var q_quota_count:int;
		 /**  道具ID */
		public var q_item_ID:int;
		 /**  排序Id */
		public var q_order_number:int;
		 /**  是否绑定(0不绑定;1绑定) */
		public var q_bind:int;

	}
}
		