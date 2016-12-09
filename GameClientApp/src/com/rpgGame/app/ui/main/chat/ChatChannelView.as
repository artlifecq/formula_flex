package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	
	import feathers.controls.UIAsset;
	
	import starling.display.Sprite;
	
	/**
	 * 聊天频道选择列表浮窗
	 * @author Guodong.Zhang
	 * 
	 */
	public class ChatChannelView extends Sprite
	{
		public static const MSG_CHANNEL:Array = [
			EnumChatChannelType.CHAT_CHANNEL_NORMAL,
			EnumChatChannelType.CHAT_CHANNEL_TEAM,
			EnumChatChannelType.CHAT_CHANNEL_FAMILY,
			EnumChatChannelType.CHAT_CHANNEL_PARTY,
			EnumChatChannelType.CHAT_CHANNEL_COUNTRY,
			EnumChatChannelType.CHAT_CHANNEL_MENG_GUO,
			EnumChatChannelType.CHAT_CHANNEL_WORLD,
			EnumChatChannelType.CHAT_CHANNEL_KUA_FU
		];
		
		private var _bg:UIAsset;
		public function ChatChannelView()
		{
			_bg = new UIAsset();
			addChild(_bg);
			var index:int = 0;
			for each (var channel:int in MSG_CHANNEL) 
			{
				var chatChannelMenuButton:ChatChannelMenuButton = new ChatChannelMenuButton(channel);
				addChild(chatChannelMenuButton);
				chatChannelMenuButton.y = index * 25 + 5;
				chatChannelMenuButton.x = 3;
				index ++;
			}
			_bg.styleName = "ui/common/tip/tip.png";
			_bg.setSize(59,MSG_CHANNEL.length * 25 + 10);
		}
		
		public function show():void
		{
			var count:int = this.numChildren;
			for(var i:int; i < count; i++)
			{
				var chatChannelMenuButton:ChatChannelMenuButton = this.getChildAt(i) as ChatChannelMenuButton;
				if(chatChannelMenuButton)
				{
					chatChannelMenuButton.addEvent();
				}
			}
		}
		
		public function close():void
		{
			var count:int = this.numChildren;
			for(var i:int; i < count; i++)
			{
				var chatChannelMenuButton:ChatChannelMenuButton = this.getChildAt(i) as ChatChannelMenuButton;
				if(chatChannelMenuButton)
				{
					chatChannelMenuButton.removeEvent();
				}
			}
		}
	}
}