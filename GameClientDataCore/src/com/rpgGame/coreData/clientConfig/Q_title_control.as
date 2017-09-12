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
	public class Q_title_control
	{
		 /**  ID */
		public var q_id:int;
		 /**  称号类型（type相同称号之间不共存） */
		public var q_type:int;
		 /**  称号排序（数字越大、权重越大， 排序越靠后） */
		public var q_weight:int;
		 /**  榜单称号特效 */
		public var q_effects:String;
		 /**  图片称号 */
		public var q_title:String;
		 /**  玩家缩放比例 */
		public var q_hero_scale:int;
		 /**  雕塑缩放比例 */
		public var q_modle_scale:int;
		 /**  称号特效高度（px） */
		public var q_effects_high:int;

	}
}
		