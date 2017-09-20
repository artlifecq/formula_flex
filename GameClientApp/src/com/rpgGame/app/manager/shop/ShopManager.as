package  com.rpgGame.app.manager.shop
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.GlobalFunction;
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ShopSender;
	import com.rpgGame.app.ui.alert.GameAlertYellowBtnExt;
	import com.rpgGame.core.events.ShopEvent;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.EnumShopType;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
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
	
	import app.message.GoodsType;
	
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
		
		/**
		 * 获取极限挑战的
		 * */
		public function getJiXianItemShopVo(locationType:int,shopId:int):ShopItemVo
		{
			var shop:ShopVo=getShopVo(shopId);
			if (shop) 
			{
				var ret:Array=shop.getJiXianShopItems(locationType);
				for each (var item:ShopItemVo in ret) 
				{
					if(item.data.limitNum-item.data.todayBuyNum>0)
						return item;
				}
			}
			return null;
		}
		
		/**
		 * 判断该物品是否足够钱购买
		 * */
		public function isCanBuy(shopItems:Array,needNum:int=0):Boolean
		{
			var iscanbuy:Boolean;
			for each (var item:ShopItemVo in shopItems) 
			{
				iscanbuy=item.data.price*needNum <= MainRoleManager.actorInfo.totalStat.getResData(item.data.priceType);
				if(iscanbuy) return iscanbuy;
//				trace("购买道具需要的单价： " + item.data.price+"\n"+"消耗的道具类型 ："+item.data.priceType+"\n" + "身上的钱钱 ："+MainRoleManager.actorInfo.totalStat.getResData(item.data.priceType));
			}
			return iscanbuy;
		}
		
		public function getCurrency(type:int):Number
		{
			if (type<=0) 
			{
				return 0;
			}
			if (ItemConfig.getItemType(type)==GoodsType.MONEY) 
			{
				return MainRoleManager.actorInfo.totalStat.getResData(type);
			}
			return BackPackManager.instance.getItemCount(type);
		}
		public function ReqBuyItem(shopvo:ShopItemInfo, num:int, _discountItemid:long = null,autoUse:int=0):void
		{
			if (shopvo == null)
				return;
			ShopSender.ReqBuyItem(shopvo,num,_discountItemid,autoUse);
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
		/**
		 *购买商品会检查货币数量够不够 
		 * @param vo
		 * @param buyNum
		 * 
		 */		
		public function buyShopItem(vo:ShopItemVo,buyNum:int,autoUse:int=0):void
		{
			if (vo) 
			{
				//先判断是否是需要vip
				if (vo.data.vipLevel>Mgr.vipMgr.vipLv) 
				{
					GameAlertYellowBtnExt.show("您还不是"+VipCfg.getVip(vo.data.vipLevel).q_vip_name+"，不能购买此道具。是否成为"+VipCfg.getVip(vo.data.vipLevel).q_vip_name+"?",Mgr.vipMgr.iWantBecomeVip);
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
							GameAlertYellowBtnExt.show("礼金不足，是否再使用"+(needGold)+"元宝支付？",Mgr.shopMgr.ReqBuyItem,[vo.data,buyNum,null,autoUse]);
							return;
						}
					}
					else if (CharAttributeType.RES_BIND_MONEY==priceType) 
					{
						needGold=allNeed-have;
						if (Mgr.shopMgr.getCurrency(CharAttributeType.RES_MONEY)>=needGold) 
						{
							GameAlertYellowBtnExt.show("绑定银两不足，是否再使用"+(needGold)+"银两支付？",Mgr.shopMgr.ReqBuyItem,[vo.data,buyNum,null,autoUse]);
							return;
						}
					}
					//Mgr.shopMgr.ReqBuyItem(vo.data,buyNum,null,autoUse);
					NoticeManager.mouseFollowNotify(ItemConfig.getItemName(priceType)+"不足");
				}
				else
				{
					Mgr.shopMgr.ReqBuyItem(vo.data,buyNum,null,autoUse);
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
		public function getMallShopItemVo(shopItemId:int):ShopItemVo
		{
			var shop:ShopVo=getShopVo(EnumShopType.SHOP_MALL);
			if (shop) 
			{
				return shop.findShopItemVo(shopItemId);
			}
			return null;
		}
		public function getCheapestShopItemVo(shop:int):ShopItemVo
		{
			var shopVo:ShopVo=getShopVo(shop);
			if (shopVo) 
			{
				var ret:ShopItemVo;
				var types:Array=shopVo.shopPageTypes;
				var typeLen:int=types.length;
				var minPrice:int=int.MAX_VALUE;
				for (var i:int = 0; i < typeLen; i++) 
				{
					var items:Array=shopVo.getPageShopItems(types[i]);
					var itemsLen:int=items.length;
					var vo:ShopItemVo;
					for (var j:int = 0; j < itemsLen; j++) 
					{
						vo=items[j];
						var price:int=vo.realPrice;
						if (price<minPrice) 
						{
							minPrice=price;
							ret=vo;
						}
					}
				}
				return ret;
			}
			return null;
		}
		
		/**
		 *获取背包中购买物品列表
		 */	
		public function getBackPackShopItemList(shop:int):Array
		{
			var shopVo:ShopVo=getShopVo(EnumShopType.SHOP_BACKPACK);
			if (shopVo) 
			{
				var shopsItems:Array=shopVo.getPageShopItems(shop);
				return shopsItems;
			}
			
			return null
		}
		/**
		 *购买商品会检查是否满足条件
		 * 
		 */		
		public function isCanbuyShopItem(vo:ShopItemVo,buyNum:int):Boolean
		{
			if (vo) 
			{
				//先判断是否是需要vip
				if (vo.data.vipLevel>Mgr.vipMgr.vipLv) 
				{
					return false;
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
				return allNeed<=have;
			}
			
			return false;
		}
		
		
	}
}