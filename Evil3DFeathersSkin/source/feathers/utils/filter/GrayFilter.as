package feathers.utils.filter
{
	import flash.utils.Dictionary;
	
	import starling.display.DisplayObject;
	import starling.errors.AbstractClassError;

	/**
	 * starling灰色滤镜 工具
	 * @author wewell@163.com
	 * 
	 */	
	public class GrayFilter
	{
		private static var weekDict:Dictionary = new Dictionary(true);
		/** @private */
		public function GrayFilter() { throw new AbstractClassError(); }
		
		/**
		 *使Starling显示对象变灰 
		 */		
		public static function gray(starlingDisplay:starling.display.DisplayObject):void
		{
			if(starlingDisplay != null)
			{
				starlingDisplay.filter = weekDict[starlingDisplay] ||=  FilterPool.getGrayFilter();
			}
		}
		
		public static function unGray(starlingDisplay:starling.display.DisplayObject):void
		{
			if(starlingDisplay != null)starlingDisplay.filter = null;
		}
		
		public static var grayFilterMatrix:Vector.<Number> = Vector.<Number>(
			[0.3, 0.59, 0.11, 0, 0,
				0.3, 0.59, 0.11, 0, 0,
				0.3, 0.59, 0.11, 0, 0,
				0, 0, 0, 1, 0])
	}
}