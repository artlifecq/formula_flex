package com.rpgGame.app.ui.menu
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.core.events.PeopleMenuEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	
	import flash.errors.IllegalOperationError;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 * 菜单控制 
	 * @author zhougang
	 */	
	public class MenuControl
	{
		private var _menuView:MenuView = null;
		private var _parentLayer:Sprite = null;
		private var intervalId:uint = 0;
		private static var _instance:MenuControl = null;
		private static var _allowInstance:Boolean = false;
		
		public function MenuControl()
		{
			if (!_allowInstance)
			{
				GameLog.throwError(new IllegalOperationError("不能直接实例化MenuController类"));
			}
			parentLayer = StarlingLayerManager.tipUILayer;
			_menuView = new MenuView();
		}
		
		public function get parentLayer() : Sprite
		{
			return _parentLayer;
		}
		
		public function set parentLayer(value:Sprite) : void
		{
			_parentLayer = value;
		}
		
		public function showMenu(menuTitleArr:Array, posX:Number = -1, posY:Number = -1, menuWidth:Number = 80, isCloseDisposeData:Boolean = false) : MenuView
		{
			//用于实现菜单显示时的一些逻辑处理，比如列表项不显示tips
			EventManager.dispatchEvent(PeopleMenuEvent.PEOPLE_MENU_SHOWED);
			menuTitleArr = menuTitleArr.sortOn("index",Array.NUMERIC);
			_menuView.uiWidth = menuWidth;
			_menuView.init(menuTitleArr, isCloseDisposeData);
			if (posX == -1 && posY == -1)
			{
				posX = Starling.current.nativeStage.mouseX + 10;
//				Starling.current.stage.pivotX
				posY = Starling.current.nativeStage.mouseY;
			}
			_menuView.x = posX;
			_menuView.y = posY;
			addMenu();
			judgeMenuViewLocation();
			addStageListener();
			//			_menuView.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			return _menuView;
		}
		
	
		
		public function showMenuForMouse(menuTitleArr:Array, menuWidth:Number = 80, isCloseDisposeData:Boolean = true) : MenuView
		{
			return showMenu(menuTitleArr,-1,-1,menuWidth,isCloseDisposeData);
		}
		
		public function closeMenu() : void
		{
			//用于实现菜单显示时的一些逻辑处理，比如列表项不显示tips
			EventManager.dispatchEvent(PeopleMenuEvent.PEOPLE_MENU_CLOSED);
			Starling.current.stage.removeEventListener( TouchEvent.TOUCH, stageClick );
			removeMenu();
		}
		
		private function judgeMenuViewLocation() : void
		{
			if (_menuView.x + _menuView.width > Starling.current.stage.stageWidth)
			{
				_menuView.x = _menuView.x - (_menuView.x + _menuView.width - Starling.current.stage.stageWidth + 20);
			}
			if (_menuView.y + _menuView.height > Starling.current.stage.stageHeight)
			{
				_menuView.y = _menuView.y - (_menuView.y + _menuView.height - Starling.current.stage.stageHeight + 20);
			}
		}
		
		private function addMenu() : void
		{
			if (parentLayer != null && _menuView != null)
			{
				parentLayer.addChild(_menuView);
			}
		}
		
		private function removeMenu() : void
		{
			if (parentLayer != null && _menuView != null && parentLayer.contains(_menuView))
			{
				parentLayer.removeChild(_menuView);
				_menuView.close();
			}
		}
		
		private function addStageListener() : void
		{
			Starling.current.stage.addEventListener( TouchEvent.TOUCH, stageClick );
		}
		
		private function stageClick(e:TouchEvent) : void
		{
			var touch:Touch = e.getTouch( Starling.current.stage, TouchPhase.BEGAN ); 
			if( touch == null )
				return;
			touch = e.getTouch( _menuView, TouchPhase.BEGAN ); 
			if( touch != null )
				return;
			closeMenu();
		}
		
		
		public static function get instance() : MenuControl
		{
			if (_instance == null)
			{
				_allowInstance = true;
				_instance = new MenuControl();
				_allowInstance = false;
			}
			return _instance;
		}
	}
}