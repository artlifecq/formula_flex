package com.rpgGame.app.manager
{
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.app.view.uiComponent.menu.Menu;
	import com.rpgGame.core.events.MenuEvent;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.DisplayObject;

	/**
	 * 下拉菜单
	 * @author luguozheng
	 * 
	 */	
	public class MenuManager
	{
		public static const MENU_ID_BACKPACK:int = 1;
		public static var curData:Object;
		
		public function MenuManager()
		{
		}
		
		public static function setup():void
		{
			EventManager.addEvent( MenuEvent.MENU_CLICK, menuClick );
		}
		
		private static function menuClick( type:String ):void
		{
			Menu.GetInstance().hide();
			
			MenuUtil.doMenu(type);
		}
		
		/**
		 * 
		 * @param menus				MenuType
		 * @param data				目标数据
		 * @param fixPosx			固定坐标		-1为不固定
		 * @param ifxPosy			固定坐标		-1为不固定
		 * 
		 */		
		public static function showMenu( menus:Array, data:Object = null, fixPosx:int = -1, fixPosy:int = -1, menuWidth:int = 40, bindHideDisplay:DisplayObject=null ):void
		{
			menus = screeingMenus( menus );
			
			curData = data;
			
			if( menus.length <= 0 )
				return;
			
			Menu.GetInstance().show( menus, fixPosx, fixPosy, menuWidth,bindHideDisplay );
		}
		
		
		/**
		 * 筛选哪些显示与不显示的
		 * @param menus
		 * @return 
		 * 
		 */		
		private static function screeingMenus( menus:Array ):Array
		{
			for( var i:int = menus.length - 1 ;i >= 0 ; i--)
			{
				if( !MenuUtil.isShowType( menus[i] ) )
				{
					menus.splice( i, 1);
				}
			}
			return menus;
		}
		
		
		
	}
}