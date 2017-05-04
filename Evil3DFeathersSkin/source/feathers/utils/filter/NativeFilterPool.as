package feathers.utils.filter
{
	import flash.filters.BitmapFilterQuality;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	
	import starling.errors.AbstractClassError;

	public class NativeFilterPool
	{
		public function NativeFilterPool() { throw new AbstractClassError(); }
		
		public static var onePixelBlackGlowFilters:Array = [new GlowFilter(0x000000,1,2,2,2,BitmapFilterQuality.LOW)];
		
		public static var onePixelBlackDropDownFilters:Array = [new DropShadowFilter(1, 45, 0, 1, 2, 2, 2)];
	}
}