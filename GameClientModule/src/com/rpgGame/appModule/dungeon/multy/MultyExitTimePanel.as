package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.TimeUtil;
	
	import org.mokylin.skin.app.fuben.FuBen_Exit;
	import org.mokylin.skin.app.fuben.FuBen_JinRuTime;
	import org.mokylin.skin.app.fuben.uinumber.UINumberDaojishi;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;

	public class MultyExitTimePanel extends SkinUIPanel
	{
		private var _skin :FuBen_Exit;
		private var numTime:UINumberDaojishi;
		public function MultyExitTimePanel()
		{
			_skin=new FuBen_Exit();
			numTime=_skin.numTime as UINumberDaojishi;
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
			var rTime:int=int(DungeonManager.outTime/1000);
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
			TimerServer.remove(updateTime);
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