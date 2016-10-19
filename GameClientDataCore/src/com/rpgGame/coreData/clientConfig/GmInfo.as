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
	public class GmInfo
	{
		 /**  不重复就行 */
		public var id:uint;
		 /**  分页名字（首字必须是数字，用于排序的），同名为同页 */
		public var pageName:String;
		 /**  类型（1:无参数，2：有参数） */
		public var type:int;
		 /**  后端命令 */
		public var command:String;
		 /**  默认参数，保证正确性 */
		public var info:String;
		 /**  命令的标题 */
		public var title:String;
		 /**  按扭文本 */
		public var buttonLabel:String;
		 /**  命令介绍TIPS */
		public var buttonTips:String;

	}
}
		