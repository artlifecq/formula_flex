package com.rpgGame.appModule.mail
{
	import com.rpgGame.app.manager.MailManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.MailSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.mail.render.MailItemSelectCellRender;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.MailEvent;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.netData.mail.bean.MailBriefInfo;
	import com.rpgGame.netData.mail.bean.MailDetailInfo;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.mail.MailReceive_Skin;
	
	import starling.display.DisplayObject;
	import away3d.events.Event;
	
	/**邮件系统*/
	public class MailPanelExt extends SkinUIPanel
	{
		private var _skin:MailReceive_Skin;
		private var _mailReadPanel:MailReadPanelExt;
		private var _selectItemList:Vector.<long>;
		//		private var _mailItemList:Vector.<MailItem>;
		//当前选取的邮件
		private var _nowSelectMailItem:MailItem;
		
		public function MailPanelExt()
		{
			_skin=new MailReceive_Skin();
			super(_skin);
			//			_mailItemList=new Vector.<MailItem>();
			_selectItemList=new Vector.<long>();
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
			EventManager.addEvent(MailEvent.MAIL_SELECT,seendReadMail);
			EventManager.addEvent(MailEvent.MAIL_DETAILED_INFORMATION,showMailReadPanel);
			EventManager.addEvent(MailEvent.DEL_MAIL_DATA,updateMailList);
			EventManager.addEvent(MailEvent.ADD_MAIL_DATA,updateMailList);
			EventManager.addEvent(MailEvent.MAIL_CLOSE_READPANEL,updateSelectMailRead);
			EventManager.addEvent(MailEvent.MAIL_ONE_SELECT,updateSelectItemList);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			_nowSelectMailItem=null;
			if(_mailReadPanel) _mailReadPanel.hide();
			EventManager.removeEvent(MailEvent.MAIL_SELECT,seendReadMail);
			EventManager.removeEvent(MailEvent.MAIL_DETAILED_INFORMATION,showMailReadPanel);
			EventManager.removeEvent(MailEvent.DEL_MAIL_DATA,updateMailList);
			EventManager.removeEvent(MailEvent.ADD_MAIL_DATA,updateMailList);
			EventManager.removeEvent(MailEvent.MAIL_CLOSE_READPANEL,updateSelectMailRead);
			EventManager.removeEvent(MailEvent.MAIL_ONE_SELECT,updateSelectItemList);
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.chkSelect:
					setAllMailItemBtnStata( _skin.chkSelect.isSelected);
					break;
				case _skin.btnTiqu:
					if(_skin.btnTiqu.filter!=null){
						NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(19));
					}
					else if(_selectItemList==null||_selectItemList.length<=0){
						NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, "邮件为空,请选择要提取的邮件");
					}
					else{
						MailSender.reqReceiveAllMailMessage(_selectItemList);	
					}
					break;
				case _skin.btnCancel:
					if(_skin.btnCancel.filter!=null){
						NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(19));
					}
					else if(_selectItemList==null||_selectItemList.length<=0){
						NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(20));
					}
					else{
						MailSender.reqDeletAllMailMessage(_selectItemList);
					}
					break;
			}
		}
		
		private function initView():void
		{
			_skin.chkSelect.isSelected=false;
			setAllMailItemBtnStata( _skin.chkSelect.isSelected);
			var mailItemList:Vector.<MailBriefInfo>=MailManager.getallMailList();
			if(mailItemList==null||mailItemList.length<=0)
			{
				_skin.imgNO.visible=true;
				GrayFilter.gray(_skin.btnCancel);
				GrayFilter.gray(_skin.btnTiqu);
			}
			else
			{
				_skin.imgNO.visible=false;
				_skin.btnCancel.filter=null;
				_skin.btnTiqu.filter=null;
			}
			_skin.listMail.dataProvider=new ListCollection(mailItemList);
		}
		
		private function creatMailItemCell():MailItemSelectCellRender
		{
			var render:MailItemSelectCellRender=new MailItemSelectCellRender();
			return render;
		}
		
		/**请求选取的邮件的详细信息*/
		private function seendReadMail(item:MailItem):void
		{
			if(_nowSelectMailItem==null){
				_nowSelectMailItem=item;
				_nowSelectMailItem.setIsSelectImgState(true);
			}
			else
			{
				if(_nowSelectMailItem.mailId.EqualTo(item.mailId)) return;
				else{				
					_nowSelectMailItem.setIsSelectImgState(false);
					_nowSelectMailItem=item;
					_nowSelectMailItem.setIsSelectImgState(true);
				}
			}
			MailManager.setMailIsRead(_nowSelectMailItem.mailId);
			_nowSelectMailItem.setData(MailManager.getMailById(_nowSelectMailItem.mailId));
			MailSender.reqGetMailAttachmentMessage(_nowSelectMailItem.mailId);
		}
		
		/**显示选取的邮件的详细信息*/
		public function showMailReadPanel(info:MailDetailInfo):void
		{
			if(_mailReadPanel!=null&&_mailReadPanel.parent!=null)
			{
				_mailReadPanel.setdata(info);
				return;
			}
			if(_mailReadPanel==null)
			{
				_mailReadPanel=new MailReadPanelExt();
				_mailReadPanel.addEventListener(Event.REMOVED,panleremoveFormSatgeHander);
			}
			this.parent.addChild(_mailReadPanel);
			_mailReadPanel.setdata(info);
			onStageResize(_stage.stageWidth,_stage.stageHeight);
		}
		
		/**邮件发生改变，重新刷新显示*/
		private  function updateMailList():void
		{
			initView();
		}	
		
		/**重置选取*/
		private function updateSelectMailRead():void
		{
			if(_nowSelectMailItem!=null)
			{
				MailManager.setMailIsRead(_nowSelectMailItem.mailId);
				_nowSelectMailItem.setData(MailManager.getMailById(_nowSelectMailItem.mailId));
				_nowSelectMailItem.setIsSelectImgState(false);
				_nowSelectMailItem=null;
			}
		}
		
		/**更新选择*/
		private function updateSelectItemList(item:MailItem):void
		{
			if(item.isSelect()){
				if(!isHaveId(item.mailId)) _selectItemList.push(item.mailId);
			}
			else{
				if(isHaveId(item.mailId)) deletId(item.mailId);
			}
		}
		
		private function panleremoveFormSatgeHander():void
		{
			onStageResize(_stage.stageWidth,_stage.stageHeight);
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			var gap:int = 20;
			var w:int = this.width;
			if(_mailReadPanel!=null&&_mailReadPanel.isAddToStage)
			{
				w +=gap+_mailReadPanel.width;
			}
			this.x =(sw - w)/2;
			this.y =(sh - this.height)/2;
			if(_mailReadPanel!=null&&_mailReadPanel.isAddToStage)
			{
				_mailReadPanel.x = this.width+this.x +gap;
				_mailReadPanel.y = (sh - _mailReadPanel.height)/2;
			}
		}
		
		private function getSelectMailList():Vector.<long>
		{
			var list:Vector.<long>=new Vector.<long>();
			var len:int=_skin.listMail.dataProvider.length;
			if(len>0)
			{
				//				for(var i:int=0;i<len;i++)
				//				{
				//					if(_mailItemList[i].isSelect())
				//						list.push(_mailItemList[i].mailId);
				//				}
			}
			return list;
		}
		
		private function isHaveId(id:long):Boolean
		{
			if(_selectItemList==null||_selectItemList.length<=0) return false;
			for(var i:int=0;i<_selectItemList.length;i++)
			{
				if(id.EqualTo(_selectItemList[i])) return true;
			}
			return false;
		}
		
		private function deletId(id:long):void
		{
			if(_selectItemList==null||_selectItemList.length<=0) return;
			for(var i:int=0;i<_selectItemList.length;i++)
			{
				if(id.EqualTo(_selectItemList[i]))
				{
					_selectItemList.removeAt(i);
				}
			}
		}
		
		private function setAllMailItemBtnStata(bool:Boolean):void
		{
			MailManager.isALL=bool;
			EventManager.dispatchEvent(MailEvent.MAIL_ALL_SELECT,bool);
			if(bool)
			{
				var len:int=_skin.listMail.dataProvider.length;
				if(len>0)
				{
					for(var i:int=0;i<len;i++)
					{
						var info1:MailBriefInfo=_skin.listMail.dataProvider.getItemAt(i) as MailBriefInfo;
						_selectItemList.push(info1.mailInfoId);
					}
				}
				else
					_selectItemList.length=0;
			}
			
		}
	}
}