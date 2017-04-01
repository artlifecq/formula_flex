//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.path.linePath2
{
    public class GodPathFinder 
    {

        private var _context:PathContext;
        private var _openList:Array;
        private var _posList:Array;
        private var _costList:Array;
        private var _fatherIdList:Array;
        private var _nodeTable:ByteTable;
        private var _resultHolder:Array;
        private var _openCount:int;
        private var _openId:int;

        public function GodPathFinder()
        {
            _openList = [];
            _posList = [];
            _costList = [];
            _fatherIdList = [];
            _resultHolder = [];
            super();
        }

        private static function getShiftGAndF(f:int, g:int):int
        {
            return (((f << 16) | g));
        }

        private static function extractF(cost:int):int
        {
            return ((cost >>> 16));
        }

        private static function extractG(cost:int):int
        {
            return ((cost & 0xFFFF));
        }

        public static function two2one(x:int, y:int):int
        {
            return (((x << 16) | y));
        }

        public static function getXofOne(k:int):int
        {
            return ((k >>> 16));
        }

        public static function getYofOne(k:int):int
        {
            return ((k & 0xFFFF));
        }


        public function init(maxWidth:int, maxHeight:int):void
        {
            _openList = [];
            _posList = [];
            _costList = [];
            _fatherIdList = [];
            _resultHolder = [];
            _nodeTable = new ByteTable(maxWidth, maxHeight);
        }

        public function clear():void
        {
            _nodeTable.clear();
            _openList = [];
            _posList = [];
            _costList = [];
            _fatherIdList = [];
            _resultHolder = [];
        }

        public function searchPath(startX:int, startY:int, endX:int, endY:int, unlimitedStep:Boolean, context:PathContext):Array
        {
            if (!(context.isWalkable(endX, endY)))
            {
                return (null);
            };
            if (!(context.isWalkable(startX, startY)))
            {
                return (null);
            };
            this._context = context;
            clear();
            var currentId:int;
            var currNoteX:int;
            var currNoteY:int;
            _openCount = 0;
            _openId = -1;
            openNode(startX, startY, 0, 0, 0);
            var k:int;
            var targetPosK:int = two2one(endX, endY);
            while (_openCount > 0)
            {
                currentId = _openList[0];
                k = _posList[currentId];
                if ((k == targetPosK))
                {
                    return (getPath(startX, startY, currentId));
                };
                currNoteX = getXofOne(k);
                currNoteY = getYofOne(k);
                closeNode(currNoteX, currNoteY);
                checkNodeArounds(currNoteX, currNoteY, currentId, endX, endY);
            };
            return (null);
        }

        private function getIndex(index:int):int
        {
            var k:int;
            k = _openList.length;
            while (--k >= 0)
            {
                if ((index == _openList[k]))
                {
                    return ((k + 1));
                };
            };
            return (-1);
        }

        private function checkScore(checkX:int, checkY:int, currentId:int, endX:int, endY:int):void
        {
            var g:int;
            var f:int;
            var realCheckId:int;
            var checkingId:int = _nodeTable.getPos(checkX, checkY);
            if ((checkingId == -1))
            {
                return;
            };
            if ((checkingId == 0))
            {
                g = (getG(currentId) + 1);
                f = ((g + Math.abs((endX - checkX))) + Math.abs((endY - checkY)));
                openNode(checkX, checkY, f, g, currentId);
            }
            else
            {
                realCheckId = ((checkingId & 0xFFFF) - 1);
                g = (getG(currentId) + 1);
                if ((g < getG(realCheckId)))
                {
                    f = ((g + Math.abs((endX - checkX))) + Math.abs((endY - checkY)));
                    _costList[realCheckId] = getShiftGAndF(f, g);
                    _fatherIdList[realCheckId] = currentId;
                    aheadNode(getIndex(realCheckId));
                };
            };
        }

        private function getF(index:int):int
        {
            return (extractF(_costList[_openList[(index - 1)]]));
        }

        private function getG(index:int):int
        {
            return (extractG(_costList[index]));
        }

        private function checkNodeArounds(nodeX:int, nodeY:int, currentId:int, endX:int, endY:int):void
        {
            var surroundingWalkableMask:int = _context.getSurroundWalkableGrid(nodeX, nodeY);
            if (!(((surroundingWalkableMask & 8) == 0)))
            {
                checkScore((nodeX + 1), nodeY, currentId, endX, endY);
            };
            if (!(((surroundingWalkableMask & 4) == 0)))
            {
                checkScore(nodeX, (nodeY + 1), currentId, endX, endY);
            };
            if (!(((surroundingWalkableMask & 2) == 0)))
            {
                checkScore((nodeX - 1), nodeY, currentId, endX, endY);
            };
            if (!(((surroundingWalkableMask & 1) == 0)))
            {
                checkScore(nodeX, (nodeY - 1), currentId, endX, endY);
            };
            if (!(((surroundingWalkableMask & 128) == 0)))
            {
                checkScore((nodeX + 1), (nodeY + 1), currentId, endX, endY);
            };
            if (!(((surroundingWalkableMask & 64) == 0)))
            {
                checkScore((nodeX - 1), (nodeY + 1), currentId, endX, endY);
            };
            if (!(((surroundingWalkableMask & 32) == 0)))
            {
                checkScore((nodeX - 1), (nodeY - 1), currentId, endX, endY);
            };
            if (!(((surroundingWalkableMask & 16) == 0)))
            {
                checkScore((nodeX + 1), (nodeY - 1), currentId, endX, endY);
            };
        }

        private function getPath(startX:int, startY:int, currentId:int):Array
        {
            var cx:int;
            var cy:int;
            var k:int = _posList[currentId];
            var endP:int = two2one(startX, startY);
            _resultHolder.push(k);
            currentId = _fatherIdList[currentId];
            var k1:int = _posList[currentId];
            if (k1 == endP)
            {
                _resultHolder.push(k1);
                return (_resultHolder.reverse());
            };
            var x1:int = getXofOne(k);
            var y1:int = getYofOne(k);
            var x2:int = getXofOne(k1);
            var y2:int = getYofOne(k1);
            currentId = _fatherIdList[currentId];
            k = _posList[currentId];
            while (k != endP)
            {
                cx = getXofOne(k);
                cy = getYofOne(k);
                if (!((((cx - x2) == (x2 - x1))) && (((cy - y2) == (y2 - y1)))))
                {
                    _resultHolder.push(k1);
                };
                currentId = _fatherIdList[currentId];
                k1 = k;
                x1 = x2;
                y1 = y2;
                x2 = cx;
                y2 = cy;
                k = _posList[currentId];
            };
            cx = getXofOne(k);
            cy = getYofOne(k);
            if (!((((cx - x2) == (x2 - x1))) && (((cy - y2) == (y2 - y1)))))
            {
                _resultHolder.push(k1);
            };
            _resultHolder.push(k);
            return (_resultHolder.reverse());
        }

        private function openNode(nodeX:int, nodeY:int, f:int, g:int, fatherId:int):void
        {
            _openCount++;
            _nodeTable.setPos(nodeX, nodeY, (++_openId + 1));
            _posList.push(two2one(nodeX, nodeY));
            _costList.push(getShiftGAndF(f, g));
            _fatherIdList.push(fatherId);
            _openList.push(_openId);
            aheadNode(_openCount);
        }

        private function aheadNode(index:int):void
        {
            while (index > 1)
            {
                if ((getF(index) < getF((index >>> 1))))
                {
                    swap(_openList, (index - 1), ((index >>> 1) - 1));
                    index = (index >> 1);
                }
                else
                {
                    return;
                };
            };
        }

        private function closeNode(nodeX:int, nodeY:int):void
        {
            _openCount--;
            _nodeTable.setPos(nodeX, nodeY, -1);
            if ((_openCount <= 0))
            {
                _openCount = 0;
                _openList = [];
                return;
            };
            _openList[0] = _openList.pop();
            backNode();
        }

        private function swap(arr:Array, x:int, y:int):void
        {
            if ((x == y))
            {
                return;
            };
            var tmp:int = arr[x];
            arr[x] = arr[y];
            arr[y] = tmp;
        }

        private function backNode():void
        {
            var checkIndex:int = 1;
            var tempIndex:int;
            while (true)
            {
                tempIndex = checkIndex;
                if (((tempIndex << 1) <= _openCount))
                {
                    if ((getF(checkIndex) > getF((tempIndex << 1))))
                    {
                        checkIndex = (tempIndex << 1);
                    };
                    if ((((tempIndex << 1) + 1) <= _openCount))
                    {
                        if ((getF(checkIndex) > getF(((tempIndex << 1) + 1))))
                        {
                            checkIndex = ((tempIndex << 1) + 1);
                        };
                    };
                };
                if ((tempIndex == checkIndex))
                {
                    return;
                };
                swap(_openList, (checkIndex - 1), (tempIndex - 1));
            };
        }


    }
}//package com.game.mainCore.core.path.linePath2
