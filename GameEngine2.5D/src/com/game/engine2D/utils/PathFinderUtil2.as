package com.game.engine2D.utils
{
	import com.game.mainCore.core.path.linePath2.LinePathFinder;
	import com.game.mainCore.core.path.linePath2.PathContext;
	
	import flash.geom.Point;

	public class PathFinderUtil2
	{
		private static var _godPath:com.game.mainCore.core.path.linePath2.LinePathFinder;
		private static var _path:PathContext;
		
		setup();
		private static function setup():void
		{
			_godPath = new com.game.mainCore.core.path.linePath2.LinePathFinder();
			_path = new PathContext();
		}
		
		/**
		 * 
		 * @param numCols 
		 * @param numRows
		 * @param map
		 * @param type 0四方向 1八方向 2跳棋
		 * 
		 */		
		public static function init(numCols:int, numRows:int,map:Vector.<Vector.<uint>>):void
		{
			_godPath.init(numCols,numRows);
			//
			_path.init(numCols,numRows,map);
		}
		
		public static function setWalkable(cols:int, rows:int, isWalkable:Boolean):void
		{
			_path.setWalkable(cols,rows,isWalkable);
		}
		
		public static function getWalkable(cols:int, rows:int):Boolean
		{
			return _path.isWalkable(cols,rows);
		}
		
		public static function findPath(startX:uint,startY:uint,endX:uint,endY:uint):Array
		{
			var pathArr:Array = _godPath.searchPath(startX,startY,endX,endY,false,_path);
			var path:Array = [];
			for each(var idx:int in pathArr)
			{
				path.push(new Point(idx >> 16, idx & 0xffff));
			}
			return path;
			
		}
	}
}