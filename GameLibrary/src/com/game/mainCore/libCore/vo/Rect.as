//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.vo
{
    import flash.geom.Rectangle;

    public class Rect extends Rectangle 
    {

        public function Rect(x:int=0, y:int=0, width:int=0, height:int=0)
        {
            super(x, y, width, height);
        }

        public function get area():int
        {
            return ((width * height));
        }

        override public function clone():Rectangle
        {
            return (new Rect(x, y, width, height));
        }


    }
}//package com.game.mainCore.libCore.vo
