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
	public class Q_rank_designation
	{
		/**  ID */
		public var q_id:int;
		/**  是否拥有排行榜(0为无，1为有) */
		public var q_ifshow:int;
		/**  榜单统计人数 */
		public var q_Info_max:int;
		/**  榜单模型编号（对应monster表中的ID） */
		public var q_model:int;
		/**  榜单称号特效 */
		public var q_effects:String;
		/**  玩家缩放比例 */
		public var q_hero_scale:int;
		/**  雕塑缩放比例 */
		public var q_modle_scale:int;
		
	}
}
