package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.manager.MailManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.message.Msg_Mail;
	
	public class NewMailIcon extends MessageIconBase
	{
		private var _skin:Msg_Mail;
		public function NewMailIcon()
		{
			_skin=new Msg_Mail();
			super(_skin, _skin.lbNum, _skin.btnCont, null, _skin.btnClose);
			TipTargetManager.show( this, TargetTipsMaker.makeSimpleTextTips("收到新邮件"));
		}
		
		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
			AppManager.showAppNoHide(AppConstant.MAIL_PANEL);
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.MAIL_TYPE);
		}
		override protected function onCloseAll():void
		{
			super.onCloseAll();
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.MAIL_TYPE);
		}
	}
}