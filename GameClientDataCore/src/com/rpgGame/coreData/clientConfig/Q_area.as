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
	public class Q_area
	{
		 /**  区域编号 */
		public var q_area_id:int;
		 /**  区域名 */
		public var q_area_name:String;
		 /**  区域所在地图ID */
		public var q_map_id:int;
		 /**  区域类型（0：自定义区域，1：障碍区域，2：竞技PK区域，3：触发事件区域，4：动态障碍区域，5：安全区域，6：技能禁止区域） */
		public var q_type:int;
		 /**  区域的所有的点，配置格式为: 点x=点y[;点x=点y;点x=点y;点x=点y....] */
		public var q_pos:String;
		 /**  区域中心点X轴坐标 */
		public var q_center_x:int;
		 /**  区域中心点Y轴坐标 */
		public var q_center_y:int;

	}
}
		