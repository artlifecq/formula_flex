package com.rpgGame.app.ui.menu
{
	import com.rpgGame.app.view.uiComponent.menu.MenuItemView;
	import com.rpgGame.core.utils.MouseListenerUtil;
	import com.rpgGame.coreData.cfg.StaticValue;
	
	import feathers.controls.UIAsset;
	
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
	
	internal class MenuButtonOne extends Sprite
	{
		private var _uiWidth:Number = 0;
		//		private var _button:LableButton = null;
		private var _buttonBg:UIAsset;
		private var _text:TextField;
		
		private var _menuItem:MenuItem = null;
		private var _isCloseDisposeData:Boolean = false;
//		private var _ico:SwfImage;
		function MenuButtonOne(widthP:Number)
		{
			_uiWidth = widthP;
			initMenuButtonOne();
			initEvent();
		}
		
		private function initEvent():void
		{
			MouseListenerUtil.addEventListener( this, null, onMouseOver, onMouseOut );
		
		}
		
		private function onMouseOut():void
		{
			_buttonBg.visible = false;
//			_text.textColor = 0xCCFCFF;
			//			filters = null;
		}
		
		private function onMouseOver():void
		{
			_buttonBg.visible = true;
//			_text.textColor = 0xFFFFFF;
			//			filters = [FilterUtil.getHightLightFilter()];
		}
		
		public function set uiWidth(value:Number) : void
		{
			_uiWidth = value;
			_buttonBg.width = _uiWidth;
		}
		
		public function get callBackFun() : Function
		{
			return _menuItem.callBackFun;
		}
		
		public function clearItem() : void
		{
			if (_menuItem != null)
			{
				if (_isCloseDisposeData == true)
				{
					_menuItem.title = null;
					_menuItem.callBackFun = null;
				}
				_menuItem = null;
			}
		}
		
		public function init(menuItem:MenuItem, isCloseDisposeData:Boolean) : void
		{
			_menuItem = menuItem;
			_isCloseDisposeData = isCloseDisposeData;
			_text.text = menuItem.title;
		}
		
		private function initMenuButtonOne() : void
		{
			_buttonBg = new UIAsset();
			_buttonBg.styleName = "ui/common/kang/xuanzhong/xuanzhong.png";
			addChild( _buttonBg );
			_buttonBg.width = MenuItemView.MAX_WIDTH + 12;
			_buttonBg.visible = false;
			_text = new TextField(_uiWidth,23,"");
			_text.autoSize = TextFieldAutoSize.VERTICAL;
			_text.color = StaticValue.COLOR_CODE_6;
			addChild(_text);
			_text.y = 2;
		}
		
		override public function get height():Number
		{
			return 26
		}
	}
}