package com.game.engine3D.vo
{
	import flash.utils.Dictionary;

	/**
	 *
	 * 3D文字渲染数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-10-10 下午1:26:38
	 *
	 */
	public class Render3DTextData
	{
		private var _styleName : String;
		private var _textWidth : int;
		private var _textHeight : int;
		private var _spacing : int;
		private var _charSetMap : Dictionary;
		private var _styleMap : Dictionary;

		public function Render3DTextData(styleName : String, textWidth : int = 0, textHeight : int = 0, spacing : int = 0)
		{
			_styleName = styleName;
			_textWidth = textWidth;
			_textHeight = textHeight;
			_spacing = spacing;
			_charSetMap = new Dictionary(true);
			_styleMap = new Dictionary(true);
		}

		public function addStyle(style : String, sourcePath : String) : void
		{
			_styleMap[style] = sourcePath;
		}

		public function addCharSet(char : String, frameTime : int) : void
		{
			_charSetMap[char] = frameTime;
		}

		public function get textWidth() : int
		{
			return _textWidth;
		}

		public function get textHeight() : int
		{
			return _textHeight;
		}

		public function get spacing() : int
		{
			return _spacing;
		}

		public function getStyleSourcePath(style : String) : String
		{
			return _styleMap[style];
		}

		public function getFrameTimeByChar(char : String) : int
		{
			if (char)
			{
				if (_charSetMap.hasOwnProperty(char))
				{
					return int(_charSetMap[char]);
				}
			}
			return -1;
		}

		public function get styleName() : String
		{
			return _styleName;
		}
	}
}
