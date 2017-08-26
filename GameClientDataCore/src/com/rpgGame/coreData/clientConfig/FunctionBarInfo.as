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
	public class FunctionBarInfo
	{
		 /**  窗口ID */
		public var id:int;
		 /**  按钮区域(0:功能区域,1:活动区域,9:其他区域) */
		public var type:int;
		 /**  功能行 */
		public var row:int;
		 /**  排序值 */
		public var order:int;
		 /**  是否显示图标(0:默认开启,1:不开启) */
		public var isshow:int;
		 /**  功能名 */
		public var name:String;
		 /**  悬停 */
		public var tips:String;
		 /**  是否显示特效 */
		public var showEft:int;
		 /**  特效名称 */
		public var effect_name:String;
		 /**  副本是否显示（0显示，1不显示） */
		public var q_map_zones:int;
		 /**  事件类型(1:窗口,2:菜单，3：显示不同面板，4：超链接) */
		public var clickType:int;
		 /**  窗口参数 */
		public var clickarg:String;
		 /**  要打开的对应功能id */
		public var open_id:String;

	}
}
		