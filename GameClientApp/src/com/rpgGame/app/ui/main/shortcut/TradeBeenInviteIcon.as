package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.shortcut.MessageTradeIconSkin;
	
	public class TradeBeenInviteIcon extends MessageIconBase
	{
		private var _skin:MessageTradeIconSkin;
		public function TradeBeenInviteIcon()
		{
			_skin = new MessageTradeIconSkin();
			super(_skin, _skin.numTxt, _skin.btn);
		}
		
		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,EnumFunctionMessageBarIcoType.TRADE_TYPE);
			AppManager.showAppNoHide(AppConstant.TRADE_BEEN_INVITE_PANEL);
		}
	}
}