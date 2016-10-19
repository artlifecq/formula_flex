package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.ui.main.chat.ChatWindowPanel;
	
	import org.mokylin.skin.mainui.shortcut.MessageChatIconSkin;
	
	public class ChatMsgIcon extends MessageIconBase
	{
		private var _skin:MessageChatIconSkin;
		public function ChatMsgIcon()
		{
			_skin = new MessageChatIconSkin();
			super(_skin, _skin.numTxt, _skin.btn, _skin.redPoint);
		}
		
		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
			ChatWindowPanel.instance.showChatWindow();
		}
	}
}