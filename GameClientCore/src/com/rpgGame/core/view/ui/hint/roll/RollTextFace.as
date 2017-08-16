package com.rpgGame.core.view.ui.hint.roll
{
	import com.game.mainCore.core.utils.FontUtil;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import feathers.controls.text.Fontter;
	
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
	
	public class RollTextFace extends Sprite
	{
		/**显示次数*/
		public var showCount:int;
		/**文本*/
		private var _text:String;
		
		private var textfiled:TextField;
		
		/**
		 * @param $text 显示文本 支持HTML
		 * @param $maxShowCount 最大显示次数
		 * */
		public function RollTextFace( $text:String = "", $showCount:int = 1 )
		{
			_text = $text;
			showCount = $showCount;
			
			if( textfiled == null )
			{
				textfiled = new TextField( 300, 22, "" );
				textfiled.touchable = false;
				textfiled.autoSize = TextFieldAutoSize.HORIZONTAL;
				textfiled.color = StaticValue.BLUE_TEXT;
				textfiled.fontSize = 18;
				textfiled.fontName = Fontter.DEFAULT_FONT_NAME;
				textfiled.isHtmlText = true;
				textfiled.bold = true;
				addChild(textfiled);
			}
			
			textfiled.text = _text;
		}
		
		public function release():void
		{
			_text = null;
		}
	}
}