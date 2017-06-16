package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.manager.mount.ZhanQiManager;
	import com.rpgGame.app.manager.mount.ZhanQiShowData;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.appModule.shop.ItemGetAdvisePanelExt;
	import com.rpgGame.appModule.systemset.TouchToState;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import flash.utils.setTimeout;
	
	import away3d.events.Event;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zuoqi.Zhanqi_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class ZhanQiPanelExt extends ViewUI
	{
		private var _skin:Zhanqi_Skin;
		
		private static var isMouseOut : Boolean = true;
		private var _zhanqiContent:ZhanQiContent;
		private var _zhanqiProps:ZhanQiProps;
		private var _zhanqiUpExpConent:ZhanQiUpExpConent;
		private var _zhanqiShowData:ZhanQiShowData;
		private var _zhanqiExtraItemList:Vector.<ZhanQiExtraButton>;
		private var _touchState:TouchToState;
		
		public function ZhanQiPanelExt()
		{
			_skin=new Zhanqi_Skin();
			super(_skin);
			initPanel();
		}
		
		private function initPanel():void
		{
			_zhanqiShowData=new ZhanQiShowData();
			_zhanqiContent=new ZhanQiContent(_skin);
			_zhanqiProps=new ZhanQiProps(_skin);
			_zhanqiUpExpConent=new ZhanQiUpExpConent(_skin);
			_zhanqiExtraItemList=new Vector.<ZhanQiExtraButton>();
			_zhanqiExtraItemList.push(new ZhanQiExtraButton(_skin.btn_zizhidan,519));
			_zhanqiExtraItemList.push(new ZhanQiExtraButton(_skin.btn_chengzhangdan,520));
			_touchState=new TouchToState(_skin.lab_xuyaowupin,labTouchHandler);
		}
		
		private function initEvent():void
		{
			_skin.btn_kaishi.addEventListener(TouchEvent.TOUCH, onTouch);
			_skin.btn_zidong.addEventListener(TouchEvent.TOUCH, onTouch);
			EventManager.addEvent(ZhanQiManager.ZhanQiUpLevel,refeashLevel);
			EventManager.addEvent(ZhanQiManager.ZhanQiChangeExp,refeashExpHandler);
			EventManager.addEvent(ZhanQiManager.ZhanQiExtraItemNum,refeashPropHandler);
			EventManager.addEvent(ItemEvent.ITEM_ADD,addItemHandler);
		}
		
		private function removeEvent():void
		{
			_skin.btn_kaishi.removeEventListener(TouchEvent.TOUCH, onTouch);
			_skin.btn_zidong.removeEventListener(TouchEvent.TOUCH, onTouch);
			EventManager.removeEvent(ZhanQiManager.ZhanQiUpLevel,refeashLevel);
			EventManager.removeEvent(ZhanQiManager.ZhanQiChangeExp,refeashExpHandler);
			EventManager.removeEvent(ZhanQiManager.ZhanQiExtraItemNum,refeashPropHandler);
			EventManager.removeEvent(ItemEvent.ITEM_ADD,addItemHandler);
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			_zhanqiShowData.zhanqiJob=MainRoleManager.actorInfo.job;
			_zhanqiShowData.zhanqidataInfo=ZhanQiManager.instance().zhanqiDataInfo;
			_zhanqiContent.refeashMode(_zhanqiShowData.zhanqiLevel);
			refeashPropHandler();
			refeashExpHandler();
			_zhanqiUpExpConent.isAutoing = false;
			initEvent();
		}
		
		override public function hide():void
		{
			ItemGetAdvisePanelExt.hidePanel();
			removeEvent();
			super.hide();
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			super.onTouchTarget(target);
			var name : String = target.name;
			switch (name)
			{
				case "btn_kaishi":
					onMouseOut();
					if(_zhanqiShowData.isSelf)
					{
						if(!ZhanQiManager.instance().eatItemZhanQi(_zhanqiShowData))
						{
							if(!_zhanqiShowData.canUpLevel())
								showShopPane();
						}
						_zhanqiUpExpConent.isAutoing = false;
					}
					break;
				case "btn_zidong":
					onMouseOut();
					if(_zhanqiShowData.isSelf)
					{
						if(ZhanQiManager.instance().eatItemZhanQi(_zhanqiShowData))
						{
							_zhanqiUpExpConent.isAutoing = true;
						}else{
							if(!_zhanqiShowData.canUpLevel())
								showShopPane();
							_zhanqiUpExpConent.isAutoing = false;
						}
					}
					break;
				case "btn_next":
					_zhanqiContent.buttonRight();
					break;
				case "btn_prev":
					_zhanqiContent.buttonLeft();
					break;
				case "btn_tingzhi":
					_zhanqiUpExpConent.isAutoing = false;
					break;
			}
		}
		
		private function onTouch(e : TouchEvent) : void
		{
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				isMouseOut = true;
				onMouseOut();
				return;
			}
			
			touch = e.getTouch(target, TouchPhase.HOVER);
			if (touch != null && isMouseOut)
			{
				isMouseOut = false;
				_zhanqiContent.refeashMode(_zhanqiShowData.zhanqiLevel);
				onMouseOver();
				return;
			}
		}
		
		private function showShopPane():void
		{
			MountPanel(this.parent).buyItem(_zhanqiShowData.upLevelItem.qItem.q_id);
		}
		
		private function addItemHandler(info:ClientItemInfo):void
		{
			if(info.cfgId!= _zhanqiShowData.upLevelItem.cfgId)
				return ;
			refeashExpHandler();
		}
		
		private function refeashLevel():void
		{
			_zhanqiUpExpConent.isAutoing = false;
			showUplevel();
			//			_zhanqiUpExpConent.updataInfo(_zhanqiShowData);
		}
		
		private var _uplevelSuccess:ZhanQiUpLevelSucessPanelExt;
		private function showUplevel():void
		{
			if(_uplevelSuccess==null)	
			{
				_uplevelSuccess = new ZhanQiUpLevelSucessPanelExt();
				_uplevelSuccess.addEventListener(Event.REMOVED_FROM_STAGE,removePropHandler);
				StarlingLayerManager.topUILayer.addChild(_uplevelSuccess);
				_uplevelSuccess.x = int((_uplevelSuccess.stage.stageWidth - _uplevelSuccess.width) / 2);
				_uplevelSuccess.y = int((_uplevelSuccess.stage.stageHeight - _uplevelSuccess.height) / 2);
			}
			_uplevelSuccess.updateinfo(_zhanqiShowData);		
		}
		
		
		///////////////////////HANDLER///////////////////////
		
		private function onMouseOver():void
		{
			_zhanqiContent.playTarget(true);
			_zhanqiProps.refeashPropShow(true);
		}
		
		private function onMouseOut():void
		{
			_zhanqiContent.playTarget(false);
			_zhanqiProps.refeashPropShow(false);
		}
		
		private function labTouchHandler(touch:Touch):void
		{
			if(touch.phase!= TouchPhase.ENDED)
				return ;
			showShopPane();
		}
		
		private function refeashPropHandler():void
		{
			_zhanqiShowData.useExtraItem(ZhanQiManager.instance().useExtraItem1,ZhanQiManager.instance().useExtarItem2);
			_zhanqiProps.updataInfo(_zhanqiShowData);
			for each(var eb:ZhanQiExtraButton in _zhanqiExtraItemList)
			{
				eb.refeash(_zhanqiShowData);
			}
		}
		
		private function refeashExpHandler():void
		{
			//			_zhanqiShowData.zhanqidataInfo=ZhanQiManager.instance().zhanqiDataInfo;
			_zhanqiUpExpConent.updataInfo(_zhanqiShowData);
			_zhanqiProps.refeashPropValue();
			_zhanqiContent.refeashMode(_zhanqiShowData.zhanqiLevel);
			for each(var eb:ZhanQiExtraButton in _zhanqiExtraItemList)
			{
				eb.refeash(_zhanqiShowData);
			}
			setTimeout(isAutoing,30);
		}
		
		private function isAutoing():void
		{
			if(_zhanqiShowData.isAutoing)
			{
				_zhanqiUpExpConent.isAutoing =ZhanQiManager.instance().eatItemZhanQi(_zhanqiShowData);
			}
		}
		
		private function removePropHandler(e:Event):void
		{
			_uplevelSuccess =  null;
			refeashExpHandler();
		}	
	}
}