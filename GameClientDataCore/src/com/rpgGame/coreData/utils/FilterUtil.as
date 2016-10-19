package com.rpgGame.coreData.utils
{
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	
	import starling.filters.ColorMatrixFilter;
	import starling.filters.FragmentFilter;

	/**
	 * 滤镜util 
	 * @author 
	 * 
	 */	
	public class FilterUtil
	{
		/** 高亮滤镜 **/
		private static var _hightLightFilter:FragmentFilter;
		/** 灰色滤镜 **/
		private static var _grayFilter:FragmentFilter;
		
		public function FilterUtil()
		{
			
		}
		
		/**
		 * 得到高亮滤镜
		 * @return
		 */
		public static function getHightLightFilter():FragmentFilter
		{
			var data:Array;
				data = [1.2, 0, 0, 0, 0,
						0, 1.2, 0, 0, 0,
						0, 0, 1.2, 0, 0,
						0, 0, 0, 1, 0];
				return new starling.filters.ColorMatrixFilter(Vector.<Number>(data));
		}
		
		/**
		 * 得到灰色滤镜
		 * @return
		 */
		public static function getGrayFilter():FragmentFilter
		{
				var	data:Array = [0.3, 0.59, 0.11, 0, 0,
					0.3, 0.59, 0.11, 0, 0,
					0.3, 0.59, 0.11, 0, 0,
					0, 0, 0, 1, 0];
				return new starling.filters.ColorMatrixFilter(Vector.<Number>(data));
		}
		
		
		public static function getRedColorFilter():ColorMatrixFilter
		{
			var matrix:Array = [];
			matrix = matrix.concat([1,0,0,0,0]);// red
			matrix = matrix.concat([0,0,0,0,0]);// green
			matrix = matrix.concat([0,0,0,0,0]);// blue
			matrix = matrix.concat([0,0,0,1,0]);// alpha
			
			var filter:ColorMatrixFilter = new ColorMatrixFilter(Vector.<Number>(matrix));
			return filter;
		}
		
		public static function getGreenColorFilter():ColorMatrixFilter
		{
			var matrix:Array = [];
			matrix = matrix.concat([0,0,0,0,0]);// red
			matrix = matrix.concat([0,1,0,0,0]);// green
			matrix = matrix.concat([0,0,0,0,0]);// blue
			matrix = matrix.concat([0,0,0,1,0]);// alpha
			
			var filter:ColorMatrixFilter = new ColorMatrixFilter(Vector.<Number>(matrix));
			return filter;
		}
		
		public static function getBlueColorFilter():ColorMatrixFilter
		{
			var matrix:Array = [];
			matrix = matrix.concat([0,0,0,0,0]);// red
			matrix = matrix.concat([0,0,0,0,0]);// green
			matrix = matrix.concat([0,0,1,0,0]);// blue
			matrix = matrix.concat([0,0,0,1,0]);// alpha
			
			var filter:ColorMatrixFilter = new ColorMatrixFilter(Vector.<Number>(matrix));
			return filter;
		}
		
		/**
		 * 冰冻 
		 * @return 
		 * 
		 */		
		public static function getFrozenColorFilter():ColorMatrixFilter
		{
			var matrix:Array = [];
			matrix = matrix.concat([0.30,0.30,0,0,0]);// red
			matrix = matrix.concat([0,0.80,0.42,0,0]);// green
			matrix = matrix.concat([0.1,0.5,1,0.1,0]);// blue
			matrix = matrix.concat([0,0,0,1,0]);// alpha
			
			var filter:ColorMatrixFilter = new ColorMatrixFilter(Vector.<Number>(matrix));
			return filter;
		}
	}
}