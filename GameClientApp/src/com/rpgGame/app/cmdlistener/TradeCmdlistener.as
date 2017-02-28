package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.trade.TradeManager;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.trade.TradeTargetData;
	import com.rpgGame.coreData.lang.LangTrade;
	
	import flash.utils.ByteArray;
	
	import app.cmd.TradeModuleMessages;
	import app.message.GoodsProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;
	import org.game.netCore.net_protobuff.BytesUtil;
	
	public class TradeCmdlistener extends BaseBean
	{
		public function TradeCmdlistener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_SEND_TRADE_INVITE_FAIL,tradeInviteFail);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_RECEIVE_TRADE_INVITE,receiveTradeInvite);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_SEND_TRADE_INVITE_SUCCESS,tradeInviteSuccess);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_ACCEPT_TRADE_FAIL,acceptTradeFail);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_ACCEPT_TRADE_SUCCESS,acceptTradeSuccess);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_START_TRADING,startTrading);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_OTHER_REJECTED_TRADE,otherRejectedTrade);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_OTHER_ACCEPTED_BUT_YOU_ARE_IN_TRADE,otherAcceptedButYouAreInTrade);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_SET_GOODS_FAIL,setGoodsFail);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_SET_GOODS_SUCCESS,setGoodsSuccess);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_OTHER_SET_GOODS,otherSetGoods);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_REMOVE_GOODS_FAIL,removeGoodsFail);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_REMOVE_GOODS_SUCCESS,removeGoodsSuccess);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_OTHER_REMOVE_GOODS,targetRemoveGoods);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_LOCK_FAIL,lockFail);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_LOCK_SUCCESS,lockSuccess);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_OTHER_LOCKED,targetLock);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_CONFIRM_FAIL,sureFail);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_CONFIRM_SUCCESS,sureSuccess);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_OTHER_CONFIRM,targetSure);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_CANCEL_TRADE,cancelTrade);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_CANCEL_FAIL,cancelFail);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_TRADE_SUCCESS,tradeSuccess);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_SET_MONEY_FAIL,setMoneyFail);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_SET_MONEY_SUCCESS,setMoneySuccess);
			SocketConnection_protoBuffer.addCmdListener(TradeModuleMessages.S2C_OTHER_SET_MONEY,targetSetMoney);
			finish();
		}
		/**
		 * 收到别人发过来的交易请求, 保留2分钟, 2分钟未响应就直接删掉此请求, 不要自动发送拒绝消息
		 *
		 * 附带
		 *
		 * varint64 对方id
		 * varint32 对方等级
		 * UTFBytes 对方名字
		 */
		private function receiveTradeInvite(bytes:ByteBuffer):void
		{
			var beenInvite : TradeTargetData = new TradeTargetData();
			beenInvite.playerId = bytes.readVarint64();
			beenInvite.level = bytes.readVarint32();
			beenInvite.playerName = BytesUtil.readRemainUTF(bytes);
			TradeManager.receiveInviteTrade(beenInvite);
		}
		/**
		 * 交易对手设置了铜钱数, 收到服务器主动推送的提示
		 *
		 * 附带
		 *
		 * varint32 铜钱数
		 */
		private function targetSetMoney(bytes:ByteBuffer):void
		{
			var money : int = bytes.readVarint32();
			TradeManager.targetMoneyChange(money);
		}
		/**
		 * 设置铜钱失败, 附带varint32错误码
		 *
		 * 1. 你当前没在交易
		 * 2. 你没那么多铜钱
		 * 3. 不在正常状态
		 * 4. 最少要放2铜钱
		 */
		private function setMoneyFail(bytes:ByteBuffer):void
		{
			var error:int = bytes.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LangTrade.setMoneyFail_1;
					break;
				case 2:
					msg = LangTrade.setMoneyFail_2;
					break;
				case 3:
					msg = LangTrade.setMoneyFail_3;
					break;
				case 4:
					msg = LangTrade.setMoneyFail_4;
					break;
			}
			NoticeManager.showNotify(msg);
			trace("setMoneyFail error:"+error);
		}
		/**
		 * 设置铜钱成功, 将自己的铜钱框设为之前请求里附带的值
		 *
		 * 没有附带信息
		 */
		private function setMoneySuccess(bytes:ByteBuffer):void
		{
			TradeManager.setMoneyComplete();
		}
		/**
		 * 交易成功, 关闭交易面板. 交易提示里获得的银两/金子/获得的物品由客户端自己计算, 仅提示玩家, 这条消息不要改变玩家的银两和金子数
		 * 服务器会另外发送改变银两和金子的消息
		 *
		 * 收到后把自己放上交易的格子里的物品删除
		 *
		 * 附带
		 *
		 * while(byteArray.available)
		 *      varint32 每个交易得到的物品前往的背包格子 (物品的顺序是对方交易过来的物品顺序, 从0-5, 如果是空, 服务器会跳过)
		 *
		 * 如果收到的格子数少于交易过来的物品数, 则就只从前开始移消息中附带的物品个数到背包中. 对方交易来的后面的那些物品不显示. 服务器会另外用邮件发送
		 */
		private function tradeSuccess(bytes:ByteBuffer):void
		{
			var temp : Array = [];
			while(bytes.bytesAvailable)
			{
				temp.push(bytes.readVarint32());
			}
			TradeManager.endTrade(temp);
		}
		/**
		 * 请求取消交易失败, 附带varint32 错误码
		 *
		 * 1. 当前没有交易
		 */
		private function cancelFail(bytes:ByteBuffer):void
		{
//			var error:int = bytes.readVarint32();
			NoticeManager.showNotify(LangTrade.cancelFail);
			trace("cancelFail error:");
		}
		/**
		 * 取消交易, 在交易的任何阶段都可能会收到, 就算两边都已确认成功. 收到后关闭交易框, 并解锁所有上交易物品
		 *
		 * 附带varint32 原因
		 *
		 * 1. 自己银两不足以交易
		 * 2. 自己金子不足以交易
		 * 3. 自己背包格子不够
		 * 4. 对方银两不足以交易
		 * 5. 对方金子不足以交易
		 * 6. 对方背包格子不够
		 * 7. 自己取消了交易
		 * 8. 对方取消了交易
		 * 9. 对方下线了
		 * 10. 自己银两超过负荷
		 * 11. 自己金子超过负荷
		 * 12. 对方银两超过负荷
		 * 13. 对方金子超过负荷
		 * 14. 数据错误
		 */
		private function cancelTrade(bytes:ByteBuffer):void
		{
			var error:int = bytes.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LangTrade.cancelTrade_1;
					break;
				case 2:
					msg = LangTrade.cancelTrade_2;
					break;
				case 3:
					msg = LangTrade.cancelTrade_3;
					break;
				case 4:
					msg = LangTrade.cancelTrade_4;
					break;
				case 5:
					msg = LangTrade.cancelTrade_5;
					break;
				case 6:
					msg = LangTrade.cancelTrade_6;
					break;
				case 7:
//					msg = LangTrade.cancelTrade_7;
					break;
				case 8:
					msg = LangTrade.cancelTrade_8;
					break;
				case 9:
					msg = LangTrade.cancelTrade_9;
					break;
				case 10:
					msg = LangTrade.cancelTrade_10;
					break;
				case 11:
					msg = LangTrade.cancelTrade_11;
					break;
				case 12:
					msg = LangTrade.cancelTrade_12;
					break;
				case 13:
					msg = LangTrade.cancelTrade_13;
					break;
				case 14:
					msg = LangTrade.cancelTrade_14;
					break;
			}
			NoticeManager.showNotify(msg);
			trace("cancelTrade error:"+error);
			TradeManager.cancelTrade();
		}
		
		/**
		 * 对方已确认. 就算双方都已确认, 都不要关闭交易框, 等服务器后续通知
		 *
		 * 没有附带的信息
		 */
		private function targetSure(bytes:ByteBuffer):void
		{
			TradeManager.targetSure();
		}
		/**
		 * 确认成功. 就算双方都已确认, 都不要关闭交易框, 等服务器后续通知
		 *
		 * 没有附带的信息
		 */
		private function sureSuccess(bytes:ByteBuffer):void
		{
			TradeManager.mineSure();
		}
		/**
		 * 确认失败
		 *
		 * 1. 你当前没有交易
		 * 2. 交易不在双方都锁定状态 (或者你已经确认)
		 */
		private function sureFail(bytes:ByteBuffer):void
		{
			var error:int = bytes.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LangTrade.sureFail_1;
					break;
				case 2:
					msg = LangTrade.sureFail_2;
					break;
			}
			NoticeManager.showNotify(msg);
			trace("sureFail error:"+error);
		}
		/**
		 * 对方已锁定. 如果自己也是锁定成功状态, 则切为双方都锁定状态, 不然自己还在正常状态, 将对方设为已锁定
		 *
		 * 没有附带的信息
		 */
		private function targetLock(bytes:ByteBuffer):void
		{
			TradeManager.targetLock();
		}
		/**
		 * 锁定成功. 如果对方也是锁定成功状态, 则切为双方都锁定状态, 不然则切为自己已锁定状态
		 *
		 * 没有附带的信息
		 */
		private function lockSuccess(bytes:ByteBuffer):void
		{
			TradeManager.mineLock();
		}
		/**
		 * 锁定失败, 附带varint32 错误码
		 *
		 * 1. 当前不是正常状态
		 * 2. 当前没有交易
		 */
		private function lockFail(bytes:ByteBuffer):void
		{
			var error:int = bytes.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LangTrade.lockFail_1;
					break;
				case 2:
					msg = LangTrade.lockFail_2;
					break;
			}
			NoticeManager.showNotify(msg);
			trace("lockFail error:"+error);
		}
		
		private function targetRemoveGoods(bytes:ByteBuffer):void
		{
			var index:int = bytes.readVarint32();
			TradeManager.targetRemoveGoods(index);
		}
		/**
		 * 拿下物品成功, 没有附带信息, 客户端自己把之前消息里附带的位置的物品拿下交易, 解锁此物品
		 */
		private function removeGoodsSuccess(bytes:ByteBuffer):void
		{
			TradeManager.mineRemoveGoodsComplete();
		}
		/**
		 * 拿下物品失败, 附带varint32 错误码
		 *
		 * 1. 格子非法, 必须是0-5
		 * 2. 你当前没有交易
		 * 3. 交易不在正常状态
		 * 4. 那个位置没有物品 (不需要提示)
		 */
		private function removeGoodsFail(bytes:ByteBuffer):void
		{
			var error:int = bytes.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LangTrade.removeGoodsFail_1;
					break;
				case 2:
					msg = LangTrade.removeGoodsFail_2;
					break;
				case 3:
					msg = LangTrade.removeGoodsFail_3;
					break;
				case 4:
					msg = LangTrade.removeGoodsFail_4;
					break;
			}
			NoticeManager.showNotify(msg);
			trace("removeGoodsFail error:"+error);
			TradeManager.mineRemoveGoodsFail();
		}
		/**
		 * 交易对方放上了物品
		 *
		 * 附带
		 *
		 * varint32 那个交易格子
		 * byteArray.readBytes(byteArray.availableBytes) 物品动态数据
		 */
		private function otherSetGoods(bytes:ByteBuffer):void
		{
			/*var index:int = bytes.readVarint32();
			var goods : GoodsProto = new GoodsProto();
			goods.mergeFrom(bytes);
			var item : GridInfo = new GridInfo(ItemContainerID.TRADE_TARGET,index);
			item.data =  ItemUtil.convertGoodsProtoToItemInfo(goods);
			item.realIndex = index;
			TradeManager.targetSetGoods(item);*/
		}
		/**
		 * 放物品上去成功, 把收到消息的时候, 在之前消息中附带的格子中的物品, 放到消息中附带的交易格子中去. (未必是当时拖的那个物品, 可能这条消息之前客户端又收到了物品移动消息)
		 * 必须是收到消息的时候, 那个格子里的物品放上交易
		 *
		 * 如果之前那个格子里已经有物品, 则将那个物品下交易, 并解除那物品正在交易状态
		 */
		private function setGoodsSuccess(bytes:ByteBuffer):void
		{
			TradeManager.setMineGoodsComplete();
		}
		/**
		 * 设置物品失败, 附带错误码
		 *
		 * 1. 交易格子非法, 必须是0-5
		 * 2. 背包中那个位置没有物品 (这个不需要提示)
		 * 3. 物品id和实际在那个位置的物品不符 (这个也不需要提示)
		 * 4. 交易不在正常状态
		 * 5. 你当前没有交易
		 * 6. 该物品不能被交易 (绑定或已过期)
		 * 7. 这个物品已经在交易中
		 * 8. 背包中的格子非法, 必须是0-已开格子数
		 */
		private function setGoodsFail(bytes:ByteBuffer):void
		{
			var error:int = bytes.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LangTrade.setGoodsFail_1;
					break;
				case 2:
					msg = LangTrade.setGoodsFail_2;
					break;
				case 3:
					msg = LangTrade.setGoodsFail_3;
					break;
				case 4:
					msg = LangTrade.setGoodsFail_4;
					break;
				case 5:
					msg = LangTrade.setGoodsFail_5;
					break;
				case 6:
					msg = LangTrade.setGoodsFail_6;
					break;
				case 7:
					msg = LangTrade.setGoodsFail_7;
					break;
				case 8:
					msg = LangTrade.setGoodsFail_8;
					break;
			}
			NoticeManager.showNotify(msg);
			trace("setGoodsFail error:"+error);
			TradeManager.setMineGoodsFail();
		}
		/**
		 * 发出的邀请, 对方同意了, 可是你正在交易中. 删掉邀请者邀请对方的记录, 使邀请者可以再邀请
		 *
		 * 附带
		 *
		 * varint64 对方id
		 */
		private function otherAcceptedButYouAreInTrade(bytes:ByteBuffer):void
		{
			var id : Number = bytes.readVarint64();
			TradeManager.unLockInvitePlayer(id);
		}		
		
		/**
		 * 发出的邀请被对方拒绝后, 发邀请者会收到. 这时删掉邀请者的邀请对方的记录, 使邀请者可以再次发出对这人的邀请
		 *
		 * 附带
		 *
		 * varint64 对方id
		 */
		private function otherRejectedTrade(bytes:ByteBuffer):void
		{
			var id : Number = bytes.readVarint64();
			TradeManager.unLockInvitePlayer(id);
		}
		/**
		 * 开始交易, 弹出交易面板
		 *
		 * 附带交易对手的信息
		 *
		 * varint64 对方id
		 * varint32 对方等级
		 *
		 * 后面方法改成通用方法
		 * varint32 后面换装数据的长度
		 * while(buffer.readable()){
		 *      byte 换装资源
		 * }
		 *
		 * UTFBytes 对方名字
		 */
		private function startTrading(bytes:ByteBuffer):void
		{
			var playerId : Number = bytes.readVarint64();
			var level:int = bytes.readVarint32();
			var resourcesLen : int = bytes.readVarint32();
			var buffer : ByteArray = new ByteArray();
			bytes.readBytes(buffer, 0, resourcesLen);
			var playerName : String = BytesUtil.readRemainUTF(bytes);
			TradeManager.startTrading(playerId,playerName,level);
		}
		
		/**
		 * 交易同意成功, 紧接着马上会收到开始交易的消息S2C_START_TRADING
		 * 收到后解回复交易的锁, 不需要提示什么
		 */
		private function acceptTradeSuccess(bytes:ByteBuffer):void
		{
			TradeManager.unlockReplayInvite();
		}
		/**
		 * 接受交易邀请失败, 附带varint32 错误码
		 *
		 * 1. 你已经在交易中了
		 * 2. 对方已经在交易中了
		 * 3. 对方下线了
		 * 4. 邀请过期了
		 * 5. 距离过远
		 */
		private function acceptTradeFail(bytes:ByteBuffer):void
		{
			TradeManager.unlockReplayInvite();
			var error:int = bytes.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LangTrade.acceptTradeFail_1;
					break;
				case 2:
					msg = LangTrade.acceptTradeFail_2;
					break;
				case 3:
					msg = LangTrade.acceptTradeFail_3;
					break;
				case 4:
					msg = LangTrade.acceptTradeFail_4;
					break;
				case 5:
					msg = LangTrade.acceptTradeFail_5;
					break;
			}
			NoticeManager.showNotify(msg);
			trace("acceptTradeFail error:"+error);
		}
		/**
		 * 邀请已发出, 等待对方回应. 客户端需要自己计时, 2分钟之内, 如果没有收到对方拒绝/同意的消息, 不能再发送邀请这个人的消息给服务器, 直接提示.
		 * 2分钟后, 如果策划需要, 客户端自己弹出提示说对方没有回应邀请, 服务器不会再有消息说邀请过期. 之后可以再发邀请给他
		 */
		private function tradeInviteSuccess(bytes:ByteBuffer):void
		{
			TradeManager.invitePlayerSuccess();
		}
		/**
		 * 邀请失败, 附带varint32 错误码
		 *
		 * 1. 对方不在线
		 * 2. 你在交易中
		 * 3. 对方在交易中
		 * 4. 你之前已经邀请过对方了
		 * 5. 对方设置拒绝所有交易请求
		 * 6. 对方是别的联服的
		 * 7. 距离过远
		 */
		private function tradeInviteFail(bytes:ByteBuffer):void
		{
			var error:int = bytes.readVarint32();
			var msg : String;
			switch(error)
			{
				case 1:
					msg = LangTrade.tradeInviteFail_1;
					break;
				case 2:
					msg = LangTrade.tradeInviteFail_2;
					break;
				case 3:
					msg = LangTrade.tradeInviteFail_3;
					break;
				case 4:
					msg = LangTrade.tradeInviteFail_4;
					break;
				case 5:
					msg = LangTrade.tradeInviteFail_5;
					break;
				case 6:
					msg = LangTrade.tradeInviteFail_6;
					break;
				case 7:
					msg = LangTrade.tradeInviteFail_7;
					break;
			}
			NoticeManager.showNotify(msg);
			trace("tradeInviteFail error:"+error);
			TradeManager.clearTrade();
		}
	}
}