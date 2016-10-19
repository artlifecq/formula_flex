package com.rpgGame.coreData.info.alert
{
	/**
	* 显示alert的配置
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
		public var align:String;
		 /**  左边按钮的文本，默认是确认 */
		public var leftValue:String;
		 /**  右边按钮的文本，默认是取消 */
		public var rightValue:String;
		 /**  备注 */
		public var note:String;

	}
}
		