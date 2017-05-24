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
		 /**  功能ID */
		public var id:int;
		 /**  按钮区域（0:功能区域，1：活动区域） */
		public var type:int;
		 /**  功能行 */
		public var row:int;
		 /**  排序值 */
		public var order:int;
		 /**  是否显示table(0：默认显示，1:不显示） */
		public var show_tab:int;
		 /**  功能名 */
		public var name:String;
		 /**  悬停 */
		public var tips:String;
		 /**  是否显示特效 */
		public var showEft:int;
		 /**  特效名称 */
		public var effect_name:String;
		 /**  副本是否显示(场景类型，默认全部展示) */
		public var mapType:String;
		 /**  事件类型（1：窗口） */
		public var clickType:int;
		 /**  窗口参数 */
		public var clickarg:String;

	}
}
		