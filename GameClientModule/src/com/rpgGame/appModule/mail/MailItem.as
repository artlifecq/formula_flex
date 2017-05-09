package com.rpgGame.appModule.mail
{
	import com.rpgGame.app.utils.RoleFaceMaskEffectUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.MailEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.ZhanGongEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.info.mail.MailInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.mail.Mail_Item;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class MailItem extends SkinUI
	{
		private var _skin:Mail_Item;
		private var _info:MailInfo;
		public function MailItem()
		{
			_skin=new Mail_Item();
			super(_skin);
			_skin.chkSelect.isToggle=false;
			_skin.imgOver.visible=false;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			
		}
		
		public function setData(data:*):void
		{
			_info=data as MailInfo;
			if(!_info.isRead)
				_skin.uiCurrent.styleName="ui/app/mail/yj_zc.png";
			else
			{
				_skin.uiCurrent.styleName="ui/app/mail/yj_dakai.png";
			}
			_skin.lbName.text=_info.mailTitle;
			_skin.lbTime.text="剩余时间："+TimeUtil.timeFormatCH(_info.endTime);		
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.imgOver:
					onToShowThis(null);
					break;
			}
		}
		
		public function onTouchItem(e:TouchEvent):void
		{
			var t:Touch=e.getTouch(this);
			if(!t){
				_skin.imgOver.visible=false;
				return;
			}
			t=e.getTouch(this,TouchPhase.HOVER);
			if(t){
				_skin.imgOver.visible=true;
			}
		}
		
		private function onToShowThis(e:Event):void
		{
			EventManager.dispatchEvent(MailEvent.MAIL_SELECT,this);
		}
	}
}