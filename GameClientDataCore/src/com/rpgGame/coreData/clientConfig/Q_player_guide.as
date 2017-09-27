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
	public class Q_player_guide
	{
		 /**  ID */
		public var q_id:String;
		 /**  是否为本组指引的第1个默认为0，不填1：第1个 */
		public var q_isfirst:int;
		 /**  下一步id(只针对同一种引导类型的) */
		public var q_next_id:String;
		 /**  引导类型（技能引导，任务引导等）组功能，同组的用同值 */
		public var q_guide_type:int;
		 /**  触发条件1:新功能开启；2:升到指定等级；3:接到任务；4:激活技能； */
		public var q_start_type:int;
		 /**  具体触发ID */
		public var q_start_data:int;
		 /**  指引说明：箭头旁显示文本 */
		public var q_guide_text:String;
		 /**  箭头方向0,1,2,3（右上左下） */
		public var q_arrow_align:int;
		 /**  0:触发就完成；1:点击；2：关闭；3点击和关闭；4面板打开部分特殊处理 */
		public var q_complete_condiction:int;
		 /**  打开面板id */
		public var q_complete_data:int;
		 /**  目标宽度 */
		public var q_weight:int;
		 /**  目标高度 */
		public var q_hight:int;

	}
}
		