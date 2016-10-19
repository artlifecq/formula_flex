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
	public class AlertInfo
	{
		 /**  程序用的，用来对应AlertKeyEnum */
		public var key:String;
		 /**  需要提示的内容 */
		public var value:String;
		 /**  上面的标题 */
		public var title:String;
		 /**  弹窗类型，只能填上面的类型，对应AlertType.1:确认|取消,2:确认，3：透明 确认|取消 ，4：透明 确认 */
		public var alertType:int;
		 /**  0/不填：文字居中，1：左，2右。默认上下居中 */
		public var align:int;
		 /**  左边按钮的文本，默认是确认 */
		public var leftValue:String;
		 /**  右边按钮的文本，默认是取消 */
		public var rightValue:String;
		 /**  备注 */
		public var note:String;

	}
}
		