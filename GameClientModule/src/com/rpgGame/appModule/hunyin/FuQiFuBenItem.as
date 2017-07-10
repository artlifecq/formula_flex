package com.rpgGame.appModule.hunyin
{
	import com.rpgGame.app.sender.HunYinSender;
	import com.rpgGame.core.events.HunYinEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ZoneMultyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_zone;
	import com.rpgGame.coreData.clientConfig.Q_zone_multy;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hunyin.FuQiFuben_Item1;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class FuQiFuBenItem extends SkinUI
	{
		private var _skin:FuQiFuben_Item1;
		private var _zoneMod:Q_zone;
		private var _zone_multy:Q_zone_multy;
		private var _iscanChallenge:Boolean;
		public function FuQiFuBenItem(type:int=0)
		{
			_skin=new FuQiFuben_Item1();			
			super(_skin);
			switch(type)
			{
				case 1:
					_skin.ui_lv.styleName = "ui/app/hunyin/60jikaiqi.png";
					_skin.ui_bg.styleName = "ui/app/hunyin/putong.png";
					break;
				case 2:
					_skin.ui_lv.styleName = "ui/app/hunyin/100jikaiqi.png";
					_skin.ui_bg.styleName = "ui/app/hunyin/kunnan.png";
					break;		
			}
			initview();
		}
		
		private function initview():void
		{
			_skin.grpZhan.visible=false;
			_skin.selectBg.visible=false;
			_skin.skinMc.visible=false;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			initEvent();
			updateLv();
			_skin.selectBg.visible=false;
		}
		
		override protected function onHide():void
		{
			super.onHide();
			clearEvent();
		}
		
		protected function initEvent():void
		{
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			
			EventManager.addEvent(HunYinEvent.HUNYIN_JINJIE,updateLv);
		}
		
		protected function clearEvent():void
		{
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			
			EventManager.removeEvent(HunYinEvent.HUNYIN_JINJIE,updateLv);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnZhan1:
					onbtnZhan1Handler();
					break;
				case _skin.btnZhan2:
					onbtnZhan2Handler();
					break; 
			}			
		}
		
		public function onTouchItem(e:TouchEvent):void
		{
			var t:Touch=e.getTouch(this);
			if(!t){
				onMouseOutHandler();
				return;
			}
			t=e.getTouch(this,TouchPhase.HOVER);
			if(t){
				onMouseOverHandler();
			}
		}
		
		public function setdata(info:Q_zone):void
		{
			_zoneMod=info;	
			_zone_multy=ZoneMultyCfgData.getZoneMultyByID(info.q_id);
			updateLv();
		}
		
		private function updateLv():void
		{
			_iscanChallenge=true;//Mgr.hunyinMgr.JieZiLv>=_zone_multy.q_power;
			updateShowState();
		}
		
		private function updateShowState(state:Boolean=false):void
		{
			if(_iscanChallenge)
			{
				if(state)
				{
					_skin.grpZhan.visible=true;
					_skin.skinMc.visible=false;
				}
				else
				{
					_skin.grpZhan.visible=false;
					_skin.skinMc.visible=true;
					_skin.skinMc.gotoAndPlay(0);
				}
			}
			else
			{
				_skin.grpZhan.visible=false;
				_skin.skinMc.visible=false;
			}
		}
		
		protected function onMouseOverHandler():void
		{
			_skin.selectBg.visible=true;
			updateShowState(true);
		}
		
		protected function onMouseOutHandler():void
		{
			_skin.selectBg.visible=false;
			updateShowState(false);
		}
		
		protected function onbtnZhan1Handler():void
		{
			HunYinSender.upCSChallengeZoneMessage(1,_zone_multy.q_zone_id);
		}
		
		protected function onbtnZhan2Handler():void
		{
			HunYinSender.upCSChallengeZoneMessage(2,_zone_multy.q_zone_id);
		}
	}
}