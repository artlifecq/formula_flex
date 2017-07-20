package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.core.events.ChatEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.netData.chat.message.ResChatMessage;
	
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.systemMsg.systemMsgSkin;
	
	import starling.display.DisplayObject;
	
	
	/**
	 * 系统消息面板
	 * @author dik
	 * 
	 */
	public class SystemMsgBar extends SkinUI
	{
		private var _skin : systemMsgSkin;
		
		private var _currentMsg:Vector.<ResChatMessage>;
		private var _allMsg:Vector.<ResChatMessage>;
		private var _sysMsg:Vector.<ResChatMessage>;
		private var maxMsgNum:uint=5;
		private var stageW:int;
		private var stageH:int;
		
		private var detailPanel:SystemMsgPanel;
		
		public function SystemMsgBar()
		{
			_skin=new systemMsgSkin();
			super(_skin);
			_skin.bg.alpha=0.5;
			MCUtil.removeSelf(_skin.btn_jian);
			var defaultFormat : TextFormat = new TextFormat(Fontter.FONT_Hei);
			defaultFormat.color = 0xded8c7;
			defaultFormat.size = 14;
			defaultFormat.align = TextFormatAlign.LEFT;
			defaultFormat.letterSpacing = 1;
			defaultFormat.leading = 5;
			
			_skin.msg_list.verticalScrollBarPosition = "right";
			_skin.msg_list.scrollBarDisplayMode=ScrollBarDisplayMode.NONE;
			_skin.msg_list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.msg_list.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			SystemMsgItemRender.WIDTH=_skin.bg.width-20;
			_skin.msg_list.itemRendererType = SystemMsgItemRender;
			_skin.msg_list.dataProvider = new ListCollection();
			var layout:VerticalLayout = new VerticalLayout();
			layout.useVirtualLayout = true;
			layout.gap = 1;
			layout.hasVariableItemDimensions = true;
			_skin.msg_list.layout = layout;
			
			_allMsg=new Vector.<ResChatMessage>();
			_sysMsg=new Vector.<ResChatMessage>();
			
			//			_skin.btn_jia.visible=false;
			
			detailPanel=new SystemMsgPanel();
			
			initEvent();
		}
		
		public function set currentMsg(value:Vector.<ResChatMessage>):void
		{
			_currentMsg = value;
			var num:int=_currentMsg.length-maxMsgNum;
			if(num>0){
				_currentMsg.splice(0,num);
			}
			_skin.msg_list.dataProvider.removeAll();
			num=_currentMsg.length;
			for(var i:int=0;i<num;i++){
				_skin.msg_list.dataProvider.addItem(_currentMsg[i]);
			}
			_skin.msg_list.scrollToBottom(0);
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(ChatEvent.SEND_SUCCESS, onSendSuccess);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			CONFIG::netDebug {
				NetDebug.LOG("[ChatBar] [onTouchTarget] targetName:" + target.name);
			}
				
				switch (target) {
					case this._skin.btn_jia:
						if(detailPanel.parent){
							detailPanel.hide();
							return;
						}
						detailPanel.show();
						break;
				}
		}
		
		private function onSendSuccess( info:ResChatMessage):void
		{
			//只显示系统和传闻
			if(info.type==EnumChatChannelType.CHAT_CHANNEL_HEARSAY||info.type==EnumChatChannelType.CHAT_CHANNEL_SYSTEM){
				ChatManager.recordSystemHearsayMsg(info);
				showChatMsg( info );	
			}
		}
		
		private function showChatMsg( info:ResChatMessage ):void
		{
			_allMsg.push(info);
			currentMsg=_allMsg;
			if(info.type==EnumChatChannelType.CHAT_CHANNEL_SYSTEM){
				_sysMsg.push(info);
			}
		}
		
		public function resize(w : int, h : int) : void {
			stageW=w;
			stageH=h;
			this.x = w-this._skin.bg.width
			this.y = h - this._skin.bg.height-10;
		}
	}
}