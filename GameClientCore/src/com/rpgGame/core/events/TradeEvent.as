package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class TradeEvent
	{
		public function TradeEvent()
		{
		}
		/**设置物品成功了，把这个物品放到物品列表上，需要自己去拉一下**/
		public static const TRADE_SET_MINE_GOODS_COMPLETE : int = UNIQUEID.NEXT;
		
		/**目标玩家设置物品成功了，把这个物品放到物品列表上，需要自己去拉一下**/
		public static const TRADE_SET_OTHER_GOODS_COMPLETE : int = UNIQUEID.NEXT;
		/**自己锁定状态改变了**/
		public static const TRADE_SET_MINE_LOCK : int = UNIQUEID.NEXT;
		/**目标锁定状态改变了**/
		public static const TRADE_SET_TARGET_LOCK : int = UNIQUEID.NEXT;
		
		/**目标确认了**/
		public static const TRADE_SET_TARGET_SURE : int = UNIQUEID.NEXT;
		
		/**我自己确认了**/
		public static const TRADE_SET_MINE_SURE : int = UNIQUEID.NEXT;
		
		/**我的银两改变了**/
		public static const TRADE_SET_MINE_MONEY_CHANGE : int = UNIQUEID.NEXT;
		
		/**目标银两改变了**/
		public static const TRADE_SET_TARGET_MONEY_CHANGE : int = UNIQUEID.NEXT;
		
		/** 邀请我交易的队列改变了 **/
		public static const TRADE_BEEN_INVITE : int = UNIQUEID.NEXT;
	}
}