package com.rpgGame.app.ui.menu
{
	import feathers.controls.UIAsset;
	
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class MenuView extends Sprite
	{
		private var _width:Number = 0;
		private var _menuButtonArray:Array = null;
		private var _bg:UIAsset = null;
		
		public function MenuView(widthP:Number = 70)
		{
			_width = widthP;
			_menuButtonArray = [];
			addEventListener(TouchEvent.TOUCH, click);
		}
		
		public function set uiWidth(widthP:Number) : void
		{
			_width = widthP;
		}
		
		public function init(menuTitleArr:Array, isCloseDisposeData:Boolean) : void
		{
			var menuTitleArrLen:int = 0;
			var menuButtonArrayLen:int = 0;
			var index:int = 0;
			var menuButtonOne:MenuButtonOne = null;
			clearMenuButton();
			if (menuTitleArr != null && menuTitleArr.length > 0)
			{
				menuTitleArrLen = menuTitleArr.length;
				menuButtonArrayLen = _menuButtonArray.length;
				index = 0;
				while (index < menuTitleArrLen)
				{
					
					if (index < menuButtonArrayLen)
					{
						menuButtonOne = _menuButtonArray[index];
						menuButtonOne.uiWidth = _width;
					}
					else
					{
						menuButtonOne = new MenuButtonOne(_width);
						_menuButtonArray.push(menuButtonOne);
						menuButtonOne.addEventListener(TouchEvent.TOUCH, menuButtonOneClick);
					}
					menuButtonOne.init(menuTitleArr[index], isCloseDisposeData);
					menuButtonOne.x = 5;
					menuButtonOne.y = menuButtonOne.height * index + 5;
					addChild(menuButtonOne);
					index++;
				}
			}
			setBg(_width + 10, menuTitleArrLen * 26 + 5);
		}
		
		public function close() : void
		{
			clearMenuButton();
		}
		
		private function menuButtonOneClick(event:TouchEvent) : void
		{
			var menuButtonOne:MenuButtonOne = event.currentTarget as MenuButtonOne;
			if(menuButtonOne)
			{
				var touch:Touch = event.getTouch( menuButtonOne, TouchPhase.BEGAN ); 
				if( touch == null )
					return;
				menuButtonOne.callBackFun();
				MenuControl.instance.closeMenu();
			}
			
		}
		
		private function clearMenuButton() : void
		{
			var menuButtonOne:MenuButtonOne = null;
			var menuButtonArrayLen:int = _menuButtonArray.length;
			var index:int = 0;
			while (index < menuButtonArrayLen)
			{
				
				menuButtonOne = _menuButtonArray[index];
				menuButtonOne.clearItem();
				if (contains(menuButtonOne))
				{
					removeChild(menuButtonOne);
				}
				index++;
			}
		}
		
		private function setBg(widthP:Number, heightP:Number) : void
		{
			if (_bg == null)
			{
				_bg = new UIAsset();
				_bg.styleName = "ui/common/tip/tip.png";
			}
			_bg.width = widthP;
			_bg.height = heightP;
			addChildAt(_bg, 0);
		}
		
		private function click(event:TouchEvent) : void
		{
			var touch:Touch = event.getTouch( this, TouchPhase.BEGAN ); 
			if( touch == null )
				return;
			event.stopPropagation();
		}
	}
}