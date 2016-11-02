//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.path.linePath2
{
    import __AS3__.vec.Vector;

    public class PathContext 
    {

        public static const UP_WALKABLE_MASK:int = 1;
        public static const LEFT_WALKABLE_MASK:int = 2;
        public static const DOWN_WALKABLE_MASK:int = 4;
        public static const RIGHT_WALKABLE_MASK:int = 8;
        public static const UP_RIGHT_WALKABLE_MASK:int = 16;
        public static const UP_LEFT_WALKABLE_MASK:int = 32;
        public static const DOWN_LEFT_WALKABLE_MASK:int = 64;
        public static const DOWN_RIGHT_WALKABLE_MASK:int = 128;

        private var _width:int;
        private var _height:int;
        private var _map:Vector.<Vector.<uint>>;
        private var _surroundingWalkableTable:ByteTable;


        public static function buildSurroundingWalkableTable(context:PathContext):ByteTable
        {
            var x:int;
            var y:int;
            var m:int;
            var upWalkable:Boolean;
            var rightWalkable:Boolean;
            var downWalkable:Boolean;
            var leftWalkable:Boolean;
            var result:ByteTable = new ByteTable(context.getWidth(), context.getHeight());
            x = context.getWidth();
            while (--x >= 0)
            {
                y = context.getHeight();
                while (--y >= 0)
                {
                    m = 0;
                    upWalkable = context.isWalkable(x, (y - 1));
                    if (upWalkable)
                    {
                        m = (m | 1);
                    };
                    rightWalkable = context.isWalkable((x + 1), y);
                    if (rightWalkable)
                    {
                        m = (m | 8);
                    };
                    downWalkable = context.isWalkable(x, (y + 1));
                    if (downWalkable)
                    {
                        m = (m | 4);
                    };
                    leftWalkable = context.isWalkable((x - 1), y);
                    if (leftWalkable)
                    {
                        m = (m | 2);
                    };
                    if (((((upWalkable) && (rightWalkable))) && (context.isWalkable((x + 1), (y - 1)))))
                    {
                        m = (m | 16);
                    };
                    if (((((rightWalkable) && (downWalkable))) && (context.isWalkable((x + 1), (y + 1)))))
                    {
                        m = (m | 128);
                    };
                    if (((((leftWalkable) && (downWalkable))) && (context.isWalkable((x - 1), (y + 1)))))
                    {
                        m = (m | 64);
                    };
                    if (((((leftWalkable) && (upWalkable))) && (context.isWalkable((x - 1), (y - 1)))))
                    {
                        m = (m | 32);
                    };
                    result.setPos(x, y, m);
                };
            };
            return (result);
        }


        public function init(width:int, height:int, map:Vector.<Vector.<uint>>):void
        {
            _width = width;
            _height = height;
            _map = map;
            _surroundingWalkableTable = PathContext.buildSurroundingWalkableTable(this);
        }

        public function isWalkable(x:int, y:int):Boolean
        {
            if ((x < 0))
            {
                return (false);
            };
            if ((x >= _width))
            {
                return (false);
            };
            if ((y < 0))
            {
                return (false);
            };
            if ((y >= _height))
            {
                return (false);
            };
            return ((_map[x][y] == 0));
        }

        public function setWalkable(x:int, y:int, value:Boolean):void
        {
            if ((x < 0))
            {
                return;
            };
            if ((x >= _width))
            {
                return;
            };
            if ((y < 0))
            {
                return;
            };
            if ((y >= _height))
            {
                return;
            };
            var v:uint = ((value) ? (1) : 0);
            _map[x][y] = v;
        }

        public function getWidth():int
        {
            return (_width);
        }

        public function getHeight():int
        {
            return (_height);
        }

        public function getSurroundWalkableGrid(x:int, y:int):int
        {
            return (_surroundingWalkableTable.getPos(x, y));
        }


    }
}//package com.game.mainCore.core.path.linePath2
