package com.rpgGame.appModule.social
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.utils.TouchableUtil;
	
	import feathers.controls.Button;

	public class TimeCountUtil
	{
		private var objHash:HashMap=new HashMap();
		private var timer:GameTimer;
		public function TimeCountUtil()
		{
			timer=new GameTimer("TimeCountUtil",1000);
			timer.onUpdate=onTime;
		}
		
		private function onTime():void
		{
			// TODO Auto Generated method stub
			var del:Array=[];
			var keys:Array=objHash.keys();
			var len:int=keys.length;
			var obj:Object;
			var btn:Button;
			var left:int;
			for (var i:int = 0; i < len; i++) 
			{
				btn=keys[i];
				obj=objHash.getValue(btn);
				left=(obj.endTime-SystemTimeManager.curtTm)/1000;
				if (left>0) 
				{
					btn.label=left+"秒";
				}
				else
				{
					btn.label=obj.lab;
					del.push(btn);
				}
			}
			for each (var tbtn:Button in del) 
			{
				objHash.remove(tbtn);
				TouchableUtil.ungray(tbtn);
			}
			checkTimeEnd();
		}
		public function addButtonTimeCountDown(btn:Button,endLab:String,time:int):void
		{
			if (!btn||time<=0) 
			{
				return;
			}
			var obj:Object;
			if (objHash.containsKey(btn)) 
			{
				obj=objHash.getValue(btn);	
			}
			else
			{
				obj=new Object();
				objHash.put(btn,obj);
			}
			obj.lab=endLab;
			obj.endTime=time*1000+SystemTimeManager.curtTm;
			TouchableUtil.gray(btn);
			btn.label=time+"秒";
			checkTimeStart();
		}
		private function checkTimeStart():void
		{
			if (objHash.size()>0) 
			{
				if (!timer.running) 
				{
					timer.start();
				}
			}
		}
		private function checkTimeEnd():void
		{
			if (objHash.size()==0&&timer.running) 
			{
				timer.stop();
			}
		}
		public static var ins:TimeCountUtil=new TimeCountUtil();
	}
}