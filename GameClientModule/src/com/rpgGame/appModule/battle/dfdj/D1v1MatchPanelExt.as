package com.rpgGame.appModule.battle.dfdj
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.D1v1Event;
	import com.rpgGame.core.manager.StarlingLayerManager;
	
	import flash.utils.getTimer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.KuaFuVs_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class D1v1MatchPanelExt extends SkinUIPanel
	{
		private var _skin:KuaFuVs_Skin;
		private var _timer:GameTimer;
		private var _endTime:int;
		/**
		 *0匹配倒計時1進入倒計時 
		 */		
		private var _step:int;
		public function D1v1MatchPanelExt()
		{
			_skin=new KuaFuVs_Skin();
			super(_skin);
			this.dragAble=false;
			this.escExcuteAble=false;
			_timer=new GameTimer("D1v1MatchPanelExt");
			_timer.onUpdate=onTimer
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var left:int=(_endTime-getTimer())/1000;
			if (left>0) 
			{
				_skin.numTime.label=left+"";
			}
			else
			{
				_timer.stop();
				if (_step==1) 
				{
					hide();
				}
			}
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
			_step=0;
			setState(_step);
			_endTime=getTimer()+int(data*1000);
			_timer.start();
			onTimer();
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _skin.btnCancel:
				case _skin.btnClose:
				{
					onCloseMe();
					break;
				}
			}
		}
		
		private function onCloseMe():void
		{
			// TODO Auto Generated method stub
			Mgr.d1v1Mgr.reqQuitRaceGame();
			hide();
		}
		override protected function onHide():void
		{
			super.onHide();
			if (_timer) 
			{
				_timer.stop();
			}
			EventManager.removeEvent(D1v1Event.MATCH_OK,onMatchOk);
			_step=0;
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(D1v1Event.MATCH_OK,onMatchOk);
		}
		
		private function onMatchOk(time:int):void
		{
			// TODO Auto Generated method stub
			_step=1;
			setState(_step);
			_endTime=getTimer()+time*1000;
			_timer.start();
			onTimer();
		}
		private function setState(state:int):void
		{
			if (state==0) 
			{
				_skin.btnCancel.visible=true;
				_skin.btnClose.visible=true;
				_skin.lbPiPei.text="正在匹配中...";
			}
			else
			{
				_skin.btnCancel.visible=false;
				_skin.btnClose.visible=false;
				_skin.lbPiPei.text="挑战即将开始";
			}
		}
	}
}