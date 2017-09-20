package com.rpgGame.app.ui.main.smallmap
{
	import com.rpgGame.app.manager.GameSettingManager;
	import com.rpgGame.app.utils.SystemSetUtil;
	import com.rpgGame.app.view.uiComponent.menu.ShieldingItemView;
	
	import feathers.controls.UIAsset;
	
	import starling.display.Sprite;
	
	public class SmallmapHideMenu extends Sprite
	{
		private var _menuBG:UIAsset;
		private var _menuItemList:Vector.<ShieldingItemView>;
		private const MAX_WIDTH:int=180;
		private const LAB_MAX_HEIGHT:int = 23;
		
		public function SmallmapHideMenu()
		{
			super();
			_menuItemList=new Vector.<ShieldingItemView>();
			_menuBG=new UIAsset();
			_menuBG.styleName = "ui/common/tips/tips_2.png";
			addChild(_menuBG);
			_menuBG.width = MAX_WIDTH;
			initView();
		}
		
		private function initView():void
		{
			var item:ShieldingItemView;
			var menus : Array = SystemSetUtil.getShieldingMenu();
			var len:int = menus.length;
			var itemlistLen:int = _menuItemList.length;
			for(var i:int=0;i<len;i++)
			{
				if(i<itemlistLen) item = _menuItemList[i];
				else{
					item = new ShieldingItemView();
					item.y = i*LAB_MAX_HEIGHT+6;
					addChild(item);
					_menuItemList.push(item);
				}
				item.setData(menus[i]);
				item.x=3;
				item.visible=true;
			}
			_menuBG.height=item.y+item.height+6;
		}
		
		public function close():void
		{
			GameSettingManager.savaMainToServer();
			this.visible=false;
		}
	}
}