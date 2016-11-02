//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.events.helper
{
    import com.game.mainCore.libCore.events.EventDispatchCenter;
    import flash.events.Event;
    import flash.events.EventDispatcher;

    public class EventListenHelper 
    {

        private static var _eventDispatchCenter:EventDispatchCenter = EventDispatchCenter.getInstance();

        public function EventListenHelper()
        {
            throw (new Event("静态类"));
        }

        public static function addEvent($type:String, $listener:Function, $dispatcher:EventDispatcher=null, $useCapture:Boolean=false, $priority:int=0, $useWeakReference:Boolean=false):void
        {
            var dispatcher:EventDispatcher = (($dispatcher) || (_eventDispatchCenter));
            dispatcher.addEventListener($type, $listener, $useCapture, $priority, $useWeakReference);
        }

        public static function removeEvent($type:String, $listener:Function, $dispatcher:EventDispatcher=null, $useCapture:Boolean=false):void
        {
            var dispatcher:EventDispatcher = (($dispatcher) || (_eventDispatchCenter));
            dispatcher.removeEventListener($type, $listener, $useCapture);
        }

        public static function hasEvent($type:String, $dispatcher:EventDispatcher=null):Boolean
        {
            var dispatcher:EventDispatcher = (($dispatcher) || (_eventDispatchCenter));
            return (dispatcher.hasEventListener($type));
        }

        public static function willTrigger($type:String, $dispatcher:EventDispatcher=null):Boolean
        {
            var dispatcher:EventDispatcher = (($dispatcher) || (_eventDispatchCenter));
            return (dispatcher.willTrigger($type));
        }


    }
}//package com.game.mainCore.core.events.helper
