package com.rpgGame.appModule.shop
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.HashMap;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.GlobalFunction;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.SourceGetCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_source;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import feathers.controls.StateSkin;
	import feathers.core.ToggleGroup;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zuoqi.huoquSkin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 *快捷购买选项 
	 * @author yfl
	 * 
	 */	
	public class ItemGetAdvisePanelExt extends SkinUI
	{
		private static var _ins:ItemGetAdvisePanelExt;
		private var forceNum:int=0;
		private var _skin:huoquSkin;
		private static var  MAX_ALLOW:int=999;
	
		private var saleShopItemHash:HashMap=new HashMap();
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
		private var _group:ToggleGroup;
		private var bindGoldInitPt:Point;
		public function ItemGetAdvisePanelExt(skin:StateSkin=null)
		{
			_skin=new huoquSkin();
			super(_skin);
			_grid=new IconCDFace(IcoSizeEnum.ICON_64);
//			_grid.x=6;
//			_grid.y=6;
			this._skin.itembg.addChild(_grid);
			this._skin.itembg.touchGroup=false;
			bindGoldInitPt=new Point(_skin.gBindGold.x,_skin.gBindGold.y);
			initEvent();
			gTimer=new GameTimer("ItemGetAdvisePanelExt",100,0,onTime);
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
			this._skin.btn_chongzhi.addEventListener(Event.TRIGGERED,onChongzhi);
			this._skin.max.addEventListener(Event.TRIGGERED,onSetMax);
			this._skin.btn_goumai.addEventListener(Event.TRIGGERED,onBuy);
			this._skin.btn_jian.addEventListener(TouchEvent.TOUCH,onDecTouch);
			this._skin.btn_jia.addEventListener(TouchEvent.TOUCH,onAddTouch);
//			this._skin.btn_jian.addEventListener(Event.TRIGGERED,onDecCout);
//			this._skin.btn_jia.addEventListener(Event.TRIGGERED,onAddCount);
			
			_group = new ToggleGroup();
			_skin.btn_yuanbao.toggleGroup = _group;
			_skin.btn_dianquan.toggleGroup = _group;
			_group.addEventListener(Event.CHANGE,useMoneyTypeHandler);
			
		}
		
	
		
		private function useMoneyTypeHandler(eve:Event):void
		{
			// TODO Auto Generated method stub
			_skin.yuanbao.visible=_skin.btn_yuanbao.isSelected;
			_skin.lijin.visible=_skin.btn_dianquan.isSelected;
			updateBuyInfo();
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
			this._skin.lab_num.text=buyNum*price+"";
			this._skin.lab_num.color=buyNum*price>Mgr.shopMgr.getCurrency(getSelectShopItem().data.priceType)?GameColorUtil.COLOR_RED:GameColorUtil.COLOR_GREEN;
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
			if (getSelectShopItem()) 
			{
				Mgr.shopMgr.buyShopItem(getSelectShopItem(),buyNum);
			}
			
		}
		
		private function onChongzhi(eve:Event):void
		{
			// TODO Auto Generated method stub
			GlobalFunction.iWantRecharge();
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,onResChange);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if (target == _skin.btnClose) 
			{
				if (this.parent) 
				{
					this.parent.x+=this.width/2;
				}
			}
			super.onTouchTarget(target);
		}
		private function onResChange(type:int):void
		{
			// TODO Auto Generated method stub
			var item:ShopItemVo=getSelectShopItem();
			if (item&&item.data.priceType==type) 
			{
				updateBuyInfo();
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,onResChange);
			gTimer.stop();
			//MCUtil.removeSelf(this);
		}
	
		
		private function updateBuyInfo():void
		{
			var data:ShopItemVo=getSelectShopItem();
			var allRes:Number=Mgr.shopMgr.getCurrency(data.data.priceType);
			maxCount=int(allRes/price);
			if (data.data.limitType!=0) 
			{
				maxCount=Math.min(maxCount,getSelectShopItem().data.limitNum-data.data.todayBuyNum);
				MAX_ALLOW=Math.min(999,data.data.limitNum-data.data.todayBuyNum);
			}
			else
			{
				MAX_ALLOW=999;
			}
		}
		private function updateBuyCount():void
		{
			
		}
		
		
		public static function showBuyItem(itemMod:int,container:DisplayObjectContainer,forceBuyNum:int=0):void
		{
			var qSource:Q_source=SourceGetCfg.getSource(itemMod);
			if (!qSource) 
			{
				return;
			}
			var shopItems:Array=Mgr.shopMgr.getMallItemShopVo(itemMod,qSource.q_shoptype,JSONUtil.decode(qSource.q_sub_shop_type));
			if (shopItems==null||shopItems.length==0) 
			{
				return;
			}
			if (!_ins) 
			{
				_ins=new ItemGetAdvisePanelExt();
			}
			_ins.x=container.width;
			_ins.y=(container.height-_ins.height)/2;
			container.addChild(_ins);
			_ins.setData(shopItems,qSource,forceBuyNum);
		}
		public static function remove(con:DisplayObjectContainer):void
		{
			if (_ins&&_ins.parent==con) 
			{
				MCUtil.removeSelf(_ins);
			}
		}
		public function setData(shopItems:Array,config:Q_source,forceBuyNum:int):void
		{
			// TODO Auto Generated method stub
			this.saleShopItemHash.clear();
			for each (var item:ShopItemVo in shopItems) 
			{
				saleShopItemHash.put(item.data.priceType,item);
			}
			resetRadioState();
			updateBuyInfo();
			var itemInfo:ClientItemInfo=new ClientItemInfo(config.q_itemid);
			
			FaceUtil.SetItemGrid(_grid,itemInfo);
			this._skin.itemname.htmlText=ItemConfig.getItemNameWithQualityColor(config.q_itemid);
			var vo:ShopItemVo=getSelectShopItem();
			price=vo.data.price;
			if (vo.data.discountPrice!=0) 
			{
				price=vo.data.discountPrice;
			}
			this._skin.num_danjia.text=price+"";
			var qitem:Q_item=ItemConfig.getQItemByID(config.q_itemid);
			if (qitem) 
			{
				this._skin.num_zuida.text=qitem.q_max+"";
			}
			this.forceNum=forceBuyNum;
			if (forceBuyNum!=0) 
			{
				TouchableUtil.gray(_skin.btn_jia);
				TouchableUtil.gray(_skin.btn_jian);
				TouchableUtil.gray(_skin.max);
				setBuyNum(forceBuyNum);
			}
			else
			{
				TouchableUtil.ungray(_skin.btn_jia);
				TouchableUtil.ungray(_skin.btn_jian);
				TouchableUtil.ungray(_skin.max);
				setBuyNum(1);
			}
			
			
			
			createAdvise(config);
		}
		private function createAdvise(qSource:Q_source):void
		{
			MCUtil.removeAllChild(this._skin.gGetPath);
			var labStrArr:Array=qSource.q_accessdeclist.split(",");
			var menuArr:Array=qSource.q_accesslist.split(",");
			var min:int=Math.min(labStrArr.length,menuArr.length);
			for (var i:int = 0; i < min; i++) 
			{
				var cell:ItemGetAdviseItemExt=new ItemGetAdviseItemExt();
				cell.setData(labStrArr[i],menuArr[i]);
				cell.x=0;
				cell.y=(cell.height+2)*i;
				this._skin.gGetPath.addChild(cell);
			}
			
		}
		private function getSelectShopItem():ShopItemVo
		{
			if (saleShopItemHash.size()==0) 
			{
				return null;
			}
			if (_skin.btn_yuanbao.isSelected) 
			{
				return saleShopItemHash.getValue(CharAttributeType.RES_GOLD);
			}
			else if (_skin.btn_dianquan.isSelected) 
			{
				return saleShopItemHash.getValue(CharAttributeType.RES_BIND_GOLD);
			}
			return null;
		}
		private function resetRadioState():void
		{
			var size:int=saleShopItemHash.size();
			if (size==1) 
			{
				this._skin.gGold.visible=false;
				this._skin.gBindGold.visible=false;
				if (CharAttributeType.RES_GOLD==saleShopItemHash.keys()[0]) 
				{
					this._skin.gGold.visible=true;
					this._skin.btn_yuanbao.isSelected=true;
				}
				else
				{
					this._skin.gBindGold.visible=true;
					this._skin.btn_dianquan.isSelected=true;
					this._skin.gBindGold.x=this._skin.gGold.x;
					this._skin.gBindGold.y=this._skin.gGold.y;
				}
			}
			else 
			{
				this._skin.gGold.visible=true;
				this._skin.gBindGold.visible=true;
				this._skin.btn_yuanbao.isSelected=true;
				this._skin.gBindGold.x=this.bindGoldInitPt.x;
				this._skin.gBindGold.y=this.bindGoldInitPt.y;
			}
		}

		public static function get ins():ItemGetAdvisePanelExt
		{
			return _ins;
		}

	}
}