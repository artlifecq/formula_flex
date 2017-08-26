package com.rpgGame.app.ui.main.buttons
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.manager.mount.ZhanQiManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	
	import org.client.mainCore.manager.EventManager;
	
	import utils.TimerServer;
	
	public class MainButton_Mount extends MainButtonBases
	{
		private var _isRun:Boolean=false; //是否在开始计时提醒
		private const Time_Interval_Between:int=600*1000; //毫秒
		private var timer:GameTimer;
		public function MainButton_Mount()
		{
			SkinUI.addNode(null,RTNodeID.MAIN_JINJIE,this,60,null,false);
			HorseManager.instance().canHorseLevelUp();
			ZhanQiManager.instance().canZhanqiLevelUp();
			timer=new GameTimer("MainButton_Mount",Time_Interval_Between,0,showTishi);
			timer.stop();
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(ItemEvent.LEFT_GRID_CHANG,showLeftGridState);
		}
		
		override protected function onHite():void
		{
			EventManager.removeEvent(ItemEvent.LEFT_GRID_CHANG,showLeftGridState);
		}
		
		private function showLeftGridState(leftGrid:int):void
		{
			/*if(leftGrid<=5){
			_skin.qi_bg.visible=true;
			_skin.qi_mc.visible=true;
			if(leftGrid==0){
			_skin.qi_mc.gotoAndStop("m");
			}else{
			_skin.qi_mc.gotoAndStop(leftGrid.toString());
			}else{
			_skin.qi_bg.visible=false;
			_skin.qi_mc.visible=false;
			_skin.qi_mc.gotoAndStop("m");
			}*/
			if(leftGrid<=3&&BackPackManager.instance.isshowBaoGuoTiShi&&!_isRun)
			{
				showTishi();
				timer.start();
				_isRun=true;
			}
			else{
				if(_isRun){
					timer.stop();
					if(AppManager.isAppInScene(AppConstant.BACK_FULL_TISHI))
						AppManager.hideApp(AppConstant.BACK_FULL_TISHI);
					_isRun=false;
				}
			}
		}
		
		public function showTishi():void
		{
			if(BackPackManager.instance.isshowBaoGuoTiShi)
				AppManager.showAppNoHide(AppConstant.BACK_FULL_TISHI);
			else{
				timer.stop();
				_isRun=false;
			}		
		}
	}
}