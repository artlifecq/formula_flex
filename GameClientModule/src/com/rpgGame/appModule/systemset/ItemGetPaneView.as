package com.rpgGame.appModule.systemset
{
	import com.rpgGame.app.richText.RichTextCustomUnitType;
	import com.rpgGame.app.richText.component.RichTextUnit;
	import com.rpgGame.app.richText.component.RichTextUnitData;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.TweenUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.systemSet.WupinSelect_Skin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import away3d.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class ItemGetPaneView extends SkinnableContainer
	{
		protected var touchToState:TouchToState;
		private var _paneView:BasePaneView;
		public function ItemGetPaneView():void
		{
			super();
		}
		override protected function initialize():void
		{
			this.skin =new WupinSelect_Skin();
			_paneView = new GetItemPaneView(this);
			this.width = 132;
			this.height = 210;
		}
		private static var _instance:ItemGetPaneView;
		public static function GetInstance():ItemGetPaneView
		{
			if( _instance == null )
				_instance = new ItemGetPaneView();
			return _instance;
		}
		
		private var _bindDisplay:Label;

		public function get bindDisplay():Label
		{
			return _bindDisplay;
		}
		public function set bindDisplay(value:Label):void
		{
			if(_bindDisplay!=null)
			{
				this.touchToState = null;
			}
			_bindDisplay = value;
			
			_bindDisplay.htmlText = HtmlTextUtil.underLine(_bindDisplay.text);
			this.touchToState = new TouchToState(_bindDisplay, this.changeState);
		}
		protected function changeState(touch:Touch):void
		{
			if(touch.phase == TouchPhase.ENDED)
			{
				ItemGetPaneView.GetInstance().show(touch.globalX,touch.globalY);
			}
		}

		/** 是否显示 **/
		private var isShowing:Boolean;
		public function show(x:int,y:int):void
		{
			this.x = x;
			this.y = y;
			if( !isShowing )
			{
				StarlingLayerManager.hintUILayer.addChild( this );
				this.addEventListener(Event.REMOVED_FROM_STAGE,onHide);
				TweenUtil.MenuShowAndHide( this, 0.3, 0, 1, showEnd );
			}
			isShowing = true;
			
		}
		private function onHide(e:Event):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE,onHide);
			Starling.current.stage.removeEventListener( TouchEvent.TOUCH, onCloseHandler );
		}
		private function showEnd():void
		{
			if(!isShowing)
				return ;
			Starling.current.stage.addEventListener( TouchEvent.TOUCH, onCloseHandler );
		}
		private function onCloseHandler( e:TouchEvent ):void
		{
			var touch:Touch = e.getTouch( Starling.current.stage, TouchPhase.BEGAN ); 
			if( touch == null )
				return;
			
			touch = e.getTouch( this, TouchPhase.BEGAN ); 
			if( touch != null )
				return;//说明点击自己，不隐藏
			
			touch = e.getTouch( bindDisplay, TouchPhase.BEGAN ); 
			if( touch != null )
				return;//说明点击关联对象，不隐藏
			
			hide();
		}
		public function hide():void
		{
			Starling.current.stage.removeEventListener( TouchEvent.TOUCH, onCloseHandler );
			TweenUtil.MenuShowAndHide( this, 0.3, 1, 0, removeSelf );
		}
		private function removeSelf():void
		{
			isShowing = false;
			StarlingLayerManager.hintUILayer.removeChild( this );
		}
	}
}
import com.rpgGame.app.manager.SystemSetManager;
import com.rpgGame.appModule.systemset.BasePaneView;

import feathers.controls.Check;
import feathers.controls.SkinnableContainer;

import org.mokylin.skin.app.systemSet.WupinSelect_Skin;

import away3d.events.Event;

class GetItemPaneView extends BasePaneView
{
	public function GetItemPaneView(content:SkinnableContainer):void
	{
		super(content);
	}
	private var _skin:WupinSelect_Skin;
	override public function refeashView():void
	{
		super.refeashView();
		_skin = this._content.skin as WupinSelect_Skin;
//		bindDate(_skin.chk_all,SystemSetManager.SYSTEMSET_AUOT_GET_ALL);
//		bindDate(_skin.chk_jinbi,SystemSetManager.SYSTEMSET_AUOT_GET_MONEY);
//		bindDate(_skin.chk_yaopin,SystemSetManager.SYSTEMSET_AUOT_GET_DRUGS);
//		bindDate(_skin.chk_zhuangbei,SystemSetManager.SYSTEMSET_AUOT_GET_EQUIPMENT);
//		bindDate(_skin.chk_cailiao,SystemSetManager.SYSTEMSET_AUOT_GET_MATERIAL);
//		bindDate(_skin.chk_renwu,SystemSetManager.SYSTEMSET_AUOT_GET_TASKITEM);
//		bindDate(_skin.chk_qita,SystemSetManager.SYSTEMSET_AUOT_GET_OTHERITEM);
	}
	private var _isChageing:Boolean = false;
//	override protected function checkChangeHandler(e:Event):void
//	{
//		super.checkChangeHandler(e);
//		if(_isChageing)
//			return ;
//		_isChageing = true;
//		var check:Check = e.target as Check;
//		if(check== _skin.chk_all)
//		{
//			setAll(check.isSelected);
//		}else{
//			if(!check.isSelected)
//			{
//				_skin.chk_all.isSelected = false;
//			}else{
//				_skin.chk_all.isSelected = checkAllCheck();
//			}
//		}
//		_isChageing = false;
//	}
	
	private function checkAllCheck():Boolean
	{
		var bool:Boolean = true;
		for(var check:Check in _checkList)
		{
			if(check == _skin.chk_all)
				continue;
			if(!check.isSelected)
			{
				bool = false;
				break;
			}
		}
		return bool;
	}
	private function setAll(value:Boolean):void
	{
		for(var check:Check in _checkList)
		{
			check.isSelected = value;
		}
	}
}