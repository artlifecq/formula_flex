package com.rpgGame.appModule.mail
{
	import com.rpgGame.app.manager.MailManager;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.MailEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.netData.mail.bean.MailBriefInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.mail.Mail_Item;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class MailItem extends SkinUI
	{
		private var _skin:Mail_Item;
		private var _info:MailBriefInfo;
		public function MailItem()
		{
			_skin=new Mail_Item();
			super(_skin);
			_skin.chkSelect.isSelected=false;
			_skin.imgOver.visible=false;
			_skin.imgSelect.visible=false;
		}
		
		public function get mailId():long
		{
			return _info.mailInfoId;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			EventManager.addEvent(MailEvent.MAIL_COLLECT_CHANGE,updateinfo);
			EventManager.addEvent(MailEvent.MAIL_ALL_SELECT,setChkselectStata);
			_skin.chkSelect.isSelected=MailManager.isALL;
		}
		
		override protected function onHide():void
		{
			super.onHide();
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			EventManager.removeEvent(MailEvent.MAIL_COLLECT_CHANGE,updateinfo);
			EventManager.removeEvent(MailEvent.MAIL_ALL_SELECT,setChkselectStata);
			_skin.chkSelect.isSelected=false;
		}
		
		public function setData(data:*):void
		{
			_info=data as MailBriefInfo;			
			_skin.lbName.text=_info.senderName;
			_skin.lbTime.text="剩余时间："+_info.leftDays+"天";	
			updateIco();
		}
		
		public function updateIco():void
		{
			if(_info.isRead==0)
				_skin.uiCurrent.styleName="ui/app/mail/yj_zc.png";
			else
			{
				if(_info.items!=null&&_info.items.length>0)
					_skin.uiDian.visible=true;
				else _skin.uiDian.visible=false;
				
				_skin.uiCurrent.styleName="ui/app/mail/yj_dakai.png";
			}
		}
		
		public function ClearData():void
		{
			_info=null;
			_skin.lbName.text="无";
			_skin.lbTime.text="剩余时间：0天";		
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.chkSelect:
					setIsselect();
					break;
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
		
		private function updateinfo(id:long):void
		{
			if(_info!=null)
			{
				if(id.EqualTo(_info.mailInfoId))
				{
					_info.isRead=1;
					_info.items=null;
					updateIco();
				}
			}
		}
		
		private var _isselect:Boolean;
		private function setIsselect():void
		{
			_isselect=_skin.chkSelect.isSelected;
			EventManager.dispatchEvent(MailEvent.MAIL_ONE_SELECT,this);
		}
		
		public function setChkselectStata(bool:Boolean):void
		{
			_isselect=_skin.chkSelect.isSelected=bool;
		}
		
		public function setIsSelectImgState(bool:Boolean):void
		{
			_skin.imgSelect.visible=bool;
		}
		
		public function isSelect():Boolean
		{
			return _isselect;
		}
		
		private function onToShowThis(e:Event):void
		{
			EventManager.dispatchEvent(MailEvent.MAIL_SELECT,this);
		}
	}
}