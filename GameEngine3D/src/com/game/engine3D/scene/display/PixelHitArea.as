package com.game.engine3D.scene.display
{
	import com.game.engine3D.manager.Stage3DLayerManager;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.utils.Dictionary;

	import starling.utils.Color;

	/**
	 *
	 * 像素碰撞区域
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-28 上午11:12:28
	 *
	 */
	public class PixelHitArea
	{
		private static var hitAreas : Dictionary;
		private static var areasCount : int = 0;

		public static function createHitArea(name : String, bitmapData : BitmapData) : PixelHitArea
		{
			if (hitAreas == null)
				hitAreas = new Dictionary();
			var hitArea : PixelHitArea = hitAreas[name];
			if (!hitArea)
			{
				hitArea = new PixelHitArea(name, bitmapData);
				hitArea.index = areasCount;
				hitAreas[name] = hitArea;
				areasCount++;
			}
			return hitArea;
		}

		public static function getHitArea(name : String) : PixelHitArea
		{
			return hitAreas[name];
		}

		public static function disposeHitArea(name : String) : void
		{
			var hitArea : PixelHitArea = hitAreas[name];
			if (hitArea)
			{
				hitArea.dispose();
				hitAreas[name] = null;
				delete hitAreas[name];
				areasCount--;
			}
		}

		public static function disposeAll() : void
		{
			for (var name : String in hitAreas)
			{
				var hitArea : PixelHitArea = hitAreas[name];
				if (hitArea)
				{
					hitArea.dispose();
					hitAreas[name] = null;
					delete hitAreas[name];
					areasCount--;
				}
			}
			hitAreas = null;
		}

		public static function hitTest(localPoint : Point) : PixelHitArea
		{
			var currMaxIndex : int = -1;
			var currHitArea : PixelHitArea = null;
			for each (var hitArea : PixelHitArea in hitAreas)
			{
				var rtn : uint = hitArea.getAlphaPixel(localPoint.x, localPoint.y);
				if (rtn > 0 && hitArea.index > currMaxIndex)
				{
					currMaxIndex = hitArea.index;
					currHitArea = hitArea;
				}
			}
			return currHitArea;
		}

		private static var debugPrintContainer : Sprite;

		public static function debugPrintAreas(globalX : int, globalY : int) : void
		{
			var stage : Stage = Stage3DLayerManager.stage;
			if (!stage)
				return;
			if (!debugPrintContainer)
			{
				debugPrintContainer = new Sprite();
				debugPrintContainer.mouseEnabled = debugPrintContainer.mouseChildren = false;
				stage.addChild(debugPrintContainer);
			}
			while (debugPrintContainer.numChildren)
			{
				debugPrintContainer.removeChildAt(0);
			}
			debugPrintContainer.x = globalX;
			debugPrintContainer.y = globalY;
			for each (var hitArea : PixelHitArea in hitAreas)
			{
				var bitmap : Bitmap = new Bitmap(hitArea._bitmapData);
				bitmap.x = hitArea.x;
				bitmap.y = hitArea.y;
				bitmap.scaleX = hitArea.scaleX;
				bitmap.scaleY = hitArea.scaleY;
				debugPrintContainer.addChild(bitmap);
			}
		}

		private var _name : String;
		private var _bitmapData : BitmapData;
		private var _alphaData : Vector.<uint>;
		public var x : int = 0;
		public var y : int = 0;
		public var scaleX : Number = 1;
		public var scaleY : Number = 1;
		public var index : int = 0;

		public function PixelHitArea(name : String, bitmapData : BitmapData)
		{
			_name = name;
			_bitmapData = bitmapData;
			var pixelData : Vector.<uint> = _bitmapData.getVector(_bitmapData.rect);
			_alphaData = new Vector.<uint>(Math.ceil((_bitmapData.width * _bitmapData.height) / 4), true);

			var j : uint = 0;
			for (var i : uint = 0; i < _alphaData.length; i++)
			{
				_alphaData[i] = (getAlpha(pixelData, j) << 24) | (getAlpha(pixelData, j + 1) << 16) | (getAlpha(pixelData, j + 2) << 8) | (getAlpha(pixelData, j + 3));
				j += 4;
			}
		}

		public function get name() : String
		{
			return _name;
		}

		private function getAlpha(pixelData : Vector.<uint>, index : uint) : uint
		{
			return index < pixelData.length ? Color.getAlpha(pixelData[index]) : 0;
		}

		public function getAlphaPixel(x : uint, y : uint) : uint
		{
			x = x - this.x;
			x = x / this.scaleX;
			y = y - this.y;
			y = y / this.scaleY;
			if (x >= _bitmapData.width || y >= _bitmapData.height)
				return 0;
			var cell : Number = (y * _bitmapData.width + x) / 4;
			var rest : Number = cell % Math.floor(cell);
			var alphaGroup : uint = _alphaData[Math.floor(cell)];
			if (rest == 0)
				return Color.getAlpha(alphaGroup);
			if (rest == 0.25)
				return Color.getRed(alphaGroup);
			if (rest == 0.5)
				return Color.getGreen(alphaGroup);
			if (rest == 0.75)
				return Color.getBlue(alphaGroup);
			return 0;
		}

		public function dispose() : void
		{
			_name = null;
			_alphaData = null;
			_bitmapData = null;
		}
	}
}
