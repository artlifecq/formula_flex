package com.game.engine2D.utils
{
	import flash.geom.Point;
	
	public class NumberUtils
	{
		public static function getNextPowerOfTwo(value:uint):uint
		{
			value--;
			value |= value >> 1;
			value |= value >> 2;
			value |= value >> 4;
			value |= value >> 8;
			value |= value >> 16;
			value++;
			return value;
		   /**
			    if (number > 0 && (number & (number - 1)) == 0) // see: http://goo.gl/D9kPj
	            	return number;
		        else
		        {
		            var result:int = 1;
		            while (result < number) result <<= 1;
		            return result;
		        }
			 * */
		}
		
		/**
		 * 返回像素信息 
		 * @param value
		 * @return 
		 * 
		 */		
		public static function getARGB(value:uint):Array
		{
			var vA:Number = 0;
			var vR:Number = 0;
			var vG:Number = 0;
			var vB:Number = 0;
			
			vA = (value >> 24 & 0xFF) / 255.0;
			vR = (value >> 16 & 0xFF) / 255.0;
			vG = (value >> 8 & 0xFF) / 255.0;
			vB = (value >> 0 & 0xFF) / 255.0;
			
			return [vA, vR, vG, vB];
		}
		
		/**
		 *  计算点的旋转缩放
		 * @param point
		 * @param node
		 * @return 旋转缩放后的点
		 */
		public static function getSkewScale(point:Point, scaleX:Number, scaleY:Number, skewX:Number, skewY:Number):Point
		{
			var x:Number = point.x;
			var y:Number = point.y;
			var ppi:Number = Math.PI / 180.0;
			point.x = x * Math.cos(skewY * ppi)*scaleX - y * Math.sin(skewX * ppi)*scaleY;
			point.y = y * Math.cos(skewX * ppi)*scaleY + x * Math.sin(skewY * ppi)*scaleX;
			return point;
		}

	}
}