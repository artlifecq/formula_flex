//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader.xmlLoader
{
    import flash.events.Event;

    public class XMLLoadEvent extends Event 
    {

        public static const ITEM_COMPLETE:String = "item_complete";
        public static const ALL_COMPLETE:String = "all_complete";
        public static const PROGRESS:String = "progress";
        public static const IOERROR:String = "ioerror";

        private var _data:Object;

        public function XMLLoadEvent(type:String, data:Object=null)
        {
            super(type);
            _data = data;
        }

        public function get data():Object
        {
            return (_data);
        }


    }
}//package com.game.mainCore.core.loader.xmlLoader
