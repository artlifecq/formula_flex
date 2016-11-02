//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.cache
{
    public class SequenceInfo 
    {

        public var width:int;
        public var height:int;
        public var frames:uint;
        public var offsetX:int;
        public var offsetY:int;
        public var cutWidth:int;
        public var cutHeight:int;
        public var valids:Array;


        public function copy():SequenceInfo
        {
            var info:SequenceInfo = new SequenceInfo();
            info.width = width;
            info.height = height;
            info.frames = frames;
            info.offsetX = offsetX;
            info.offsetY = offsetY;
            info.cutWidth = cutWidth;
            info.cutHeight = cutHeight;
            info.valids = valids;
            return (info);
        }


    }
}//package com.game.mainCore.core.cache
