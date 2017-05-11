package com.rpgGame.app.view.uiComponent.menu
{
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.core.events.MenuEvent;
	import com.rpgGame.core.ui.SkinUI;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.common.MenuItemSkin;
	
	import starling.display.DisplayObject;

	
	/**
	 * 菜单
	 * @author luguozheng
	 * 
	 */	
	public class MenuItemView extends SkinUI
	{
		public static const MAX_WIDTH:int = 40;
		public static const LAB_MAX_HEIGHT:int = 23;
		
		private var _skin:MenuItemSkin;
		private var _type:String;
		
		public function MenuItemView()
		{
			_skin=new MenuItemSkin();
			super(_skin);
		}
		
		public function setData( type:String ):void
		{
			_type = type;
			_skin.btn.label = MenuUtil.getMenuTitle( type );
			//_skin.btn.width=60;
			_skin.btn.height=20;
		}
		override public function set width(value:Number):void
		{
			_skin.btn.width=value;
		}
		override protected function onTouchTarget(target : DisplayObject) : void 
		{
			super.onTouchTarget(target);
			if(target==_skin.btn){
				EventManager.dispatchEvent( MenuEvent.MENU_CLICK, _type );
			}
		}
	}
}
