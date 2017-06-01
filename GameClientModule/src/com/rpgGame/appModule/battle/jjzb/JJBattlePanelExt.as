package com.rpgGame.appModule.battle.jjzb
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.events.JJBattleEvent;
	import com.rpgGame.core.ui.SkinUI;
	
	import away3d.events.Event;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.jingjichang.JingJiChan1_Skin;
	import org.mokylin.skin.app.zhanchang.jingjichang.JingJi_Info;
	
	import starling.display.DisplayObject;
	
	public class JJBattlePanelExt extends SkinUI
	{
		private var _skin:JingJiChan1_Skin;
		private var _normalView:SubNormalView;
		private var _top3View:SubTop3View;
		public function JJBattlePanelExt()
		{
			_skin=new JingJiChan1_Skin();
			super(_skin);
			
			_normalView=new SubNormalView(_skin.gNormal,[_skin.skinRole3,_skin.skinRole2,_skin.skinRole4,_skin.skinRole1,_skin.skinRole5]);
			_top3View=new SubTop3View(_skin.gTop,[_skin.top3,_skin.top1,_skin.top2]);
			regEvent();
		}
		private function regEvent():void
		{
			this._skin.btnBack.addEventListener(Event.TRIGGERED,onBack);
			this._skin.btnTiaoZhan.addEventListener(Event.TRIGGERED,onFightTop3);
			this._skin.btnJiangli.addEventListener(Event.TRIGGERED,onShowReward);
			var infoSkin:JingJi_Info=_skin.skinInfo.skin as JingJi_Info;
			infoSkin.btnAdd1.addEventListener(Event.TRIGGERED,onBuyTimes);
			infoSkin.btnAdd2.addEventListener(Event.TRIGGERED,onBuyFightPwoer);
			infoSkin.btnAdd1.addEventListener(Event.TRIGGERED,onBuyTimes);
			infoSkin.btnAdd1.addEventListener(Event.TRIGGERED,onShowShop);
		}
		
		private function onShowReward(eve:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if (target==_skin.item_msg) 
			{
				showHideBattleLog();
			}
		}
		
		private function showHideBattleLog():void
		{
			// TODO Auto Generated method stub
			
		}
		private function onShowShop(eve:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onBuyFightPwoer(eve:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onBuyTimes(eve:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onFightTop3(eve:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onBack(eve:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(JJBattleEvent.GET_PANEL_DATA,onGetPanelData);
			EventManager.addEvent(JJBattleEvent.GET_LOG_DATA,onLogData);
			Mgr.jjBattleMgr.reqChallegeRankData(1);
		}
		
		private function onLogData(...arg):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onGetPanelData(...arg):void
		{
			// TODO Auto Generated method stub
			
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(JJBattleEvent.GET_PANEL_DATA,onGetPanelData);
			EventManager.removeEvent(JJBattleEvent.GET_LOG_DATA,onLogData);
		}
		
		private function showNormal(bool:Boolean):void
		{
			if (bool) 
			{
				_normalView.show();
				_top3View.hide();
				_skin.btnTiaoZhan.visible=true;
				_skin.btnBack.visible=false;
			}
			else
			{
				_normalView.hide();
				_top3View.show();
				_skin.btnTiaoZhan.visible=false;
				_skin.btnBack.visible=true;
			}
		}
	}
}