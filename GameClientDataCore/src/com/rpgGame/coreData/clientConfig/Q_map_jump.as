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
	public class Q_map_jump
	{
		 /**  跳跃点编号 */
		public var q_jump_id:int;
		 /**  跳跃点名 */
		public var q_name:String;
		 /**  跳跃点所在地图ID */
		public var q_map_id:int;
		 /**  跳跃速度 */
		public var q_jump_speed:int;
		 /**  跳跃起始区域(区域表) */
		public var q_jump_source_area_id:int;
		 /**  跳跃目的点列表，格式：[[0,0],[1,1,]] */
		public var q_jump_dest_list:String;
		 /**  和那一条路是一个来回 */
		public var q_equal_pash:int;
		 /**  跳跃点造型资源编号 */
		public var q_jump_res:String;
		 /**  跳跃点资源X坐标 */
		public var q_jump_res_x:int;
		 /**  跳跃点资源Y坐标 */
		public var q_jump_res_y:int;
		 /**  跳跃点资源方向 */
		public var q_jump_res_direction:int;

	}
}
		