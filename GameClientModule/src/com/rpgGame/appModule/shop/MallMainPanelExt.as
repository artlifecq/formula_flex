package com.rpgGame.appModule.shop
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.GlobalFunction;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.common.PageSelectUICtrl;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.ShopEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.EnumShopType;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	import com.rpgGame.coreData.info.shop.ShopVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import flash.display3D.IndexBuffer3D;
	
	import away3d.events.Event;
	
	import feathers.controls.Radio;
	import feathers.data.ListCollection;
	
	import gs.TweenMax;
	import gs.easing.Quad;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.shangcheng.ShangCheng_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class MallMainPanelExt extends SkinUIPanel
	{
		private var _skin:ShangCheng_Skin;
		private var _curMallType:int=-1;
		private var _pageCtrl:PageSelectUICtrl;
		private var maxCount:int=9;
		private var cellList:Vector.<MallItemExt>=new Vector.<MallItemExt>();
		private var shopVo:ShopVo;
		private var _shopBtns:Array;
		
		private var _shangchengEftContaner1:Inter3DContainer;
		private var _shangchengEff:InterObject3D;	
		public function MallMainPanelExt()
		{
			_skin=new ShangCheng_Skin();
			super(_skin);
			_pageCtrl=new PageSelectUICtrl(_skin.btn_min,_skin.btn_max,_skin.lbPage,showPageData);
			shopVo=Mgr.shopMgr.getShopVo(EnumShopType.SHOP_MALL);
			initEvent();
			init();
		}
		private function init():void
		{
			_shangchengEftContaner1=new Inter3DContainer();
			_skin.container.addChildAt(_shangchengEftContaner1,1);
			_shangchengEff=_shangchengEftContaner1.playInter3DAt(ClientConfig.getEffect("ui_shangcheng"),662,438,0);
			_shopBtns=[_skin.btnRexiao,_skin.btnBianqiang,_skin.btnLijin,_skin.btnVip];
			var cell:MallItemExt;
			var startX:int=410;
			var startY:int=231;
			for (var i:int = 0; i < maxCount; i++) 
			{
				cell=new MallItemExt(startX+int(i%3)*232,startY+int(i/3)*150);
				cellList.push(cell);
				cell.visible=false;
				this.addChild(cell);
			}
			//_skin.tab_nv.dataProvider=new ListCollection();
			TipTargetManager.show(this._skin.grpYuanbao,TargetTipsMaker.makeSimpleTextTips(ItemConfig.getItemName(CharAttributeType.RES_GOLD)));
			TipTargetManager.show(this._skin.grpLijing,TargetTipsMaker.makeSimpleTextTips(ItemConfig.getItemName(CharAttributeType.RES_BIND_GOLD)));
		}
		private function initEvent():void
		{
			//			_skin.tab_nv.addEventListener(Event.CHANGE, onTab);
			
		}
		
		protected function onSingleDataChange(event:ShopEvent):void
		{
			// TODO Auto-generated method stub
			var vo:ShopItemVo=event.data;
			for each (var cell:MallItemExt in cellList) 
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
			if (EnumShopType.SHOP_MALL==type) 
			{
				showSubPanel(_curMallType);
			}
		}
		
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);
			
			if (shopVo) 
			{
				var types:Array=shopVo.shopPageTypes;
				//this._skin.tab_nv.dataProvider=new ListCollection(shopVo.shopPageTitles);
				if (data==null) 
				{
					if (_curMallType==-1) 
					{
						if (types.length>0) 
						{
							showSubPanel(0);
						}
					}
					else 
					{
						showSubPanel(_curMallType);
					}
				}
				else if(types.indexOf(int(data))!=-1)
				{
					showSubPanel(int(data));
				}
			}
		}
		private function showPageData(arr:Array):void
		{
			var len:int=arr.length;
			var cell:MallItemExt;
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
			this._curMallType=subType;
			this._pageCtrl.setData(shopVo.getPageShopItems(shopVo.shopPageTypes[subType]),maxCount);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if (target==this._skin.btnChongZhi) 
			{
				GlobalFunction.iWantRecharge();
			}
			if (target is Radio) 
			{
				var index:int=_shopBtns.indexOf(target);
				if (index!=-1) 
				{
					showSubPanel(index);
				}
			}
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,onStateResChange);
			Mgr.shopMgr.addEventListener(ShopEvent.SHOP_ITEM_DATA,onGetItemData);
			Mgr.shopMgr.addEventListener(ShopEvent.SHOP_ITEM_DATA_CHANGE,onSingleDataChange);
			onStateResChange(CharAttributeType.RES_GOLD);
			onStateResChange(CharAttributeType.RES_BIND_GOLD);
			if(_shangchengEff) _shangchengEff.start();
		}
		
		private function onStateResChange(type:int=0):void
		{
			// TODO Auto Generated method stub
			if (CharAttributeType.RES_GOLD==type) 
			{
				_skin.lbYuanbao.text=MainRoleManager.actorInfo.totalStat.getResData(type)+"";
			}
			else if (CharAttributeType.RES_BIND_GOLD==type) 
			{
				_skin.lbLijing.text=MainRoleManager.actorInfo.totalStat.getResData(type)+"";
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,onStateResChange);
			Mgr.shopMgr.removeEventListener(ShopEvent.SHOP_ITEM_DATA,onGetItemData);
			Mgr.shopMgr.removeEventListener(ShopEvent.SHOP_ITEM_DATA_CHANGE,onSingleDataChange);
			for each (var cell:MallItemExt in cellList) 
			{
				cell.clearData();
			}
			if(_shangchengEff) _shangchengEff.stop();
		}
	}
}