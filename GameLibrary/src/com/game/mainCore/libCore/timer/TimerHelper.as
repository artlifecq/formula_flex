//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.timer
{
    import org.client.mainCore.ds.HashMap;
    import flash.events.Event;
    import com.game.mainCore.libCore.handle.HandleThread;
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    import gs.TweenLite;
    import gs.easing.Linear;
    import flash.utils.getTimer;
    import org.client.mainCore.utils.Tick;

    public class TimerHelper 
    {

        private static var delayCallBackMap:HashMap = new HashMap();

        public function TimerHelper()
        {
            throw (new Event("静态类"));
        }

        public static function createTimer($delay:Number, $repeat:int, $timerHandler:Function, $timerHandlerParameters:Array=null, $timerCompleteHandler:Function=null, $timerCompleteHandlerParameters:Array=null, $autoStart:Boolean=true):TimerData
        {
            $delay = $delay;
            $repeat = $repeat;
            $timerHandler = $timerHandler;
            $timerHandlerParameters = $timerHandlerParameters;
            $timerCompleteHandler = $timerCompleteHandler;
            $timerCompleteHandlerParameters = $timerCompleteHandlerParameters;
            $autoStart = $autoStart;
            timerHandler = function (e:TimerEvent):void
            {
                HandleThread.execute($timerHandler, $timerHandlerParameters);
            };
            timerCompleteHandler = function (e:TimerEvent):void
            {
                (destroy());
                HandleThread.execute($timerCompleteHandler, $timerCompleteHandlerParameters);
            };
            destroy = function ():void
            {
                if (timer)
                {
                    timer.stop();
                    timer.removeEventListener("timer", timerHandler);
                    timer.removeEventListener("timerComplete", timerCompleteHandler);
                    timer = null;
                };
            };
            var timer:Timer = new Timer($delay, $repeat);
            if (!(($timerHandler == null)))
            {
                timer.addEventListener("timer", timerHandler);
            };
            if (!(($timerCompleteHandler == null)))
            {
                timer.addEventListener("timerComplete", timerCompleteHandler);
            };
            if ($autoStart)
            {
                timer.start();
            };
            return (new TimerData(timer, destroy));
        }

        public static function createExactTimer($duration:int, $from:Number, $to:Number, $onUpdate:Function=null, $onComplete:Function=null, $updateStep:Number=0):TimerData
        {
            $duration = $duration;
            $from = $from;
            $to = $to;
            $onUpdate = $onUpdate;
            $onComplete = $onComplete;
            $updateStep = $updateStep;
            onUpdate1 = function ():void
            {
                if ((Math.abs((obj.i - i)) >= absUpdateStep))
                {
                    i = obj.i;
                    if (!(($onUpdate == null)))
                    {
                        ($onUpdate(obj.i));
                    };
                };
            };
            onUpdate2 = function ():void
            {
                if (!(($onUpdate == null)))
                {
                    ($onUpdate(obj.i));
                };
            };
            onComplete = function ():void
            {
                if (!(($onUpdate == null)))
                {
                    ($onUpdate(obj.i));
                };
                if (!(($onComplete == null)))
                {
                    ($onComplete());
                };
            };
            destroy = function ():void
            {
                TweenLite.killTweensOf(obj);
            };
            var obj:Object = {"i":$from};
            var onUpdate:Function = ((($updateStep)!=0) ? onUpdate1 : onUpdate2);
            TweenLite.to(obj, ($duration / 1000), {
                "i":$to,
                "onUpdate":onUpdate,
                "onComplete":onComplete,
                "ease":Linear.easeNone
            });
            var i:Number = $from;
            var absUpdateStep:Number = Math.abs($updateStep);
            return (new TimerData(null, destroy));
        }

        public static function addDelayCallBack($delay:Number, $callBack:Function):void
        {
            if (($delay <= 0))
            {
                ($callBack());
                return;
            };
            var delayData:Array = [$delay, $callBack, getTimer()];
            delayCallBackMap.add($callBack, delayData);
            if ((delayCallBackMap.length == 1))
            {
                Tick.addCallback(updateDelayCallBack);
            };
        }

        public static function removeDelayCallBack($callBack:Function):void
        {
            delayCallBackMap.remove($callBack);
            if ((delayCallBackMap.length == 0))
            {
                Tick.removeCallback(updateDelayCallBack);
            };
        }

        private static function updateDelayCallBack(gapTm:uint):void
        {
            var i:int;
            var delayData = null;
            var delay:int;
            var callBack = null;
            var addTime:int;
            var nowTime:int = getTimer();
            var arr:Array = delayCallBackMap.getValues();
            i = 0;
            while (i < arr.length)
            {
                delayData = arr[i];
                delay = delayData[0];
                callBack = delayData[1];
                addTime = delayData[2];
                if (((nowTime - addTime) >= delay))
                {
                    removeDelayCallBack(callBack);
                    (callBack());
                };
                i++;
            };
        }


    }
}//package com.game.mainCore.libCore.timer
