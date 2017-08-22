package com.rpgGame.appModule.mail
{
	import com.rpgGame.app.manager.MailManager;
	import com.rpgGame.core.events.MailEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.netData.mail.bean.MailBriefInfo;
	
	import flash.geom.Point;
	
	import away3d.events.Event;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.mail.Mail_Item;
	
	import starling.display.DisplayObject;
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
		
		public function get info():MailBriefInfo
		{
			return _info;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			EventManager.addEvent(MailEvent.MAIL_COLLECT_CHANGE,updateinfo);
			EventManager.addEvent(MailEvent.MAIL_ALL_SELECT,setChkselectStata);
//			EventManager.addEvent(MailEvent.MAIL_NEXT_SELECT,showNext);
			_skin.chkSelect.isSelected=MailManager.isALL;
		}
		
		override protected function onHide():void
		{
			super.onHide();
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			EventManager.removeEvent(MailEvent.MAIL_COLLECT_CHANGE,updateinfo);
			EventManager.removeEvent(MailEvent.MAIL_ALL_SELECT,setChkselectStata);
//			EventManager.removeEvent(MailEvent.MAIL_NEXT_SELECT,showNext);
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
		
		private static const HELPER_POINT:Point = new Point();
		protected var touchPointID:int = -1;
		public function onTouchItem(e:TouchEvent):void
		{
			if(this.touchPointID >= 0)
			{
				var touch:Touch = e.getTouch(this, null, this.touchPointID);
				if(!touch || !this.stage)
				{
					//this should never happen
					return;
				}
				
				touch.getLocation(this.stage, HELPER_POINT);
				var isInBounds:Boolean = this.contains(this.stage.hitTest(HELPER_POINT));
				if(touch.phase === TouchPhase.MOVED)
				{
					if(isInBounds)
					{
						_skin.imgOver.visible=true;
					}
					else
					{
						_skin.imgOver.visible=false;
					}
				}else if(touch.phase === TouchPhase.ENDED){
					this.touchPointID = -1;
					if(isInBounds)
					{
						_skin.imgOver.visible=true;
					}
					else
					{
						_skin.imgOver.visible=false;
					}
				}
				return;
			}
			else //if we get here, we don't have a saved touch ID yet
			{
				touch = e.getTouch(this, TouchPhase.BEGAN);
				if(touch)
				{
					_skin.imgOver.visible=true;
					this.touchPointID = touch.id;
					return;
				}
				touch = e.getTouch(this, TouchPhase.HOVER);
				if(touch)
				{
					_skin.imgOver.visible=true;
					return;
				}
				
				//end of hover
				_skin.imgOver.visible=false;
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
//					var nextMail:MailBriefInfo=MailManager.getNextMail(_info.mailInfoId);
//					if(nextMail){
//						EventManager.dispatchEvent(MailEvent.MAIL_NEXT_SELECT,nextMail.mailInfoId);
//					}
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
		
		private function showNext(id:long):void
		{
			if(_info.mailInfoId.EqualTo(id))
				onToShowThis(null);
		}
		
		public function setIsSelectImgState(bool:Boolean):void
		{
			_skin.imgSelect.visible=bool;
//			if(!bool)	_skin.imgOver.visible=false;
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