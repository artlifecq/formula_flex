package com.rpgGame.coreData.type
{

	/**
	 *
	 * 按名字搜索请求类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-13 上午10:05:12
	 *
	 */
	public class HeroSearchReqType
	{
		/**
		 * 邮件
		 */
		public static const Req_Type_MAIL : int = 1;
		/**
		 * 好友
		 */
		public static const Req_Type_FRIEND : int = 2;
		/**
		 * 黑名单
		 */
		public static const Req_Type_BLACK : int = 3;
		/**
		 * 所有玩家 
		 */		
		public static const Req_Type_All : int= 4;
		/**囚禁**/
		public static const Req_Type_QiuJin : int = 5;
		/**禁言**/
		public static const Req_Type_JinYan : int = 6;
		/**查找玩家**/
		public static const Req_type_find_player : int = 7;
		public function HeroSearchReqType()
		{
		}
	}
}
