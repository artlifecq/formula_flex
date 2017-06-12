package com.rpgGame.appModule.battle.dfdj
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.manager.StarlingLayerManager;
	
	import flash.utils.getTimer;
	
	import org.mokylin.skin.app.zhanchang.KuaFuVs_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class D1v1MatchPanelExt extends SkinUIPanel
	{
		private var _skin:KuaFuVs_Skin;
		private var _timer:GameTimer;
		private var _endTime:int;
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
			if (left>=0) 
			{
				_skin.numTime.label=left+"";
			}
			else
			{
				_timer.stop();
			}
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
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
		}
	}
}