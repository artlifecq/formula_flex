package com.rpgGame.app.ui
{
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	
	import starling.display.DisplayObject;

	public class SkinUIModePanel
	{
		protected var _uiskin:StateSkin;
		private var _button:*;
		private var _guideId:uint;
		private var _skuinui:StateSkin;
		private var _skinCls:Class;
		public function SkinUIModePanel(skin:Class,button:Object,guideId:uint=0):void
		{
			_skinCls = skin;
			_button = button;
			_guideId = guideId;
		}
		
		public function refashSkin(content:SkinnableContainer):void
		{
			if(_uiskin==null)
			{
				_uiskin = new _skinCls() as StateSkin;
			}
			
			content.skin = _uiskin;
			initialize();
		}
		
		protected function initialize():void
		{
			
		}
		public function get button():Radio
		{
			return _button as Radio;
		}
		
		public function get buttonLabel():String
		{
			return _button as String;
		}
		
		public function get isOpen():Boolean
		{
			return true;
		}
		
		public function onTouchTarget(target:DisplayObject):void 
		{
			
		}
		
		public function showView():void
		{
			
		}
		
		public function hide():void
		{
			
		}
	}
}