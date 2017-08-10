package com.rpgGame.appModule.mail
{
	import com.rpgGame.app.sender.MailSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.MailEvent;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.mail.bean.MailDetailInfo;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollPolicy;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.mail.MailRead_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class MailReadPanelExt extends SkinUIPanel
	{
		private var _skin:MailRead_Skin;
		private var _info:MailDetailInfo;
		private var _skillContainer:Sprite;
		private var _lastSp:Sprite;
		public function MailReadPanelExt()
		{
			_skin=new MailRead_Skin();
			super(_skin);
			initpanel();
		}	
		
		private function initpanel():void
		{
			_skillContainer=new Sprite();
			this._skin.vs_bar.width=385;
			this._skin.vs_bar.x=28;
			this._skin.vs_bar.scrollBarDisplayMode = ScrollBarDisplayMode.FIXED;
			this._skin.vs_bar.horizontalScrollPolicy=ScrollPolicy.OFF;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(MailEvent.MAIL_COLLECT_CHANGE,updateinfo);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.dispatchEvent(MailEvent.MAIL_CLOSE_READPANEL);
			EventManager.removeEvent(MailEvent.MAIL_COLLECT_CHANGE,updateinfo);
			_isAddToStage = false;
			_skin.lbName.text="无";
			_skin.lbZhuti.text="无";
			_skin.lbXiangqing.text="无";
			_skin.lbTime.text="剩余时间：0天";
			_info=null;
			clearIcoList();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnCancel:
					closePanel();
					break;
				case _skin.btnTiqu:
					receivePrize();
					break;
			}
		}
		
		public function setdata(info:MailDetailInfo):void
		{
			_info=info;
			initView();
		}
		
		private function initView():void
		{
			_skin.lbName.text=_info.senderName;
			_skin.lbZhuti.text=_info.subject;
			_skin.lbXiangqing.text=_info.content;
			_skin.lbTime.text="剩余时间："+_info.leftDays+"天";
			showPrize();
		}
		
		private var _isAddToStage:Boolean;
		
		public function get isAddToStage():Boolean
		{
			return _isAddToStage;
		}
		
		override protected function onStageResize(sw:int, sh:int):void
		{
			_isAddToStage = true;
		}
		
		private function showPrize():void
		{
			clearIcoList();
			if(_info.attachments==null||_info.attachments.length<=0)
			{
				_skin.btnTiqu.visible=false;
				_skin.btnCancel.x=177;
			}
			else
			{
				for(var i:int=0;i<_info.attachments.length;i++)
				{
					var ico:IconCDFace=IconCDFace.create(IcoSizeEnum.ICON_48);		
					ico.selectImgVisible=false;
					var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(_info.attachments[i].tempItemInfo.mod,_info.attachments[i].tempItemInfo.num);
					FaceUtil.SetItemGrid(ico,itemInfo);
					ico.x=(i%6)*60;
					ico.y=(int(i/6))*54;
					_skillContainer.addChild(ico);
				}
				_lastSp=new Sprite();
				_lastSp.y=ico.y+ico.height+2;
				_skillContainer.addChild(_lastSp);
				_skin.vs_bar.addChild(_skillContainer);
				_skin.btnTiqu.visible=true;
				_skin.btnCancel.x=138;
			}
		}
		
		private function updateinfo(id:long):void
		{
			if(id.EqualTo(_info.mailInfoId))
			{
				_info.attachments=null;
				showPrize();
			}
		}
		
		private function clearIcoList():void
		{
			_skin.vs_bar.removeChildren();
			_skillContainer.removeChildren();
		}
		
		private function receivePrize():void
		{
			MailSender.reqReceiveMailMessage(_info.mailInfoId);
		}
		
		public function closePanel():void
		{	
			MailSender.reqDeletMailMessage(_info.mailInfoId);
			this.hide();			
		}
	}
}