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
	public class Q_singlecitybase
	{
		 /**  编号 */
		public var q_id:int;
		 /**  城池类型（1卫城 2王城） */
		public var q_type:int;
		 /**  城池名称 */
		public var q_name:String;
		 /**  每日占领福利（帮众）[mod:物品ID,num：数量] */
		public var q_rewards1:String;
		 /**  每日占领福利（官员） */
		public var q_rewards2:String;
		 /**  Tips中展示官员奖励 */
		public var q_tipsaward1:String;
		 /**  Tips中展示帮众奖励 */
		public var q_tipsaward2:String;
		 /**  参战奖励 */
		public var q_reward3:String;
		 /**  进攻奖励 */
		public var q_reward4:String;
		 /**  竞拍时间 */
		public var q_auctiontime:String;
		 /**  争霸时间 */
		public var q_battletime:String;
		 /**  竞拍起价 */
		public var q_startingprice:int;
		 /**  每次竞价 */
		public var q_bidding:int;
		 /**  胜利积分 */
		public var q_integral_victory:int;
		 /**  群体传送技能冷却时间（时间：毫秒） */
		public var q_cooling:int;
		 /**  群体传送有效时间 */
		public var q_transfer_valid_time:int;
		 /**  矿石上交点坐标[[坐标,阵营]] */
		public var q_submit_point:String;

	}
}
		