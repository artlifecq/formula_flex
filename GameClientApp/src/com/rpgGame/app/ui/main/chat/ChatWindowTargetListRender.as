package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.app.manager.chat.ChatWindowManager;
	import com.rpgGame.core.events.ChatEvent;
	import com.rpgGame.coreData.info.chat.PrivateChaterVo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.chat.PlayerItemListSkin;
	
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 *对话功能所用 
	 * @author Guodong.Zhang
	 * 
	 */
	public class ChatWindowTargetListRender extends DefaultListItemRenderer
	{
		private var skin :PlayerItemListSkin;
		private var _targetID:Number;
		private var _curState:String;
		
		public function ChatWindowTargetListRender()
		{
			super();
		}
		
		override protected function changeState(value:String):void
		{
			super.changeState(value);
			if(_curState != value)
			{
				_curState = value;
				if(_currentState == "hover")
				{
					this.addChildAt(skin.bg,0);
					this.addChild(skin.closeBtn);
					skin.closeBtn.addEventListener(TouchEvent.TOUCH,onCloseClick);
				}
				else if(_currentState == "up")
				{
					if(!this.isSelected)
					{
						skin.bg.removeFromParent();
					}
					skin.closeBtn.removeFromParent();
					skin.closeBtn.removeEventListener(TouchEvent.TOUCH,onCloseClick);
				}
			}
		}
		
		override protected function initialize():void
		{
			skin = new PlayerItemListSkin();
			skin.toSprite(this);
			skin.closeBtn.removeFromParent();
		}
		
		protected function onCloseClick(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch( skin.closeBtn, TouchPhase.BEGAN ); 
			if( touch == null )
				return;
			EventManager.dispatchEvent(ChatEvent.CLOSE_WIND_CHAT_TABLE,_targetID);
		}
		
		override public function get height():Number
		{
			return 29;
		}
		
		override protected function commitData():void
		{
			_targetID = this._data as Number;
			var privateChatVo:PrivateChaterVo = ChatWindowManager.getPrivateChatDataByUserId(_targetID);
			if(privateChatVo)
			{
				skin.nameLab.text = privateChatVo.name;
				if(privateChatVo.waitMsgNum > 0)
				{
					this.addChild(skin.recPoint);
				}
				else
				{
					skin.recPoint.removeFromParent();
				}
			}
			else
			{
				skin.recPoint.removeFromParent();
			}
		}
		
		override public function set isSelected(value : Boolean) : void
		{
			super.isSelected = value;
			if(isSelected)
			{
				this.addChildAt(skin.bg,0);
				skin.recPoint.removeFromParent();
			}else
			{
				skin.bg.removeFromParent();
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
			skin.closeBtn.removeEventListener(TouchEvent.TOUCH,onCloseClick);
		}
	}
}