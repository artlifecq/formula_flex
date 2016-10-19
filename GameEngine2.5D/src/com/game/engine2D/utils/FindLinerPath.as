package com.game.engine2D.utils
{
	import flash.geom.Point;
	import flash.utils.ByteArray;

	public class FindLinerPath
	{
		public function FindLinerPath()
		{
				
				
		}
		
		
		
		public static function optimizeAstarPoint(aStarArray:Array, map:Object):Array
		{
			var linePoint:Array =  finderLinerPoint( aStarArray );
			var conerPoint:Array = getConerPoint(linePoint);
			var bestPath:Array = findBestPath(aStarArray, linePoint, map, conerPoint);
			return bestPath;
		}
		
		
		
		/**
		 * 找到在同一条直线上的点，比如A B C 三点共线，则去掉中间点B 目的：去掉的点可以不用参与找最佳直线的计算  减少运算量
		 * AB直线斜率与BC直线斜率如果相等  且两条直线还有公共点B  则说明ABC三点共线  因为是用AStar求出来的序列点  ABC一定连续  所以值需要判断AB 横纵坐标的差值 等于 BC 横纵坐标的差值即可
		 * 对点序列ABCDEF  找完ABC 后 找 BCD 继续找 CDE 依次类推
		 * 这个函数可以递归调用，递归次数待实验后决定
		 * params
		 * @author 张圣洁 2014-2-22
		 */	
		private static function finderLinerPoint(aStarAry:Array):Array
		{
			aStarAry.reverse();
			var linerPoint:Array = new Array(aStarAry.length);/**记录哪些点共直线**/
			
			for(var i:int = 0; i < aStarAry.length - 2 ; i++)
			{
				var pointAx:uint = 	aStarAry[i][0];
				var PointAy:uint =  aStarAry[i][1];
				
				var pointBx:uint = 	aStarAry[i + 1][0];
				var PointBy:uint =  aStarAry[i + 1][1];
				
				var pointCx:uint = 	aStarAry[i + 2][0];
				var PointCy:uint =  aStarAry[i + 2][1];
				
				
				if( PointBy - PointAy == PointCy - PointBy && pointBx - pointAx == pointCx - pointBx)
				{
					linerPoint[i] = linerPoint[i]==1 ? 1 : 0;
					linerPoint[i + 1] =  1;
					linerPoint[i + 2] = linerPoint[i + 2]==1 ? 1: 0;
					
				}
			}
			return linerPoint;
		}
		
		/**
		 * 记录拐角点下标
		 * params
		 * @author 张圣洁 2014-2-23
		 */	
		private static function getConerPoint(linerPoint:Array):Array
		{
			var conerPointArray:Array = new Array();
			for(var i:int = 0; i < linerPoint.length; i++)
			{
				if( linerPoint[i] == 0)
				{
					conerPointArray.push(i);
				}
			}
			return 	conerPointArray;
		}
		/**
		 * 开始寻找最佳路径  注意aStarAry里面的点序列是从终点开始到起始点的序列
		 * 从第一个点开始，计算第一个点和倒数第一个点能不能走直线到达，如果不可以，计算第一个点和倒数第二个点，如果可以，路径变为第一个点到倒数第二个点的直线路径点，加上倒数第一个点，
		 * 以此类推……如果第一个点和任何一个点都不存在直线路径，
		 * 继续计算第二个点和倒数第一个点,以此类推……
		 * @author 张圣洁 2014-2-22
		 */	
		private static function findBestPath(aStarAry:Array, linerPoint:Array, map:Object, conerPoint:Array ):Array
		{
			aStarAry.reverse();
			
			/**拷贝aStar数组到bestPath中**/
			var bestPathCopy:ByteArray = new ByteArray();
			bestPathCopy.writeObject(aStarAry);
			bestPathCopy.position = 0;
			var bestPath:Array = bestPathCopy.readObject() as Array;
			
			
			for( var i:int = 0; i < aStarAry.length ; i++ )
			{
				
				if( linerPoint[i] == 1 )
				{
					continue;
				}
				
				var starPointX:int = aStarAry[i][0];
				var starPointY:int = aStarAry[i][1];
				
				for( var j:int = aStarAry.length - 1; j > i; j-- )
				{
					
					if( linerPoint[j] == 1)
					{
						continue;	
					}
					
					var endPointX:int = aStarAry[j][0];
					var endPointY:int = aStarAry[j][1];
					
					/**是否需要找直线路径**/
					if(isNeedFindLine(conerPoint,i,j) == false)
					{
						continue;
					}
					/**判断两点间是否存在直线路径 如果存在返回直线路径**/
					var newPath:Array = findLinePath(starPointX, starPointY, endPointX, endPointY ,map);
					if( newPath.length > 0)
					{
						/**判断最后一个点的坐标是否等于目的点 如果是删除  以免linePath插入aStarAry的时候最后一个点重复**/
						if( endPointX == newPath[newPath.length - 1][0] && endPointY == newPath[newPath.length - 1][1])
						{
							newPath.pop();
						}
						var temp:int = i + 1;
						bestPath.splice(temp, j - i - 1);
						for(var k:uint = 0; k < newPath.length; k++)
						{
							bestPath.splice(temp + k, 0, newPath[k]);
						}
						i = j - 1;
						break;
						
					}
					
				}
			}
			return bestPath;//数组里面可能有重复点
		}
		
		
		/**
		 * 
		 * 判断找直线的两点在conerPointArray是不是相邻，如果相邻说明中间去掉了直线点，不需要重新计算直线
		 * @author 张圣洁 2014-2-23
		 */	
		private static function isNeedFindLine(conerPointArray:Array,i:int,j:int):Boolean
		{
			for(var index:uint = 0; index < conerPointArray.length ; index++)
			{
				if(conerPointArray[index] == i && conerPointArray[index + 1] == j)
				{
					return false;
				}
			}
			return true;/**需要**/
		}
		
		/**
		 * 判断两点间是否存在直线路径
		 * 起始A(ax,ay) 目标B(bx,by) 向量AB为(bx - ax, by - ay)(注意此向量就包含的方向信息， 减的顺序不能颠倒)
		 * 将向量AB标准化成单位向量，((bx - ax)/sqrt((bx - ax)*(bx - ax) + (by - ay)*(by - ay)), (by - ay)/sqrt((bx - ax)*(bx - ax) + (by - ay)*(by - ay))) 
		 * 假设玩家每次移动s距离，则每次沿x轴移动  s*(bx - ax)/sqrt(bx*bx + ax*ax), y轴移动s*(by - ay)/sqrt(bx*bx + ax*ax)
		 * params   
		 * @author 张圣洁 2014-2-22
		 */	
		private static function findLinePath(srcX:uint, srcY:uint, dstX:uint, dstY:uint, map:Object):Array
		{
			/**向量的正负决定方向，下面的变量类型不可以用uint！！！！ **/
			var directionX:int = dstX - srcX;
			var directionY:int = dstY - srcY;
			
			
			var unitX:Number = directionX/Math.sqrt(directionX*directionX + directionY*directionY);
			var unitY:Number = directionY/Math.sqrt(directionX*directionX + directionY*directionY);
			
			var eachMoveX:Number = unitX*1.4;
			var eachMoveY:Number = unitY*1.4;
			
			var linePath:Array = new Array();
			
			
			/**s最好取1.4,玩家可以斜角移动，但是如果单位向量>1 可能出现找到的两个格子路径不连续的情况 所以判断s能不能取1.4**/
			
			if( Math.abs(eachMoveX) > 1.0 || Math.abs(eachMoveY) > 1.0 )
			{
				eachMoveX = unitX*1.0;
				eachMoveY = unitY*1.0;/**s取1**/
				
				
			}
			
			
			
			var curX:Number = Number( srcX );
			var curY:Number = Number( srcY );
			
			var curIntX:uint = srcX;
			var curIntY:uint = srcY;
			
			
			while(isFind(curIntX,curIntY,dstX,dstY) == false)
			{
				
				curX += unitX;
				curY += unitY;
				
				/**坐标值四舍五入**/
				curIntX = uint(curX + 0.5);
				curIntY = uint(curY + 0.5);
				/**判断当前点是不是障碍物**/
				
				if( map[curIntX][curIntY] == 0 )
				{
					
					linePath = putInArray(curIntX,curIntY,linePath);		
					
				}
				else
				{
					linePath.splice(0);
					return linePath;
				}
			}
			return linePath;
		}
		
		/**
		 * 判断直线上的点是否到了目标点
		 * params
		 * @author 张圣洁 2014-2-22
		 */	
		private static function isFind(curX:uint, curY:uint, dstX:uint, dstY:uint):Boolean
		{
			var ro:Array =[[ -1, -1], [0, -1],[ +1, -1], [ +1, 0],[ +1, +1],[0, +1],[ -1, +1],[-1, 0],[0,0]];
			for(var i:int = 0; i < ro.length; i++)
			{
				
				if( dstX + ro[i][0] == curX && dstY + ro[i][1] == curY)
				{
					return true;
					break;
				}
			}
			return false;
		}
		
		/**
		 * 两个坐标值放入数组
		 * params
		 * @author 张圣洁 2014-2-22
		 */	
		private static function putInArray(x:uint, y:uint, array:Array):Array
		{
			var eachPoint:Array = new Array(2);
			eachPoint[0] = x;
			eachPoint[1] = y;
			
			array.push(eachPoint);
			
			return array;
		}
		
		public static function findCrossLinePoints( y1:int, x1:int, y2:int, x2:int, path:Vector.<Point>):void
		{
			var pathpos:uint = path.length;
			var i:int ;               // loop counter 
			var ystep:int;
			var xstep:int;    // the step on y and x axis 
			var error:int;           // the error accumulated during the increment 
			var errorprev:int;       // *vision the previous value of the error variable 
			var y:int = y1;
			var x:int = x1;  // the line points 
			var ddy:int;
			var ddx:int;        // compulsory variables: the double values of dy and dx 
			var dx:int = x2 - x1; 
			var dy:int = y2 - y1; 
			
			putPointInPath(y1,x1,path);
			// NB the last point can't be here, because of its previous point (which has to be verified) 
			if (dy < 0)
			{ 
				ystep = -1; 
				dy = -dy; 
			}
			else 
			{
				ystep = 1; 
			}
			if (dx < 0)
			{ 
				xstep = -1; 
				dx = -dx; 
			}
			else
			{
				xstep = 1;
			}
			
			ddy = 2 * dy;  // work with double values for full precision 
			ddx = 2 * dx; 
			if (ddx >= ddy)
			{  // first octant (0 <= slope <= 1) 
				// compulsory initialization (even for errorprev, needed when dx==dy) 
				errorprev = error = dx;  // start in the middle of the square 
				for (i=0 ; i < dx ; i++)
				{  // do not use the first point (already done) 
					x += xstep; 
					error += ddy; 
					if (error > ddx)
					{  // increment y if AFTER the middle ( > ) 
						y += ystep; 
						error -= ddx; 
						// three cases (octant == right->right-top for directions below): 
						if (error + errorprev < ddx)
						{
							putPointInPath(y-ystep, x, path);
						}// bottom square also 
							
						else if (error + errorprev > ddx)
						{
							putPointInPath(y, x-xstep, path);
						}// left square also 
							
						else
						{  // corner: bottom and left squares also 
							
							putPointInPath(y-ystep, x, path);
							putPointInPath(y, x-xstep, path)
						} 
					}
					putPointInPath(y, x, path)
					errorprev = error; 
				} 
			}
			else
			{  // the same as above 
				errorprev = error = dy; 
				for (i=0 ; i < dy ; i++)
				{ 
					y += ystep; 
					error += ddx; 
					if (error > ddy)
					{ 
						x += xstep; 
						error -= ddy; 
						if (error + errorprev < ddy)
						{
							putPointInPath(y, x-xstep, path);
							
						}
							
						else if (error + errorprev > ddy) 
						{
							putPointInPath(y-ystep, x, path);
						}
							
						else
						{ 
							
							putPointInPath(y, x-xstep, path);
							putPointInPath(y-ystep, x, path);
						} 
					} 
					
					putPointInPath(y, x, path);
					errorprev = error; 
				} 
				
			} 
		}
		
		private static function putPointInPath(y:int, x:int,path:Vector.<Point>):void
		{
			path.push(new Point(x,y));
		}

	}
}