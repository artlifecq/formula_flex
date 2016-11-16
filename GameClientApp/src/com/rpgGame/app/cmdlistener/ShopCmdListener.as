package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.SmallShopItemManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.core.events.ShopEvent;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.shop.ShopBuyBackGoodsData;
	import com.rpgGame.coreData.info.shop.ShopItemBuyInfo;
	import com.rpgGame.coreData.type.ShopType;
	import com.rpgGame.coreData.type.item.ItemQualityType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.utils.ByteArray;
	
	import app.cmd.ShopModuleMessages;
	import app.message.ShopProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	/**
	 *
	 * @author lpp
	 */
	public class ShopCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection_protoBuffer.addCmdListener(ShopModuleMessages.S2C_OPEN_NPC_SHOP,onOpenNpcShopSuccess);
			SocketConnection_protoBuffer.addCmdListener(ShopModuleMessages.S2C_COMMON_ERROR_CODE,onShopError);
			SocketConnection_protoBuffer.addCmdListener(ShopModuleMessages.S2C_BUY_SHOP_GOODS,onBuyGoodsSuccess);
//			SocketConnection.addCmdListener(ShopModuleMessages.S2C_BUY_SHOP_GOODS_FAIL,onBuyGoodsFail);
			SocketConnection_protoBuffer.addCmdListener(ShopModuleMessages.S2C_BUY_BACK_GOODS,onBuyBackGoodsSuccess);
//			SocketConnection.addCmdListener(ShopModuleMessages.S2C_BUY_BACK_GOODS_FAIL,onBuyBackGoodsFail);
			SocketConnection_protoBuffer.addCmdListener(ShopModuleMessages.S2C_SELL_GOODS,onSellGoodsSuccess);
//			SocketConnection.addCmdListener(ShopModuleMessages.S2C_SELL_GOODS_FAIL,onSellGoodsFail);
			SocketConnection_protoBuffer.addCmdListener(ShopModuleMessages.S2C_BUY_JINZI_SHOP_GOODS,onRecBuyJinziShopGoods);
//			SocketConnection.addCmdListener(ShopModuleMessages.S2C_BUY_JINZI_SHOP_GOODS_FAIL,onRecBuyJinziShopGoodsFail);
			SocketConnection_protoBuffer.addCmdListener(ShopModuleMessages.S2C_REPAIR_GOODS_SUCCESS,onRepairSuccess);
			SocketConnection_protoBuffer.addCmdListener(ShopModuleMessages.S2C_REPAIR_GOODS_ALL_SUCCESS,onRepairAllSuccess);
			
			finish();
		}	
		
		/**
		 * 成功，附带卖出物品位置
		 * bytes ShopProto（已压缩），具体参考ShopProto说明
		 */
		private function onOpenNpcShopSuccess(buffer:ByteBuffer):void
		{
			ReqLockUtil.unlockReq( ShopModuleMessages.C2S_OPEN_NPC_SHOP );
			
			var bytes:ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			var shopProto:ShopProto = new ShopProto();
			shopProto.mergeFrom(bytes);
			
			SmallShopItemManager.convertNpcShopProto( shopProto );
			
			EventManager.dispatchEvent(ShopEvent.NPC_SHOP_ITEM_DATA );
		}
		
		/**
		 * 失败返回，附带byte错误码.错误码详见后面的说明.
		 * 有以下几种失败情况
		 * 1、客户端发送的shop id无效
		 * 2、英雄与NPC距离太远了
		 */
/*		private function onOpenNpcShopFail(buffer:ByteBuffer):void
		{
			ReqLockUtil.unlockReq( ShopModuleMessages.C2S_OPEN_NPC_SHOP );
			
			var errId:int = buffer.readUnsignedByte();
			switch(errId)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.OPEN_NPC_SHOP_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.OPEN_NPC_SHOP_FAIL3 );
					break;
			}
		}*/
		
		/**
		 * 成功返回S2C_BUY_SHOP_GOODS消息，附带以下信息
		 * UTF8 物品名称
		 * varint32 品质
		 * varint32 个数
		 * byte 消费类型 0-银两 1-礼金  2-元宝
		 * varint32 消费金额
		 * varint32 goodsIndex 物品在商店中的位置
		 */
		private function onBuyGoodsSuccess(buffer:ByteBuffer):void
		{
			var shopItemBuyInfo:ShopItemBuyInfo = new ShopItemBuyInfo();
			shopItemBuyInfo.itemName = buffer.readUTF();
			shopItemBuyInfo.quality = buffer.readVarint32();
			shopItemBuyInfo.count = buffer.readVarint32();
			shopItemBuyInfo.priceType = buffer.readByte();
			shopItemBuyInfo.cost = buffer.readVarint32();
			shopItemBuyInfo.goodsIndex = buffer.readVarint32();
			
			var qualityColor:int = ItemQualityType.getColorValue(shopItemBuyInfo.quality)
			var itemQualityColorName:String = HtmlTextUtil.getTextColor(qualityColor,shopItemBuyInfo.itemName);
			
			NoticeManager.showHint( EnumHintInfo.BUY_GOODS_SUCCESS, [ itemQualityColorName, shopItemBuyInfo.count, shopItemBuyInfo.cost + ShopType.getMoneyStrByType(shopItemBuyInfo.priceType)] );
			
			ReqLockUtil.unlockReq( ShopModuleMessages.C2S_BUY_SHOP_GOODS );
		}
		
		/**
		 * 有以下几种失败情况，
		 * 1、客户端发送的shop id无效
		 * 2、客户端发送的tab index或者goods index无效
		 * 3、客户端发送的购买数量无效
		 * 4、商品已过期
		 * 5、背包空间不足
		 * 6、银两不够
		 * 7、距离NPC太远
		 * 8、礼金不够
		 * 9、金子不够
		 * 10、充值金子不够
		 */
/*		private function onBuyGoodsFail(buffer:ByteBuffer):void
		{
			ReqLockUtil.unlockReq( ShopModuleMessages.C2S_BUY_SHOP_GOODS );
			
			var errId:int = buffer.readUnsignedByte();
			switch(errId)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.BUY_SHOP_GOODS_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.BUY_SHOP_GOODS_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.BUY_SHOP_GOODS_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.BUY_SHOP_GOODS_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.BUY_SHOP_GOODS_FAIL5 );
					break;
				case 6:
					NoticeManager.showHint( EnumHintInfo.BUY_SHOP_GOODS_FAIL6 );
					break;
				case 7:
					NoticeManager.showHint( EnumHintInfo.BUY_SHOP_GOODS_FAIL7 );
					break;
				case 8:
					NoticeManager.showHint( EnumHintInfo.BUY_SHOP_GOODS_FAIL8 );
					break;
				case 9:
					NoticeManager.showHint( EnumHintInfo.BUY_SHOP_GOODS_FAIL9 );
					break;
				case 10:
					NoticeManager.showHint( EnumHintInfo.BUY_SHOP_GOODS_FAIL10 );
					break;
			}
		}*/
		
		/**
		 * 回购物品
		 *
		 * 成功，附带以下信息
		 * varint32 buyBackPos 回购位置 从0开始
		 * varint32 物品回购到背包中哪个空位上
		 */
		private function onBuyBackGoodsSuccess(buffer:ByteBuffer):void
		{
			var buyBackPos:int = buffer.readVarint32();
			var backPackGridId:int = buffer.readVarint32();
			
			var itemInfo:ItemInfo = SmallShopItemManager.delBackBuyItem( buyBackPos ).itemInfo;
			if( itemInfo != null )
			{
				itemInfo.setIndex( backPackGridId );
				
				var qualityColor:int = ItemQualityType.getColorValue(itemInfo.quality)
				var itemQualityColorName:String = HtmlTextUtil.getTextColor( qualityColor, ItemCfgData.getItemName( itemInfo.cfgId ) );
				
				NoticeManager.showHint( EnumHintInfo.BUY_BACK_GOODS_SUCCESS, [ itemQualityColorName ] );
			}
			
			//添加到背包
			GoodsContainerMamager.setItemInfo( ItemContainerID.BackPack, backPackGridId, itemInfo );
			
			EventManager.dispatchEvent(ShopEvent.BUY_BACK_CHANGE );
			
			ReqLockUtil.unlockReq( ShopModuleMessages.C2S_BUY_BACK_GOODS );
		}
		
		/**
		 * 失败，附带byte错误码
		 * 有以下几种失败情况，
		 * 1、客户端发送的回购位置无效
		 * 2、客户端发送的背包位置无效
		 * 3、客户端发送的背包位置已经有物品存在
		 * 4、银两不够
		 */
/*		private function onBuyBackGoodsFail(buffer:ByteBuffer):void
		{
			ReqLockUtil.unlockReq( ShopModuleMessages.C2S_BUY_BACK_GOODS );
			
			var errId:int = buffer.readUnsignedByte();
			switch(errId)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.BUY_BACK_GOODS_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.BUY_BACK_GOODS_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.BUY_BACK_GOODS_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.BUY_BACK_GOODS_FAIL4 );
					break;
			}
		}*/
		
		/**
		 * 出售物品成功
		 *
		 * byte 卖出物品的位置(背包中)
		 */
		private function onSellGoodsSuccess(buffer:ByteBuffer):void
		{
			var gridId:int = buffer.readVarint32();
			var extime:Number = buffer.readVarint64();
			
			var itemInfo:ItemInfo = BackPackManager.instance.getItemInfoByIndex( gridId );
			if( itemInfo != null )
			{
				var qualityColor:int = ItemQualityType.getColorValue(itemInfo.quality)
				var itemQualityColorName:String = HtmlTextUtil.getTextColor( qualityColor, ItemCfgData.getItemName( itemInfo.cfgId ) );
				
				NoticeManager.showHint( EnumHintInfo.SELL_GOODS_SUCCESS, [ itemQualityColorName ] );
			}
			
			var shopBuyData:ShopBuyBackGoodsData = new ShopBuyBackGoodsData();
			shopBuyData.expireTime = extime;
			shopBuyData.itemInfo = itemInfo;
			
			SmallShopItemManager.addBackBuyItem( shopBuyData );
			//删除
			GoodsContainerMamager.setItemInfo( ItemContainerID.BackPack, gridId, null );
			
			EventManager.dispatchEvent( ShopEvent.BUY_BACK_CHANGE );
		}
		
		/**
		 * 出售失败有以下几种情况
		 * 1、客户端发送的目标位置无效
		 * 2、客户端发送的目标位置上面的物品不存在
		 * 3、物品不能出售
		 * 4、银两已满，英雄最大可以携带20亿银两
		 * 5、背包位置已经被锁定
		 */
/*		private function onSellGoodsFail(buffer:ByteBuffer):void
		{
			ReqLockUtil.unlockReq( ShopModuleMessages.C2S_SELL_GOODS );
			 
			var errId:int = buffer.readUnsignedByte();
			switch(errId)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.SELL_GOODS_FAIL1 );
					break;
				case 2:
					NoticeManager.showHint( EnumHintInfo.SELL_GOODS_FAIL2 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.SELL_GOODS_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.SELL_GOODS_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.SELL_GOODS_FAIL5 );
					break;
			}
		}*/
		
		/**
		 * 成功，附带以下信息
		 * UTF8 物品名称
		 * varint32 物品品质
		 * varint32 个数
		 * byte 消费类型 AmountType
		 * varint32 消费金额
		 */
		private function onRecBuyJinziShopGoods(buffer:ByteBuffer):void
		{
			var shopItemBuyInfo:ShopItemBuyInfo = new ShopItemBuyInfo();
			shopItemBuyInfo.itemName = buffer.readUTF();
			shopItemBuyInfo.quality = buffer.readVarint32();
			shopItemBuyInfo.count = buffer.readVarint32();
			shopItemBuyInfo.priceType = buffer.readByte();
			shopItemBuyInfo.cost = buffer.readVarint32();
			
			var qualityColor:int = ItemQualityType.getColorValue(shopItemBuyInfo.quality)
			var itemQualityColorName:String = HtmlTextUtil.getTextColor( qualityColor, shopItemBuyInfo.itemName );
			
			NoticeManager.showHint( EnumHintInfo.BUY_GOODS_SUCCESS, [ itemQualityColorName, shopItemBuyInfo.count, shopItemBuyInfo.cost + ShopType.getMoneyStrByType(shopItemBuyInfo.priceType)] );
			
			ReqLockUtil.unlockReq( ShopModuleMessages.C2S_BUY_JINZI_SHOP_GOODS );
		}
		
		/**
		 * 失败,返回byte错误码
		 * 有以下几种失败情况，
		 * 1、物品ID无效，该物品没找到
		 * 3、客户端发送的购买数量无效
		 * 4、商品已过期
		 * 5、背包空间不足
		 * 6、钱不够（银两，礼金，金子）
		 */
/*		private function onRecBuyJinziShopGoodsFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readUnsignedByte();
			switch(errId)
			{
				case 1:
					NoticeManager.showHint( EnumHintInfo.BUY_JINZI_SHOP_GOODS_FAIL1 );
					break;
				case 3:
					NoticeManager.showHint( EnumHintInfo.BUY_JINZI_SHOP_GOODS_FAIL3 );
					break;
				case 4:
					NoticeManager.showHint( EnumHintInfo.BUY_JINZI_SHOP_GOODS_FAIL4 );
					break;
				case 5:
					NoticeManager.showHint( EnumHintInfo.BUY_JINZI_SHOP_GOODS_FAIL5 );
					break;
			}
			
			ReqLockUtil.unlockReq( ShopModuleMessages.C2S_BUY_JINZI_SHOP_GOODS );
		}*/
		
		/**
		 * 修理成功
		 * varint32 容器类型
		 * varint32 装备位置
		 * bool 使用银两替代绑银
		 */
		private function onRepairSuccess(buffer:ByteBuffer):void
		{
			var containerId:int = buffer.readVarint32();
			var index:int = buffer.readVarint32();
			var usedBind:Boolean = buffer.readBoolean();
			EventManager.dispatchEvent( ShopEvent.REPAIR_SUCCESS, containerId, index );
		}
		
		/**
		 * all修理成功所有
		 * bool 使用银两替代绑银
		 * while(byteArray.avaliable){//如果没有可以读的字节  说明一个装备都没修理成功
		 *     varint32 装备位置  --success
		 * }
		 */
		private function onRepairAllSuccess(buffer:ByteBuffer):void
		{
			var usedBind:Boolean = buffer.readBoolean();
			var successIndexArr:Array = [];
			while(buffer.bytesAvailable)
			{
				successIndexArr.push(buffer.readVarint32());
			}
			EventManager.dispatchEvent( ShopEvent.REPAIR_ALL_SUCCESS, successIndexArr);
		}
		
		/**
		 * 失败，附带byte错误码
		 * 有以下几种失败情况，
		 * 1、客户端发送的位置无效
		 * 2、钱不够（银两，绑金，金子）
		 * 3、耐久度满了不能修理
		 * 4.容器非法
		 * 5.要修理的不是装备
		 * 6.修理的装备过期
		 * 7、物品ID无效，该物品没找到
		 * 8、客户端发送的购买数量无效
		 * 9、商品已过期
		 * 10、背包空间不足
		 * 11 客户端发送的目标位置上面的物品不存在
		 * 12、物品不能出售
		 * 13 位置已经被锁定
		 * 14、银两已满，英雄最大可以携带20亿银两
		 * 15 客户端发送的背包位置已经有物品存在
		 * 16、客户端发送的shop id无效
		 * 17、客户端发送的tab index或者goods index无效
		 * 18、客户端发送的购买数量无效
		 * 19  距离NPC太远
		 * 20  没有可以修理的装备（一键修理）
		 */
		private static const SHOP_ERROR:String = "SHOP_ERROR_";
		private function onShopError(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readVarint32();
			NoticeManager.showNotify(SHOP_ERROR + errId);
		}
		
	}
}