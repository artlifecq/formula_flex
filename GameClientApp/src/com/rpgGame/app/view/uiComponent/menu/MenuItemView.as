package com.rpgGame.app.view.uiComponent.menu
{
	import com.gameClient.alert.Game2dLayer;
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.core.events.MenuEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.lang.LangMenu;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.system.System;
	
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
		
		private var _clipHitArea:Sprite;
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
		override protected function onShow():void
		{
			super.onShow();
			if (LangMenu.COPY_THE_NAME==_type) 
			{
				if (_clipHitArea == null)
				{
					_clipHitArea = new Sprite();
					_clipHitArea.graphics.beginFill(0xAAAA00, 0.01);
					_clipHitArea.graphics.drawRect(0, 0, 1, 1);
					_clipHitArea.graphics.endFill();
					_clipHitArea.addEventListener(MouseEvent.CLICK, clipText);
				}
				_clipHitArea.scaleX=this._skin.btn.width;
				_clipHitArea.scaleY=this._skin.btn.height;
				var pt:Point=this.localToGlobal(new Point(0,0));
				_clipHitArea.x=pt.x;
				_clipHitArea.y=pt.y;
				if (!Game2dLayer.ins.contains(_clipHitArea))
				{
					Game2dLayer.ins.addChild(_clipHitArea);
				}
				
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			if (_clipHitArea&&_clipHitArea.stage) 
			{
				_clipHitArea.removeEventListener(MouseEvent.CLICK,clipText);
				_clipHitArea.parent.removeChild(_clipHitArea);
				_clipHitArea=null;
			}
		}

		private  function clipText(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			//System.setClipboard("xxx");
			EventManager.dispatchEvent( MenuEvent.MENU_CLICK, _type );
		}
		override public function set width(value:Number):void
		{
			_skin.btn.width=value;
		}
		override protected function onTouchTarget(target : DisplayObject) : void 
		{
			super.onTouchTarget(target);
			if(target==_skin.btn&&LangMenu.COPY_THE_NAME!=_type)
			{
				EventManager.dispatchEvent( MenuEvent.MENU_CLICK, _type );
			}
		}
	}
}
