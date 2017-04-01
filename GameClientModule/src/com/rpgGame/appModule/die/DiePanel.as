package com.rpgGame.appModule.die
{
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.cfg.DieCfgData;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.lang.LangQ_BackPack;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.player.message.ResPlayerDieMessage;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import feathers.utils.filter.GrayFilter;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.siwangfuhuo.fuhuo_Skin;
	import org.mokylin.skin.common.Erji_panelbg_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	
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
		private var showItem:DieToItem;

		private var openTime:int;

		private var timer:Timer;
		private var openMask:Sprite;

		private var currentSeeIndex:int;
		private var maxSeeIndex:int;
		private var tween:TweenLite;
		
		private const FUHUO_ID:int=300;
		
		public function DiePanel()
		{
			_skin=new fuhuo_Skin();
			timer=new Timer(1000);
			super(_skin);
			
			(_skin.bg.skin as Erji_panelbg_Skin).btnClose.visible=false;
			openMask=new Sprite();
			openMask.graphics.graphics.beginFill(0);
			openMask.graphics.drawRect(0,0,this._skin.openGrp.width,this._skin.openGrp.height);
			openMask.graphics.endFill();
			openMask.x=this._skin.openGrp.x;
			openMask.y=this._skin.openGrp.y;
			this._skin.openGrp.mask=openMask;
			this._skin.container.addChild(openMask);
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
			for(var i:int=0;i<5;i++){
				items.push(new DieToItem());
				this._skin.openGrp.addChild(items[i]);
				items[i].x=(items[i].width+8)*i;
				if(i<openNum){
					items[i].update(DieCfgData.allOpenList[i]);
				}else{
					items[i].update(null);
				}
			}
			showItem=items[4];
			
			maxSeeIndex=openNum-4;
			currentSeeIndex=0;
			updateSeeItem(true,false);
			
			timer.reset();
			if(openTime>0){
				timer.repeatCount=openTime;
				timer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimeComplete);
				timer.addEventListener(TimerEvent.TIMER,onTimer);
				timer.start();
			}
			
			EventManager.addEvent(MainPlayerEvent.REVIVE_SUCCESS,hide);
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
			EventManager.removeEvent(MainPlayerEvent.REVIVE_SUCCESS,hide);
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE,onTimeComplete);
			timer.removeEventListener(TimerEvent.TIMER,onTimer);
			timer.stop();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			
			BackPackManager.instance.getBagItemsCountById(FUHUO_ID);
			
			switch(target){
				case _skin.btn_yuandi:
					if(BackPackManager.instance.getBagItemsCountById(FUHUO_ID)>0){
						SceneSender.reqReviveLocalRole(FUHUO_ID,1);
						this.hide();
					}else{
						var alertSet:AlertSetInfo=new AlertSetInfo(LangQ_BackPack.ITEM_less_1);
						GameAlert.showAlert(alertSet,alertToBuy);
					}
					break;
				case _skin.btn_goumai:
					showByFuHuo();
					break;
				case _skin.btn_fuhuodian:
					SceneSender.reqReviveRole();
					this.hide();
					break;
				case _skin.btn_prev:
					if(tween){
						tween.complete();
					}
					currentSeeIndex++;
					updateSeeItem(false);
					break;
				case _skin.btn_next:
					if(tween){
						tween.complete();
					}
					currentSeeIndex--;
					updateSeeItem(true);
					break;
			}
		}
		
		private function alertToBuy(alert:GameAlert):void
		{
			if(alert.clickType==AlertClickTypeEnum.TYPE_SURE){
				showByFuHuo();
			}			
		}
		
		private function showByFuHuo():void
		{
			// TODO Auto Generated method stub
//			this.hide();
		}
		
		private function updateSeeItem(isNext:Boolean,showAni:Boolean=true):void
		{
			_skin.btn_prev.visible=true;
			_skin.btn_next.visible=true;
			if(currentSeeIndex==0){
				_skin.btn_next.visible=false;
			}
			if(currentSeeIndex==maxSeeIndex){
				GrayFilter.gray(_skin.btn_prev);
				_skin.btn_prev.visible=false;
			}
			
			if(!showAni){
				return;
			}
			
			if(isNext){
				showItem.x=items[0].x-8-items[0].width;
				showItem.update(DieCfgData.allOpenList[currentSeeIndex]);
				tween=TweenLite.to(_skin.openGrp,0.5,{x:_skin.openGrp.x+items[0].width+8,onComplete:onTween});
			}else{
				showItem.x=items[3].x+items[0].width+8;
				showItem.update(DieCfgData.allOpenList[currentSeeIndex+3]);
				tween=TweenLite.to(_skin.openGrp,0.5,{x:_skin.openGrp.x-items[0].width-8,onComplete:onTween});
			}
		}
		
		private function onTween():void
		{
			_skin.openGrp.x=46;
			for(var i:int=0;i<4;i++){
				items[i].update(DieCfgData.allOpenList[currentSeeIndex+i]);
			}
			tween.kill();
			tween=null;
		}
	}
}