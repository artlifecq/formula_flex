package com.rpgGame.appModule.battle.dfdj
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.D1v1Event;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.TextUtil;
	
	import flash.utils.getTimer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.VS_Skin;
	
	import starling.display.DisplayObjectContainer;
	
	public class D1v1HeadPanelExt extends SkinUIPanel
	{
		private var _skin:VS_Skin;
		private var _timer:GameTimer;
		private var _endTime:int;
		public function D1v1HeadPanelExt()
		{
			_skin=new VS_Skin();
			super(_skin);
		
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var left:int=(_endTime-getTimer())/1000;
			if (left>=0) 
			{
				var str:String=TextUtil.SecondToHMS2(left);
				_skin.uiTime.label=str;
			}
			else
			{
				_timer.stop();
			}
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
			//两分钟
			_endTime=getTimer()+2*60*1000;
			var str:String=TextUtil.SecondToHMS2(2*60*1000);
			_skin.uiTime.label=str;
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			this.x=(sw-this.width)*0.5;
			this.y=0;
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(D1v1Event.ACTIVITY_FIGHT_START,onFightStart);
		}
		
		private function onFightStart():void
		{
			// TODO Auto Generated method stub
			if (!_timer) 
			{
				_timer=new GameTimer("D1v1HeadPanelExt");
				_timer.onUpdate=onTimer;
			}
			_timer.start();
			onTimer();
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(D1v1Event.ACTIVITY_FIGHT_START,onFightStart);
			if (_timer) 
			{
				_timer.stop();
				_timer.destroy();
				_timer=null;
			}
		}
	}
}