package com.game.engine2D.vo
{
	import starling.display.Sprite;
	
	public class HeadNameContainer extends Sprite
	{
		private var _offsetX:Number = 0;
		private var _offsetY:Number = 0;
		
		public function HeadNameContainer()
		{
			super();
		}
		
		override public function set x(value:Number):void
		{
			super.x = value + _offsetX;
		}
		
		override public function set y(value:Number):void
		{
			super.y = value + _offsetY;
		}
		
		public function get offsetY():Number
		{
			return _offsetY;
		}

		public function set offsetY(value:Number):void
		{
			_offsetY = value;
		}

		public function get offsetX():Number
		{
			return _offsetX;
		}

		public function set offsetX(value:Number):void
		{
			_offsetX = value;
		}

	}
}