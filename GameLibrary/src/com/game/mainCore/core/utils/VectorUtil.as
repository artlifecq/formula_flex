//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.utils
{
    import __AS3__.vec.Vector;

    public class VectorUtil 
    {


        public static function vectorToArray(v:Vector.<Object>):Array
        {
            var arr:Array = [];
            for each (var item in v)
            {
                arr.push(item);
            };
            return (arr);
        }


    }
}//package com.game.mainCore.core.utils
