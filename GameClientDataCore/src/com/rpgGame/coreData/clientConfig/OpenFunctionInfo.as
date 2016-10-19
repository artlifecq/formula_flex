package com.rpgGame.coreData.clientConfig
{
	/**
	* 
	*  根据模块config 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改具体的config文件】
	* @author fly.AutoUICreater
	* @modifier L.L.M.Sunny
	* 修改时间：2015-7-2 上午10:05:12
	* 
	*/
	public class OpenFunctionInfo
	{
		 /**  功能名称 */
		public var name:String;
		 /**  预告等级 */
		public var show_level:int;
		 /**  图标资源名称 */
		public var icon:String;
		 /**  预告Tips显示的文本 */
		public var tips_text:String;
		 /**  预告文本 */
		public var show_text:String;
		 /**  开启文本 */
		public var open_text:String;
		 /**  开启功能的id,跟后端表一致 */
		public var function_id:int;
		 /**  1为前端控制不开启，0由后端控制开启 */
		public var lock:int;

	}
}
		