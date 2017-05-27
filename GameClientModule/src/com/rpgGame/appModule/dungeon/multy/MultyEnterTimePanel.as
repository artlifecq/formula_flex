package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.fuben.FuBenTanKuang1;
	import org.mokylin.skin.app.fuben.FuBen_JinRuTime;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;

	/**
	* 副本进入倒计时框
	* @author yt
	* 
	*/
	public class MultyEnterTimePanel extends SkinUIPanel
	{
		private var _skin :FuBen_JinRuTime;
		public function MultyEnterTimePanel()
		{
			_skin=new FuBen_JinRuTime();
			super(_skin);
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			setTime();
			
		}
		private var remainTime:int;
		private function setTime():void
		{
			var rTime:int=10;
			if(rTime<=0){
				_skin.numTime.label="0";
			}else{
				remainTime=rTime;
				_skin.numTime.label=remainTime.toString();
				TimerServer.remove(updateTime);
				TimerServer.addLoop(updateTime,1000);
			}
		}
		
		private function updateTime():void
		{
			remainTime--;
			_skin.numTime.label=remainTime.toString();
			if(remainTime==0){
				hide();
				TimerServer.remove(updateTime);
			}
		}
		override public function hide():void 
		{
			super.hide();
		}
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x=sw/2-this.width/2;
			this.y=sh/6;
		}
	}
}