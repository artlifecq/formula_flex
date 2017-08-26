package com.rpgGame.app.view.uiComponent.menu
{
	import com.gameClient.alert.Game2dLayer;
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.core.events.MenuEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.lang.LangMenu;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.common.erjiItem_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	
	/**
	 * 菜单
	 * @author luguozheng
	 * 
	 */	
	public class MenuItemView extends SkinUI
	{
		public static const MAX_WIDTH:int = 40;
		public static const LAB_MAX_HEIGHT:int = 23;
		
		private var _skin:erjiItem_Skin;//MenuItemSkin;
		private var _type:String;
		
		private var _clipHitArea:Sprite;
		public function MenuItemView()
		{
			_skin=new erjiItem_Skin();//new MenuItemSkin();
			super(_skin);
			_skin.uiBg.visible=false;
		}
		
		public function setData( type:String ):void
		{
			_type = type;
			//			_skin.btn.label = MenuUtil.getMenuTitle( type );
			//			//_skin.btn.width=60;
			//			_skin.btn.height=20;
			_skin.labelDisplay.text=MenuUtil.getMenuTitle( type);
		}
		override protected function onShow():void
		{
			super.onShow();
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
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
				_clipHitArea.scaleX=this._skin.uiBg.width;
				_clipHitArea.scaleY=this._skin.uiBg.height;
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
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
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
			_skin.uiBg.width=_skin.labelDisplay.width=value;
		}
		override protected function onTouchTarget(target : DisplayObject) : void 
		{
			super.onTouchTarget(target);
			if(target==_skin.labelDisplay&&LangMenu.COPY_THE_NAME!=_type)
			{
				EventManager.dispatchEvent( MenuEvent.MENU_CLICK, _type );
			}
		}
		
		private static const HELPER_POINT:Point = new Point();
		protected var touchPointID:int = -1;
		public function onTouchItem(event:TouchEvent):void
		{
			if(this.touchPointID >= 0)
			{
				var touch:Touch = event.getTouch(this, null, this.touchPointID);
				if(!touch || !this.stage)
				{
					//this should never happen
					return;
				}
				
				touch.getLocation(this.stage, HELPER_POINT);
				var isInBounds:Boolean = this.contains(this.stage.hitTest(HELPER_POINT));
				if(touch.phase === TouchPhase.MOVED)
				{
					if(isInBounds)
					{
						_skin.uiBg.visible=true;
					}
					else
					{
						_skin.uiBg.visible=false;
					}
				}else if(touch.phase === TouchPhase.ENDED){
					this.touchPointID = -1;
					if(isInBounds)
					{
						_skin.uiBg.visible=true;
					}
					else
					{
						_skin.uiBg.visible=false;
					}
				}
				return;
			}
			else //if we get here, we don't have a saved touch ID yet
			{
				touch = event.getTouch(this, TouchPhase.BEGAN);
				if(touch)
				{
					_skin.uiBg.visible=true;
					this.touchPointID = touch.id;
					return;
				}
				touch = event.getTouch(this, TouchPhase.HOVER);
				if(touch)
				{
					_skin.uiBg.visible=true;
					return;
				}
				
				//end of hover
				_skin.uiBg.visible=false;
			}
			
		}
	}
}
