package com.rpgGame.app.sender
{
	import app.cmd.TradeModuleMessages;

	public class TradeSender extends BaseSender
	{
		public function TradeSender()
		{
		}
		/**
		 * 发送邀请请求给其他人, 当前不能正在交易, 且不能重复邀请同一个人. 且需等待服务器返回之后才能发邀请给其他人
		 *
		 * 附带
		 *
		 * varint64 对方id
		 */
		public static function tradeInvite(target:Number):void
		{
			_bytes.clear();
			_bytes.writeVarint64(target);
			send(TradeModuleMessages.C2S_SEND_TRADE_INVITE,_bytes);
		}
		/**
		 * 设置成 自动拒绝所有交易请求. 自己还是可以发送邀请给别人
		 *
		 * 服务器没有返回, 客户端只需要发消息通知服务器就行
		 */
		public static function autoRejectToTrue():void
		{
			_bytes.clear();
			send(TradeModuleMessages.C2S_SET_AUTO_REJECT_TO_TRUE,_bytes);
		}
		/**
		 * 不勾 自动拒绝所有交易请求, 别人可以给他发邀请.
		 *
		 * 服务器没有返回
		 */
		public static function autoRejectToFalse():void
		{
			_bytes.clear();
			send(TradeModuleMessages.C2S_SET_AUTO_REJECT_TO_FALSE,_bytes);
		}
		/**
		 *  varint64 对方id
		 * boolean 是否同意交易
		 */
		public static function replyTradeInvite(player:Number,isAgree:Boolean):void
		{
			_bytes.clear();
			_bytes.writeVarint64(player);
			_bytes.writeBoolean(isAgree);
			send(TradeModuleMessages.C2S_REPLY_TRADE_INVITE,_bytes);
		}
		
		/**
		 * varint32 要放到哪个交易格子 0-5
         * varint32 要从背包中哪个位置放东西上去
         * varint32 要放的物品的id (以防万一)
		 */
		public static function tradeSetGoods(index:int,pos:int,id:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(index);
			_bytes.writeVarint32(pos);
			_bytes.writeVarint32(id);
			send(TradeModuleMessages.C2S_SET_GOODS,_bytes);
		}
		
		/**
		 * 将已放上交易的物品拿下, 必须是在正常交易状态时发送
		 *
		 * 附带
		 *
		 * varint32 交易格子 0-5
		 */
		public static function removeGoodsByIndex(index:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(index);
			send(TradeModuleMessages.C2S_REMOVE_GOODS,_bytes);
		}
		/**
		 * 锁定. 必须是正常交易状态
		 *
		 * 没有附带的信息
		 */
		public static function lockTrade():void
		{
			_bytes.clear();
			send(TradeModuleMessages.C2S_LOCK,_bytes);
		}
		/**
		 * 确认交易. 在双方都锁定状态下可发, 自己已确认时, 不能再发
		 *
		 * 这条消息可以不会收到专门的返回, 可能收到取消交易S2C_CANCEL_TRADE的消息
		 *
		 * 没有附带信息
		 */
		public static function mineSure():void
		{
			_bytes.clear();
			send(TradeModuleMessages.C2S_CONFIRM,_bytes);
		}
		/**
		 * 客户端请求取消交易, 任何时间都可以发送
		 *
		 * 没有附带的信息
		 */
		public static function cancelTrade():void
		{
			_bytes.clear();
			send(TradeModuleMessages.C2S_CANCEL,_bytes);
		}
		
		public static function setMoney(money:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(money);
			send(TradeModuleMessages.C2S_SET_MONEY,_bytes)
		}
	}
}