package com.game.engine2D.utils
{
	import com.game.mainCore.core.path.linePath.AStar;
	import com.game.mainCore.core.path.linePath.Grid;
	import com.game.mainCore.core.path.linePath.Node;
	
	import flash.geom.Point;
	import flash.utils.getTimer;

	public class PathFinderUtil
	{
		private static var _grid:Grid = new Grid(0,0);
		private static var _aStar:AStar = new AStar(_grid);
		
		public function PathFinderUtil()
		{
		}
		
		/**
		 * 
		 * @param numCols
		 * @param numRows
		 * @param map
		 * @param type 0四方向 1八方向 2跳棋
		 * 
		 */		
		public static function init(numCols:int, numRows:int,map:Vector.<Vector.<uint>>,type:uint=1):void
		{
			_grid.clear();
			_grid.init(numCols,numRows);
			
			for(var i:uint=0;i<map.length;i++)
			{
				var rowList:Vector.<uint> = map[i];
				for(var j:uint=0;j<rowList.length;j++)
				{
					var walkable:Boolean = !Boolean(rowList[j]);
					_grid.setWalkable(i,j,walkable);
				}
			}
			_grid.calculateLinks(1);
		}
		
		public static function setWalkable(cols:int, rows:int, isWalkable:Boolean):void
		{
			if(cols > _grid.numCols || cols > _grid.numRows)
			{
				_grid.setWalkable(cols,rows,isWalkable);
			}
		}
		
		public static function findPath(startX:uint,startY:uint,endX:uint,endY:uint):Array
		{
			_grid.setStartNode(startX, startY);
			
			_grid.setEndNode(endX, endY);
			
			var fPath:Array;
//			var time:int = getTimer();
			if (_aStar.findPath())
			{
				_aStar.floyd();
				fPath = _aStar.floydPath;
//				time = getTimer() - time;
//				trace("寻路时间 : ",time);
			}
			
			var path:Array = [];
			for each(var node:Node in fPath)
			{
				path.push(new Point(node.x,node.y));
			}
			
			return path;
		}
	}
}