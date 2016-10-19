package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	
	/**
	 * 好友事件声明
	 * @author zgd
	 * 
	 */
	public class FriendEvent 
	{
		/**好友-所有列表初始化,此消息只在第一次得到详细数据时发一边*/
		public static const FRIEND_ALL_LIST_INIT:uint = UNIQUEID.NEXT;
		/**好友状态改变了**/
		public static const FRIEND_STATE_CHANGE : uint = UNIQUEID.NEXT;
		/**屏蔽列表状态改变了**/
		public static const BLACK_STATE_CHANGE : uint = UNIQUEID.NEXT;
		/** 添加我为好友的列表改变了**/
		public static const FRIEND_ADDED_COUNT_CHANGED : uint = UNIQUEID.NEXT;
		/** 心情改变了**/
		public static const MOOD_CHANGE : uint = UNIQUEID.NEXT;
	}
}