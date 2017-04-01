package com.game.mainCore.core.info.event
{
    import flash.events.EventDispatcher;

    public class EventListenData 
    {

        private var _type:String;
        private var _listener:Function;
        private var _dispatcher:EventDispatcher;
        private var _useCapture:Boolean;
        private var _priority:int;
        private var _useWeakReference:Boolean;

        public function EventListenData($type:String, $listener:Function, $dispatcher:EventDispatcher=null, $useCapture:Boolean=false, $priority:int=0, $useWeakReference:Boolean=false)
        {
            _type = $type;
            _listener = $listener;
            _dispatcher = $dispatcher;
            _useCapture = $useCapture;
            _priority = $priority;
            _useWeakReference = $useWeakReference;
        }

        public function get type():String
        {
            return _type;
        }

        public function get listener():Function
        {
            return _listener;
        }

        public function get dispatcher():EventDispatcher
        {
            return _dispatcher;
        }

        public function get useCapture():Boolean
        {
            return _useCapture;
        }

        public function get priority():int
        {
            return _priority;
        }

        public function get useWeakReference():Boolean
        {
            return _useWeakReference;
        }

        public function equals($type:String, $listener:Function, $dispatcher:EventDispatcher=null, $useCapture:Boolean=false, $priority:int=0, $useWeakReference:Boolean=false):Boolean
        {
            return _type == $type && _listener == $listener && _dispatcher == $dispatcher && _useCapture == $useCapture && _priority == $priority && _useWeakReference == $useWeakReference;
        }
    }
}