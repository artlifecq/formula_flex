package  com.rpgGame.app.manager.shop
{
	import com.game.mainCore.core.model.AppModel;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.GlobalFunction;
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ShopSender;
	import com.rpgGame.app.ui.UIModel;
	import com.rpgGame.app.ui.alert.GameAlertYellowBtnExt;
	import com.rpgGame.appModule.common.GlobalFunction;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ShopEvent;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.EnumShopType;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	import com.rpgGame.coreData.info.shop.ShopVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.shop.bean.ShopItemInfo;
	import com.rpgGame.netData.shop.message.SCBuyItemResultMessage;
	import com.rpgGame.netData.shop.message.SCRebuyItemInfosMessage;
	import com.rpgGame.netData.shop.message.SCRebuySuccessMessage;
	import com.rpgGame.netData.shop.message.SCSaleSuccessMessage;
	import com.rpgGame.netData.shop.message.SCSendShopItemChangeMessage;
	import com.rpgGame.netData.shop.message.SCSendShopListMessage;
	
	import flash.events.EventDispatcher;
	
	import org.game.netCore.data.long;
	
	
	/**
	 *  商店
	 * @author yfl
	 * 
	 */	
	public class ShopManager extends EventDispatcher
	{
		public static var ins:ShopManager=new ShopManager();
		
		
		private var shopsHash:HashMap;
		public function ShopManager()
		{
			
			shopsHash=new HashMap();
		}
		public function getShopVo(type:int):ShopVo
		{
			return shopsHash.getValue(type);
		}
		/**
		 *获取商城，礼金和元宝商城的数据 
		 * @return 
		 * 
		 */		
		public function getMallItemShopVo(itemMod:int,shopId:int,subArr:Array):Array
		{
			var ret:Array=[];
			var shop:ShopVo=getShopVo(shopId);
			if (shop) 
			{
				return shop.getShopItems(subArr,itemMod);
			}
			return ret;
		}
		public function getCurrency(type:int):Number
		{
			if (type<=0) 
			{
				return 0;
			}
			if (type<100) 
			{
				return MainRoleManager.actorInfo.totalStat.getResData(type);
			}
			return BackPackManager.instance.getItemCount(type);
		}
		public function ReqBuyItem(shopvo:ShopItemInfo, num:int, _discountItemid:long = null):void
		{
			if (shopvo == null)
				return;
			ShopSender.ReqBuyItem(shopvo,num,_discountItemid);
		}
		
		/**
		 * 请求卖物品
		 * 
		 */
		public function ReqSellItem(itemId : long): void{
			ShopSender.ReqSellItem(itemId);
		}
		/**
		 * 批量卖物品 
		 * @param items
		 * 
		 */		
		public function ReqSellItems( items:Vector.<long> ):void
		{
			ShopSender.ReqSellItems(items);
		}
		
		public function ReqRebuyList(): void
		{
			ShopSender.ReqRebuyList();
		}
		
		/**
		 * 回购物品
		 * @param itemId
		 */		
		public function ReqRebuyItem(itemId : long): void
		{
			ShopSender.ReqRebuyItem(itemId);
		}
		
		public function SCSendShopListHandler(msg:SCSendShopListMessage):void
		{
			// TODO Auto Generated method stub
			var shop:ShopVo=shopsHash.getValue(msg.type);
			if (!shop) 
			{
				shop=new ShopVo(msg.type);
				shopsHash.put(msg.type,shop);
			}
			shop.setItemsData(msg.items);
			dispachShopEvent(ShopEvent.SHOP_ITEM_DATA,msg.type);
		}
		
		public function SCBuyItemResultHandler(msg:SCBuyItemResultMessage):void
		{
			// TODO Auto Generated method stub
			ItemActionManager.flyItemToBag(msg.item.mod);
		}
		
		public function SCRebuyItemInfosHandler(msg:SCRebuyItemInfosMessage):void
		{
			// TODO Auto Generated method stub
			dispachShopEvent(ShopEvent.BUY_BACK_CHANGE,msg);
		}
		
		public function SCRebuySuccessHandler(msg:SCRebuySuccessMessage):void
		{
			// TODO Auto Generated method stub
			ItemActionManager.flyItemToBag(msg.item.itemModelId);
		}
		
		public function SCSaleSuccessHandler(msg:SCSaleSuccessMessage):void
		{
			// TODO Auto Generated method stub
			
		}
		public function SCSendShopItemChangeHandler(msg:SCSendShopItemChangeMessage):void
		{
			// TODO Auto Generated method stub
			var shop:ShopVo=shopsHash.getValue(msg.type);
			if (shop) 
			{
				var vo:ShopItemVo=shop.updateShopItem(msg.items);
				if (vo) 
				{
					dispachShopEvent(ShopEvent.SHOP_ITEM_DATA_CHANGE,vo);
				}
				
			}
		}
		private function dispachShopEvent(type:String,data:*):void
		{
			var eve:ShopEvent=new ShopEvent(type,data);
			this.dispatchEvent(eve);
		}
		
		public function buyShopItem(vo:ShopItemVo,buyNum:int):void
		{
			if (vo) 
			{
				//先判断是否是需要vip
				if (vo.data.vipLevel>Mgr.vipMgr.vipLv) 
				{
					GameAlertYellowBtnExt.show("您不是"+vo.data.vipLevel+"级Vip玩家，不能购买此道具。是否成为"+vo.data.vipLevel+"级Vip?",Mgr.vipMgr.iWantBecomeVip);
					return;
				}
				var price:int=vo.data.price;
				if (vo.data.discountPrice!=0) 
				{
					price=vo.data.discountPrice;
				}
				var needGold:int=0;
				var allNeed:int=buyNum*price;
				var priceType:int=vo.data.priceType;
				var have:int=Mgr.shopMgr.getCurrency(priceType);
				if (allNeed>have) 
				{
					if (CharAttributeType.RES_GOLD==priceType) 
					{
						GameAlertYellowBtnExt.show("元宝不足!是否前往充值",GlobalFunction.iWantRecharge);
						return;
					}
						//礼金+元宝
					else if (CharAttributeType.RES_BIND_GOLD==priceType) 
					{
						needGold=allNeed-have;
						if (Mgr.shopMgr.getCurrency(CharAttributeType.RES_GOLD)>=needGold) 
						{
							GameAlertYellowBtnExt.show("礼金不足，是否再使用"+(needGold)+"元宝支付？",Mgr.shopMgr.ReqBuyItem,[vo.data,buyNum]);
							return;
						}
					}
					else if (CharAttributeType.RES_BIND_MONEY==priceType) 
					{
						needGold=allNeed-have;
						if (Mgr.shopMgr.getCurrency(CharAttributeType.RES_MONEY)>=needGold) 
						{
							GameAlertYellowBtnExt.show("绑定银两不足，是否再使用"+(needGold)+"银两支付？",Mgr.shopMgr.ReqBuyItem,[vo.data,buyNum]);
							return;
						}
					}
					NoticeManager.mouseFollowNotify(ItemConfig.getItemName(priceType)+"不足");
				}
				else
				{
					Mgr.shopMgr.ReqBuyItem(vo.data,buyNum);
				}
			}
		}
		public function rebuyItem(item:ItemInfo):void
		{
			var have:int=Mgr.shopMgr.getCurrency(CharAttributeType.RES_MONEY);
			if (have<ItemConfig.getQItemByID(item.itemModelId).q_recycle) 
			{
				NoticeManager.mouseFollowNotify(ItemConfig.getItemName(CharAttributeType.RES_MONEY)+"不足");
			}
			ShopSender.ReqRebuyItem(item.itemId);
		}
		public var sellItemCall:Function;
		public function readySellItem(item:ClientItemInfo):void
		{
			// TODO Auto Generated method stub
			if (sellItemCall) 
			{
				sellItemCall(item);
			}
		}
	}
}