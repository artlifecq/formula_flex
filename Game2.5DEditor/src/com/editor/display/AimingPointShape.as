package com.editor.display
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 *
	 * 瞄准点图形
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-24 下午2:03:17
	 *
	 */
	public class AimingPointShape extends Sprite
	{
		private var _textField : TextField;
		private var _textBmp : Bitmap;
		private var _selected : Boolean;

		public function AimingPointShape(text : String)
		{
			super();

			_textField = new TextField();
			_textField.defaultTextFormat = new TextFormat("SimSun", 300, 0x0000ff, true);
			_textField.text = text;
			var textBmd : BitmapData = new BitmapData(256, 256, true, 0);
			_textBmp = new Bitmap(textBmd);
			this.addChild(_textBmp);
			_textBmp.x = -_textBmp.width * 0.5 + 50;
			_textBmp.y = -_textBmp.height * 0.5 - 20;
			_textField.width = _textField.textWidth + 6;
			_textField.height = _textField.textHeight + 6;
			_textField.selectable = false;
			_textField.mouseWheelEnabled = false;
			_textField.mouseEnabled = false;
			textBmd.draw(_textField);
			normal();
		}

		public function normal() : void
		{
			this.graphics.clear();
			this.graphics.beginFill(0xffff00);
			this.graphics.lineStyle(5);
			this.graphics.drawCircle(0, 0, 128);
			this.graphics.endFill();

			this.graphics.lineStyle(5);
			this.graphics.moveTo(-128, 0);
			this.graphics.lineTo(128, 0);
			this.graphics.moveTo(0, -128);
			this.graphics.lineTo(0, 128);
		}

		public function over() : void
		{
			this.graphics.clear();
			this.graphics.beginFill(0x00ff00);
			this.graphics.lineStyle(5);
			this.graphics.drawCircle(0, 0, 128);
			this.graphics.endFill();

			this.graphics.lineStyle(5);
			this.graphics.moveTo(-128, 0);
			this.graphics.lineTo(128, 0);
			this.graphics.moveTo(0, -128);
			this.graphics.lineTo(0, 128);
		}

		public function set selected(value : Boolean) : void
		{
			_selected = value;
			if (_selected)
			{
				this.graphics.clear();
				this.graphics.beginFill(0xff0000);
				this.graphics.lineStyle(5);
				this.graphics.drawCircle(0, 0, 128);
				this.graphics.endFill();

				this.graphics.lineStyle(5);
				this.graphics.moveTo(-128, 0);
				this.graphics.lineTo(128, 0);
				this.graphics.moveTo(0, -128);
				this.graphics.lineTo(0, 128);
			}
			else
			{
				normal();
			}
		}

		public function get selected() : Boolean
		{
			return _selected;
		}
	}
}
