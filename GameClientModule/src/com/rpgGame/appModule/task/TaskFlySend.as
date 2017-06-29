package com.rpgGame.appModule.task
{
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.common.alert.AlertSend;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;

	/**
	 * 系统神行符
	 * @author YT
	 * 
	 */	
	public class TaskFlySend extends SkinUIPanel
	{
		private var _skin :AlertSend;
		public function TaskFlySend()
		{
			_skin=new AlertSend();
			super(_skin);
		}
		private var mapid:int=0;
		private var sendX:int=0;
		private var sendY:int=0;
		private var sendKey:Boolean=false;
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			sendKey=false;
			var pathing:String=String(data);
			var pathArr:Array=pathing.split(",");
			if(pathArr.length==3)
			{
				super.show(data,openTable,parentContiner);
				mapid=int(pathArr[0]);
				sendX=int(pathArr[1]);
				sendY=int(pathArr[2]);
				sendKey=true;
				setTime(3);
			}
			
			//TweenLite.delayedCall(3, hide);
		}
		override public function hide():void
		{
			super.hide();
			TimerServer.remove(updateTime);
			//TweenLite.killDelayedCallsTo(hide);
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			switch (target.name)
			{
				case "btn_ok":
					send();
					break;
			}
		}
		private var remainTime:int;
		private function setTime(time:int):void
		{
			if(time<0)
			{
				_skin.btn_ok.label="立即传送";
			}else
			{
				remainTime=time;
				updateTime();
				TimerServer.remove(updateTime);
				TimerServer.addLoop(updateTime,1000);
			}
		}
		
		private function updateTime():void
		{
			remainTime--;
			_skin.btn_ok.label="立即传送("+remainTime+")";
			if(remainTime==0)
			{
				send();
			}
		}
		private function send():void
		{
			if(sendKey)
			{
				SceneSender.sceneMapTransport(mapid, sendX,sendY,25,false,null,1);
			}
			
			hide();
		}
	}
}