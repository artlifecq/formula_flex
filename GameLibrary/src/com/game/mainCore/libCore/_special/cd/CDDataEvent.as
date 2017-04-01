//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore._special.cd
{
    import flash.events.Event;

    public class CDDataEvent extends Event 
    {

        public static const START:String = "CDDataEvent.start";
        public static const UPDATE:String = "CDDataEvent.update";
        public static const COMPLETE:String = "CDDataEvent.complete";
        public static const CLEAR:String = "CDDataEvent.clear";

        private var _cdData:CDData;

        public function CDDataEvent(type:String, $cdData:CDData)
        {
            super(type, bubbles, cancelable);
            _cdData = $cdData;
        }

        public function get cdData():CDData
        {
            return (_cdData);
        }


    }
}//package com.game.mainCore.libCore._special.cd
