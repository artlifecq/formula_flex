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
	public class Q_cheats_node
	{
		 /**  平台 */
		public var q_agents:String;
		 /**  区服 */
		public var q_zones:String;
		 /**  节点Id(功法Id_节点Id) */
		public var q_node_id:String;
		 /**  节点名称 */
		public var q_name:String;
		 /**  类型（0真气节点 1砭石节点） */
		public var q_type:int;
		 /**  砭石属性类型 */
		public var q_stone_type:int;
		 /**  等级上限 */
		public var q_maxlevel:int;
		 /**  升级需要等级 */
		public var q_need_level:String;
		 /**  升级需要消耗真气值[1,2,3,4] */
		public var q_need_spirit:String;
		 /**  前置穴位ID */
		public var q_need_node_id:String;
		 /**  前置节点等级/砭石等级[1,2,3,4] */
		public var q_prelvl:String;
		 /**  附加属性[1,2,3,4] */
		public var q_attribute:String;
		 /**  穴位点的坐标(拐点坐标)[[x,y],[x,y]] */
		public var q_coord:String;
		 /**  下级节点列表[1_1,1_2] */
		public var q_link_nodes:String;
		 /**  穴位图标类型 */
		public var q_huponameurl:String;
		 /**  激活成功是否全服公告（0不公告，1公告） */
		public var q_notify:int;
		 /**  公告内容 */
		public var q_notify_str:String;

	}
}
		