package com.rpgGame.appModule.shop.backpackShop
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.events.ShopEvent;
	import com.rpgGame.netData.shop.message.SCRebuyItemInfosMessage;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.controls.UIAsset;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.beibao.ShangDian_Skin;
	
	import starling.display.Sprite;

	public class BackpackShopRebuyView extends Sprite
	{
		private var imgNone:UIAsset;
		private var list:List;
		public function BackpackShopRebuyView(_skin:ShangDian_Skin)
		{
			this.imgNone=_skin.uiNo;
			this.list=_skin.lst_pack1;
			this.addChild(list);
			this.addChild(imgNone);
			this.x=list.x;
			this.y=list.y;
			this.imgNone.x-=list.x;
			this.imgNone.y-=list.y;
			list.paddingLeft=3;
			list.paddingTop=3;
			list.x=0;
			list.y=0;
			list.itemRendererFactory = createItemRenderCell;
			//list.touchAcross=true;
			list.clipContent = true;
			list.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_ALWAYS_VISIBLE;
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy =Scroller.SCROLL_BAR_DISPLAY_MODE_ALWAYS_VISIBLE;
		}
		
		private function createItemRenderCell():BackPackShopItemRender
		{
			// TODO Auto Generated method stub
			return new BackPackShopItemRender(1);
		}
		public function onShow():void
		{
			
			Mgr.shopMgr.addEventListener(ShopEvent.BUY_BACK_CHANGE,onGetData);
			Mgr.shopMgr.ReqRebuyList();
		}
		
		private function onGetData(event:ShopEvent):void
		{
			// TODO Auto-generated method stub
			var msg:SCRebuyItemInfosMessage=event.data;
			imgNone.visible=msg.items.length==0;
			var objList:Array=[];
			var len:int=msg.items.length;
			for (var i:int = 0; i <len; i++) 
			{
				var tmp:Object=new Object();
				tmp.item=msg.items[i];
				tmp.time=uint(msg.timeKeys[i]);
				objList.push(tmp);
			}
			
			objList.sortOn("time",Array.DESCENDING);
			this.list.dataProvider=new ListCollection(objList);
		}
		private function sort():void
		{
			
		}
		public function onHide():void
		{
			Mgr.shopMgr.removeEventListener(ShopEvent.BUY_BACK_CHANGE,onGetData);
		}
	}
}