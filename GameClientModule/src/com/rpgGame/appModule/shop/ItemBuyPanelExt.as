package com.rpgGame.appModule.shop
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.SourceGetCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_source;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	
	import flash.utils.getTimer;
	
	import away3d.events.Event;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.shangcheng.Tankuang_Shangpin;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class ItemBuyPanelExt extends SkinUIPanel
	{
		private static var MAX_ALLOW:int=999;
		private static var _ins:ItemBuyPanelExt;
		private var _skin:Tankuang_Shangpin;
		private var _data:ShopItemVo;
		private var _grid:IconCDFace;
		private var maxCount:int=900;
		private var price:int;
		private var speedTime:int=1500;
		private var now:int=0;
		private var speedArr:Array=[1,2,4,8,16,32];
		
		private var speedIndex:int=0;
		private var addOrDec:int=1;
		private var buyNum:int=0;
		private var gTimer:GameTimer;
		public function ItemBuyPanelExt()
		{
			_skin=new Tankuang_Shangpin();
			super(_skin);
			_grid=IconCDFace.create(IcoSizeEnum.ICON_64);
//			_grid.x=6;
//			_grid.y=6;
			this._skin.icons.addChild(_grid);
			this._skin.icons.touchGroup=false;
			initEvent();
			this.model=true;
			gTimer=new GameTimer("ItemBuyPanelExt",100,0,onTime);
		}
		
		private function onTime():void
		{
			// TODO Auto Generated method stub
			if (buyNum<=MAX_ALLOW&&buyNum>=0) 
			{
				if (speedIndex>=0&&speedIndex<=speedArr.length-1) 
				{
					isStart=true;
					buyNum+=speedArr[speedIndex]*addOrDec;
					setBuyNum(buyNum);
					if (now>getTimer()&&speedIndex<speedArr.length-1) 
					{
						speedIndex++;
						now=getTimer()+speedTime;
					}
				}
				
			}
			else
			{
				gTimer.stop();
			}
			
		}
		private function initEvent():void
		{
			this._skin.btnCancle.addEventListener(Event.TRIGGERED,onCancel);
			this._skin.btnMax.addEventListener(Event.TRIGGERED,onSetMax);
			this._skin.btnOK.addEventListener(Event.TRIGGERED,onBuy);
			this._skin.btn_min.addEventListener(TouchEvent.TOUCH,onDecTouch);
			this._skin.btn_max.addEventListener(TouchEvent.TOUCH,onAddTouch);
			//this._skin.btn_min.addEventListener(Event.TRIGGERED,onDecCout);
			//this._skin.btn_max.addEventListener(Event.TRIGGERED,onAddCount);
		}
		
		private function onAddCount(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (buyNum<MAX_ALLOW) 
			{
				setBuyNum(buyNum+1);
			}
		}
		
		private function onDecCout(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (buyNum>0) 
			{
				setBuyNum(buyNum-1);
			}
		}
		private function onDecTouch(e:TouchEvent):void
		{
			// TODO Auto Generated method stub
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				OnRollOut();
				return;
			}
			touch = e.getTouch(target, TouchPhase.BEGAN);
			if (touch!=null) 
			{
				OnRollIn(-1);
				return;
			}
			touch = e.getTouch(target, TouchPhase.ENDED);
			if (touch != null)
			{
				if (!isStart) 
				{
					onDecCout(null);
				}
				OnRollOut();
				return;
			}
		}
		private function onAddTouch(e:TouchEvent):void
		{
			// TODO Auto Generated method stub
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				OnRollOut();
				return;
			}
			touch = e.getTouch(target, TouchPhase.BEGAN);
			if (touch!=null) 
			{
				OnRollIn(1);
				return;
			}
			touch = e.getTouch(target, TouchPhase.ENDED);
			if (touch != null)
			{
				if (!isStart) 
				{
					onAddCount(null);
				}
				OnRollOut();
				return;
			}
		}
		private var isStart:Boolean=false;
		private function OnRollIn(val:int):void
		{
			// TODO Auto Generated method stub
			addOrDec=val;
			speedIndex=0;
			now=getTimer()+speedTime;
			gTimer.start();
		}
		
		private function OnRollOut():void
		{
			// TODO Auto Generated method stub
			isStart=false;
			gTimer.stop();
		}
		
		private function setBuyNum(num:int):void
		{
			
			buyNum=Math.min(num,MAX_ALLOW);
			buyNum=Math.max(buyNum,1);
			this._skin.lbBuyNum.text=buyNum+"";
			this._skin.lbAll.text=buyNum*price+"";
			this._skin.lbAll.color=buyNum*price>Mgr.shopMgr.getCurrency(_data.data.priceType)?GameColorUtil.COLOR_RED:GameColorUtil.COLOR_GREEN;
		}
		private function onSetMax(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (buyNum!=maxCount) 
			{
				setBuyNum(maxCount);
			}
			
		}
		
		private function onBuy(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (_data) 
			{
				Mgr.shopMgr.buyShopItem(_data,buyNum);
			}
			hide();
		}
		
		private function onCancel(eve:Event):void
		{
			// TODO Auto Generated method stub
			hide();
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,onResChange);
		}
		
		private function onResChange(type:int):void
		{
			// TODO Auto Generated method stub
			if (_data&&_data.data.priceType==type) 
			{
				updateBuyInfo();
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,onResChange);
			gTimer.stop();
		}
		public static function buyItem(vo:ShopItemVo):void
		{
			if (vo.data.limitType!=0&&vo.data.todayBuyNum>=vo.data.limitNum) 
			{
				NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(61023));
				return;
			}
			if (!_ins) 
			{
				_ins=new ItemBuyPanelExt();
			}
			_ins.setData(vo);
			StarlingLayerManager.topUILayer.addChild(_ins);
		}
		public static function buyItemByModelId(itemMod:int):void
		{
			var qSource:Q_source=SourceGetCfg.getSource(itemMod);
			if (!qSource) 
			{
				return ;
			}
			var shopItems:Array=Mgr.shopMgr.getMallItemShopVo(itemMod,qSource.q_shoptype,JSONUtil.decode(qSource.q_sub_shop_type));
			if (shopItems==null||shopItems.length==0) 
			{
				return;
			}
			buyItem(shopItems[0]);
		}
		private function setData(vo:ShopItemVo):void
		{
			this._data=vo;
			
			var itemInfo:ClientItemInfo=new ClientItemInfo(vo.data.item.mod);
			itemInfo.count=vo.data.item.num;
			FaceUtil.SetItemGrid(_grid,itemInfo);
			this._skin.lbl_name.htmlText=ItemConfig.getItemNameWithQualityColor(vo.data.item.mod);
			this._skin.imgPriceType.styleName=ItemUtil.getResURL(_data.data.priceType);
			this._skin.imgMoneyType2.styleName=ItemUtil.getResURL(_data.data.priceType);
			price=vo.data.price;
			if (vo.data.discountPrice!=0) 
			{
				price=vo.data.discountPrice;
			}
			this._skin.lbl_num.text=price+"";
			var qitem:Q_item=ItemConfig.getQItemByID(vo.data.item.mod);
			if (qitem) 
			{
				this._skin.lbDiejia0.text=qitem.q_max+"";
			}
			
			updateBuyInfo();
			setBuyNum(1);
		}
		private function updateBuyInfo():void
		{
			var allRes:Number=Mgr.shopMgr.getCurrency(_data.data.priceType);
			maxCount=int(allRes/price);
			if (_data.data.limitType!=0) 
			{
				maxCount=Math.min(maxCount,_data.data.limitNum-_data.data.todayBuyNum);
				MAX_ALLOW=Math.min(999,_data.data.limitNum-_data.data.todayBuyNum);
			}
			else
			{
				MAX_ALLOW=999;
			}
			this._skin.lbShengyu.text=NotifyCfgData.getNotifyTextByID(61024)+ItemConfig.getItemName(_data.data.priceType)+":"+allRes;
			this._skin.lbAll.color=buyNum*price>Mgr.shopMgr.getCurrency(_data.data.priceType)?GameColorUtil.COLOR_RED:GameColorUtil.COLOR_GREEN;
		}
		private function updateBuyCount():void
		{
			
		}
	}
}