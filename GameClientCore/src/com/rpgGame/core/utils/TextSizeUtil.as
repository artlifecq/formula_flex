package com.rpgGame.core.utils
{
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * 得到文本的高度
	 * @author luguozheng
	 * 
	 */	
	public class TextSizeUtil
	{
		private static var _textField:TextField = new TextField();
		private static var _textFormat:TextFormat = new TextFormat();
		
		setup();
		public static function setup():void
		{
			_textField.multiline = true;
			_textField.wordWrap = true;
		}
			
		/**
		 * 根据文本内容获取文本的真实高度
		 * @param info 文本
		 * @param sWith 宽度
		 * @param size 字体大小，默认14号字体
		 * @return 
		 * 
		 */		
		public static function getTextHeght( info:String, sWith:int, size:int = 14 ):int
		{
			_textFormat.size = size;
			_textField.width = sWith;
			_textField.htmlText = info==null?"技能描述":info;
			_textField.setTextFormat( _textFormat );
			return _textField.textHeight;
		}
	}
}