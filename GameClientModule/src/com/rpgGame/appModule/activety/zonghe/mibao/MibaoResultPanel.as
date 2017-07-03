package com.rpgGame.appModule.activety.zonghe.mibao
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.activety.Active_LiJin_JieSuan;
	import org.mokylin.skin.app.activety.zonghe.TiaoZhanChengGong;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;

	/**
	 * 天降礼金结算面板
	 * @author YT
	 * 
	 */	
	public class MibaoResultPanel extends SkinUIPanel
	{
		private var _skin:TiaoZhanChengGong;
		public function MibaoResultPanel()
		{
			_skin = new TiaoZhanChengGong();
			super(_skin);
			init();
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			setTime(10);
			/*var dataInfo:Vector.<ItemInfo>;
			hideItem();
			if(data)
			{
				dataInfo= data as Vector.<ItemInfo>;
			}
			if(dataInfo)
			{
				setReword(dataInfo);
			}*/
			//setReword2();
			//TweenLite.delayedCall(6, hide);
		}
		override public function hide():void
		{
			super.hide();
			//TweenLite.killDelayedCallsTo(hide);
		}
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
			switch(target.name){
				case "subbut":// 领取奖励
					hide();
					break;
			}
		}
		private function init():void
		{
			
		}
		
		private var remainTime:int;
		private function setTime(time:int):void
		{
			var rTime:int=time;
			remainTime=rTime;
			_skin.btnOk.label="确认("+remainTime.toString()+")";
			TimerServer.remove(updateTime);
			TimerServer.addLoop(updateTime,1000);
		}
		
		private function updateTime():void
		{
			remainTime--;
			_skin.btnOk.label="确认("+remainTime.toString()+")";
			if(remainTime==0){
				hide();
				TimerServer.remove(updateTime);
			}
		}
		
		
	}
}