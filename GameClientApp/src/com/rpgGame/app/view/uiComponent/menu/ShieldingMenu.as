package com.rpgGame.app.view.uiComponent.menu
{
	import com.rpgGame.app.manager.GameSettingManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.TweenUtil;
	
	import away3d.events.Event;
	
	import feathers.controls.UIAsset;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class ShieldingMenu extends Sprite
	{
		private var _menuBG:UIAsset;
		
		private var _isShowing:Boolean;
		private var _menuItemList:Vector.<ShieldingItemView>;
		private var _lastBindHider:DisplayObject;
		
		private const MAX_WIDTH:int=180;
		private const LAB_MAX_HEIGHT:int = 23;
		public function ShieldingMenu()
		{
			super();
			_menuItemList=new Vector.<ShieldingItemView>();
			_menuBG=new UIAsset();
			_menuBG.styleName = "ui/common/tips/tips_2.png";
			addChild(_menuBG);
			_menuBG.width = MAX_WIDTH;
		}
		
		private static var _instance:ShieldingMenu;
		public static function GetInstance():ShieldingMenu
		{
			if(_instance == null) _instance=new ShieldingMenu();
			return _instance;
		}
		
		public function show(menus:Array, fixPosx:int = -1, fixPosy:int = -1, menuWidth:int = 40,bindHideDisplay:DisplayObject=null):void
		{
			if(_isShowing) clear();
			_isShowing = true;
			var item:ShieldingItemView;
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
			updatePos( fixPosx, fixPosy );
			
			StarlingLayerManager.hintUILayer.addChild( this );
			this.addEventListener(Event.REMOVED_FROM_STAGE,onHide);
			TweenUtil.MenuShowAndHide( this, 1, 0, 1, showEnd );
			if(_lastBindHider != bindHideDisplay)
			{
				if(_lastBindHider != null)unBind();
				if(bindHideDisplay != null)
				{
					_lastBindHider = bindHideDisplay;
					bindHideDisplay.addEventListener(Event.REMOVED_FROM_STAGE,onBindHide);
				}
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
					y = Starling.current.nativeStage.stageHeight - _menuBG.height+30;
			}
		}
		
		private function hideMenuItem():void
		{
			for( var i:int = _menuItemList.length - 1;i >= 0 ;i -- )
			{
				_menuItemList[i].visible = false;
			}
		}
		
		private function showEnd():void
		{
			Starling.current.stage.addEventListener( TouchEvent.TOUCH, onClose );
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
		
		private function onBindHide(e:Event):void
		{
			if(stage != null) hide();
		}
		
		public function hide():void
		{
			_isShowing = false;
			
			removeListener();
			
			TweenUtil.MenuShowAndHide( this, 0, 1, 0, removeSelf );
			GameSettingManager.savaMainToServer();
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
		
		private function onHide(e:Event):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE,onHide);
			unBind();
		}
		
		private function unBind(e:Event=null):void
		{
			if(_lastBindHider !=  null)
			{
				_lastBindHider.removeEventListener(Event.REMOVED_FROM_STAGE, unBind);
				_lastBindHider = null;
			}
		}
		
		private function removeListener():void
		{
			Starling.current.stage.removeEventListener( TouchEvent.TOUCH, onClose );
		}
	}
}