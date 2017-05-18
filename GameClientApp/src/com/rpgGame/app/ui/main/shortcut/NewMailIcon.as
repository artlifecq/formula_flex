package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.lang.LangMAILUI;
	import com.rpgGame.coreData.lang.LangMAIL_UI;
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
			var num:int=parseInt(_skin.lbNum.text);
			if(num>=90)
			{
				var alertSet:AlertSetInfo= new AlertSetInfo(LangMAIL_UI.MAIL_TEXT1);
				alertSet.isShowCBox = false;
				alertSet.alertInfo.title="邮件提示";
				alertSet.alertInfo.leftValue="前往整理";
				GameAlert.showAlert(alertSet,onToUp);
			}
			else
			{
				AppManager.showAppNoHide(AppConstant.MAIL_PANEL);
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.MAIL_TYPE);
			}
		}
		
		private function onToUp(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					AppManager.showAppNoHide(AppConstant.MAIL_PANEL);
					EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.MAIL_TYPE);
					break;
			}				
		}
		
		override protected function onCloseAll():void
		{
			super.onCloseAll();
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.MAIL_TYPE);
		}
	}
}