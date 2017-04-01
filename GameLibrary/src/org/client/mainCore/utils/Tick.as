package org.client.mainCore.utils
{
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.utils.Dictionary;
    import flash.utils.Timer;
    import flash.utils.getTimer;
    
    import __AS3__.vec.Vector;

    public class Tick 
    {

        private static var _running:Boolean;
        private static var _funList:Vector.<Function> = new Vector.<Function>();
        private static var _funArgsDic:Dictionary = new Dictionary();
        private static var _timer:Timer = new Timer(10);

        {
            setup();
        }


        private static function setup():void
        {
            _timer.addEventListener(TimerEvent.TIMER, onTick, false, 0, true);
        }

        public static function destroy():void
        {
            stop();
            _funList.length = 0;
            _funList = null;
        }

        public static function get running():Boolean
        {
            return _running;
        }

        public static function start():void
        {
            if (!_running)
            {
                _timer.start();
                _running = true;
            }
        }

        public static function stop():void
        {
            if (_running)
            {
                _running = false;
                _timer.stop();
            }
        }

        public static function addCallback(fun:Function, ... arg):void
        {
            if (arg.length)
            {
                _funArgsDic[fun] = arg;
            }
            if (!hasCallback(fun))
            {
                _funList.push(fun);
                start();
            }
        }

        public static function removeCallback(fun:Function):void
        {
            var index:int = _funList.indexOf(fun);
            if (index != -1)
            {
                _funList.splice(index, 1);
            }
            delete _funArgsDic[fun];
            if (cnt == 0)
            {
                stop();
            }
        }

        public static function hasCallback(fun:Function):Boolean
        {
            var index:int = _funList.indexOf(fun);
            return index != -1;
        }

        public static function get allCallBack():Vector.<Function>
        {
            return _funList;
        }

        public static function get cnt():uint
        {
            return _funList.length;
        }

        [Inline]
        private static function onTick(e:Event):void
        {
            var fun:Function = null;
            var args:* = null;
            var i:uint;
            var tm:uint = getTimer();
            var gapTm:uint;
            i = 0;
            while (i < _funList.length)
            {
                gapTm = getTimer() - tm;
                fun = _funList[i];
                args = _funArgsDic[fun];
                if (args)
                {
                    fun.call(null, args, gapTm);
                }
                else
                {
                    fun(gapTm);
                }
                i++;
            }
        }
    }
}