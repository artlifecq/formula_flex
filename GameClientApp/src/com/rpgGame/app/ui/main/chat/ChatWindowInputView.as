package com.rpgGame.app.ui.main.chat
{
	import com.gameClient.utils.StringFilter;
	import com.rpgGame.app.manager.chat.ChatWindowManager;
	import com.rpgGame.app.manager.chat.FaceGroupManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.sender.ChatSender;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ChatCfgData;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.clientConfig.FaceInfo;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.chat.PrivateChaterVo;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.utils.setTimeout;
	
	import feathers.events.FeathersEventType;
	
	import org.mokylin.skin.mainui.chat.ChatWindowSkin;
	
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.KeyboardEvent;

	public class ChatWindowInputView
	{
		public static const CHAT_MAX_WORD:int = 160;
		private static const DEFAULT_CHAT_TEXT:String = "输入内容，点击发送";
		private var _skin:ChatWindowSkin;
		private var _curentShowUserId:Number;
		private var _lastSendText:String;
		private var _inputText:RichTextArea3D;
		
		public function ChatWindowInputView(skin:ChatWindowSkin)
		{
			_skin = skin;
			
			_skin.textInput.isEditable = false;
			_inputText = new RichTextArea3D(_skin.textInput.width,_skin.textInput.height,ColorUtils.getDefaultStrokeFilter());
			_inputText.setConfig(RichTextCustomUtil.cloneChatUnitConfigVec());
			_inputText.maxChars = ChatCfgData.MAX_CHAR_LENGTH;
			_inputText.wordWrap = true;
			_inputText.multiline = true;
			_inputText.isEditable = true;
			_inputText.x = _skin.textInput.x;
			_inputText.y = _skin.textInput.y + 2;
			_inputText.defaultTextFormat = _skin.textInput.textEditorProperties.textFormat;
			_skin.container.addChild( _inputText );
		}
		
		public function onWindowShow():void
		{
			_inputText.addEventListener(FeathersEventType.FOCUS_IN,inputFocusInHandler);
			_inputText.addEventListener(FeathersEventType.FOCUS_OUT,inputFocusOutHandler);
			Starling.current.stage.addEventListener( KeyboardEvent.KEY_DOWN, onStageKeyDown );
			
			TipTargetManager.show( _skin.btnLocation, TargetTipsMaker.makeSimpleTextTips("添加当前位置信息"));
			TipTargetManager.show( _skin.sendBtn, TargetTipsMaker.makeSimpleTextTips("按回车键发送消息"));
		}
		
		public function onWindowClose():void
		{
			_inputText.removeEventListener(FeathersEventType.FOCUS_IN,inputFocusInHandler);
			_inputText.removeEventListener(FeathersEventType.FOCUS_OUT,inputFocusOutHandler);
			Starling.current.stage.removeEventListener( KeyboardEvent.KEY_DOWN, onStageKeyDown );
			
			TipTargetManager.remove( _skin.btnLocation);
			TipTargetManager.remove( _skin.sendBtn);
		}
		
		public function onShowFace():void
		{
			var point : Point =  _skin.btnFace.localToGlobal(new Point());
			FaceGroupManager.instance.showOrHide(onTargetFaceFun,point.x,point.y);
		}
		
		public function sendChatMsg():void
		{
			var sendMsgStr:String = _inputText.text;
			if(sendMsgStr == "" || sendMsgStr == DEFAULT_CHAT_TEXT)
			{
				NoticeManager.showNotify( "请输入内容，点击发送或按Enter键发送");
				return;
			}
			sendMsgStr = StringFilter.match(sendMsgStr,"*");
			_lastSendText = sendMsgStr;
			_inputText.text = "";
			ChatSender.cs_sendChat(sendMsgStr,EnumChatChannelType.CHAT_CHANNEL_WINDOW,null,_curentShowUserId);
		}
		
		public function setInputText(text:String):void
		{
			_inputText.text = text;
			showInputText();
		}
		
		private function showInputText():void
		{
			_inputText.setFocus();
//			var text:String = _inputText.text;
//			var index:int = text.length;
//			_inputText.selectRange(index,index);
		}
		
		/**
		 * 添加坐标到输入文本
		 * 
		 */
		public function onAddLocation():void
		{
			if(_inputText.text == DEFAULT_CHAT_TEXT)
			{
				_inputText.text = "";
			}
			var countryName : String = "[" + CountryNameCfgData.getCountryNameById(MainRoleManager.actorInfo.countryId) + "]";
			var sceneID:String = MapDataManager.currentScene.sceneId.toString();
			var xy:String = int(MainRoleManager.actor.x) + "," + int(MainRoleManager.actor.z);
			var posName:String = countryName + MapDataManager.currentScene.name + "(" + xy + ")";
			var locationCode:String = RichTextCustomUtil.getTextLinkCode(posName,-1,RichTextCustomLinkType.POSITION_TYPE,sceneID + "," + xy);
			_inputText.appendRichText(locationCode);
			setTimeout(showInputText,10);
		}
		
		public function onTargetFaceFun(faceInfo : FaceInfo):void
		{
			if(_inputText.text == DEFAULT_CHAT_TEXT)
				_inputText.text = faceInfo.str;
			else
				_inputText.appendRichText(faceInfo.str);
			setTimeout(showInputText,10);
		}
		
		//-------------------输入框的鼠标和焦点事件---------------------
		private function inputFocusInHandler(e:Event):void
		{
			if (_inputText.text == DEFAULT_CHAT_TEXT)
			{
				_inputText.text = "";
			}
		}
		
		private function inputFocusOutHandler(e:Event):void
		{
			if (_inputText.text == "")
			{
				_inputText.text = DEFAULT_CHAT_TEXT;
			}
		}
		
		private function onStageKeyDown(event:KeyboardEvent):void
		{
			if(_inputText.isInputFocus)
			{
				if(event.keyCode == Keyboard.ENTER)
				{
					sendChatMsg();
				}
			}
		}
		
		public function getInputText():String
		{
			return _lastSendText;
		}
		
		public function setTargetId(id:Number):void
		{
			_curentShowUserId = id;
			setInputText("");
		}
		
		private function isChatTargetOnline():Boolean
		{
			var privateChaterVo:PrivateChaterVo = ChatWindowManager.getPrivateChatDataByUserId(_curentShowUserId);
			if(privateChaterVo)
			{
				return privateChaterVo.isOnLine;
			}
			return false;
		}
		
	}
}