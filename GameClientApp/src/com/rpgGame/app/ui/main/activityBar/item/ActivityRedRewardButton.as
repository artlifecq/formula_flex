package com.rpgGame.app.ui.main.activityBar.item
{
	
	import com.rpgGame.app.manager.RedRewardManager;
	import com.rpgGame.core.events.RedRewardEvent;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.common.YuanDian_Skin;
	
	import starling.display.Sprite;

	public class ActivityRedRewardButton extends ActivityButton
	{
		private var _lableContent:Sprite;
		private var _labSkin:YuanDian_Skin;
		public function ActivityRedRewardButton():void
		{
			super();
			initView();
		}
		
		private function initView():void
		{
			_labSkin = new YuanDian_Skin();
			_lableContent = new Sprite();
			_lableContent.y = 12;
			_lableContent.x = 55;
			_labSkin.toSprite(_lableContent);
			this.addChild(_lableContent);
		}
		
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(RedRewardEvent.UPDATA_COUNTINFO,refeashCount);
			refeashCount();
		}
		
		private function refeashCount():void
		{
			var count:int = RedRewardManager.instance().redCount;
			_labSkin.lbnum.text = count.toString();
			var minValie:int = Math.min(RedRewardManager.instance().haveRewardCount,count)
			if((RedRewardManager.instance().isMaxVipLevel&&minValie==0)
				||(!RedRewardManager.instance().isMaxVipLevel&&count==0))
			{
				_lableContent.visible = false;
			}else{
				_lableContent.visible = true;
			}
				
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(RedRewardEvent.UPDATA_COUNTINFO,refeashCount);
		}
		
	}
}