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
	public class Q_mainbtn
	{
		 /**  按钮id */
		public var q_id:int;
		 /**  功能名 */
		public var q_name:String;
		 /**  按钮类型(1,主控上方按钮，2.右上角第一排按钮，3右上角第二排按钮，4.右上角第三排活动按钮 */
		public var q_btn_type:int;
		 /**  按钮排序id */
		public var q_btn_order:int;
		 /**  点按钮类型(1,打开面板;2打开链接 */
		public var q_click_type:int;
		 /**  点击的参数,根据点击类型配置,点击类型是面板配面板id,链接配地址 */
		public var q_click_arg:String;
		 /**  按钮的资源目录(如:res\ui\button\lunjian填lunjian) */
		public var q_btn_res:String;
		 /**  按钮特效名(res\effect) */
		public var q_btn_eft:String;
		 /**  按钮提示 */
		public var q_btn_tips:String;
		 /**  在副本展示(0,不展示,1展示) */
		public var q_show_zone:int;
		 /**  是否是运营活动按钮 */
		public var q_is_activity:int;

	}
}
		