package com.rpgGame.appModule.redreward
{
	import com.rpgGame.app.manager.RedRewardManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.RedRewardSender;
	import com.rpgGame.app.ui.common.NumSelectUICtrl;
	import com.rpgGame.core.events.RedRewardEvent;
	
	import away3d.events.Event;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hongbao.HongBao_Fa;
	
	import starling.display.DisplayObject;

	public class RedRewardSendView
	{
		private var _skin:HongBao_Fa;
		private var _itemPage1:NumSelectUICtrl;
		public function RedRewardSendView(skin:HongBao_Fa,isshowClose:Boolean):void
		{
			_skin = skin;
			_skin.btnClose.visible = isshowClose;
			initView();
		}
		
		private function initView():void
		{
			_itemPage1 = new NumSelectUICtrl(_skin.btn_max,_skin.btn_min,_skin.btn_all,null,_skin.lbBuyNum,1,int.MAX_VALUE,null,0);
			_skin.container.addEventListener(Event.ADDED_TO_STAGE,addTostageHandler);
			_skin.container.addEventListener(Event.REMOVED_FROM_STAGE,removeformstageHandler);
		}
		private function addTostageHandler(e:Event):void
		{
			EventManager.addEvent(RedRewardEvent.UPDATA_COUNTINFO,updataShow);
			updataShow();
		}
		private function removeformstageHandler(e:Event):void
		{
			EventManager.removeEvent(RedRewardEvent.UPDATA_COUNTINFO,updataShow);
		}
		private function updataShow():void
		{
			var count:int = RedRewardManager.instance().sendCount;
			_itemPage1.updateMax(count ,count,false);
			_itemPage1.maxValue();
			_skin.lbItem.text = count.toString();
		}
		public function refeashView():void
		{
			var count:int = RedRewardManager.instance().sendCount;
			_itemPage1.updateMax(count ,count,false);
			_itemPage1.maxValue();
			_skin.lbItem.text = count.toString();
		}
		
		public function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _skin.btnFa:
					RedRewardManager.instance().sendReward( _itemPage1.getValue());
					break;
			}
		}
	}
}