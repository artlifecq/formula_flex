//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.events
{
    import flash.events.EventDispatcher;

    public class EventDispatchCenter extends EventDispatcher 
    {

        private static var _instance:EventDispatchCenter;

        public function EventDispatchCenter()
        {
            if (_instance != null)
            {
                throw (new Error("单例!"));
            };
        }

        public static function getInstance():EventDispatchCenter
        {
            if (_instance == null)
            {
                _instance = new (EventDispatchCenter)();
            };
            return (_instance);
        }


    }
}//package com.game.mainCore.libCore.events
