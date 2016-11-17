package com.rpgGame.app.sender
{
	import com.rpgGame.app.utils.ReqLockUtil;
	
	import app.cmd.ShopModuleMessages;
	
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	
	import utils.TimerServer;

	/**
	 *商店系统
	 * @author lpp
	 * ModuleID==7
	 */
	public class ShopSender extends BaseSender
	{
		public function ShopSender()
		{
			super();
		}
		
		/**
		 * 请求打开NPC 
		 * @param npcId
		 * @param listIndex 功能列表索引
		 * 
		 */		
		public static function reqOpenNpcShop(shopId:int):void
		{
			if( ReqLockUtil.isReqLocked( ShopModuleMessages.C2S_OPEN_NPC_SHOP ) )
				return;
			ReqLockUtil.lockReq( ShopModuleMessages.C2S_OPEN_NPC_SHOP, 5 * 1000 );
			
			_bytes.clear();
			_bytes.writeVarint32(shopId);
			SocketConnection_protoBuffer.send(ShopModuleMessages.C2S_OPEN_NPC_SHOP,_bytes);
		}
		
		/**
		 * 请求回购物品
		 * @param buyBackId
		 * @param gridId
		 * 
		 */		
		public static function reqBuyBackGoods(buyBackId:int, gridId:int ):void
		{
			if( ReqLockUtil.isReqLocked( ShopModuleMessages.C2S_BUY_BACK_GOODS ) )
				return;
			ReqLockUtil.lockReq( ShopModuleMessages.C2S_BUY_BACK_GOODS, 5 * 1000 );
			
			_bytes.clear();
			_bytes.writeVarint32(buyBackId);
			_bytes.writeVarint32(gridId);
			SocketConnection_protoBuffer.send(ShopModuleMessages.C2S_BUY_BACK_GOODS,_bytes);
		}
		
		/**
		 * 卖出物品发送C2S_SELL_GOODS，附带以下信息
		 * byte 卖出物品的位置(背包中)
		 */	
		public static  function reqSellGoods( gridid:int ):void
		{
			_bytes.clear();
			_bytes.writeByte(gridid);
			SocketConnection_protoBuffer.send(ShopModuleMessages.C2S_SELL_GOODS, _bytes);
		}
		
		/**
		 * 购买商店物品，发送C2S_BUY_SHOP_GOODS消息，附带以下信息
		 * varint32 shopId (从ShopProto中读取)
		 * varint32 tabIndex (从ShopProto中读取)
		 * varint32 goodsIndex 从0开始
		 * varint32 count
		 * varint64 npcId(有则传，无则不用传)
		 */
		public static function reqBuyGoods(shopId:int, tabIndex:int, goodsIndex:int, count:int, npcId:int=0):void
		{
			if( ReqLockUtil.isReqLocked( ShopModuleMessages.C2S_BUY_SHOP_GOODS ) )
				return;
			ReqLockUtil.lockReq( ShopModuleMessages.C2S_BUY_SHOP_GOODS, 5 * 1000 );
			
			_bytes.clear();
			_bytes.writeVarint32(shopId);
			_bytes.writeVarint32(tabIndex);
			_bytes.writeVarint32(goodsIndex);
			_bytes.writeVarint32(count);
			
			if(npcId > 0)
			{
				_bytes.writeVarint64(npcId);
			}
			SocketConnection_protoBuffer.send(ShopModuleMessages.C2S_BUY_SHOP_GOODS, _bytes);
		}
		
		
		/**
		 * 购买商店物品，发送C2S_BUY_JINZI_SHOP_GOODS消息，附带以下信息
		 * byte 消费类型 0-银两 1-绑金  2-金子
		 * varint32 goodsId
		 * varint32 count
		 */
		public static function reqBuyJinziShopGoods( type:int, goodsId:int, count:int ):void
		{
			if( ReqLockUtil.isReqLocked( ShopModuleMessages.C2S_BUY_JINZI_SHOP_GOODS ) )
				return;
			ReqLockUtil.lockReq( ShopModuleMessages.C2S_BUY_JINZI_SHOP_GOODS, 5 * 1000 );
			
			_bytes.clear();
			_bytes.writeByte(type);
			_bytes.writeVarint32(goodsId);
			_bytes.writeVarint32(count);
			SocketConnection_protoBuffer.send(ShopModuleMessages.C2S_BUY_JINZI_SHOP_GOODS, _bytes);
		}
		
		/**
		 * 装备修理
		 * varint32  容器类型
		 * varint32 装备位置
		 * varint32 装备id，防止错误
		 * bool 使用银两替代绑银
		 */
		public static function reqRepairGoods( containerId:int, index:int, goodsId:int, usebind:Boolean=true):void
		{
			_bytes.clear();
			_bytes.writeByte(containerId);
			_bytes.writeVarint32(index);
			_bytes.writeVarint32(goodsId);
			_bytes.writeBoolean(usebind);
			SocketConnection_protoBuffer.send(ShopModuleMessages.C2S_REPAIR_GOODS, _bytes);
		}
		
		/**
		 * 装备修理all所有
		 *
		 * bool 使用银两替代绑银
		 */
		public static function reqRepairGoodsAll(usebind:Boolean=true):void
		{
			//请求间隔
			if(!TimerServer.hasPassedTime(ShopModuleMessages.C2S_REPAIR_GOODS_ALL, 5 * 1000))
			{
				return;
			}
			_bytes.clear();
			_bytes.writeBoolean(usebind);
			SocketConnection_protoBuffer.send(ShopModuleMessages.C2S_REPAIR_GOODS_ALL, _bytes);
		}
	}
}