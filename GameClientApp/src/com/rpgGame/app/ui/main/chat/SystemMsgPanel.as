package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.netData.chat.message.ResChatMessage;
	
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.getTimer;
	
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.common.panel_ziriSkin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *系统消息面板 
	 * @author dik
	 * 
	 */
	public class SystemMsgPanel extends SkinUIPanel
	{
		private var _skin : panel_ziriSkin;
		
		private var _showDatas:Vector.<ResChatMessage>;
		
		private var bgW:int;
		private var preTime:int;
		private var updateTween:TweenLite;
		
		public function SystemMsgPanel()
		{
			this._skin = new panel_ziriSkin();
			super(this._skin);
			
			initView();
		}
		
		private function initEvent():void
		{
//			_skin.tab_zizhi.addEventListener(Event.SELECT,onSelected);
			ChatManager.sysHearsayMsgChange=onSendSuccess;
		}
		
		private function onSendSuccess(info:ResChatMessage):void
		{
			if(info.type==EnumChatChannelType.CHAT_CHANNEL_HEARSAY||info.type==EnumChatChannelType.CHAT_CHANNEL_SYSTEM){
				_skin.msg_list.dataProvider.addItem(info);
				if (_skin.msg_list.dataProvider.length > ChatManager.MAX_CHATSHOWITEMCACEHE)
				{
					_skin.msg_list.dataProvider.removeItemAt(0);
				}
				_skin.msg_list.scrollToBottom(0);
			}
		}
		
//		private function onSelected(e:Event=null):void
//		{
//			switch(_skin.tab_zizhi.selectedIndex){
//				case 0:
//					_showDatas=ChatManager.systemHearsayMsg;
//					break;
//				case 1:
//					_showDatas=ChatManager.hearsayMsg;
//					break;
//				case 2:
//					_showDatas=ChatManager.systemMsg;
//					break;
//			}
//			updateTxt();
//		}
		
		private function updateTxt():void
		{
			if(getTimer()-preTime<300){
				if(updateTween){
					updateTween.kill();
				}
				updateTween=TweenLite.delayedCall(1,updateTxt);
				return;
			}
			updateTween=null;
			_skin.msg_list.dataProvider.removeAll();
			var num:int=_showDatas.length;
			for(var i:int=0;i<num;i++){
				_skin.msg_list.dataProvider.addItem( _showDatas[i]);
			}
			preTime=getTimer();
			_skin.msg_list.scrollToBottom(0);
		}
		
		private function initView():void
		{
			var defaultFormat : TextFormat = new TextFormat(Fontter.FONT_Hei);
			defaultFormat.color = 0xded8c7;
			defaultFormat.size = 14;
			defaultFormat.align = TextFormatAlign.LEFT;
			defaultFormat.letterSpacing = 1;
			defaultFormat.leading = 5;
			
			bgW=310;
			
			_skin.msg_list.verticalScrollBarPosition = "right";
			_skin.msg_list.horizontalScrollPolicy = "off";
			_skin.msg_list.verticalScrollPolicy = "on";
			_skin.msg_list.scrollBarDisplayMode = "fixed";
			SystemMsgItemRender.WIDTH=298;
			_skin.msg_list.itemRendererType = SystemMsgItemRender;
			_skin.msg_list.dataProvider = new ListCollection();
			var layout:VerticalLayout = new VerticalLayout();
			layout.useVirtualLayout = true;
			layout.gap = 1;
			layout.hasVariableItemDimensions = true;
			_skin.msg_list.layout = layout;
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			initEvent();	
			_skin.tab_zizhi.selectedIndex=0;
			_showDatas=ChatManager.systemHearsayMsg;
			updateTxt();
		}
		
		override public function hide():void
		{
			super.hide();
//			_skin.tab_zizhi.removeEventListener(Event.SELECT,onSelected);
			ChatManager.sysHearsayMsgChange=null;
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			switch (target) {
				case this._skin.btnClose:
					this.hide();
					break;
			}
		}
	}
}