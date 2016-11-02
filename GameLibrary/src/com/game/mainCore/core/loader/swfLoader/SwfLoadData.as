//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader.swfLoader
{
    public class SwfLoadData 
    {

        public var name:String;
        public var path:String;
        public var size:uint;
        public var isCompress:Boolean = false;
        public var data:Object;
        public var completeFun:Function;
        public var decodeFun:Function;
        public var isByte:Boolean = false;
        public var isCurrentDomain:Boolean = true;

        public function SwfLoadData(path:String="", completeFun:Function=null, decodeFun:Function=null, name:String="", isCurrentDomain:Boolean=true)
        {
            this.name = name;
            this.path = path;
            this.completeFun = completeFun;
            this.decodeFun = decodeFun;
            this.isCurrentDomain = isCurrentDomain;
        }

        public function clear():void
        {
            name = null;
            path = null;
            size = 0;
            isCompress = false;
            data = null;
            completeFun = null;
            decodeFun = null;
        }


    }
}//package com.game.mainCore.core.loader.swfLoader
