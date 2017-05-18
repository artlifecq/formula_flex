package com.rpgGame.app.sender
{
	import com.rpgGame.netData.shop.bean.ShopItemInfo;
	import com.rpgGame.netData.shop.message.CSBuyItemMessage;
	import com.rpgGame.netData.shop.message.CSRebuyListMessage;
	import com.rpgGame.netData.shop.message.CSRebuyMessage;
	import com.rpgGame.netData.shop.message.CSSellItemMessage;
	import com.rpgGame.netData.shop.message.CSSellItemsMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;

	/**
	 *商店系统
	 * @author yfl
	 */
	public class ShopSender extends BaseSender
	{
		public function ShopSender()
		{
			super();
		}
		/**
		 * 
		 * @param _shopType 商店类型
		 * @param shopvo 商品信息
		 * @param num 数量
		 * @param costType 货币类型
		 * @param _discountItemid 是否使用折扣卡
		 */        
		public static function ReqBuyItem(shopvo:ShopItemInfo, num:int, _discountItemid:long = null):void
		{
			if (shopvo == null)
				return;
			var msg:CSBuyItemMessage = new CSBuyItemMessage();
			msg.shopItemId = shopvo.shopItemId;
			msg.num = num;
			msg.shopItemId = shopvo.shopItemId;
			
			
			SocketConnection.send(msg);
			//			Mgr.musicMgr.playSoundCom(117);
		}
		
		/**
		 * 请求卖物品
		 * 
		 */
		public static function ReqSellItem(itemId : long): void{
			var msg : CSSellItemMessage = new CSSellItemMessage();
			msg.itemId = itemId;
			SocketConnection.send(msg);
			//			Mgr.musicMgr.playSoundCom(115);
		}
		/**
		 * 批量卖物品 
		 * @param items
		 * 
		 */		
		public static function ReqSellItems( items:Vector.<long> ):void
		{
			var msg:CSSellItemsMessage = new CSSellItemsMessage();
			msg.itemId = items;
			SocketConnection.send(msg);
			//			Mgr.musicMgr.playSoundCom(115);
		}
		
		public static function ReqRebuyList(): void
		{
			var msg : CSRebuyListMessage = new CSRebuyListMessage();
			SocketConnection.send(msg);
		}
		
		/**
		 * 回购物品
		 * @param itemId
		 */		
		public static function ReqRebuyItem(itemId : long): void
		{
			var msg : CSRebuyMessage = new CSRebuyMessage();
			msg.itemId = itemId;
			SocketConnection.send(msg);
		}
	}
}