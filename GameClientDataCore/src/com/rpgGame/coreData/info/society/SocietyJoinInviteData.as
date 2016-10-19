package com.rpgGame.coreData.info.society
{
	import flash.utils.ByteArray;

	/**
	 *
	 * 帮派入帮邀请数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-02-24 下午6:50:25
	 *
	 */
	public class SocietyJoinInviteData
	{
		/**对方id**/
		public var heroId : Number;
		/**对方玩家名字**/
		public var heroName : String;
		/**等级**/
		public var level : int;
		/**换装**/
		public var equipmentResources : ByteArray;
		/** 帮会等级 **/
		public var societyLevel : int;
		/** 帮会名称 **/
		public var societyName : String;
		/** 过期时间**/
		public var outTime : Number;

		public function SocietyJoinInviteData()
		{
		}
	}
}
