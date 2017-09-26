package com.rpgGame.appModule.activety.zonghe.lijin
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	
	import org.mokylin.skin.app.activety.zonghe.Active_LiJin_DaoJiShi;
	
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;

	/**
	 * 天降礼金刷怪倒计时
	 * @author YT
	 * 
	 */	
	public class LijinMonsterTimerPanel extends SkinUIPanel
	{
		private var _skin:Active_LiJin_DaoJiShi;
		public function LijinMonsterTimerPanel()
		{
			_skin = new Active_LiJin_DaoJiShi();
			super(_skin);
			init();
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			var time:int=int(data);
			if(time>0)
			{
				super.show(data,openTable,parentContiner);
				setTime(time);
			}
			else
			{
				hide();
				AppManager.showApp(AppConstant.ACTIVETY_LIJIN_REFRESH);
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			TimerServer.remove(updateTime);
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x=sw/2-this.width/2;
			this.y=sh/6;
		}
		private function init():void
		{
		
		}
		private var remainTime:int;
		private function setTime(time:int):void
		{
			var rTime:int=time;
			remainTime=rTime;
			_skin.numTime.label=remainTime.toString();
			TimerServer.remove(updateTime);
			TimerServer.addLoop(updateTime,1000);
		}
		
		private function updateTime():void
		{
			remainTime--;
			_skin.numTime.label=remainTime.toString();
			if(remainTime==0){
				hide();
				TimerServer.remove(updateTime);
				AppManager.showApp(AppConstant.ACTIVETY_LIJIN_REFRESH);
			}
		}
		
		
	}
}