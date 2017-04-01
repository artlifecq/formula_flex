package com.game.mainCore.core.manager
{
    import com.game.mainCore.libCore.timer.TimerData;
    import com.game.mainCore.libCore.timer.TimerHelper;
    
    import flash.events.Event;

    public class TimerManager 
    {

        private static var _timerArr:Array = [];

        public function TimerManager()
        {
            throw new Event("静态类");
        }

        public static function getTimersNum():int
        {
            return _timerArr.length;
        }

        public static function createOneOffTimer($delay:Number, $repeat:Number, $timerHandler:Function, $timerHandlerParameters:Array=null, $timerCompleteHandler:Function=null, $timerCompleteHandlerParameters:Array=null, $autoStart:Boolean=true):void
        {
            TimerHelper.createTimer($delay, $repeat, $timerHandler, $timerHandlerParameters, $timerCompleteHandler, $timerCompleteHandlerParameters, $autoStart);
        }

        public static function createTimer($delay:Number, $repeat:Number, $timerHandler:Function, $timerHandlerParameters:Array=null, $timerCompleteHandler:Function=null, $timerCompleteHandlerParameters:Array=null, $autoStart:Boolean=true):TimerData
        {
            var timerData:TimerData = TimerHelper.createTimer($delay, $repeat, $timerHandler, $timerHandlerParameters, $timerCompleteHandler, $timerCompleteHandlerParameters, $autoStart);
            _timerArr[_timerArr.length] = timerData;
            return timerData;
        }

        public static function createOneOffExactTimer($duration:Number, $from:Number, $to:Number, $onUpdate:Function=null, $onComplete:Function=null, $updateStep:Number=0):void
        {
            TimerHelper.createExactTimer($duration, $from, $to, $onUpdate, $onComplete, $updateStep);
        }

        public static function createExactTimer($duration:Number, $from:Number, $to:Number, $onUpdate:Function=null, $onComplete:Function=null, $updateStep:Number=0):TimerData
        {
            var timerData:TimerData = TimerHelper.createExactTimer($duration, $from, $to, $onUpdate, $onComplete, $updateStep);
            _timerArr[_timerArr.length] = timerData;
            return timerData;
        }

        public static function deleteTimer($timerData:TimerData):void
        {
            var timerData:TimerData = null;
            var index:int;
            for each (timerData in _timerArr)
            {
                if (timerData == $timerData)
                {
                    index = _timerArr.indexOf(timerData);
                    if (index != -1)
                    {
                        _timerArr.splice(index, 1);
                    }
                    timerData.destroy();
                    return;
                }
            }
        }

        public static function deleteAllTimers():void
        {
            var timerData:TimerData = null;
            for each (timerData in _timerArr)
            {
                timerData.destroy();
            }
            _timerArr = [];
        }

        public static function addDelayCallBack($delay:Number, $callBack:Function):void
        {
            TimerHelper.addDelayCallBack($delay, $callBack);
        }

        public static function removeDelayCallBack($callBack:Function):void
        {
            TimerHelper.removeDelayCallBack($callBack);
        }
    }
}