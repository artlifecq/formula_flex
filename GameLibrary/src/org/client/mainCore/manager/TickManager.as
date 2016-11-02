//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.manager
{
    import org.client.mainCore.ds.HashSet;
    import flash.utils.setInterval;
    import flash.utils.clearInterval;

    public class TickManager 
    {

        private static var _hashSet:HashSet = new HashSet();
        private static var _interval:Number = 40;
        private static var _id:uint = 0;
        private static var _running:Boolean;


        public static function setup():void
        {
            _id = setInterval(onTick, _interval);
            _running = true;
        }

        public static function set interval(time:Number):void
        {
            _interval = time;
            (clearInterval(_id));
            _running = false;
            setup();
        }

        public static function get interval():Number
        {
            return (_interval);
        }

        public static function get running():Boolean
        {
            return (_running);
        }

        public static function play():void
        {
            if (!_running)
            {
                setup();
            };
        }

        public static function stop():void
        {
            if (_running)
            {
                (clearInterval(_id));
                _running = false;
            };
        }

        public static function getFrameForTime(t:Number):Number
        {
            return ((t / _interval));
        }

        public static function getTimeForFrame(f:Number):Number
        {
            return ((f * _interval));
        }

        public static function addListener(listener:Function):void
        {
            _hashSet.add(listener);
        }

        public static function removeListener(listener:Function):void
        {
            _hashSet.remove(listener);
        }

        public static function hasListener(listener:Function):Boolean
        {
            return (_hashSet.contains(listener));
        }

        private static function onTick():void
        {
            _hashSet.forEach(function (func:Function):void
            {
                _arg1(); //not popped
            });
        }


    }
}//package org.client.mainCore.manager
