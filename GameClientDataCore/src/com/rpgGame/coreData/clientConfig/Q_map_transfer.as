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
	public class Q_map_transfer
	{
		 /**  传送点编号 */
		public var q_tran_id:int;
		 /**  传送点名 */
		public var q_name:String;
		 /**  开始传送地图ID */
		public var q_map_id:int;
		 /**  传送源区域 */
		public var q_tran_source_area_id:int;
		 /**  传送目的地区域 */
		public var q_tran_dest_area_id:int;
		 /**  传送点造型资源编号 */
		public var q_tran_res:String;
		 /**  传送点资源X坐标 */
		public var q_tran_res_x:int;
		 /**  传送点资源Y坐标 */
		public var q_tran_res_y:int;
		 /**  传送点资源方向 */
		public var q_tran_res_direction:int;
		 /**  是否隐藏传送点（1是隐藏，0是不隐藏） */
		public var q_tran_hide:int;
		 /**  地图名称描述（小地图TIPS，支持xml） */
		public var q_mapdesc:int;
		 /**  脚本调用（填写后传送至坐标点将无效） */
		public var q_scriptid:int;

	}
}
		