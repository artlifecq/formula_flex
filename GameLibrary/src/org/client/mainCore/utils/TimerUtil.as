//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.utils.setTimeout;
    import flash.utils.clearTimeout;
    import flash.utils.setInterval;
    import flash.utils.clearInterval;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class TimerUtil 
    {


        public static function clearAllTimer():void
        {
            clearAllTimeout();
            clearAllInterval();
        }

        public static function clearAllTimeout():void
        {
            var timeoutNum:uint = setTimeout(function ():void
            {
                timeoutNum = setTimeout(function ():void
                {
                }, 0);
                var i:uint = 1;
                while (i <= timeoutNum)
                {
                    (clearTimeout(i));
                    i++;
                };
            }, 0);
        }

        public static function clearAllInterval():void
        {
            var timeoutNum:uint = setInterval(function ():void
            {
                timeoutNum = setInterval(function ():void
                {
                }, 0);
                var i:uint = 1;
                while (i <= timeoutNum)
                {
                    (clearInterval(i));
                    i++;
                };
            }, 0);
        }

        public static function setGTimeout(closure:Function, delay:Number, ... vars):Timer
        {
            return (getTimerInstance(closure, delay, 1, vars));
        }

        public static function clearGTimeout(timer:Timer):void
        {
            if (timer)
            {
                timer.stop();
                timer = null;
            };
        }

        public static function setGInterval(closure:Function, delay:*, ... vars):Timer
        {
            var num:int;
            var ta = null;
            if ((((delay as String)) && ((delay.indexOf(":") > -1))))
            {
                ta = delay.split(":");
                num = ta[1];
                delay = ta[0];
            }
            else
            {
                num = 0;
            };
            return (getTimerInstance(closure, delay, num, vars));
        }

        public static function clearGInterval(timer:Timer):void
        {
            if (timer)
            {
                timer.stop();
                timer = null;
            };
        }

        private static function getTimerInstance(closure:Function, delay:Number, num:uint, vars:*):Timer
        {
            closure = closure;
            delay = delay;
            num = num;
            vars = vars;
            var tempTimer:Timer = new Timer(delay, num);
            tempTimer.addEventListener("timer", function (E:TimerEvent):void
            {
                if ((_arg1.currentTarget.currentCount == _arg1.currentTarget.repeatCount))
                {
                    tempTimer.removeEventListener("timerComplete", arguments.callee);
                    clearGTimeout(tempTimer);
                };
                if ((vars.length > 0))
                {
                    closure.apply(this, vars);
                }
                else
                {
                    (closure());
                };
            });
            tempTimer.start();
            return (tempTimer);
        }


    }
}//package org.client.mainCore.utils
