// =================================================================================================
//
//	Starling Framework
//	Copyright Gamua GmbH. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package feathers.utils.filter
{
	import starling.errors.AbstractClassError;
	import starling.filters.ColorMatrixFilter;
	import starling.filters.FragmentFilter;
	
	/** A simple object FilterPool supporting the most basic utility objects.
	 *
	 *  <p>If you want to retrieve an object, but the FilterPool does not contain any more instances,
	 *  it will silently create a new one.</p>
	 *
	 *  <p>It's important that you use the FilterPool in a balanced way, i.e. don't just "get" or "put"
	 *  alone! Always make the calls in pairs; whenever you get an object, be sure to put it back
	 *  later, and the other way round. Otherwise, the FilterPool will empty or (even worse) grow
	 *  in size uncontrolled.</p>
	 * 
	 * @author wewell@163.com
	 */
	public class FilterPool
	{
		/** @private */
		public function FilterPool() { throw new AbstractClassError(); }
		
		
		private static var grayFilters:Vector.<FragmentFilter> = new <FragmentFilter>[];
		
		/** Retrieves a FragmentFilter instance from the grayFiltersPool. */
		public static function getGrayFilter():FragmentFilter
		{
			if (grayFilters.length == 0)
			{
				var v:Number = 0.3;
				var N:Number=10;
				var	data:Array = [v, v, v, 0, N,
					v, v, v, 0, N,
					v, v, v, 0, N,
					0, 0, 0, 1, 0];
				return new starling.filters.ColorMatrixFilter(Vector.<Number>(data));
			}
			else
			{
				var filter:FragmentFilter = grayFilters.pop();
				return filter;
			}
		}
		
		
		/** Stores a FragmentFilter instance in the grayFiltersPool.
		 *  Don't keep any references to the object after moving it to the grayFiltersPool! */
		public static function putGrayFilter(filter:FragmentFilter):void
		{
			if (filter) 
			{
				filter.clearCache();
				grayFilters[grayFilters.length] = filter;
			}
		}
	}
}