//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.path.linePath
{
    public class Node 
    {

        public var x:int;
        public var y:int;
        public var f:Number;
        public var g:Number;
        public var h:Number;
        public var walkable:Boolean = true;
        public var parent:Node;
        public var version:int = 1;
        public var links:Array;

        public function Node(x:int, y:int)
        {
            this.x = x;
            this.y = y;
        }

        public function toString():String
        {
            return (((("x:" + x) + " y:") + y));
        }


    }
}//package com.game.mainCore.core.path.linePath
