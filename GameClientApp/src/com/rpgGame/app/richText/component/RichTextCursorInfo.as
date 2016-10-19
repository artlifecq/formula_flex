package com.rpgGame.app.richText.component
{
	
	/**
	 * 富文本对应的指针信息
	 * @author GuoDong.Zhang
	 * 创建时间：2016-7-5 上午10:43:58
	 * 
	 */
	public class RichTextCursorInfo
	{
		public var cursorIndex:int;
		public var firstPartLength:int;
		public var lastPartLength:int;
		
		public function reset():void
		{
			cursorIndex = 0;
			firstPartLength = 0;
			lastPartLength = 0;
		}
	}
}