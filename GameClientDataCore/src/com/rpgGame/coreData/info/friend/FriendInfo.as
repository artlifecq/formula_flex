package com.rpgGame.coreData.info.friend
{
	/**
	 *
	 * 好友通用数据，意思是所有的信息都在里面
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-9 上午10:05:12
	 *
	 */
	public class FriendInfo extends FriendBaseInfo
	{
		/**
		 *亲密度，范围值是0到49,50到199,200到999
		 */
		public var friendDegree : int;
		
		public function FriendInfo()
		{
		}
		/**设置简单数据数据**/
//		public function setup(data:ClientFriendProto):void
//		{
//			id = data.friendId.toNumber();
//			friendDegree = data.friendDegree;
//		}
	}
}
