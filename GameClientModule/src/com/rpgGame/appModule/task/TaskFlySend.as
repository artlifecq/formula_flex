package com.rpgGame.appModule.task
{
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.common.alert.AlertSend;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

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
			super.show(data,openTable,parentContiner);
			sendKey=false;
			var pathing:String=String(data);
			var pathArr:Array=pathing.split(",");
			if(pathArr.length==3)
			{
				mapid=int(pathArr[0]);
				sendX=int(pathArr[1]);
				sendY=int(pathArr[2]);
				sendKey=true;
			}
			
			//TweenLite.delayedCall(3, hide);
		}
		override public function hide():void
		{
			super.hide();
			//TweenLite.killDelayedCallsTo(hide);
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			switch (target.name)
			{
				case "btn_ok":
					if(sendKey)
					{
						SceneSender.sceneMapTransport(mapid, sendX,sendY,25,false,null,1);
					}
					
					hide();
					break;
			}
		}
		
	}
}