package com.rpgGame.app.ui.main.activityBar.item
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.sender.FuliDaTingSender;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	public class ActivityZaiXianButton extends ActivityButton
	{
		private var timer:GameTimer;
		private var _time:Number;
		public function ActivityZaiXianButton()
		{
			super();
		}
		
		//		override public function canOpen():Boolean
		//		{
		//			if(!_openState){
		//				return false;
		//			}
		//			if(Mgr.zaiXianMgr.getonMinlineInfo()==0)
		//				return false;
		//			return true;
		//		}
		override protected function onShow():void
		{
			super.onShow();
			FuliDaTingSender.onCSRefreshPanelMessage();
		}
		
		public function setTime(time:int):void
		{
			_time=time;
			if(!timer){
				timer=new GameTimer("ActivityZaiXianButton",1000,0,updtaupTime);
			}
			timer.start();
		}
		
		private function updtaupTime():void
		{
			_time--;
			if(_time<=0){
				timer.stop();
				//				setText("可领取");
			}else{
				this.onTextRuningTime(_time);
			}
		}
		
		public function setText(str:String):void
		{
			setTextLeable(HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT, str));
		}
		
		override protected function onHide():void
		{
			super.onHide();
			if(timer) timer.stop();
		}
	}
}