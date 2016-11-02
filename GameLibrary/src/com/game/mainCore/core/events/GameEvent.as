//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.events
{
    import flash.events.Event;

    public class GameEvent extends Event 
    {

        public static const RESIZE:String = "resize";
        public static const EXIT_FRAME:String = "exitFrame";
        public static const FRAME_CONSTRUCTED:String = "frameConstructed";

        private var _data:Object;

        public function GameEvent(type:String, data:Object=null)
        {
            super(type);
            _data = data;
        }

        public function get data():Object
        {
            return (_data);
        }


    }
}//package com.game.mainCore.core.events
