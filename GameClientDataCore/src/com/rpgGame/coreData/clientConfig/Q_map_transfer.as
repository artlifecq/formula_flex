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
		 /**  开始传送地图ID */
		public var q_tran_from_map:int;
		 /**  传送出发点坐标X */
		public var q_tran_from_x:int;
		 /**  传送出发点坐标Y */
		public var q_tran_from_y:int;
		 /**  触发范围半径(格子） */
		public var q_tran_from_range:int;
		 /**  传送至地图ID */
		public var q_tran_to_map:int;
		 /**  传送至坐标点x */
		public var q_tran_to_x:int;
		 /**  传送至坐标点y */
		public var q_tran_to_y:int;
		 /**  范围半径(格子） */
		public var q_tran_to_range:int;
		 /**  传送点造型资源编号 */
		public var q_tran_icon:String;
		 /**  是否隐藏传送点（1是隐藏，0是不隐藏） */
		public var q_tran_hide:int;
		 /**  地图名称描述（小地图TIPS，支持xml） */
		public var q_mapdesc:int;
		 /**  脚本调用（填写后传送至坐标点将无效） */
		public var q_scriptid:int;

	}
}
		