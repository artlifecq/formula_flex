//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader.events
{
    import flash.events.Event;

    public class XMLEvent extends Event 
    {

        public static const COMPLETE:String = "complete";

        private var _data:XML;

        public function XMLEvent(type:String, data:XML)
        {
            super(type);
            _data = data;
        }

        public function get data():XML
        {
            return (_data);
        }


    }
}//package com.game.mainCore.core.loader.events
