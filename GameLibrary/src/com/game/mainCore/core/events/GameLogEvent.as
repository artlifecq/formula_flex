//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.events
{
    import flash.events.Event;

    public class GameLogEvent extends Event 
    {

        private var _data:Object;

        public function GameLogEvent(type:String, data:Object=null)
        {
            super(type, bubbles, cancelable);
            _data = data;
        }

        public function get data():Object
        {
            return (_data);
        }


    }
}//package com.game.mainCore.core.events
