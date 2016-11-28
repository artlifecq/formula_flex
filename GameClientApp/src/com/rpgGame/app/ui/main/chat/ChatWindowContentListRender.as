package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.chat.ChatInfo;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import flash.text.TextFormat;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	import feathers.controls.text.Fontter;
	
	import org.mokylin.skin.mainui.chat.ChatLeftSkin;
	
	public class ChatWindowContentListRender extends SkinUI
	{
		private const PAD:int = 8;
		private const ARROW_WIDTH:int = 15;
		private const NameHeight:int = 23;
		private var _skin:ChatLeftSkin
		private var _chatBg:UIAsset;
		private var _chatArea:RichTextArea3D;
		private var _chatInfo:ChatInfo;
		private var _nickLab:Label;
		
		public function ChatWindowContentListRender()
		{
			_skin = new ChatLeftSkin();
			super(_skin);
			init();
		}
		private function init():void
		{
			_chatBg = _skin.textBg;
			_nickLab = _skin.nickLab;
			_chatArea = new RichTextArea3D( 280, 140,ColorUtils.getDefaultStrokeFilter() );
			_chatArea.setConfig(RichTextCustomUtil.cloneChatUnitConfigVec());
			
			_chatArea.x = 6;
			_chatArea.y = 6;
			_chatArea.wordWrap = true;
			_chatArea.multiline = true;
			
//			_chatArea.resizeTo( 280,140 );
			
			var _defaultFormat:TextFormat = new TextFormat(Fontter.FONT_Hei);
			_defaultFormat.color = 0xded8c7;
			_defaultFormat.size = 14;
			_chatArea.defaultTextFormat = _defaultFormat;
			addChild(_chatArea);
		}
		public function setChatInfo(chatInfo:ChatInfo):void
		{
			analysis(chatInfo);
		}
		public function analysis(info:ChatInfo):void
		{
			_chatArea.clear();
			_chatInfo = info;
			_chatArea.appendRichText(info.realShowMsg);
			if(info.id == MainRoleManager.actorInfo.id)//自己的，在右边
			{
				_nickLab.textAlign = "right";
				_chatBg.styleName = "ui/common/version_3/B_bujian/dui_hua_kuang_you.png";
				_chatBg.setSize(_chatArea.textWidth + ARROW_WIDTH + PAD*2 + 4,_chatArea.textHeight + NameHeight);
				_nickLab.text = _chatInfo.realShowName+"(" +  TimeUtil.formatTimeToSpecString(info.talkTime,"Y-M-D H:I") + ")"; 
				_chatBg.x = -_chatBg.width - 5;
				_nickLab.x = -_nickLab.width;
				_nickLab.y = 0;
				_nickLab.color = 0x52D798;
				_chatArea.x = _chatBg.x + PAD;
				_chatArea.y = _chatBg.y + PAD;
			}else
			{
				_nickLab.textAlign = "left";
				_nickLab.text = _chatInfo.realShowName + "(" +  TimeUtil.formatTimeToSpecString(info.talkTime,"Y-M-D H:I") + ")";
				_nickLab.x = 0;
				_nickLab.y = 0;
				_chatBg.x = 5;
				_chatBg.styleName = "ui/common/version_3/B_bujian/dui_hua_kuang_zuo.png"
				_nickLab.color = 0x25D2FC;
				_chatBg.setSize(_chatArea.textWidth + ARROW_WIDTH + PAD*2 + 4,_chatArea.textHeight + NameHeight);
				_chatArea.x = _chatBg.x + PAD + ARROW_WIDTH;
				_chatArea.y = _chatBg.y + PAD;
			}
		}
	
		public function isSelf():Boolean
		{
			return _chatInfo.id == MainRoleManager.actorInfo.id;
		}
		
		public function clear():void
		{
			// TODO Auto Generated method stub
			
		}
		
		override public function get height():Number
		{
			if(_chatBg)
			{
				return _chatBg.y + _chatBg.height;
			}
			return super.height;
		}
	}
}