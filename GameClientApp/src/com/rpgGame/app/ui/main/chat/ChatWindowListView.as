package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.app.manager.chat.ChatWindowManager;
	import com.rpgGame.coreData.info.chat.ChatInfo;
	import com.rpgGame.coreData.info.chat.PrivateChaterVo;
	
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	
	import org.mokylin.skin.mainui.chat.ChatWindowSkin;

	public class ChatWindowListView
	{
		private var _skin:ChatWindowSkin;
		private var _scroll:ScrollContainer;
		private var _privateChatViewPool:Array = [];
		
		public function ChatWindowListView(skin:ChatWindowSkin)
		{
			_skin = skin;
			initView();
		}
		private function initView():void
		{
			_scroll = _skin.scroller;
//			_list = _skin.chatInfoList;
			_scroll.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			_scroll.horizontalScrollPolicy = "off";
			_scroll.verticalScrollPolicy = "on";
			_scroll.scrollBarDisplayMode = ScrollContainer.SCROLL_BAR_DISPLAY_MODE_FIXED;
		}
		
		private function addPrivateChatView(chatInfo:ChatInfo,prePrivateChatView:ChatWindowContentListRender,toBottom:Boolean = false):ChatWindowContentListRender
		{
			var posY:int;
			if(prePrivateChatView)
			{
				var preHeight:int = prePrivateChatView.height;
				posY = prePrivateChatView.y + preHeight;
			}
			var privateChatView:ChatWindowContentListRender = getPrivateChatView();
			privateChatView.setChatInfo(chatInfo);
			_scroll.addChild(privateChatView);
			privateChatView.y = posY;
			posY = privateChatView.y + privateChatView.height;
			if(privateChatView.isSelf())
			{
				privateChatView.x = _skin.scroller.width - 25;
			}
			else
			{
				privateChatView.x = 3;
			}
//			_scroll.scrollToPosition(0,posY);
			var scrollPos:int = Math.max(0,posY - _scroll.height);
			if(toBottom)
			{
				_scroll.scrollToPosition( 0,scrollPos , 0);
			}
			else
			{
				_scroll.scrollToPosition( 0,scrollPos , 0.3 );
			}
			return privateChatView;
		}
		
		private function getPrivateChatView():ChatWindowContentListRender
		{
			if(_privateChatViewPool.length > 0)
			{
				return _privateChatViewPool.shift();
			}else
			{
				return new ChatWindowContentListRender();
			}
		}
		
		public function addChatInfo(chatInfo:ChatInfo):void
		{
			var privateChaterVo:PrivateChaterVo = ChatWindowManager.getPrivateChatDataByUserId(chatInfo.id);
			if(privateChaterVo)
			{
				privateChaterVo.clearWaitMsg();
			}
			var posY:int;
			var privateChatView:ChatWindowContentListRender;
			if(_scroll.numChildren > 0)
			{
				privateChatView = _scroll.getChildAt(_scroll.numChildren - 1) as ChatWindowContentListRender;
			}
			addPrivateChatView(chatInfo,privateChatView);
		}
		
		public function setTargetUserId(selectUserId:Number):void
		{
			var privateChaterVo:PrivateChaterVo = ChatWindowManager.getPrivateChatDataByUserId(selectUserId);
			setChatData(privateChaterVo)
		}
		
		private function clear():void
		{
			while(_scroll.numChildren)
			{
				var privateChatView:ChatWindowContentListRender = _scroll.getChildAt(0) as ChatWindowContentListRender;
				privateChatView.clear();
				if(privateChatView.parent)
				{
					privateChatView.parent.removeChild(privateChatView);
				}
				_privateChatViewPool.push(privateChatView);
			}
		}
		
		private function setChatData(privateChaterVo:PrivateChaterVo):void
		{
			clear();
			if(privateChaterVo == null)
			{
				return;
			}
			privateChaterVo.clearWaitMsg();
			var vec:Vector.<ChatInfo> = privateChaterVo.chatList;
			var prePrivateChatView:ChatWindowContentListRender;
			var len:int = vec.length;
			for (var i:int = 0; i < len; i++) 
			{
				var chatInfo:ChatInfo = vec[i];
				var privateChatView:ChatWindowContentListRender = addPrivateChatView(chatInfo,prePrivateChatView,true);
				prePrivateChatView = privateChatView;
			}
		}
	}
}