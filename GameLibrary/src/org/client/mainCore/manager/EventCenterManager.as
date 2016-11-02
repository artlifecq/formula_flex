//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.manager
{
    import flash.events.EventDispatcher;
    import flash.events.Event;

    public class EventCenterManager 
    {

        private static var instance:EventDispatcher;
        private static var isSingle:Boolean = false;

        public function EventCenterManager()
        {
            if (!isSingle)
            {
                throw (new Error("EventsManager为单例模式，不能直接创建"));
            };
        }

        private static function getInstance():EventDispatcher
        {
            if ((instance == null))
            {
                isSingle = true;
                instance = new EventDispatcher();
            };
            isSingle = false;
            return (instance);
        }

        public static function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
        {
            getInstance().addEventListener(type, listener, useCapture, priority, useWeakReference);
        }

        public static function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
        {
            getInstance().removeEventListener(type, listener, useCapture);
        }

        public static function dispatchEvent(event:Event):void
        {
            getInstance().dispatchEvent(event);
        }

        public static function hasEventListener(type:String):Boolean
        {
            return (getInstance().hasEventListener(type));
        }

        public static function willTrigger(type:String):Boolean
        {
            return (getInstance().willTrigger(type));
        }


    }
}//package org.client.mainCore.manager
