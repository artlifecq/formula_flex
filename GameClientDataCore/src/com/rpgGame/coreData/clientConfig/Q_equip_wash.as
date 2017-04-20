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
	public class Q_equip_wash
	{
		 /**  ID */
		public var q_id:int;
		 /**  装备阶数 */
		public var q_levelnum:int;
		 /**  装备部位（武器:0;衣服:1;护腿:2;鞋子:3;头盔:4;肩甲:5;手镯:6;项链:7;戒指:8;帅印:9） */
		public var q_kind:int;
		 /**  消耗的洗练道具ID */
		public var q_item_id:int;
		 /**  消耗的洗练道具数 */
		public var q_item_num:int;
		 /**  可洗炼的属性集合(属性ID,权重|属性ID,权重) */
		public var q_gather:String;

	}
}
		