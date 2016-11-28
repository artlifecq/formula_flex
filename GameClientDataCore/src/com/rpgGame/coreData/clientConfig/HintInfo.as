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
	public class HintInfo
	{
		 /**  广播Id最好别纯数字，因为有可能重复 */
		public var key:String;
		 /**  类型广播位置1=GM；2=个人重要；3=战斗；4=中央大字；5=聊天框；6=鼠标附近；7=场景对象;8=服务器； */
		public var type:int;
		 /**  类型这个只是在广播位置等于5的时候有效,1 世界，2 国家，3 场景，4 帮会，5 队伍，6 喇叭，7 家族 */
		public var channel:int;
		 /**  类型广播文本颜色0 错误类别 红色， 1 警告类别 黄色，  2 普通类别 绿色， 3 白色 */
		public var error:int;
		 /**  note */
		public var info:String;

	}
}
		