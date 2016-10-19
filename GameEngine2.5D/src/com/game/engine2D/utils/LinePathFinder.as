package com.game.engine2D.utils
{
	import flash.display.Sprite;
	
	public class LinePathFinder extends Sprite
	{
		private static var  REMOVED:int = -1;
		
		
		public function LinePathFinder()
		{
			
		}
		
		public static function searchPath(astarPath:Array,map:Object):Array
		{
			var length :int = astarPath.length;
			var recordMoved:Array = new Array( length );
	        // 先对同一条直线上的点去重，去掉中间的点，只留首尾
	        // 假设有3个点（A，B，C）, 若B与A的横、纵坐标差值分别与C与B的横、纵坐标差值相等则
	        // 判断此三点共线，此时可以删除中间点B
			
			var  p:int = 0;
			
			// 合并共线节点后进行第二步，消除拐点操作。算法流程如下：
			// 如果一个路径由1-10十个节点组成，那么由节点10从1开始检查
			// 节点间是否存在障碍物，若它们之间不存在障碍物，则直接合并
			// 此两路径节点间所有节点。 你真狠……………………敢遍历计算存在不存在直线  10个点  这么复杂的计算 最多可能要计算50次…………………………
			var  paths:Array = new Array();
			var  conerPoint:Array = new Array();
			// 用于保存合并节点后的服务器路径
			var  maxIndex:int = length - 1;
			for (var i:int  = 0; i < maxIndex; i++)
			{
				
				if (recordMoved[i] == REMOVED)
				{
					continue;
				}

				var firstX:int = astarPath[i][0];
				var firstY:int = astarPath[i][1];
				
				var lastX:int  = 0;
				var lastY:int  = 0;
				for (var j:int = maxIndex; j > i; j--)
				{
					
					if ( recordMoved[j] == REMOVED )
					{
						continue;
					}
					
					lastX = astarPath[j][0];;
					lastY = astarPath[j][1];;
					
					// 如果可以消除拐点，则合并pointA，pointB之间的点
					
					if (cleanInflectionPoint(firstX, firstY, lastX, lastY, map))
					{
						for (var k:int  = i + 1; k < j; k++)
						{
							recordMoved[k] = REMOVED;/**如果AB所在直线没有进过障碍物，移除AB间的所有点**/
						}
						i = j - 1;
						break;
					}
				}
				calculatePath(firstX, firstY, lastX, lastY, conerPoint);/**求拐点  存入conerPoint**/

			}
//			for(var n:int = 0; n < conerPoint.length - 1; n++)
//			{
//				findCrossLinePoints(conerPoint[n][0], conerPoint[n][1], conerPoint[n+1][0], conerPoint[n+1][1], paths,  false,  false);
//			}
			return conerPoint;           
		}	     

		
			/**
			 * 将寻路的路径点放入path
			 * params
			 * @author 张圣洁 2014-2-24
			 */	
		private static function calculatePath( firstX:int , firstY:int , lastX:int ,lastY:int ,  paths:Array ):void								
		{
			if(paths.length == 0)
			{
				var eachPoint:Array = new Array(2);/**x,y 2个坐标**/
				eachPoint[0] = firstX;
				eachPoint[1] = firstY;
				paths.push( eachPoint );
			}
			var eachPointL:Array = new Array(2);/**x,y 2个坐标**/
			eachPointL[0] = lastX;
			eachPointL[1] = lastY;
			
			paths.push(eachPointL);
			
		}
				
		/**求两点之间的直线会不会经过障碍物，如果经过返回false**/
		private static function cleanInflectionPoint(firstX:int , firstY:int , lastX:int , lastY:int, map:Object ):Boolean
		{
			var  xDistance :int = Math.abs(lastX - firstX);
			var  yDistance :int = Math.abs(lastY - firstY);
			
			/**确定玩家移动方向，-1反方向**/
			var stepY:int  = lastY > firstY ? 1 : (lastY < firstY ? -1 : 0);
			var stepX:int  = lastX > firstX ? 1 : (lastX < firstX ? -1 : 0);
			
			/**直线垂直于x轴 平行x轴  和直线成45度角的情况特殊处理**/
			// 预先对x坐标、y坐标一致的情况做处理
			if (xDistance == 0 || yDistance == 0 || xDistance == yDistance)
			{
				return processSpecialLine(firstX, firstY, lastX, lastY, xDistance, yDistance, stepX, stepY,map);
			}
			
			// 如果直线倾斜角度大于45°，则每次递增Y来画直线，否则递增X  yDistance > xDistance的情况下直线倾斜角大于45度
			var steep:Boolean  = ( yDistance > xDistance );
			
			if (steep)
			{
				var temp:int  = firstX;
				firstX = firstY;
				firstY = temp;
				
				temp = lastX;
				lastX = lastY;
				lastY = temp;
				
				temp = stepX;
				stepX = stepY;
				stepY = temp;
			}
			
			// 直线方程 y=kx+b x=(y-b)/k
			var k:Number = ((Number) (lastY - firstY)) / (lastX - firstX);
			var b:Number = lastY - k * lastX;
			
			var half:Number = 0.5;
			var currentX:int = firstX + stepX;
			var currentY:int = firstY;
			
			var tempX:int = 0;
			var tempY:int = 0;
			while (currentY != lastY)
			{
				var halfY:Number = currentY + half * stepY;
				var crossX:Number = (halfY - b) / k;
				
				var endX:int = 0;
				var fx:Number = Math.floor(crossX);
				var centerCross:Boolean = crossX - fx == half; //直线等于45度的情况下，centerCross为true
				if (!centerCross)//上面已经判断了45度情况 还需要这个判断？？？？？？？
				{
					endX = int( Math.round(crossX));/**不为45度，crossX四舍五入**/
				} 
				else
				{
					if (stepX > 0)
					{
						endX = int(Math.ceil(crossX));/**直线斜率小于45情况，x方向位移大于y方向上的位移 ，玩家往x轴方向移动，x向上取整**/
					}
					else
					{
						endX = int(fx);/**直线斜率小于45情况，x方向位移大于y方向上的位移 ， 玩家往x轴负方向移动，x向下取整**/
					}
				}
				
				while (currentX != endX)
				{
					tempX = steep ? currentY : currentX;
					tempY = steep ? currentX : currentY;
					if (unwalkable(tempX, tempY ,map))
					{
						return false;
					}
					currentX += stepX;
				}
				
				// 处理endX
				if (!centerCross)
				{
					tempX = steep ? currentY : currentX;
					tempY = steep ? currentX : currentY;
					if (unwalkable(tempX, tempY,map))
					{
						return false;
					}
				}
				
				currentY += stepY;
			}
			
			while (currentX != lastX)
			{
				tempX = steep ? currentY : currentX;
				tempY = steep ? currentX : currentY;
				if (unwalkable(tempX, tempY, map))
				{
					return false;
				}
				currentX += stepX;
			}
			
			// 没有发现不可通过点
			return true;
		}
		
		private static function processSpecialLine(firstX:int,  firstY:int, lastX:int ,lastY:int , xDistance:int ,  yDistance:int, stepX:int , stepY:int ,map:Object):Boolean
		{
				
				// 预先对x坐标、y坐标一致的情况做处理
				if (xDistance == 0)
				{
					var nowY:int = firstY;
					for (var i:int = 1; i < yDistance; i++)
					{
						nowY += stepY;
						if (unwalkable(firstX, nowY, map))
						{
							return false;
						}
					}
					return true;
				}
				
				if (yDistance == 0)
				{
					var nowX:int = firstX;
					for ( i = 1; i < xDistance; i++)
					{
						nowX += stepX;
						if (unwalkable(nowX, firstY,map))
						{
							return false;
						}
					}
					return true;
				}
				
				if (xDistance == yDistance)
				{
					nowX = firstX;
					nowY = firstY;
					for (i = 1; i < xDistance; i++)
					{
						nowX += stepX;
						nowY += stepY;
						if (unwalkable(nowX, nowY,map))
						{
							return false;
						}
					}
					return true;
				}
				
				return false;
			}
		
		private static function unwalkable(x:int, y:int ,map:Object):Boolean
		{
			return map[x][y];
		}
		
		
		/**
		 * 把坐标放入数组
		 * params
		 * @author 张圣洁 2014-2-24
		 */	
		private static function putPointInPath(x:int, y:int,path:Array):void
		{
			var temp:Array = new Array(2);
			temp[0] = x;
			temp[1] = y;
			path.push(temp);
		}
		
		public static function findCrossLinePoints(firstX:int, firstY:int, lastX:int,
			lastY:int, path:Array,  ignoreStart:Boolean,  ignoreEnd:Boolean):void
		{
			var xDistance:int = Math.abs(lastX - firstX);
			var yDistance:int = Math.abs(lastY - firstY);
			var stepY:int = lastY > firstY ? 1 : (lastY < firstY ? -1 : 0);
			var stepX:int = lastX > firstX ? 1 : (lastX < firstX ? -1 : 0);
			
			// 预先对x坐标、y坐标一致的情况做处理
			if (xDistance == 0 || yDistance == 0 || xDistance == yDistance)
			{
				if (!ignoreStart)
				{
					putPointInPath(firstX,firstY,path);
				}
				
				findSpecialLinePoints(firstX, firstY, lastX, lastY, xDistance,
					yDistance, stepX, stepY, path);
				
				if (!ignoreEnd){
					putPointInPath(lastX, lastY, path);
				}
				return;
			}
			
			// 如果直线倾斜角度大于45°，则每次递增Y来画直线，否则递增X
			var steep:Boolean = yDistance > xDistance;
			
			if (steep)
			{
				var temp:int = firstX;
				firstX = firstY;
				firstY = temp;
				
				temp = lastX;
				lastX = lastY;
				lastY = temp;
				
				temp = stepX;
				stepX = stepY;
				stepY = temp;
			}
			
			// 直线方程 y=kx+b x=(y-b)/k
			var k:Number = (Number( lastY - firstY)) / (lastX - firstX);
			var b:Number = lastY - k * lastX;
			
			var half:Number = 0.5;
			var currentX:int = firstX + stepX;
			var currentY:int = firstY;
			
			if (!ignoreStart)
			{
				var tempX:int = steep ? firstY : firstX;
				var tempY:int = steep ? firstX : firstY;
				putPointInPath(tempX, tempY,path);
			}
			
			while (currentY != lastY)
			{
				var halfY:Number = currentY + half * stepY;
				var crossX:Number = (halfY - b) / k;
				
				var endX:int;
				var fx:int = Math.floor(crossX);
				var centerCross :Boolean= crossX - fx == half;
				if (!centerCross)
				{
					endX = int( Math.round(crossX));
				} 
				else
				{
					if (stepX > 0)
					{
						endX = int( Math.ceil(crossX));
					} 
					else
					{
						endX = int (fx);
					}
				}
				
				while (currentX != endX)
				{
					tempX = steep ? currentY : currentX;
					tempY = steep ? currentX : currentY;
					putPointInPath(tempX, tempY, path);
					
					currentX += stepX;
				}
				
				// 处理endX
				if (!centerCross)
				{
					 tempX = steep ? currentY : currentX;
					 tempY = steep ? currentX : currentY;
					putPointInPath(tempX, tempY,path);
				}
				
				currentY += stepY;
			}
			
			while (currentX != lastX)
			{
				 tempX = steep ? currentY : currentX;
				 tempY = steep ? currentX : currentY;
				 putPointInPath(tempX, tempY,path);
				
				currentX += stepX;
			}
			
			if (!ignoreEnd)
			{
				tempX = steep ? lastY : lastX;
				tempY = steep ? lastX : lastY;
				putPointInPath(tempX, tempY,path);
			}
		}

		private static function findSpecialLinePoints( firstX:int, firstY:int ,lastX:int, lastY:int, xDistance:int , yDistance:int, stepX:int ,stepY:int, path:Array):void
		{
				
				// 预先对x坐标、y坐标一致的情况做处理
				var nowX:int = 0;
				var nowY:int = 0;
				var i:int = 0;
				if (xDistance == 0)
				{
					nowY= firstY;
					for (i = 1; i < yDistance; i++)
					{
						nowY += stepY;
						putPointInPath(firstX, nowY,path);
					}
					return;
				}
				
				if (yDistance == 0)
				{
					nowX = firstX;
					for (i = 1; i < xDistance; i++)
					{
						nowX += stepX;
						putPointInPath(nowX, firstY,path);
					}
					return;
				}
				
				if (xDistance == yDistance)
				{
					nowX = firstX;
					nowY = firstY;
					for (i = 1; i < xDistance; i++)
					{
						nowX += stepX;
						nowY += stepY;
						putPointInPath(nowX, nowY, path);
					}
					return;
				}
		}
	}
}