//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.path.linePath2
{
    public class LinePathFinder 
    {

        private static const REMOVED:int = -1;

        private var astarPathFinder:GodPathFinder;
        private var context:PathContext;

        public function LinePathFinder()
        {
            astarPathFinder = new GodPathFinder();
        }

        private static function getHighShort(x:int):int
        {
            return ((x >> 16));
        }

        private static function getLowShort(x:int):int
        {
            return ((x & 0xFFFF));
        }

        private static function short2Int(x:int, y:int):int
        {
            return (((x << 16) + y));
        }

        private static function calculatePath(firstX:int, firstY:int, lastX:int, lastY:int, paths:Array):void
        {
            if ((paths.length == 0))
            {
                paths.push(short2Int(firstX, firstY));
            };
            paths.push(short2Int(lastX, lastY));
        }

        public static function findCrossLinePoints(firstX:int, firstY:int, lastX:int, lastY:int, path:Array, ignoreStart:Boolean, ignoreEnd:Boolean):void
        {
            var temp:int;
            var tempX:int;
            var tempY:int;
            var halfY:Number;
            var crossX:Number;
            var endX:int;
            var fx:Number;
            var centerCross:Boolean;
            var xDistance:int = Math.abs((lastX - firstX));
            var yDistance:int = Math.abs((lastY - firstY));
            var stepY:int = (((lastY)>firstY) ? 1 : (((lastY)<firstY) ? -1 : 0));
            var stepX:int = (((lastX)>firstX) ? 1 : (((lastX)<firstX) ? -1 : 0));
            if ((((((xDistance == 0)) || ((yDistance == 0)))) || ((xDistance == yDistance))))
            {
                if (!(ignoreStart))
                {
                    path.push(short2Int(firstX, firstY));
                };
                findSpecialLinePoints(firstX, firstY, lastX, lastY, xDistance, yDistance, stepX, stepY, path);
                if (!(ignoreEnd))
                {
                    path.push(short2Int(lastX, lastY));
                };
                return;
            };
            var steep = (yDistance > xDistance);
            if (steep)
            {
                temp = firstX;
                firstX = firstY;
                firstY = temp;
                temp = lastX;
                lastX = lastY;
                lastY = temp;
                temp = stepX;
                stepX = stepY;
                stepY = temp;
            };
            var k:Number = ((lastY - firstY) / (lastX - firstX));
            var b:Number = (lastY - (k * lastX));
            var half = 0.5;
            var currentX:int = (firstX + stepX);
            var currentY = firstY;
            if (!(ignoreStart))
            {
                tempX = ((steep) ? firstY : firstX);
                tempY = ((steep) ? firstX : firstY);
                path.push(short2Int(tempX, tempY));
            };
            while (currentY != lastY)
            {
                halfY = (currentY + (half * stepY));
                crossX = ((halfY - b) / k);
                fx = Math.floor(crossX);
                centerCross = ((crossX - fx) == half);
                if (!(centerCross))
                {
                    endX = Math.round(crossX);
                }
                else
                {
                    if ((stepX > 0))
                    {
                        endX = Math.ceil(crossX);
                    }
                    else
                    {
                        endX = fx;
                    };
                };
                while (currentX != endX)
                {
                    tempX = ((steep) ? currentY : currentX);
                    tempY = ((steep) ? currentX : currentY);
                    path.push(short2Int(tempX, tempY));
                    currentX = (currentX + stepX);
                };
                if (!(centerCross))
                {
                    tempX = ((steep) ? currentY : currentX);
                    tempY = ((steep) ? currentX : currentY);
                    path.push(short2Int(tempX, tempY));
                };
                currentY = (currentY + stepY);
            };
            while (currentX != lastX)
            {
                tempX = ((steep) ? currentY : currentX);
                tempY = ((steep) ? currentX : currentY);
                path.push(short2Int(tempX, tempY));
                currentX = (currentX + stepX);
            };
            if (!ignoreEnd)
            {
                tempX = ((steep) ? lastY : lastX);
                tempY = ((steep) ? lastX : lastY);
                path.push(short2Int(tempX, tempY));
            };
        }

        private static function findSpecialLinePoints(firstX:int, firstY:int, lastX:int, lastY:int, xDistance:int, yDistance:int, stepX:int, stepY:int, path:Array):void
        {
            var nowX:int;
            var nowY:int;
            var i:int;
            if ((xDistance == 0))
            {
                nowY = firstY;
                i = 1;
                while (i < yDistance)
                {
                    nowY = (nowY + stepY);
                    path.push(short2Int(firstX, nowY));
                    i++;
                };
                return;
            };
            if ((yDistance == 0))
            {
                nowX = firstX;
                i = 1;
                while (i < xDistance)
                {
                    nowX = (nowX + stepX);
                    path.push(short2Int(nowX, firstY));
                    i++;
                };
                return;
            };
            if ((xDistance == yDistance))
            {
                nowX = firstX;
                nowY = firstY;
                i = 1;
                while (i < xDistance)
                {
                    nowX = (nowX + stepX);
                    nowY = (nowY + stepY);
                    path.push(short2Int(nowX, nowY));
                    i++;
                };
                return;
            };
        }


        public function init(maxWidth:int, maxHeight:int):void
        {
            astarPathFinder.init(maxWidth, maxHeight);
        }

        public function searchPath(startX:int, startY:int, endX:int, endY:int, unlimitedStep:Boolean, context:PathContext):Array
        {
            var astarPath:Array = astarPathFinder.searchPath(startX, startY, endX, endY, unlimitedStep, context);
            if ((astarPath == null))
            {
                return (null);
            };
            this.context = context;
            return (searchPath1(astarPath));
        }

        private function searchPath1(astarPath:Array):Array
        {
            var i:int;
            var firstX:int;
            var firstY:int;
            var lastX:int;
            var lastY:int;
            var j:int;
            var k:int;
            var length:int = astarPath.length;
            var p:int;
            var paths:Array = [];
            var maxIndex:int = (length - 1);
            i = 0;
            while (i < maxIndex)
            {
                p = astarPath[i];
                if (!(p == -1))
                {
                    firstX = getHighShort(p);
                    firstY = getLowShort(p);
                    lastX = 0;
                    lastY = 0;
                    j = maxIndex;
                    while (j > i)
                    {
                        p = astarPath[j];
                        if (!(p == -1))
                        {
                            lastX = getHighShort(p);
                            lastY = getLowShort(p);
                            if (cleanInflectionPoint(firstX, firstY, lastX, lastY))
                            {
                                k = (i + 1);
                                while (k < j)
                                {
                                    astarPath[k] = -1;
                                    k++;
                                };
                                i = (j - 1);
                                break;
                            };
                        };
                        j--;
                    };
                    calculatePath(firstX, firstY, lastX, lastY, paths);
                };
                i++;
            };
            return (paths);
        }

        private function cleanInflectionPoint(firstX:int, firstY:int, lastX:int, lastY:int):Boolean
        {
            var temp:int;
            var halfY:Number;
            var crossX:Number;
            var endX:int;
            var fx:Number;
            var centerCross:Boolean;
            var tempX:int;
            var tempY:int;
            var xDistance:int = Math.abs((lastX - firstX));
            var yDistance:int = Math.abs((lastY - firstY));
            var stepY:int = (((lastY)>firstY) ? 1 : (((lastY)<firstY) ? -1 : 0));
            var stepX:int = (((lastX)>firstX) ? 1 : (((lastX)<firstX) ? -1 : 0));
            if ((((((xDistance == 0)) || ((yDistance == 0)))) || ((xDistance == yDistance))))
            {
                return (processSpecialLine(firstX, firstY, lastX, lastY, xDistance, yDistance, stepX, stepY));
            };
            var steep = (yDistance > xDistance);
            if (steep)
            {
                temp = firstX;
                firstX = firstY;
                firstY = temp;
                temp = lastX;
                lastX = lastY;
                lastY = temp;
                temp = stepX;
                stepX = stepY;
                stepY = temp;
            };
            var k:Number = ((lastY - firstY) / (lastX - firstX));
            var b:Number = (lastY - (k * lastX));
            var half = 0.5;
            var currentX:int = (firstX + stepX);
            var currentY = firstY;
            while (currentY != lastY)
            {
                halfY = (currentY + (half * stepY));
                crossX = ((halfY - b) / k);
                fx = Math.floor(crossX);
                centerCross = ((crossX - fx) == half);
                if (!(centerCross))
                {
                    endX = Math.round(crossX);
                }
                else
                {
                    if ((stepX > 0))
                    {
                        endX = Math.ceil(crossX);
                    }
                    else
                    {
                        endX = fx;
                    };
                };
                while (currentX != endX)
                {
                    tempX = ((steep) ? currentY : currentX);
                    tempY = ((steep) ? currentX : currentY);
                    if (unwalkable(tempX, tempY))
                    {
                        return (false);
                    };
                    currentX = (currentX + stepX);
                };
                if (!(centerCross))
                {
                    tempX = ((steep) ? currentY : currentX);
                    tempY = ((steep) ? currentX : currentY);
                    if (unwalkable(tempX, tempY))
                    {
                        return (false);
                    };
                };
                currentY = (currentY + stepY);
            };
            while (currentX != lastX)
            {
                tempX = ((steep) ? currentY : currentX);
                tempY = ((steep) ? currentX : currentY);
                if (unwalkable(tempX, tempY))
                {
                    return (false);
                };
                currentX = (currentX + stepX);
            };
            return (true);
        }

        private function processSpecialLine(firstX:int, firstY:int, lastX:int, lastY:int, xDistance:int, yDistance:int, stepX:int, stepY:int):Boolean
        {
            var nowX:int;
            var nowY:int;
            var i:int;
            if ((xDistance == 0))
            {
                nowY = firstY;
                i = 1;
                while (i < yDistance)
                {
                    nowY = (nowY + stepY);
                    if (unwalkable(firstX, nowY))
                    {
                        return (false);
                    };
                    i++;
                };
                return (true);
            };
            if (yDistance == 0)
            {
                nowX = firstX;
                i = 1;
                while (i < xDistance)
                {
                    nowX = (nowX + stepX);
                    if (unwalkable(nowX, firstY))
                    {
                        return (false);
                    };
                    i++;
                };
                return (true);
            };
            if (xDistance == yDistance)
            {
                nowX = firstX;
                nowY = firstY;
                i = 1;
                while (i < xDistance)
                {
                    nowX = (nowX + stepX);
                    nowY = (nowY + stepY);
                    if (unwalkable(nowX, nowY))
                    {
                        return (false);
                    };
                    i++;
                };
                return (true);
            };
            return (false);
        }

        private function unwalkable(x:int, y:int):Boolean
        {
            return (!(context.isWalkable(x, y)));
        }


    }
}//package com.game.mainCore.core.path.linePath2
