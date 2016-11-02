//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.cache.event
{
    import flash.events.Event;

    public class CacheEvent extends Event 
    {

        public static const CLEAR_EXPIRED:String = "clear_expired";
        public static const REMOVE_ALL_CACHE:String = "remove_all_cache";

        public function CacheEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }

        override public function clone():Event
        {
            return (new CacheEvent(type, bubbles, cancelable));
        }


    }
}//package org.client.mainCore.cache.event
