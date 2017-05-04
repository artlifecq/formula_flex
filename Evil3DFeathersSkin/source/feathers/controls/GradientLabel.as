package feathers.controls
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.display.StageQuality;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	import starling.core.Starling;
	
	/**
	 * A label that contains a textField fill with gradient color
	 *
	 *
	 * <p>In the following example
	 * 
	 * var label:GradientLabel = new GradientLabel();
	 * label.colors = [ 0xd0f5ff, 0x5797b5 ];
	 * label.gradientType = "linear"
	 * this.addChild(label)
	 *
	 * @see ../../../help/gradient-label.html How to use the Feathers GradientLabel component
	 * @see feathers.controls.Label
	 * @author wewell@163.com
	 */
	public class GradientLabel extends Label
	{
		private static var helpSprite:Sprite;
		private static var helpMask:Shape;
		
		private var _gradientColor_a:uint = 0xd0f5ff;
		private var _gradientColor_b:uint = 0x5797b5;
		private var _colorRotation:Number = 0.5;
		
		
		
		/**
		 * [绘制类型:线性(linear), 放射(radial)] 
		 */		
		private var _gradientType:String = "linear";
		
		/**  
		*[渐变颜色，最多15种颜色] 
		*/		
		private var _colors:Array = [ 0xd0f5ff, 0x5797b5 ];
		
		/**
		 *  [colors数组中对应颜色的alpha值数组]
		 */		
		private var _alphas:Array = [ 1, 1 ];
		
		/**
		 * [颜色分布比率的数组] 	 
		 */		
		private var _ratios:Array = [ 0x00, 0xff ];
		
		
		public function GradientLabel()
		{
			super();
		}

		public function get gradientColor_a():uint
		{
			return _gradientColor_a;
		}

		public function set gradientColor_a(value:uint):void
		{
			if(_gradientColor_a == value)
				return;
			_gradientColor_a = value;
			_colors[0] = value;
			invalidate();
		}

		public function get gradientColor_b():uint
		{
			return _gradientColor_b;
		}

		public function set gradientColor_b(value:uint):void
		{
			if(_gradientColor_b == value)
				return;
			
			_gradientColor_b = value;
			_colors[1] = value;
			invalidate();
		}

		/**
		 * colorRotation
		 * 
		 */		
		public function get colorRotation():Number
		{
			return _colorRotation;
		}

		public function set colorRotation(value:Number):void
		{
			if(_colorRotation == value)
				return;
			
			_colorRotation = value;
			invalidate();
		}
		
		/**
		 * gradientType
		 * 
		 */		
		public function get gradientType():String
		{
			return _gradientType;
		}
		
		public function set gradientType(value:String):void
		{
			if(_gradientType == value)
				return;
			
			_gradientType = value;
			invalidate();
		}
		
		/**
		 * colors
		 * 
		 */
		public function get colors():Array
		{
			return _colors;
		}
		
		public function set colors(value:Array):void
		{
			_colors = value;
			invalidate();
		}
		
		/**
		 * alphas
		 * 
		 */
		public function get alphas():Array
		{
			return _alphas;
		}
		
		public function set alphas(value:Array):void
		{
			_alphas = value;
			invalidate();
		}
		
		/**
		 * ratios
		 * 
		 */		
		public function get ratios():Array
		{
			return _ratios;
		}
		
		public function set ratios(value:Array):void
		{
			_ratios = value;
			invalidate();
		}
		
		/**
		 * draw gradient color textField to bitmapData
		 * 
		 */
		override protected function drawText(textField:TextField, matrix:Matrix, bitmapData:BitmapData):void
		{
			if(helpSprite == null)helpSprite = new Sprite();
			var rect:Rectangle = textField.getCharBoundaries( 0 );
			if ( rect == null)
			{
				return;
			}
			
			while(helpSprite.numChildren)
			{
				helpSprite.removeChildAt(0);
			}
			
			//访问numLines textField.filters会被赋值
			var numLine:int = numLines;
			
			helpSprite.filters = textField.filters;
			textField.filters = null;
			
			if(helpMask == null)
			{
				helpMask = new Shape();
				helpMask.x = 0;
				helpMask.y = 0;
			}
			Starling.current.nativeStage.quality = StageQuality.BEST; 
			helpMask.mask = textField;
			helpMask.cacheAsBitmap = true;
			textField.cacheAsBitmap = true;
			helpSprite.addChild(helpMask);
			helpSprite.addChild(textField);
			
			var mtx:Matrix = new Matrix();
//			rect.height  = textHeight;
			helpMask.y = rect.y;
			if(rect.height < 8)
			{
				rect.height  = textField.textHeight - 2;
				helpMask.y = 2;
			}
			rect.height += leading;
			
			for (var i:int=0; i<numLine; i++)
			{
				mtx.createGradientBox( 2, Math.ceil(rect.height), _colorRotation * Math.PI, 0,  Math.ceil(rect.height * i) );
				helpMask.graphics.beginGradientFill(_gradientType, _colors, _alphas, _ratios, mtx, SpreadMethod.PAD );
				helpMask.graphics.drawRect( 0, Math.ceil(rect.height * i), 2, rect.height );
			}
			helpMask.graphics.endFill();
			
			helpMask.width = bitmapData.width;
			
			var drawWithQualityFunc:Function = 
				"drawWithQuality" in bitmapData ? bitmapData["drawWithQuality"] : null;
			
			// Beginning with AIR 3.3, we can force a drawing quality. Since "LOW" produces
			// wrong output oftentimes, we force "MEDIUM" if possible.
			
			if (drawWithQualityFunc is Function)
				drawWithQualityFunc.call(bitmapData, helpSprite, matrix, 
					null, null, null, false, StageQuality.MEDIUM);
			else
				bitmapData.draw(helpSprite, matrix,null,null,null,true);
				
			//clear after complete draw
			textField.cacheAsBitmap = false;
			helpMask.cacheAsBitmap = false;
			helpMask.mask = null;
			helpSprite.filters = null;
			while(helpSprite.numChildren)
			{
				helpSprite.removeChildAt(0);
			}
			helpMask.graphics.clear();
			Starling.current.nativeStage.quality = StageQuality.LOW;
		}

		/**渐变字的贴图不能被压缩*/
		override protected function getTextuerFormat():String
		{
			return "bgra";
		}
	}
}