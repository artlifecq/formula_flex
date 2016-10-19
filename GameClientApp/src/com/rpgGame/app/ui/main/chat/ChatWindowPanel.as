package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.chat.ChatWindowManager;
	import com.rpgGame.app.manager.friend.FriendManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.ChatEvent;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.manager.scene.PanelFixedInSceneManager;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.chat.ChatInfo;
	import com.rpgGame.coreData.info.chat.PrivateChaterVo;
	import com.rpgGame.coreData.info.friend.FriendBaseInfo;
	import com.rpgGame.coreData.info.friend.FriendInfo;
	import com.rpgGame.coreData.lang.LangChat;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	import com.rpgGame.coreData.type.FriendType;
	import com.rpgGame.coreData.type.MenuType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.utils.setTimeout;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.chat.ChatWindowSkin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class ChatWindowPanel extends SkinUIPanel
	{
		private static var _instance:ChatWindowPanel;
		private var _customSkin:ChatWindowSkin;
		//当前窗口私聊者对象
		private var _curentShowUserId:Number = 35189184268114;
		//当前窗口私聊这名字
		private var _curentShowNick:String;
		private var _lastReqChatHistoryTime:Number = 0;
		private var _seeIngMap:HashMap = new HashMap();
		private var _chatWindowInput:ChatWindowInputView;
		private var _privateChatListView:ChatWindowListView;
		private var _targetList:List;
		private var _targetListDP:ListCollection;
		
		public function ChatWindowPanel()
		{
			_customSkin = new ChatWindowSkin();
			super(_customSkin);
			init();
			initEvent();
		}
		
		private function initEvent():void
		{
			_targetList.addEventListener(Event.SELECT, onListItemSelect);
			this.addEventListener(TouchEvent.TOUCH,onTouchThis);
			EventManager.addEvent(ChatEvent.CLOSE_WIND_CHAT_TABLE,onCloseChatTable);
			EventManager.addEvent(ChatEvent.WINDW_CHAT_SEND_SUCCESS,onSendSuccess);
			EventManager.addEvent(ChatEvent.GET_NEW_WHISPER_DATA,onGetChatMsg);
			EventManager.addEvent(ChatEvent.PRIVATE_CHAT_SEND_FAIL_IN_BLACK_LIST,onPrivateSendFailInBlackList);
		}
		
		private function removeEvent():void
		{
			_targetList.removeEventListener(Event.SELECT, onListItemSelect);
			this.removeEventListener(TouchEvent.TOUCH,onTouchThis);
			EventManager.removeEvent(ChatEvent.CLOSE_WIND_CHAT_TABLE,onCloseChatTable);
			EventManager.removeEvent(ChatEvent.WINDW_CHAT_SEND_SUCCESS,onSendSuccess);
			EventManager.removeEvent(ChatEvent.GET_NEW_WHISPER_DATA,onGetChatMsg);
			EventManager.removeEvent(ChatEvent.PRIVATE_CHAT_SEND_FAIL_IN_BLACK_LIST,onPrivateSendFailInBlackList);
		}
		
		private function onGetChatMsg(chatInfo:ChatInfo):void
		{
			if(_curentShowUserId == chatInfo.id)
			{
				_privateChatListView.addChatInfo(chatInfo);
			}
			else
			{
				updateTargetList(_curentShowUserId);
			}
		}
		
		private function updateTargetList(currentTargetID:Number = 0):void
		{
			_targetListDP.removeAll();
			var currentTargetIndex:int;
			var targetVec:Vector.<Number> = ChatWindowManager.getWindowChatTargetIdVec();
			var len:int = targetVec.length;
			for(var i:int = 0; i < len; i++)
			{
				var targetID:Number = targetVec[i];
				var privateChaterVo:PrivateChaterVo = ChatWindowManager.getPrivateChatDataByUserId(targetID);
				if (privateChaterVo == null)
				{
					privateChaterVo = ChatWindowManager.createOneWindowChatVo(targetID, null, 0);
					var fData:FriendInfo = FriendManager.getHashByType(FriendType.RELATION_TYPE_FRIEND).getValue(targetID);
					if (fData != null)
					{
						privateChaterVo.name = fData.name;
						privateChaterVo.level = fData.level;
						privateChaterVo.isOnLine = fData.isOnLine;
						privateChaterVo.isRquestState = true;
					}
					else
					{
						privateChaterVo.name = ChatWindowManager.getUserName(targetID);
					}
				}
				_targetListDP.addItem(targetID);
				if(targetID == currentTargetID)
				{
					currentTargetIndex = i;
				}
			}
			_targetList.selectedIndex = currentTargetIndex;
		}
		
		private function onSendSuccess($isOnLine:Boolean):void
		{
			var chatInfo:ChatInfo = new ChatInfo();
			chatInfo.id = MainRoleManager.actorInfo.id;
			chatInfo.name = MainRoleManager.actorInfo.name;
			chatInfo.realShowName = MainRoleManager.actorInfo.name;
			chatInfo.realShowMsg =_chatWindowInput.getInputText();
			chatInfo.talkTime = SystemTimeManager.curtTm;
			chatInfo.targetID = curentShowUserId;
			FriendManager.addTalkInfo(_curentShowUserId,_curentShowNick);
//			AdFilter.addSuspicion(chatInfo.name,chatInfo.msgStr);
			chatInfo.realShowMsg = chatInfo.realShowMsg + ($isOnLine?"":"\n（对方已离线）");
			ChatWindowManager.addPrivateChatData(curentShowUserId,chatInfo);
			_privateChatListView.addChatInfo(chatInfo);
			_chatWindowInput.setInputText("");
		}
		
		private function onListItemSelect(e:Event):void
		{
			updateCurrentChatView();
		}
		
		private function updateCurrentChatView():void
		{
			_curentShowUserId = _targetList.selectedItem as Number;
			var privateChaterVo:PrivateChaterVo = ChatWindowManager.getPrivateChatDataByUserId(_curentShowUserId);
			if (privateChaterVo == null)
			{
				privateChaterVo = ChatWindowManager.createOneWindowChatVo(_curentShowUserId, null, 0);
				var fData:FriendInfo = FriendManager.getHashByType(FriendType.RELATION_TYPE_FRIEND).getValue(_curentShowUserId);
				if (fData != null)
				{
					privateChaterVo.name = fData.name;
					privateChaterVo.level = fData.level;
					privateChaterVo.isOnLine = fData.isOnLine;
					privateChaterVo.isRquestState = true;
				}
				else
				{
					privateChaterVo.name = ChatWindowManager.getUserName(_curentShowUserId);
				}
			}
			_curentShowNick = privateChaterVo.name;
			_chatWindowInput.setTargetId(_curentShowUserId);
			_privateChatListView.setTargetUserId(_curentShowUserId);
			var levelStr:String = "";
			if(privateChaterVo.level)
			{
				levelStr = "（" + privateChaterVo.level + "级）";
			}
			_customSkin.nickLab.htmlText = HtmlTextUtil.underLine(_curentShowNick + levelStr);
			var friend : FriendBaseInfo = FriendManager.getBaseInfoById(_curentShowUserId);
			if(friend)
				_customSkin.moodLab.text = friend.mood;
			else
				_customSkin.moodLab.text = "无";
		}
		
		public static function get instance():ChatWindowPanel
		{
			if(_instance == null)
			{
				_instance = new ChatWindowPanel();
			}
			return _instance;
		}
		
		private function onCloseChatTable(closeUserId:Number):void
		{
			ChatWindowManager.removeWindowChatTargetId(closeUserId);
			if(ChatWindowManager.getWindowChatTargetIdVec().length == 0)
			{
				setTimeout(hide,10);
			}
			else if(closeUserId == _curentShowUserId)
			{
				updateTargetList();
				updateCurrentChatView();
			}
			else
			{
				updateTargetList(_curentShowUserId);
			}
		}
		
		override public function hide():void
		{
			super.hide();
			removeEvent();
			_curentShowUserId = 0;
			_chatWindowInput.onWindowClose();
			_targetListDP.removeAll();
		}
		
		/**
		 * 判断私聊窗口是否已打开  
		 * @return 
		 */
		public static function isShowing():Boolean
		{
			if(_instance == null)
			{
				return false;
			}else
			{
				return _instance.isShowing();
			}
		}
		
		private function init():void
		{
			_customSkin.title.text = "对话";
			_chatWindowInput = new ChatWindowInputView(_customSkin);
			_privateChatListView = new ChatWindowListView(_customSkin);
			_targetListDP = new ListCollection();
			_targetList = _customSkin.playerList;
			_targetList.paddingTop = _targetList.paddingBottom = 0;
			_targetList.dataProvider =  _targetListDP;
			_targetList.itemRendererType = ChatWindowTargetListRender;
			_targetList.clipContent = true;
			_targetList.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_targetList.verticalScrollPolicy = Scroller.SCROLL_POLICY_AUTO;
			_targetList.scrollBarDisplayMode = "fixed";
			_targetList.verticalScrollBarPosition = "right";
		}
		
		public function onShow():void
		{
			var endX:int = (Starling.current.nativeStage.stageWidth - 611) / 2;
			var endY:int = (Starling.current.nativeStage.stageHeight - 451) / 2;
			this.x = endX;
			this.y = endY;
			this.alpha = 0.3;
			TweenLite.to(this, 1, {alpha:1});
			StarlingLayerManager.appUILayer.addChild(this);
			PanelFixedInSceneManager.add(this);
			_chatWindowInput.onWindowShow();
		}
		
		/** 打开私聊窗口 */
		public function showChatWindow(currentTargetID:Number = 0):Boolean
		{
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,EnumFunctionMessageBarIcoType.CHAT_TYPE);
			var isShowIng:Boolean = isShowing();
			if(!isShowIng)
			{
				onShow();
			}
			updateTargetList(currentTargetID);
			updateCurrentChatView();
			return true;
		}
		
		/**
		 * 判断窗口是否可以打开 
		 * @param id
		 * @return 
		 * 
		 */		
		private function isCanShow(id:Number):Boolean
		{
			if (id <= 0 || MainRoleManager.actorID == id) 
			{
				return false;
			}
			return true;
		}
		
		public function get curentShowUserId():Number
		{
			return _curentShowUserId;
		}
		
		public function get curentShowNick():String
		{
			return _curentShowNick;
		}
		
		public function freshRecore(chaterID:Number, fromeServer:Boolean):void
		{
			if(curentShowUserId != chaterID || fromeServer)
			{
				_privateChatListView.setTargetUserId(chaterID);
			}
		}
		
		private function onPrivateSendFailInBlackList():void
		{
			var privateChaterVo:PrivateChaterVo = ChatWindowManager.getPrivateChatDataByUserId(_curentShowUserId);
			var chatList:Vector.<ChatInfo> = privateChaterVo.chatList;
			if(chatList.length > 0)
			{
				var lastInfo:ChatInfo = chatList[chatList.length - 1];
			}
			var chatInfo:ChatInfo = new ChatInfo();
			chatInfo.realShowMsg = "很遗憾,您已经被对方屏蔽,对方无法收到您的信息";
			chatInfo.id = MainRoleManager.actorID;
			privateChaterVo.putMsg(chatInfo);
			_privateChatListView.addChatInfo(chatInfo);
		}
		
		/**
		 *  判断私聊窗口是否已打开
		 */		
		public function isShowing():Boolean
		{
			return this.parent != null
		}
		
		private function onTouchThis(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(_customSkin.btnFace,TouchPhase.BEGAN);
			if(touch != null)
			{
				_chatWindowInput.onShowFace();
			}
			else
			{
				touch = event.getTouch(_customSkin.btnLocation,TouchPhase.BEGAN);
				if(touch != null)
				{
					_chatWindowInput.onAddLocation();
				}
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _customSkin.btnClose:
					onCloseBtn();
					break;
				case _customSkin.nickLab:
					MenuManager.showMenu(MenuType.CHAT_HERO, [_curentShowUserId, _curentShowNick], -1, -1, 80);
					break;
				case _customSkin.btnMinimize:
					minimize();
					break;
				case _customSkin.sendBtn:
					_chatWindowInput.sendChatMsg();
					break;
			}
		}
		
		private function onCloseBtn():void
		{
			if(_targetListDP.length > 1)
			{
				//弹窗提示保存
				GameAlert.showAlertUtil(LangChat.CHAT_CLOSE_ALL,onCloseBtnClick);
				return;
			}
			else
			{
				hide();
			}
		}
		
		private function onCloseBtnClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
				{
					sureToSaveAndClose();
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
		
		private function sureToSaveAndClose():void
		{
			hide();
		}
		
		private function minimize():void
		{
			hide();
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.CHAT_TYPE);
		}
		
	}
}