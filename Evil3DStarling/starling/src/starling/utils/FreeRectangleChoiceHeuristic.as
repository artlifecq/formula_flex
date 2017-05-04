package starling.utils
{
	import flash.geom.Rectangle;

	public class FreeRectangleChoiceHeuristic
	{
		//把一个矩形放在一个自由矩形的短边相对的最合适的位置...
		public static const BestShortSideFit:int = 0; ///< -BSSF: Positions the Rectangle against the short side of a free Rectangle into which it fits the best.
		public static const BestLongSideFit:int = 1; ///< -BLSF: Positions the Rectangle against the long side of a free Rectangle into which it fits the best.
		
		//把一个矩形放在最小的与它匹配的空矩形里面
		public static const BestAreaFit:int = 2; ///< -BAF: Positions the Rectangle into the smallest free Rectangle into which it fits.
		public static const BottomLeftRule:int = 3; ///< -BL: Does the Tetris placement.
	
		//选择的矩形的位置要尽可能多的接触到其他矩形？
		public static const ContactPointRule:int = 4; ///< -CP: Choosest the placement where the Rectangle touches other Rectangles as much as possible.
	
		private static const _areaArr:Array = [1,2,4,8,16,32,64,128,256,512,1024,2048];
		/**
		 * 二分法搜索最小适合的矩形容器
		 * */
		public static function findMinFitBin(rects:Vector.<Rectangle>, 
											  start:uint = 32,
											  rotation:Boolean = false, 
											  method:int = FreeRectangleChoiceHeuristic.BestShortSideFit):MaxRectsBinPack
		{
			var flag:uint = 0;//标记位
			var endIndex:uint = 11;
			var startIndex:uint,moveIndex:uint = 0;
			var maxRectBin:MaxRectsBinPack,minRectBin:MaxRectsBinPack = null;
			
			if (start < 32)start = 32;
			start = startIndex = Math.LOG2E*Math.log(start);
			while(1)
			{
				moveIndex = startIndex + int((endIndex - startIndex)/2.0 + 0.5);
				maxRectBin = findBin(rects, _areaArr[moveIndex], _areaArr[moveIndex], rotation, method);
				if (maxRectBin)
				{
					endIndex = moveIndex;
					flag = ((flag >> moveIndex)|1 << moveIndex) | flag;//标记第moveIndex位为1
				}
				else
				{
					startIndex = moveIndex;
				}
				if (startIndex == endIndex)break;
				if (startIndex + 1 == endIndex )
				{
					var startFlag:Boolean = Boolean(flag >> startIndex & 1);
					var endFlag:Boolean = Boolean(flag >> endIndex & 1);
					moveIndex = startIndex;
					startIndex = _areaArr[startIndex];
					endIndex = _areaArr[endIndex];
					
					if (!startFlag && !endFlag)//0 0 1024-2048,校验2048  
					{
						minRectBin = findBin(rects, startIndex, endIndex, rotation, method);
						if (minRectBin)
							return minRectBin;
						//maxRectBin宽高相等及不用findBin
						if (maxRectBin && maxRectBin.binWidth == endIndex && maxRectBin.binHeight == endIndex)
							return maxRectBin;
						return findBin(rects, endIndex, endIndex, rotation, method);
					}
					else //0 1
					{
						if (start == moveIndex)//搜索后startIndex == start 校验start
						{
							minRectBin = findBin(rects, startIndex, startIndex, rotation, method);
							if (minRectBin)
								return minRectBin;
						}
						minRectBin = findBin(rects, startIndex, endIndex, rotation, method);
						if (minRectBin)
							return minRectBin;
						//maxRectBin宽高相等及不用findBin
						if (maxRectBin && maxRectBin.binWidth == endIndex && maxRectBin.binHeight == endIndex)
							return maxRectBin;
						return findBin(rects, endIndex, endIndex, rotation, method);
					}
					break;
				}
			}
			
			return maxRectBin;
		}
		
		/**固定矩形大小MaxRectsBinPack*/
		public static function findBin(rectsCopy:Vector.<Rectangle>, 
									   binWidth:int, binHeight:int, rotation:Boolean, 
										method:int = FreeRectangleChoiceHeuristic.BestShortSideFit):MaxRectsBinPack
		{
			var maxRectBin:MaxRectsBinPack = new MaxRectsBinPack(binWidth, binHeight, rotation);
			maxRectBin.insert2(rectsCopy.concat(), method);
			if(!checkVector(maxRectBin.usedRectangles)) return null;
			return maxRectBin;
		}
		
		/**
		 *   	检验算法处理后的 结果。
		 *       若存在矩形（图片）宽高为0 代表此图片没地方放置 ，
		 *       则地图太小   不满足。
		 * @param vector:待检验的结果向量，
		 * @return 满足    true 
		 * 				不满足  false
		 * */
		private static function checkVector(vector:Vector.<Rectangle>):Boolean
		{
			for(var i:int = vector.length - 1; i >= 0  ; i--)
			{
				if(vector[i].width == 0 && vector[i].height == 0)  return false;
			}
			return true;
		}
	}
}