//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.events.helper
{
    import com.game.mainCore.libCore.events.EventDispatchCenter;
    import flash.events.Event;
    import flash.events.EventDispatcher;

    public class EventDispatchHelper 
    {

        private static var _eventDispatchCenter:EventDispatchCenter = EventDispatchCenter.getInstance();

        public function EventDispatchHelper()
        {
            throw (new Event("静态类"));
        }

        public static function dispatchEvent($e:Event, $dispatcher:EventDispatcher=null):void
        {
            var dispatcher:EventDispatcher = (($dispatcher) || (_eventDispatchCenter));
            dispatcher.dispatchEvent($e);
        }


    }
}//package com.game.mainCore.core.events.helper
