package com.rpgGame.appModule.redreward
{
	import com.rpgGame.app.manager.RedRewardManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.RedRewardSender;
	import com.rpgGame.app.ui.common.NumSelectUICtrl;
	
	import org.mokylin.skin.app.hongbao.HongBao_Fa;
	
	import starling.display.DisplayObject;

	public class RedRewardSendView
	{
		private var _skin:HongBao_Fa;
		private var _itemPage1:NumSelectUICtrl;
		public function RedRewardSendView(skin:HongBao_Fa):void
		{
			_skin = skin;
			initView();
		}
		
		private function initView():void
		{
			_itemPage1 = new NumSelectUICtrl(_skin.btn_max,_skin.btn_min,_skin.btn_all,null,_skin.lbBuyNum,1,int.MAX_VALUE,null);
		}
		public function refeashView():void
		{
			var count:int = RedRewardManager.instance().sendCount;
			_itemPage1.updateMax(count ,count);
			_skin.lbItem.text = count.toString();
		}
		
		public function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _skin.btnFa:
					var count:int = _itemPage1.getValue();
					if(count==0)
					{
						NoticeManager.showNotifyById(91001);
						return ;
					}
					if(RedRewardManager.instance().sendCount<=0)
					{
						NoticeManager.showNotifyById(91002);
						return ;
					}
					RedRewardSender.sendReward(count);
					break;
			}
		}
	}
}