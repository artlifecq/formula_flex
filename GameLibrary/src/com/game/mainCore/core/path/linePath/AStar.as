//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.path.linePath
{
    import flash.geom.Point;

    public class AStar 
    {

        private var _open:BinaryHeap;
        private var _grid:Grid;
        private var _endNode:Node;
        private var _startNode:Node;
        private var _path:Array;
        private var _floydPath:Array;
        public var heuristic:Function;
        private var _straightCost:Number = 1;
        private var _diagCost:Number = 1.4142135623731;
        private var nowversion:int = 1;
        private var TwoOneTwoZero:Number;

        public function AStar(grid:Grid)
        {
            TwoOneTwoZero = (2 * Math.cos((3.14159265358979 / 3)));
            super();
            this._grid = grid;
            heuristic = euclidian2;
        }

        private function justMin(x:Object, y:Object):Boolean
        {
            return ((x.f < y.f));
        }

        public function findPath():Boolean
        {
            _endNode = _grid.endNode;
            nowversion++;
            _startNode = _grid.startNode;
            _open = new BinaryHeap(justMin);
            _startNode.g = 0;
            return (search());
        }

        public function floyd():void
        {
            var vector = null;
            var tempVector = null;
            var i:int;
            var j:int;
            var k:int;
            if ((path == null))
            {
                return;
            };
            _floydPath = path.concat();
            var len:int = _floydPath.length;
            if (len > 2)
            {
                vector = new Node(0, 0);
                tempVector = new Node(0, 0);
                floydVector(vector, _floydPath[(len - 1)], _floydPath[(len - 2)]);
                i = (_floydPath.length - 3);
                while (i >= 0)
                {
                    floydVector(tempVector, _floydPath[(i + 1)], _floydPath[i]);
                    if ((((vector.x == tempVector.x)) && ((vector.y == tempVector.y))))
                    {
                        _floydPath.splice((i + 1), 1);
                    }
                    else
                    {
                        vector.x = tempVector.x;
                        vector.y = tempVector.y;
                    };
                    i--;
                };
            };
            len = _floydPath.length;
            i = (len - 1);
            while (i >= 0)
            {
                j = 0;
                while (j <= (i - 2))
                {
                    if (floydCrossAble(_floydPath[i], _floydPath[j]))
                    {
                        k = (i - 1);
                        while (k > j)
                        {
                            _floydPath.splice(k, 1);
                            k--;
                        };
                        i = j;
                        len = _floydPath.length;
                        break;
                    };
                    j++;
                };
                i--;
            };
        }

        private function floydCrossAble(n1:Node, n2:Node):Boolean
        {
            var i:int;
            var ps:Array = bresenhamNodes(new Point(n1.x, n1.y), new Point(n2.x, n2.y));
            i = (ps.length - 2);
            while (i > 0)
            {
                if ((((((((((ps[i].x >= 0)) && ((ps[i].y >= 0)))) && ((ps[i].x < _grid.numCols)))) && ((ps[i].y < _grid.numRows)))) && (!(_grid.getNode(ps[i].x, ps[i].y).walkable))))
                {
                    return (false);
                };
                i--;
            };
            return (true);
        }

        private function bresenhamNodes(p1:Point, p2:Point):Array
        {
            var temp:int;
            var fy:int;
            var cy:int;
            var steep = (Math.abs((p2.y - p1.y)) > Math.abs((p2.x - p1.x)));
            if (steep)
            {
                temp = p1.x;
                p1.x = p1.y;
                p1.y = temp;
                temp = p2.x;
                p2.x = p2.y;
                p2.y = temp;
            };
            var stepX:int = (((p2.x)>p1.x) ? 1 : (((p2.x)<p1.x) ? -1 : 0));
            var deltay:Number = ((p2.y - p1.y) / Math.abs((p2.x - p1.x)));
            var ret:Array = [];
            var nowX:Number = (p1.x + stepX);
            var nowY:Number = (p1.y + deltay);
            if (steep)
            {
                ret.push(new Point(p1.y, p1.x));
            }
            else
            {
                ret.push(new Point(p1.x, p1.y));
            };
            if (Math.abs((p1.x - p2.x)) == Math.abs((p1.y - p2.y)))
            {
                if ((((p1.x < p2.x)) && ((p1.y < p2.y))))
                {
                    ret.push(new Point(p1.x, (p1.y + 1)), new Point(p2.x, (p2.y - 1)));
                }
                else
                {
                    if ((((p1.x > p2.x)) && ((p1.y > p2.y))))
                    {
                        ret.push(new Point(p1.x, (p1.y - 1)), new Point(p2.x, (p2.y + 1)));
                    }
                    else
                    {
                        if ((((p1.x < p2.x)) && ((p1.y > p2.y))))
                        {
                            ret.push(new Point(p1.x, (p1.y - 1)), new Point(p2.x, (p2.y + 1)));
                        }
                        else
                        {
                            if ((((p1.x > p2.x)) && ((p1.y < p2.y))))
                            {
                                ret.push(new Point(p1.x, (p1.y + 1)), new Point(p2.x, (p2.y - 1)));
                            };
                        };
                    };
                };
            };
            while (nowX != p2.x)
            {
                fy = Math.floor(nowY);
                cy = Math.ceil(nowY);
                if (steep)
                {
                    ret.push(new Point(fy, nowX));
                }
                else
                {
                    ret.push(new Point(nowX, fy));
                };
                if (!((fy == cy)))
                {
                    if (steep)
                    {
                        ret.push(new Point(cy, nowX));
                    }
                    else
                    {
                        ret.push(new Point(nowX, cy));
                    };
                }
                else
                {
                    if (deltay != 0)
                    {
                        if (steep)
                        {
                            ret.push(new Point((cy + 1), nowX));
                            ret.push(new Point((cy - 1), nowX));
                        }
                        else
                        {
                            ret.push(new Point(nowX, (cy + 1)));
                            ret.push(new Point(nowX, (cy - 1)));
                        };
                    };
                };
                nowX = (nowX + stepX);
                nowY = (nowY + deltay);
            };
            if (steep)
            {
                ret.push(new Point(p2.y, p2.x));
            }
            else
            {
                ret.push(new Point(p2.x, p2.y));
            };
            return (ret);
        }

        private function floydVector(target:Node, n1:Node, n2:Node):void
        {
            target.x = (n1.x - n2.x);
            target.y = (n1.y - n2.y);
        }

        public function search():Boolean
        {
            var len:int;
            var i:int;
            var test = null;
            var cost:Number;
            var g:Number;
            var h:Number;
            var f:Number;
            var node:Node = _startNode;
            node.version = nowversion;
            while (node != _endNode)
            {
                len = node.links.length;
                i = 0;
                while (i < len)
                {
                    test = node.links[i].node;
                    cost = node.links[i].cost;
                    g = (node.g + cost);
                    h = heuristic(test);
                    f = (g + h);
                    if ((test.version == nowversion))
                    {
                        if (test.f > f)
                        {
                            test.f = f;
                            test.g = g;
                            test.h = h;
                            test.parent = node;
                        };
                    }
                    else
                    {
                        test.f = f;
                        test.g = g;
                        test.h = h;
                        test.parent = node;
                        _open.ins(test);
                        test.version = nowversion;
                    };
                    i++;
                };
                if (_open.a.length == 1)
                {
                    return (false);
                };
                node = (_open.pop() as Node);
            };
            buildPath();
            return (true);
        }

        private function buildPath():void
        {
            _path = [];
            var node:Node = _endNode;
            _path.push(node);
            while (node != _startNode)
            {
                node = node.parent;
                _path.unshift(node);
            };
        }

        public function get path():Array
        {
            return (_path);
        }

        public function get floydPath():Array
        {
            return (_floydPath);
        }

        public function manhattan(node:Node):Number
        {
            return ((Math.abs((node.x - _endNode.x)) + Math.abs((node.y - _endNode.y))));
        }

        public function manhattan2(node:Node):Number
        {
            var dx:Number = Math.abs((node.x - _endNode.x));
            var dy:Number = Math.abs((node.y - _endNode.y));
            return (((dx + dy) + (Math.abs((dx - dy)) / 1000)));
        }

        public function euclidian(node:Node):Number
        {
            var dx:Number = (node.x - _endNode.x);
            var dy:Number = (node.y - _endNode.y);
            return (Math.sqrt(((dx * dx) + (dy * dy))));
        }

        public function chineseCheckersEuclidian2(node:Node):Number
        {
            var y:int = (node.y / TwoOneTwoZero);
            var x:int = (node.x + (node.y / 2));
            var dx:Number = ((x - _endNode.x) - (_endNode.y / 2));
            var dy:Number = (y - (_endNode.y / TwoOneTwoZero));
            return (sqrt(((dx * dx) + (dy * dy))));
        }

        private function sqrt(x:Number):Number
        {
            return (Math.sqrt(x));
        }

        public function euclidian2(node:Node):Number
        {
            var dx:Number = (node.x - _endNode.x);
            var dy:Number = (node.y - _endNode.y);
            return (((dx * dx) + (dy * dy)));
        }

        public function diagonal(node:Node):Number
        {
            var dx:Number = Math.abs((node.x - _endNode.x));
            var dy:Number = Math.abs((node.y - _endNode.y));
            var diag:Number = Math.min(dx, dy);
            var straight:Number = (dx + dy);
            return (((_diagCost * diag) + (_straightCost * (straight - (2 * diag)))));
        }


    }
}//package com.game.mainCore.core.path.linePath
