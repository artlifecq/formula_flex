package com.rpgGame.appModule.common.itemRender
{
	import com.rpgGame.core.ui.SkinUI;
	
	import feathers.controls.ComboBox;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	
	import starling.display.DisplayObject;
	
	/**
	 *基于皮肤的元素基类
	 *@author dik
	 *2017-4-10下午7:46:16
	 */
	public class SkinItem extends SkinUI
	{
		private var _text:String;
		private var _comboBox:ComboBox;
		public  var callBack:Function;
		public function SkinItem(com:ComboBox,skin:StateSkin=null)
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
			lb.textAlign="left";
			//			lb.width=this.width;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			_comboBox.selectedIndex=_comboBox.dataProvider.getItemIndex(_text);
			_comboBox.getTextInput().text=_text;
			if(callBack){
				callBack();
			}
		}
		
		public function set text(value:String):void
		{
			_text=value;
			refresh();
		}
	}
}