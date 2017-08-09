package com.rpgGame.appModule.shop
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.common.PageSelectUICtrl;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.ShopEvent;
	import com.rpgGame.coreData.enum.EnumShopType;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	import com.rpgGame.coreData.info.shop.ShopVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import gs.TweenMax;
	import gs.easing.Quad;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.shangdian.ShengWang_Store;
	import org.mokylin.skin.common.Flip1_Skin;
	
	import starling.display.DisplayObjectContainer;
	
	public class BattleShopPanelExt extends SkinUIPanel
	{
		private var _skin:ShengWang_Store;
	
		private var maxCount:int=9;
		private var cellList:Vector.<BattleShopItemExt>=new Vector.<BattleShopItemExt>();
		private var shopVo:ShopVo;
		private var _pageCtrl:PageSelectUICtrl;
		public function BattleShopPanelExt()
		{
			_skin=new ShengWang_Store();
			super(_skin);
		
			shopVo=Mgr.shopMgr.getShopVo(EnumShopType.SHOP_SW);
			var flip:Flip1_Skin=_skin.skinFlip.skin as Flip1_Skin;
			_pageCtrl=new PageSelectUICtrl(flip.btnDec,flip.btnAdd,flip.textDisplay,showPageData);
			init();
		}
		private function init():void
		{
			var cell:BattleShopItemExt;
			var startX:int=45;
			var startY:int=102;
			for (var i:int = 0; i < maxCount; i++) 
			{
				cell=new BattleShopItemExt(startX+int(i%3)*300,startY+int(i/3)*155);
				cellList.push(cell);
				cell.visible=false;
				this.addChild(cell);
			}
			//_skin.tab_nv.dataProvider=new ListCollection();
		
		}
	
		
		protected function onSingleDataChange(event:ShopEvent):void
		{
			// TODO Auto-generated method stub
			var vo:ShopItemVo=event.data;
			for each (var cell:BattleShopItemExt in cellList) 
			{
				if (cell.data==vo) 
				{
					cell.setData(vo);
					break;
				}
			}
		}
		
		protected function onGetItemData(event:ShopEvent):void
		{
			// TODO Auto-generated method stub
			var type:int=event.data;
			//是商城
			if (EnumShopType.SHOP_SW==type) 
			{
				showSubPanel(0);
			}
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);
			
			if (shopVo) 
			{
				showSubPanel(0);
			}
		}
		private function showPageData(arr:Array):void
		{
			var len:int=arr.length;
			var cell:BattleShopItemExt;
			for each (cell in cellList) 
			{
				cell.visible=false;
				cell.x=cell.initX+225*3
				cell.clearData();
				TweenMax.killTweensOf(cell);
			}
			var delay:Number=0;
			for (var i:int = 0; i < len; i++) 
			{
				cell=cellList[i];
				cell.visible=true;
				cell.setData(arr[i]);
				TweenMax.fromTo(cell,0.15*(3-i%3),{x:cell.initX+225*3,y:cell.initY,delay:delay,ease:Quad.easeIn,alpha:0.5},{x:cell.initX,y:cell.initY,ease:Quad.easeIn,delay:delay,alpha:1});
				delay+=0.05;
			}
			
		}
		public function showSubPanel(subType:int):void
		{
			var shopsItems:Array=shopVo.getPageShopItems(EnumShopType.SWSHOP_NORMAL);
			this._pageCtrl.setData(shopsItems,maxCount);
		}
		
	
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,onStateResChange);
			Mgr.shopMgr.addEventListener(ShopEvent.SHOP_ITEM_DATA,onGetItemData);
			Mgr.shopMgr.addEventListener(ShopEvent.SHOP_ITEM_DATA_CHANGE,onSingleDataChange);
			onStateResChange(CharAttributeType.RES_PRESTIGE);
			
		}
		
		private function onStateResChange(type:int=0):void
		{
			// TODO Auto Generated method stub
			if (CharAttributeType.RES_PRESTIGE==type) 
			{
				_skin.lbNum.text=MainRoleManager.actorInfo.totalStat.getResData(type)+"";
			}
		
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,onStateResChange);
			Mgr.shopMgr.removeEventListener(ShopEvent.SHOP_ITEM_DATA,onGetItemData);
			Mgr.shopMgr.removeEventListener(ShopEvent.SHOP_ITEM_DATA_CHANGE,onSingleDataChange);
			for each (var cell:BattleShopItemExt in cellList) 
			{
				cell.clearData();
			}
			
		}
	}
}