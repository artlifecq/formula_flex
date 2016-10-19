package com.rpgGame.core.view.ui.hint
{
	import com.game.mainCore.core.utils.FontUtil;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import feathers.controls.text.Fontter;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
	
	/**
	 *
	 * 请为我写上注释，以告诉其他小伙伴我是用来做什么的
	 * @author fly.liuyang
	 * 创建时间：2014-6-25 下午10:05:04
	 * 
	 */
	public class BottomCenterNote extends Sprite
	{
		private var _ico:Image;
		private var _textLab:TextField;
		private var _textValue:String;
		
		public function BottomCenterNote()
		{
			addIco();
			addText();
		}
		
		private function addText():void
		{
			_textLab = new TextField( 400, 25, "");
			_textLab.touchable = false;
			_textLab.fontSize = Fontter.DEFAULT_FONT_SIZE;
			_textLab.fontName = Fontter.DEFAULT_FONT_NAME;
			_textLab.color = StaticValue.COLOR_CODE_4;
			_textLab.autoSize = TextFieldAutoSize.VERTICAL;
			_textLab.isHtmlText = true;
			addChild( _textLab );
		}
		
		private function addIco():void
		{
			//			_ico = new Image();
			//			_ico.swfName = "note/note"
			//			addChild(_ico);
		}
		
		public function setText($value:String):void
		{
			//设置文本
			_textLab.text = $value;
			_textValue = $value;
		}
		
		public function getText():String
		{
			return _textValue;
		}
		
		override public function get width():Number
		{
			return _textLab.width;
		}
	}
}