package com.rpgGame.appModule.mail
{
	import com.rpgGame.app.manager.MailManager;
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.mail.render.MailItemSelectCellRender;
	import com.rpgGame.core.events.MailEvent;
	import com.rpgGame.core.events.ZhanGongEvent;
	import com.rpgGame.coreData.info.mail.MailInfo;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.mail.MailReceive_Skin;
	
	/**邮件系统*/
	public class MailPanelExt extends ViewUI
	{
		private var _skin:MailReceive_Skin;
		public function MailPanelExt()
		{
			_skin=new MailReceive_Skin();
			super(_skin);
			
			_skin.listMail.itemRendererFactory = creatMailItemCell;
			_skin.listMail.clipContent = true;
			_skin.listMail.verticalScrollBarPosition = "right";
			_skin.listMail.scrollBarDisplayMode=ScrollBarDisplayMode.ALWAYS_VISIBLE;
			_skin.listMail.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.listMail.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			_skin.listMail.padding=2;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			initView();
			EventManager.addEvent(MailEvent.MAIL_SELECT,showMailPanel);
		}
		
		override protected function onHide():void
		{
			super.onHide();
		}
		
		private function initView():void
		{
			clearList();
			var mailItemList:Array=MailManager.mailList();
			_skin.listMail.dataProvider=new ListCollection(mailItemList);
		}
		
		private function creatMailItemCell():MailItemSelectCellRender
		{
			var render:MailItemSelectCellRender=new MailItemSelectCellRender();
			return render;
		}
		
		private function showMailPanel(info:MailInfo):void
		{
			
		}
		
		private function clearList():void
		{
			if(_skin.listMail.numChildren>0)
				_skin.listMail.removeChildAt(0);
		}
	}
}