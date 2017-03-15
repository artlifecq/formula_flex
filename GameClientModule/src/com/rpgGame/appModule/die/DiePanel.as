package com.rpgGame.appModule.die
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.coreData.cfg.DieCfgData;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.player.message.ResPlayerDieMessage;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.mokylin.skin.app.siwangfuhuo.fuhuo_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *死亡面板 
	 * @author dik
	 * 
	 */
	public class DiePanel extends SkinUIPanel
	{
		private var _skin:fuhuo_Skin;
		private var disMsg:ResPlayerDieMessage;

		private var openNum:int;
		private var items:Vector.<DieToItem>;

		private var openTime:int;

		private var timer:Timer;
		
		public function DiePanel()
		{
			_skin=new fuhuo_Skin();
			timer=new Timer(1000);
			super(_skin);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			disMsg=data as ResPlayerDieMessage;
			
			_skin.lbl_msg.color=0xe1201c;
			var date:Date=new Date(disMsg.time*1000);
			_skin.lbl_msg.htmlText="你被"+HtmlTextUtil.getTextColor(0x5DBD37,disMsg.attackername)+"杀死了,("+date.fullYear+"年"+
				(date.month+1)+"月"+date.date+"日  "+TimeUtil.changeTime(date.hours)+":"+TimeUtil.changeTime(date.minutes)+":"+
				TimeUtil.changeTime(date.seconds)+")";
			
			openNum=DieCfgData.allOpenList.length;
			openTime=disMsg.autoTime;
			items=new Vector.<DieToItem>();
			for(var i:int=0;i<4;i++){
				items.push(new DieToItem());
				this._skin.container.addChild(items[i]);
				items[i].y=140;
				items[i].x=_skin.btn_prev.x+items[i].width*i+5;
				if(i<openNum){
					items[i].update(DieCfgData.allOpenList[i]);
				}else{
					items[i].update(null);
				}
			}
			
			timer.reset();
			timer.repeatCount=openTime;
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimeComplete);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
			timer.start();
		}
		
		protected function onTimer(event:TimerEvent):void
		{
			_skin.lbl_time.text="剩余:"+(openTime-timer.currentCount)+"s";
		}
		
		protected function onTimeComplete(event:TimerEvent):void
		{
			_skin.lbl_time.text="剩余:"+(openTime-timer.currentCount)+"s";
			this.hide();
		}
		
		override public function hide():void
		{
			super.hide();
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE,onTimeComplete);
			timer.removeEventListener(TimerEvent.TIMER,onTimer);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btn_yuandi:
					break;
				case _skin.btn_goumai:
					break;
				case _skin.btn_fuhuodian:
					break;
				case _skin.btn_prev:
					break;
				case _skin.btn_next:
					break;
			}
		}
	}
}