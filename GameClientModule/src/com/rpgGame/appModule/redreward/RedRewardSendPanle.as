package com.rpgGame.appModule.redreward
{
	import com.rpgGame.app.manager.RedRewardManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.RedRewardSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.common.NumSelectUICtrl;
	
	import org.mokylin.skin.app.hongbao.HongBao_Fa;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class RedRewardSendPanle extends SkinUIPanel
	{
		private var _skin:HongBao_Fa;
		private var _view:RedRewardSendView;
		public function RedRewardSendPanle():void
		{
			_skin = new HongBao_Fa();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			_view = new RedRewardSendView(_skin,true)
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_view.refeashView();
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			_view.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnFa:
					this.hide();
					break;
			}
		}
	}
}