//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.gemo
{
    public class IntDimension 
    {

        private var _width:int = 0;
        private var _height:int = 0;

        public function IntDimension(w:int=0, h:int=0)
        {
            _width = w;
            _height = h;
        }

        public function setSize(dim:IntDimension):void
        {
            _width = dim.width;
            _height = dim.height;
        }

        public function setSizeWH(w:int, h:int):void
        {
            _width = w;
            _height = h;
        }

        public function get width():int
        {
            return (_width);
        }

        public function get height():int
        {
            return (_height);
        }

        public function set width(i:int):void
        {
            _width = i;
        }

        public function set height(i:int):void
        {
            _height = i;
        }


    }
}//package org.client.mainCore.gemo
