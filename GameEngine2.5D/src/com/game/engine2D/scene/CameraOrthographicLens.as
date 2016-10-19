package com.game.engine2D.scene
{
	import flash.geom.Rectangle;
	
	import away3d.arcane;
	import away3d.cameras.lenses.OrthographicLens;
	
	use namespace arcane;
	
	public class CameraOrthographicLens extends OrthographicLens
	{
		private var _vsRect:Rectangle = new Rectangle();
		private var _vpRect:Rectangle = new Rectangle();
		private var _vpScale:Number = 1.0;
		
		public function CameraOrthographicLens(projectionHeight:Number=500)
		{
			super(projectionHeight);
		}
		
		override arcane function updateScissorRect(x:Number, y:Number, width:Number, height:Number):void
		{
			_vsRect.setTo(x, y, width, height);
			super.updateScissorRect(x,y,width*_vpScale,height*_vpScale);
		}
		
		override arcane function updateViewport(x:Number, y:Number, width:Number, height:Number):void
		{
			_vpRect.setTo(x, y, width, height);
			super.updateViewport(x,y,width*_vpScale,height*_vpScale);
		}

		public function get viewportScale():Number
		{
			return _vpScale;
		}

		public function set viewportScale(value:Number):void
		{
			if (_vpScale != value)
			{
				_vpScale = value;
				super.updateScissorRect(_vsRect.x, _vsRect.y,_vsRect.width*_vpScale,_vsRect.height*_vpScale);
				super.updateViewport(_vpRect.x,_vpRect.y,_vpRect.width*_vpScale,_vpRect.height*_vpScale);
			}
		}
		
		public function get viewportWidth():Number
		{
			return _vpRect.width;
		}
		
		public function get viewportHeight():Number
		{
			return _vpRect.height;
		}

	}
}