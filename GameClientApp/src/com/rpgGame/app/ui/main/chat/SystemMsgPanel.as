package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.coreData.utils.ColorUtils;
	import com.rpgGame.netData.chat.message.ResChatMessage;
	
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import feathers.controls.Scroller;
	import feathers.controls.text.Fontter;
	
	import org.mokylin.skin.common.panel_ziriSkin;
	
	import starling.display.DisplayObject;
	import away3d.events.Event;
	
	/**
	 *系统消息面板 
	 * @author dik
	 * 
	 */
	public class SystemMsgPanel extends SkinUIPanel
	{
		private var _skin : panel_ziriSkin;
		
		private var _msgTxt:RichTextArea3D;
		private var _showDatas:Vector.<ResChatMessage>;

		private var bgW:int;
		
		public function SystemMsgPanel()
		{
			this._skin = new panel_ziriSkin();
			super(this._skin);
			
			initView();
			initEvent();
		}
		
		private function initEvent():void
		{
			_skin.tab_zizhi.addEventListener(Event.SELECT,onSelected);
			ChatManager.sysHearsayMsgChange=onSelected;
		}
		
		private function onSendSuccess(info:ResChatMessage):void
		{
			if(info.type==EnumChatChannelType.CHAT_CHANNEL_HEARSAY||info.type==EnumChatChannelType.CHAT_CHANNEL_SYSTEM){
				onSelected(null);
			}
		}
		
		private function onSelected(e:Event=null):void
		{
			switch(_skin.tab_zizhi.selectedIndex){
				case 0:
					_showDatas=ChatManager.systemHearsayMsg;
					break;
				case 1:
					_showDatas=ChatManager.hearsayMsg;
					break;
				case 2:
					_showDatas=ChatManager.systemMsg;
					break;
			}
			updateTxt();
		}
		
		private function updateTxt():void
		{
			_msgTxt.clear();
			this._msgTxt.setSize(bgW, 0);
			var num:int=_showDatas.length;
			for(var i:int=0;i<num;i++){
				_msgTxt.appendRichText( ChatUtil.getHTMLSystemMsg( _showDatas[i]));
			}
			updateScroller();
		}
		
		private function updateScroller() : void {
			this._skin.scroll_Bar.addChild(this._msgTxt);
			var scrollerPos : int = Math.max(0, this._msgTxt.height - this._skin.scroll_Bar.height);
			this._skin.scroll_Bar.scrollToPosition(0, scrollerPos, 0.3);
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
			
			this._msgTxt = new RichTextArea3D(bgW, 0, ColorUtils.getDefaultStrokeFilter());
			this._msgTxt.setConfig(RichTextCustomUtil.cloneChatUnitConfigVec());
			this._msgTxt.wordWrap = true;
			this._msgTxt.multiline = true;
			this._msgTxt.defaultTextFormat = defaultFormat;
			this._msgTxt.text = "";
			this._msgTxt.x = 0;
			
			this._skin.scroll_Bar.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			this._skin.scroll_Bar.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			this._skin.scroll_Bar.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			this._skin.scroll_Bar.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			this._skin.scroll_Bar.addChild(this._msgTxt);
			this._skin.scroll_Bar.width = bgW;
			this._skin.scroll_Bar.height =466;
			this._skin.scroll_Bar.x=13;
			this._msgTxt.setSize(bgW, 0);
			
			this._skin.titleDisplay.y=12;
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			switch (target) {
				case this._skin.btn_close:
					this.hide();
					break;
			}
		}
	}
}