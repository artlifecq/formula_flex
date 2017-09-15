package com.rpgGame.app.ui.main.activityBar.item
{
	
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.RedRewardManager;
	import com.rpgGame.core.events.RedRewardEvent;
	import com.rpgGame.coreData.cfg.RedRewardCfgData;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.common.YuanDian_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class ActivityRedRewardButton extends ActivityButton
	{
		private var _lableContent:Sprite;
		private var _labSkin:YuanDian_Skin;
		private var _maxCount:int;
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
			_maxCount = RedRewardCfgData.getdataById(5).q_count;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(RedRewardEvent.UPDATA_COUNTINFO,refeashCount);
			refeashCount();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			var _local2:ActivityButtonBase = this;
			var name : String = target.name;
			switch (name)
			{
				case "btnClose":
				case "closeBtn":
					this.removeFromParent();
					break;
			}
			switch (target)
			{
				case ui.btnBar:
					onButtonClick();
					if(RedRewardManager.instance().canGetReward)
						FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_REDREWARD);
					else
						FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_REDREWARDGETLOG);
					return;
			}
		}
		
		private function refeashCount():void
		{
			var count:int = RedRewardManager.instance().haveRewardCount;
			if(RedRewardManager.instance().vipInfo==null)
			{
				count = _maxCount;
			}else{
				count +=_maxCount - RedRewardManager.instance().vipInfo.q_count;
			}
			
			var minValue:int = Math.min(RedRewardManager.instance().redCount,count);
			_labSkin.lbnum.text = minValue.toString();
			_lableContent.visible = minValue>0;
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(RedRewardEvent.UPDATA_COUNTINFO,refeashCount);
		}
		
	}
}