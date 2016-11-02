//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.path.linePath2
{
    public class ByteTable 
    {

        private var _data:Array;
        private var _width:int = 0;
        private var _height:int = 0;

        public function ByteTable(maxWidth:int, maxHeight:int)
        {
            _data = [];
            super();
            _data.length = (maxWidth * maxHeight);
            _width = maxWidth;
            _height = maxHeight;
        }

        public function setPos(x:int, y:int, m:int):void
        {
            _data[((y * _width) + x)] = m;
        }

        public function getPos(x:int, y:int):int
        {
            return (_data[((y * _width) + x)]);
        }

        public function clear():void
        {
            _data = [];
        }


    }
}//package com.game.mainCore.core.path.linePath2
