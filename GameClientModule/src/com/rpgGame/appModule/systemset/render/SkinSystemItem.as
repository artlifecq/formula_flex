package com.rpgGame.appModule.systemset.render
{
	import com.rpgGame.core.ui.SkinUI;
	
	import feathers.controls.ComboBox;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	
	import starling.display.DisplayObject;
	
	public class SkinSystemItem extends SkinUI
	{
		private var _text:String;
		private var _comboBox:ComboBox;
		public function SkinSystemItem(com:ComboBox,skin:StateSkin=null)
		{
			_comboBox=com;
			_comboBox.isEditable=false;
			super(skin);
			_stateSkin.width=_comboBox.width;
		}
		
		/**
		 *清理掉 
		 * 
		 */
		public function clear():void
		{
			text="";
		}
		
		//刷新显示
		override public function refresh() : void
		{
			if(!_stateSkin){
				return;
			}
			var lb:Label=_stateSkin["labelDisplay"];
			if(!lb){
				return;
			}
			lb.htmlText=_text;
			lb.textAlign="left"
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			_comboBox.selectedIndex=_comboBox.dataProvider.getItemIndex(_text);
			_comboBox.getTextInput().htmlText=_text;
		}
		
		public function set text(value:String):void
		{
			_text=value;
			refresh();
		}
	}
}