//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.events
{
    import flash.events.Event;

    public class BaseEvent extends Event 
    {

        public var action:String;
        public var data:Object;

        public function BaseEvent($type:String, $action:String="", $data:Object=null, $bubbles:Boolean=false, $cancelable:Boolean=false)
        {
            super($type, $bubbles, $cancelable);
            action = $action;
            data = $data;
        }

        override public function clone():Event
        {
            return (new BaseEvent(type, action, data, bubbles, cancelable));
        }

        override public function toString():String
        {
            return ("[BaseEvent]");
        }


    }
}//package com.game.mainCore.libCore.events
