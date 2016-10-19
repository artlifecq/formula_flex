package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.core.events.ChatChannelChangeEvent;
	import com.rpgGame.core.utils.MouseListenerUtil;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.Sprite;

	/**
	 *
	 * 聊天频道选择列表浮窗项
	 * @author zhougang
	 * 
	 */
	public class ChatChannelMenuButton extends Sprite
	{
		private var _buttonBg:UIAsset;
		private var _label:Label;
		private var _channel:int;
		public function ChatChannelMenuButton(channelType:int)
		{
			_channel = channelType;
			initView();
		}
		
		private function initView():void
		{
			_buttonBg = new UIAsset();
			_buttonBg.height = 26;
			_buttonBg.styleName = "ui/common/kang/xuanzhong/xuanzhong.png";
			_buttonBg.visible = false;
			_buttonBg.width = 57;
			_buttonBg.x = 1;
			addChild(_buttonBg);
			
			_label = new Label();
			var channelName:String = ChatUtil.getChannelTitle(_channel);
			_label.text = channelName;
			_label.color = ChatUtil.getChannelColor(_channel);
			_label.x = 10;
			_label.y = 1;
			addChild(_label);
		}
		
		public function addEvent():void
		{
			MouseListenerUtil.addEventListener( this, clickItem, rollOver, rollOut );
		}
		
		public function removeEvent():void
		{
			MouseListenerUtil.removeEventListener(this);
			rollOut();
		}
		
		private function clickItem():void
		{
			EventManager.dispatchEvent(ChatChannelChangeEvent.CHAT_CHANNEL_CHANGE_EVENT,_channel);
		}
		
		private function rollOver():void
		{
			_buttonBg.visible = true
		}
		
		private function rollOut():void
		{
			_buttonBg.visible = false
		}
		
	}
}