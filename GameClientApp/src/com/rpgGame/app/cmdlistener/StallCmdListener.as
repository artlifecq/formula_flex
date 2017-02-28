package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.stall.StallManager;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.StallEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StallCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.info.stall.StallItemData;
	import com.rpgGame.coreData.lang.LangStall;
	import com.rpgGame.coreData.utils.MoneyUtil;
	
	import flash.utils.ByteArray;
	
	import app.cmd.StallModuleMessages;
	import app.message.ChangeToBuyGoodsType;
	import app.message.ChangeToSellGoodsType;
	import app.message.StallBuyGoodsProto;
	import app.message.StallDetailProto;
	import app.message.StallSellGoodsProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	public class StallCmdListener extends BaseBean
	{
		public function StallCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_STALL_FAIL,stallFail);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_STALL,stallComplete);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_STALL_BROADCAST,stallBroadcast);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_CANCEL_STALL,cancelStall);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_CANCEL_STALL_BROADCAST,cancelStallBroadcast);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_CHANGE_TO_SELL_GOODS,changeToSellGoods);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_CHANGE_TO_SELL_GOODS_UNLOCK,changeToSellGoodsFailUnlock);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_CHANGE_TO_BUY_GOODS,changeToBuyGoods);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_CHANGE_TO_BUY_GOODS_UNLOCK,changeToBuyGoodsFailUnlock);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_STALL_TYPE_LEFT_TIME_CHANGED,buyStallType);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_GET_STALL_DETAIL,getStallDetail);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_BUY_STALL_GOODS,buyStallGoods);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_STALL_OWNER_SELL_SUCCESS,stallOwnerSellSuccess);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_SELL_GOODS_TO_STALL,sellGoodsToStall);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_STALL_OWNER_BUY_SUCCESS,stallOwnerBuySuccess);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_SET_AD,setAdComplete);
			SocketConnection_protoBuffer.addCmdListener(StallModuleMessages.S2C_AD_BROADCAST,adBroadcast);
			finish();
		}
		/**
		 * 广告广播
		 *
		 * bytes 广告内容
		 */
		private function adBroadcast(buffer:ByteBuffer):void
		{
			var str : String = buffer.readUTFBytes(buffer.bytesAvailable);
			NoticeManager.showNotify(LangStall.autoAdAlert,str);
		}
		/**
		 * 设置广告成功
		 *
		 * bool 开启(true)/关闭(false)
		 *
		 * if(成功){
		 *      客户端自己把当前时间加上广告cd
		 * }
		 */
		private function setAdComplete(buffer:ByteBuffer):void
		{
			var isOpen : Boolean = buffer.readBoolean();
			if(isOpen)
				StallManager.setAutoAdComplete();
			else
				StallManager.cancelAutoAdComplete();
		}
		/**
		 * 告诉商家,你收购了产品了
		 *
		 * varint32 收购产品的槽位
		 * varint32 收购的物品id
		 * varint32 收购的物品数量,客户端自己算出有多少个物品要自己去领取,还剩余多少的收购物品数量
		 * varint32 出售价格
		 */
		private function stallOwnerBuySuccess(buffer:ByteBuffer):void
		{
			var index : int = buffer.readVarint32();
			var itemId : int = buffer.readVarint32();
			var getNum:int = buffer.readVarint32();
			var price : int = buffer.readVarint32();
			StallManager.buyItemComplete(index,itemId,getNum,price);
		}
		/**
		 * 出售物品给收购摊位成功,背包中增加银两通过其他消息来广播
		 *
		 * varint32 摊位id
		 * varint32 获得的银两,用于提示
		 */
		private function sellGoodsToStall(buffer:ByteBuffer):void
		{
			var id : int = buffer.readVarint32();
			var getSilver : int = buffer.readVarint32();
			NoticeManager.showNotify(LangStall.sellGoodsToStallComplete,MoneyUtil.getHtmlMoneyString(getSilver));
		}
		/**
		 * 告诉商家,你卖出了产品了
		 *
		 * varint32 出售的物品的槽位
		 * varint32 出售的物品id
		 * varint32 出售物品数量
		 * varint32 出售单价,客户端自己算出这个位置是下架了或者剩余物品数量
		 */
		private function stallOwnerSellSuccess(buffer:ByteBuffer):void
		{
			var index : int = buffer.readVarint32();
			var id : int = buffer.readVarint32();
			var sellNum : int = buffer.readVarint32();
			var price : int = buffer.readVarint32();
			
			var stallItem : StallItemData = StallManager.selfStallData.getStallSellItem(index);
			if(stallItem.itemId != id)
			{
				trace("服务器发过来的物品和客户端缓存的物品不是一个东西");
				return;
			}
			
			stallItem.num = stallItem.num - sellNum;
			stallItem.item.count = stallItem.num;
			if(stallItem.num == 0)
				stallItem.item = null;
			stallItem.price = price;
			var itemName : String = ItemConfig.getItemName(id);
			NoticeManager.showNotify(LangStall.buyStallItemComplete,itemName,sellNum);
			StallManager.addStallInfo(LanguageConfig.getText(LangStall.infoSellGoods,TimeUtil.getCurrentTimeFromt(),
				itemName,
				sellNum,
				MoneyUtil.getHtmlMoneyString(price*sellNum),
				MoneyUtil.getHtmlMoneyString(price*sellNum*StallCfgData.tax)));
			EventManager.dispatchEvent(StallEvent.STALL_UPDATE);
			
		}
		/**
		 * 购买成功,收到物品会是其他消息推送,收到该消息以后,可以立刻来请求详细信息
		 *
		 * varint32 摊位id
		 * varint32 获得物品数量
		 */
		private function buyStallGoods(buffer:ByteBuffer):void
		{
			var stallId : int = buffer.readVarint32();
			var num : int = buffer.readVarint32();
			StallManager.buyGoodsFromOtherStallComplete(stallId,num);
		}
		/**
		 * 返回店铺的详细信息,如果客户端视野里面有这个玩家以及这个摊位,缓存
		 *
		 * if(buffer.readable()){
		 *      解压缩
		 *      bytes StallDetailProto
		 * } else {
		 *      直接用旧的数据进行展示
		 * }
		 */
		private function getStallDetail(buffer:ByteBuffer):void
		{
			if(buffer.bytesAvailable)
			{
				var byte : ByteArray = new ByteArray();
				buffer.readBytes(byte);
				byte.uncompress();
				var detail : StallDetailProto = new StallDetailProto();
				detail.mergeFrom(byte);
				StallManager.getStallDetail(detail);
			}
		}
		/**
		 *
		 * varint32 摊位类型
		 * varint64 剩余摊位时长,如果当前在摆摊,这个摊位时长,是包括你从购买到现在总共的时长
		 *          那么还剩余多久,要减去摊位开始摆摊到现在摆摊的时长,这个需要特殊注意
		 */
		private function buyStallType(buffer:ByteBuffer):void
		{
			var type : int = buffer.readVarint32();
			var time : Number = buffer.readVarint64();
			StallManager.buyStallType(type,time);
		}
		/**
		 * 修改我要收购的物品失败解锁
		 */
		private function changeToBuyGoodsFailUnlock(buffer:ByteBuffer):void
		{
//			NoticeManager.showNotify(LangStall.changeToBuyGoodsFailUnlock);
//			ReqLockUtil.unlockReq(StallModuleMessages.C2S_CHANGE_TO_BUY_GOODS);
		}
		/**
		 * 修改收购物品成功
		 *
		 * varint32 收购物品的类型 0 不收购了/1 修改收购价格/2 修改收购数量/3 收购新的产品
		 * varint32 收购物品的槽位
		 *
		 * if(收购类型不是不收购了){
		 *      bytes StallBuyGoodsProto
		 * }
		 */
		private function changeToBuyGoods(buffer:ByteBuffer):void
		{
			var type : int = buffer.readVarint32();
			var index : int = buffer.readVarint32();
//			ReqLockUtil.unlockReq(StallModuleMessages.C2S_CHANGE_TO_BUY_GOODS);
			if(type != ChangeToBuyGoodsType.BUY_GOODS_DOWN)
			{
				var stallSellGoods : StallBuyGoodsProto= new StallBuyGoodsProto();
				stallSellGoods.mergeFrom(buffer);
				StallManager.updateStallBuyItemByProto(index,stallSellGoods);
			}else
				StallManager.closeBuyStallItem(index);
		}
		/**
		 * 修改我要出售的物品失败解锁
		 */
		private function changeToSellGoodsFailUnlock(buffer:ByteBuffer):void
		{
//			NoticeManager.showNotify(LangStall.changeToSellGoodsFailUnlock);
//			ReqLockUtil.unlockReq(StallModuleMessages.C2S_CHANGE_TO_SELL_GOODS);
		}
		/**
		 * 要出售的物品变更了
		 *
		 * varint32 修改类型,用于提示
		 * varint32 出售物品的槽位
		 *
		 * if(修改类型不是下架){
		 *      bytes StallSellGoodsProto
		 * }
		 */
		private function changeToSellGoods(buffer:ByteBuffer):void
		{
//			ReqLockUtil.unlockReq(StallModuleMessages.C2S_CHANGE_TO_SELL_GOODS);
			var type : int = buffer.readVarint32();
			var index : int = buffer.readVarint32();
			if(type != ChangeToSellGoodsType.SELL_GOODS_DOWN)
			{
				var stallSellGoods : StallSellGoodsProto= new StallSellGoodsProto();
				stallSellGoods.mergeFrom(buffer);
				StallManager.updateStallSellItemByProto(index,stallSellGoods);
			}else
				StallManager.closeSellGoods(index);
		}
		/**
		 * 撤摊广播
		 *
		 * varint64 撤摊的玩家id,标记该玩家的状态为没有摆摊中
		 */
		private function cancelStallBroadcast(buffer:ByteBuffer):void
		{
			var id : Number = buffer.readVarint64();
			StallManager.cancelStallBroadcast(id);
		}
		/**
		 * 撤销成功,如果客户端有需要,可以加个提示
		 */
		private function cancelStall(buffer:ByteBuffer):void
		{
			NoticeManager.showNotify(LangStall.cancelStall);
			StallManager.cancelStall();
		}
		/**
		 * 摆摊广播 标记该玩家的状态为摆摊中
		 *
		 * varint64 玩家id
		 * varint32 摊位id
		 * varint32 摊位类型
		 * bytes 摊位名字
		 */
		private function stallBroadcast(buffer:ByteBuffer):void
		{
			var player : Number = buffer.readVarint64();
			var stallId : int = buffer.readVarint32();
			var stallType : int = buffer.readVarint32();
			var stallName : String = buffer.readUTFBytes(buffer.bytesAvailable);
			StallManager.updateStallBroadcast(player,stallId,stallType,stallName);
		}
		/**
		 * 摆摊成功,只是一个提示性的,如果客户端需要可以用来提示
		 */
		private function stallComplete(buffer:ByteBuffer):void
		{
			NoticeManager.showNotify(LangStall.stallComplete);
			StallManager.startStall();
		}
		/**
		 * 摆摊模块通用错误码,返回varint32错误码
		 *
		 * 1.没有摊位
		 * 2.有摊位了
		 * 3.银两不够
		 * 4.物品不够
		 * 5.银两已满
		 * 6.背包已满
		 * 7.距离过远
		 * 8.物品出售单价非法
		 * 9.物品位置非法
		 * 10.物品出售数量非法
		 * 11.操作过于频繁
		 * 12.只有在本国或者中立区才可以摆摊
		 * 13.当前状态无法执行该操作
		 * 14.未知的摊位
		 * 15.该摊位其他人已经占据了
		 * 16.非法的摊位类型
		 * 17.该摊位类型时间不够
		 * 18.当前摊位类型无法购买这么多种类的物品
		 * 19.当前摊位类型无法出售这么多种类的物品
		 * 20.摊位起码要出售一件物品
		 * 21.该物品不可以呗收购
		 * 22.要收购的物品数量非法
		 * 23.物品收购价格非法
		 * 24.无法切换到该摊位类型
		 * 25.该摊位类型不需要购买
		 * 26.非法的购买时长
		 * 27.名字没有变化
		 * 28.当前摊位无法设置广告
		 * 29.要购买的产品位置非法
		 * 30.要购买的产品下架了
		 * 31.产品信息已经变更
		 * 32.要购买的产品卖光了
		 * 33.你一次购买的产品太多了,无法购买
		 * 34.产品信息单价变更
		 * 35.出售的产品位置非法
		 * 36.要收购的产品下架了
		 * 37.收购的产品变更了
		 * 38.收购的产品价格变更了
		 * 39.出售的物品位置非法
		 * 40.出售的物品在背包中的数量不够
		 * 41.摊位不需要收购这么多产品
		 * 42.要操作出售物品位置非法
		 * 43.操作出售物品的类型非法
		 * 44.操作的出售物品已经下架
		 * 45.操作的出售物品已经卖光了
		 * 46.新的出售价格非法
		 * 47.要减少的数量非法
		 * 48.没有银两可以领取
		 * 49.操作位置有产品无法上架新产品
		 *
		 * 50.要操作收购物品位置非法
		 * 51.操作收购物品的类型非法
		 * 52.操作的收购物品已经下架
		 * 53.新的收购价格非法
		 * 54.要变更的数量非法
		 * 55.没有物品可以领取
		 * 56.操作位置有产品无法上架新产品
		 *
		 * 100.服务器bug
		 */
		private function stallFail(buffer:ByteBuffer):void
		{
			var fail : int = buffer.readVarint32();
			NoticeManager.showNotify("stallFail"+fail);
		}
	}
}