package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 *
	 * 消息图标基类
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-12 上午10:05:12
	 *
	 */
	public class MessageIconBase extends Sprite
	{
		private var _numTxt : Label;
		private var _btnIcon : Button;
		private var _redPointIcon:UIAsset;

		public function MessageIconBase(skin : StateSkin, numTxt : Label, btnIcon : Button,redPointIcon:UIAsset = null)
		{
			super();
			skin.toSprite(this);
			if( numTxt != null )
				_numTxt = numTxt;
			_numTxt.touchable = false;
			_btnIcon = btnIcon;
			_redPointIcon = redPointIcon;
		}

		public function show() : void
		{
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouch);
		}

		public function hide() : void
		{
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouch);
		}

		protected function onTouch(e : TouchEvent) : void
		{
			var t : Touch = e.getTouch(this, TouchPhase.ENDED);
			if (t != null && t.target != null)
			{
				onTouchTarget(t.target);
			}
		}

		protected function onTouchTarget(target : DisplayObject) : void
		{
			switch (target)
			{
				case _btnIcon:
					onTouchIcon();
					break;
			}
		}

		protected function onTouchIcon() : void
		{
		}

		public function setNum(num : int) : void
		{
			if (!_numTxt)
				return;
			if (num <= 0)
			{
				_numTxt.visible = false;
				_numTxt.text = "";
			}
			else
			{
				_numTxt.visible = true;
				_numTxt.text = num + "";
			}
		}
		
		/**
		 * 设置其他文本 
		 * @param type
		 * @param itemBtn
		 * 
		 */		
		public function setOtherTxt( type:int, itemBtn:MessageIconBase ):void
		{
			switch( type )
			{
				case EnumFunctionMessageBarIcoType.RELIVE_TYPE:
					(itemBtn as ReliveIcon).startTime();
					break;
				case EnumFunctionMessageBarIcoType.MOUNT_BREAD_INVITE_WAITE_TYPE:
					(itemBtn as MessageMountBreadInviteWaiteIcon).startTime();
					break;
				default:
					break;
			}
		}
		
		public function removeOtherTxt( type:int, itemBtn:MessageIconBase ):void
		{
			switch( type )
			{
				case EnumFunctionMessageBarIcoType.RELIVE_TYPE:
					if(itemBtn is ReliveIcon)
						(itemBtn as ReliveIcon).removeTime();
					break;
				case EnumFunctionMessageBarIcoType.MOUNT_BREAD_INVITE_WAITE_TYPE:
					if(itemBtn is MessageMountBreadInviteWaiteIcon)
						(itemBtn as MessageMountBreadInviteWaiteIcon).removeTime();
					break;
				default:
					break;
			}
		}
		
		public function showOrHideRedPoint(show:Boolean):void
		{
			if(_redPointIcon)
			{
				_redPointIcon.visible = show;
			}
		}
	}
}
