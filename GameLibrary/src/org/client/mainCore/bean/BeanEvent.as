package org.client.mainCore.bean
{
    import flash.events.Event;

    public class BeanEvent extends Event 
    {

        public static const OPEN:String = "open";
        public static const COMPLETE:String = "complete";
        public static const PROGRESS:String = "progress";

        private var _current:int;
        private var _total:int;

        public function BeanEvent(type:String, current:int=0, total:int=0)
        {
            super(type);
            _current = current;
            _total = total;
        }

        public function get current():int
        {
            return _current;
        }

        public function get total():int
        {
            return _total;
        }
    }
}