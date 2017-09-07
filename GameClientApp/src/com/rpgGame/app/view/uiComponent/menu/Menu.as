package com.rpgGame.app.view.uiComponent.menu
{
	import com.rpgGame.core.events.SystemEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.TweenUtil;
	
	import away3d.events.Event;
	
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * 弹出菜单
	 * @author luguozheng
	 * 
	 */	
	public class Menu extends Sprite
	{
		/**背景**/
		private var _menuBG:UIAsset;
		
//		private var _menuBG:Shape;
		/** 是否显示 **/
		private var isShowing:Boolean;
		/** 菜单Vector **/
		private var _menuItemVect:Vector.<MenuItemView>;
		private var lastBindHider:DisplayObject;
		
		public function Menu()
		{
			_menuItemVect = new Vector.<MenuItemView>();
			
//			_menuBG = new Shape();
//			_menuBG.graphics.beginFill( 0x000000, 0.6 );
//			_menuBG.graphics.drawRect( 0, 0, MenuItemView.MAX_WIDTH, 10 );
//			_menuBG.graphics.endFill();
//			addChild( _menuBG );

			_menuBG = new UIAsset();
			_menuBG.styleName = "ui/common/tips/tips_2.png";
			addChild( _menuBG );
			_menuBG.width = MenuItemView.MAX_WIDTH + 12;
		}
		
		private static var _instance:Menu;
		public static function GetInstance():Menu
		{
			if( _instance == null )
				_instance = new Menu();
			return _instance;
		}
		
		public function show( menus:Array, fixPosx:int = -1, fixPosy:int = -1, menuWidth:int = 40,bindHideDisplay:DisplayObject=null ):void
		{
			if( isShowing )
				clear();
			
			isShowing = true;
			
			hideMenuItem();
			
			var menuItem:MenuItemView;
			var menusLen:int = menus.length;
			var itemLen:int = _menuItemVect.length;
			for( var i:int = 0; i < menusLen; i ++ )
			{
				if( i < itemLen )
				{
					menuItem = _menuItemVect[i];
				}
				else
				{
					menuItem = new MenuItemView();
					menuItem.y = 6 + MenuItemView.LAB_MAX_HEIGHT * i;
					addChild( menuItem );
					
					_menuItemVect.push( menuItem );
				}
				
//				menuItem.setWidth( menuWidth, 5 );
				
				menuItem.setData( menus[i] );
				menuItem.width=menuWidth-4;
				menuItem.x=4;
				menuItem.visible = true;
			}
			
			_menuBG.width = menuWidth+4;
			_menuBG.height = menusLen * MenuItemView.LAB_MAX_HEIGHT + 12;
			
			updatePos( fixPosx, fixPosy );
			
			StarlingLayerManager.hintUILayer.addChild( this );
			this.addEventListener(Event.REMOVED_FROM_STAGE,onHide);
			
			TweenUtil.MenuShowAndHide( this, 1, 0, 1, showEnd );
			if(lastBindHider != bindHideDisplay)
			{
				if(lastBindHider != null)unBind();
				if(bindHideDisplay != null)
				{
					lastBindHider = bindHideDisplay;
					bindHideDisplay.addEventListener(Event.REMOVED_FROM_STAGE,onBindHide);
				}
			}
		}
		
		private function onHide(e:Event):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE,onHide);
			unBind();
		}
		
		private function onBindHide(e:Event):void
		{
			if(stage != null)hide();
		}
		
		private function unBind(e:Event=null):void
		{
			if(lastBindHider !=  null)
			{
				lastBindHider.removeEventListener(Event.REMOVED_FROM_STAGE, unBind);
				lastBindHider = null;
			}
		}
		
		private function updatePos(fixPosx:int, fixPosy:int):void
		{
			if( fixPosx != -1 )
			{
				x = fixPosx;
			}
			else
			{
				x = Starling.current.nativeStage.mouseX;
				if( x + _menuBG.width > Starling.current.nativeStage.stageWidth )
					x = Starling.current.nativeStage.stageWidth - _menuBG.width;
			}
			
			if( fixPosy != -1 )
			{
				y = fixPosy;
			}
			else
			{
				y = Starling.current.nativeStage.mouseY;
				if( y + _menuBG.height > Starling.current.nativeStage.stageHeight )
					y = Starling.current.nativeStage.stageHeight - _menuBG.height;
			}
		}
		
		private function hideMenuItem():void
		{
			for( var i:int = _menuItemVect.length - 1;i >= 0 ;i -- )
			{
				_menuItemVect[i].visible = false;
			}
		}
		
		private function onClose( e:TouchEvent ):void
		{
			var touch:Touch = e.getTouch( Starling.current.stage, TouchPhase.BEGAN ); 
			if( touch == null )
				return;
			
			touch = e.getTouch( this, TouchPhase.BEGAN ); 
			if( touch != null )
				return;//说明点击自己，不隐藏
			
			hide();
		}
		
		private function showEnd():void
		{
			Starling.current.stage.addEventListener( TouchEvent.TOUCH, onClose );
		}
		
		public function hide():void
		{
			isShowing = false;
			
			removeListener();
			TweenUtil.MenuShowAndHide( this, 0, 1, 0, removeSelf );
		}
		
		private function clear():void
		{
			removeSelf();
			removeListener();
		}
		
		private function removeSelf():void
		{
			StarlingLayerManager.hintUILayer.removeChild( this );
			unBind();
		}
		
		private function removeListener():void
		{
			Starling.current.stage.removeEventListener( TouchEvent.TOUCH, onClose );
		}
		
	}
}