//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader.xmlLoader
{
    public class XMLLoadData 
    {

        public var name:String;
        public var path:String;
        public var size:uint;
        public var isCompress:Boolean = false;
        public var data:XML;
        public var completeFun:Function;
        public var decodeFun:Function;

        public function XMLLoadData(path:String="", completeFun:Function=null, decodeFun:Function=null, name:String="")
        {
            this.name = name;
            this.path = path;
            this.completeFun = completeFun;
            this.decodeFun = decodeFun;
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
}//package com.game.mainCore.core.loader.xmlLoader
