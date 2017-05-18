package com.rpgGame.appModule.shop.backpackShop
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.ShopEvent;
	import com.rpgGame.coreData.enum.EnumShopType;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	import com.rpgGame.coreData.info.shop.ShopVo;
	
	import feathers.controls.Check;
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.beibao.ShangDian_Skin;
	
	import starling.display.Sprite;
	import starling.events.Event;

	public class BackpackShopView extends Sprite
	{
		private var list:List;
		private var check:Check;
		private var shopVo:ShopVo;
		public function BackpackShopView(_skin:ShangDian_Skin)
		{
			this.list=_skin.lst_pack0;
			this.check=_skin.chkSelect;
			this.x=list.x;
			this.y=list.y;
			list.paddingLeft=3;
			list.paddingTop=3;
			this.addChild(list);
			this.addChild(_skin.gCheck);
			
			_skin.gCheck.x-=list.x;
			_skin.gCheck.y-=list.y;
			
			list.x=0;
			list.y=0;
			
			list.itemRendererFactory = createItemRenderCell;
			//list.touchAcross=true;
			list.clipContent = true;
			list.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_ALWAYS_VISIBLE;
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			
			
			this.check.addEventListener(Event.CHANGE,selectItems);
			shopVo=Mgr.shopMgr.getShopVo(EnumShopType.SHOP_BACKPACK);
		}
		
		private function selectItems(eve:Event):void
		{
			// TODO Auto Generated method stub
			refreshData();
		}
		
		private function createItemRenderCell():BackPackShopItemRender
		{
			// TODO Auto Generated method stub
			return new BackPackShopItemRender(0);
		}
		
		public function onShow():void
		{
			Mgr.shopMgr.addEventListener(ShopEvent.SHOP_ITEM_DATA,onGetShopData);
			refreshData();
		}
		
		private function onGetShopData(event:ShopEvent):void
		{
			// TODO Auto-generated method stub
			var type:int=event.data;
			if (EnumShopType.SHOP_BACKPACK==type) 
			{
				shopVo=Mgr.shopMgr.getShopVo(type);
				refreshData();
			}
			
		}
		private function refreshData():void
		{
			if (shopVo) 
			{
				var shopsItems:Array=shopVo.getPageShopItems(EnumShopType.BKSHOP_NORMAL);
				if (check.isSelected) 
				{
					var newItems:Array=[];
					var len:int=shopsItems.length;
					var item:ShopItemVo;
					for (var i:int = 0; i < len; i++) 
					{
						item=shopsItems[i];
						if (item.getItemConfig().q_level<=MainRoleManager.actorInfo.totalStat.level) 
						{
							newItems.push(item);
						}
					}
					this.list.dataProvider=new ListCollection(newItems);
				}
				else
				{
					this.list.dataProvider=new ListCollection(shopsItems);
				}
			}
			
		}
		public function onHide():void
		{
			
		}
	}
}