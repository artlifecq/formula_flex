//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.path.linePath
{
    public class Grid 
    {

        private var _startNode:Node;
        private var _endNode:Node;
        private var _nodes:Array;
        private var _numCols:int;
        private var _numRows:int;
        private var type:int;
        private var _straightCost:Number = 1;
        private var _diagCost:Number = 1.4142135623731;

        public function Grid(numCols:int, numRows:int)
        {
            init(numCols, numRows);
        }

        public function init(numCols:int, numRows:int):void
        {
            var i:int;
            var j:int;
            _numCols = numCols;
            _numRows = numRows;
            _nodes = [];
            i = 0;
            while (i < _numCols)
            {
                _nodes[i] = [];
                j = 0;
                while (j < _numRows)
                {
                    _nodes[i][j] = new Node(i, j);
                    j++;
                };
                i++;
            };
        }

        public function clear():void
        {
            _numCols = 0;
            _numRows = 0;
            if (_nodes)
            {
                _nodes.length = 0;
            };
            _nodes = null;
            _startNode = null;
            _endNode = null;
        }

        public function calculateLinks(type:int=0):void
        {
            var i:int;
            var j:int;
            this.type = type;
            i = 0;
            while (i < _numCols)
            {
                j = 0;
                while (j < _numRows)
                {
                    initNodeLink(_nodes[i][j], type);
                    j++;
                };
                i++;
            };
        }

        public function getType():int
        {
            return (type);
        }

        private function initNodeLink(node:Node, type:int):void
        {
            var i:int;
            var j:int;
            var test = null;
            var test2 = null;
            var cost:Number;
            var startX:int = Math.max(0, (node.x - 1));
            var endX:int = Math.min((numCols - 1), (node.x + 1));
            var startY:int = Math.max(0, (node.y - 1));
            var endY:int = Math.min((numRows - 1), (node.y + 1));
            node.links = [];
            i = startX;
            while (i <= endX)
            {
                j = startY;
                for (;j <= endY;j++)
                {
                    test = getNode(i, j);
                    if (!(((test == node)) || (!(test.walkable))))
                    {
                        if (((((!((type == 2))) && (!((i == node.x))))) && (!((j == node.y)))))
                        {
                            test2 = getNode(node.x, j);
                            if (!test2.walkable) continue;
                            test2 = getNode(i, node.y);
                            if (!test2.walkable) continue;
                        };
                        cost = _straightCost;
                        if (!(((node.x == test.x)) || ((node.y == test.y))))
                        {
                            if (type == 1) continue;
                            if ((((type == 2)) && ((((node.x - test.x) * (node.y - test.y)) == 1)))) continue;
                            if ((type == 2))
                            {
                                cost = _straightCost;
                            }
                            else
                            {
                                cost = _diagCost;
                            };
                        };
                        node.links.push(new Link(test, cost));
                    };
                };
                i++;
            };
        }

        public function getNode(x:int, y:int):Node
        {
            return (_nodes[x][y]);
        }

        public function setEndNode(x:int, y:int):void
        {
            _endNode = _nodes[x][y];
        }

        public function setStartNode(x:int, y:int):void
        {
            _startNode = _nodes[x][y];
        }

        public function setWalkable(x:int, y:int, value:Boolean):void
        {
            _nodes[x][y].walkable = value;
        }

        public function get endNode():Node
        {
            return (_endNode);
        }

        public function get numCols():int
        {
            return (_numCols);
        }

        public function get numRows():int
        {
            return (_numRows);
        }

        public function get startNode():Node
        {
            return (_startNode);
        }


    }
}//package com.game.mainCore.core.path.linePath
