package com.rpgGame.app.view.uiComponent.menu
{
	import com.rpgGame.core.events.MenuEvent;
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.core.utils.MouseListenerUtil;
	import com.rpgGame.coreData.cfg.StaticValue;
	
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;

	
	/**
	 * 菜单
	 * @author luguozheng
	 * 
	 */	
	public class MenuItemView extends Sprite
	{
		public static const MAX_WIDTH:int = 40;
		public static const LAB_MAX_HEIGHT:int = 23;
		
		private var _menuBG:UIAsset;
		
		private var _type:String;
		
		private var _text:TextField;
		
		public function MenuItemView()
		{
			initView();
		}
		
		private function initView():void
		{
			_menuBG = new UIAsset();
			_menuBG.styleName = "ui/common/kang/xuanzhong/xuanzhong.png";
			addChild( _menuBG );
			_menuBG.width = MenuItemView.MAX_WIDTH + 12;
			_menuBG.visible = false;
			//--------------------------
			
			_text = new TextField( MAX_WIDTH, 20, "");
			_text.autoSize = TextFieldAutoSize.VERTICAL;
			_text.color = StaticValue.COLOR_CODE_6;
			addChild(_text);
			
			_text.y = 2;
			
			addEvent();
		}
		
		public function setData( type:String ):void
		{
			_type = type;
			
			_text.text = MenuUtil.getMenuTitle( type );
		}
		
		private function clickItem():void
		{
			EventManager.dispatchEvent( MenuEvent.MENU_CLICK, _type );
		}
		
		private function rollOver():void
		{
//			_text.color = StaticValue.WHITE;
			_menuBG.visible = true;
		}
		
		private function rollOut():void
		{
//			_text.color = StaticValue.GREEN;
			_menuBG.visible = false;
		}
		
		public function addEvent():void
		{
			MouseListenerUtil.addEventListener( this, clickItem, rollOver, rollOut );
		}
		
		public function removeEvent():void
		{
			MouseListenerUtil.removeEventListener( this );
		}
		
		public function setWidth( menuWidth:int, offX:int ):void
		{
			_text.width = menuWidth - (offX * 2);
			_menuBG.width = menuWidth - (offX * 2);
			
			_text.x = _menuBG.x = offX;
		}
	}
}
