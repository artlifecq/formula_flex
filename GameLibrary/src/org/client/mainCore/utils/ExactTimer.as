package org.client.mainCore.utils
{
    import __AS3__.vec.Vector;
    import flash.utils.getTimer;

    public class ExactTimer 
    {

        public static var isPrint:Boolean = false;
        private static var _timerUpdateList:Vector.<Function> = new Vector.<Function>();
        private static var _timerCmpList:Vector.<Function> = new Vector.<Function>();
        private static var _isCountUpdate:Boolean = false;
        private static var _isCountCmp:Boolean = false;

        public var id:String = "timer";
        protected var _repeatCnt:uint = 0;
        protected var _repeat:uint = 0;
        protected var _lastTm:Number = 0;
        protected var _time:Number = 0;
        protected var _delay:Number = 1000;
        protected var _duration:Number = 0;
        protected var _running:Boolean = false;
        protected var _onUpdate:Function;
        protected var _onComplete:Function;
        protected var _isCmpDestroy:Boolean;
        protected var _onUpdateParams:Array;
        protected var _onCompleteParams:Array;
        private var _startTm:Number = 0;
        private var _passTm:Number = 0;
        private var _timeCnt:uint = 0;

        public function ExactTimer(delay:Number=1000, repeat:uint=0, onUpdate:Function=null, onComplete:Function=null, isCmpDestroy:Boolean=false, onUpdateParams:Array=null, onCompleteParams:Array=null)
        {
            _delay = delay;
            _repeat = repeat;
            _duration = (_delay * _repeat);
            _onUpdate = onUpdate;
            _onComplete = onComplete;
            _isCmpDestroy = isCmpDestroy;
            _onUpdateParams = onUpdateParams;
            _onCompleteParams = onCompleteParams;
        }

        public static function get runningTimerUpdateList():Vector.<Function>
        {
            _isCountUpdate = true;
            return _timerUpdateList;
        }

        public static function get runningTimerCmpList():Vector.<Function>
        {
            _isCountCmp = true;
            return _timerCmpList;
        }


        public function get delay():Number
        {
            return _delay;
        }

        public function set delay(value:Number):void
        {
            _delay = value;
        }

        public function get currentCount():uint
        {
            return _repeatCnt;
        }

        public function set repeatCount(value:uint):void
        {
            _repeat = value;
        }

        public function get repeatCount():uint
        {
            return _repeat;
        }

        public function get duration():Number
        {
            return _duration;
        }

        public function set duration(value:Number):void
        {
            _duration = value;
            if (_delay > 0)
            {
                _repeat = _duration / _delay;
            }
            else
            {
                if (_repeat > 0)
                {
                    _delay = _duration / _repeat;
                }
            }
        }

        public function set onUpdate(value:Function):void
        {
            _onUpdate = value;
        }

        public function set onComplete(value:Function):void
        {
            _onComplete = value;
        }

        public function start():void
        {
            _startTm = getTimer();
            _lastTm = _startTm;
            _timeCnt = 0;
            _running = true;
            Tick.addCallback(onTimerTick);
            var index:int;
            if (_isCountUpdate)
            {
                index = _timerUpdateList.indexOf(_onUpdate);
                if (index == -1 && _onUpdate != null)
                {
                    _timerUpdateList.push(_onUpdate);
                }
            }
            if (_isCountCmp)
            {
                index = _timerCmpList.indexOf(_onComplete);
                if (index == -1 && _onComplete != null)
                {
                    _timerCmpList.push(_onComplete);
                }
            }
        }

        public function stop():void
        {
            _running = false;
            Tick.removeCallback(onTimerTick);
            var index:int = _timerUpdateList.indexOf(_onUpdate);
            if (index != -1)
            {
                _timerUpdateList.splice(index, 1);
            }
            index = _timerCmpList.indexOf(_onComplete);
            if (index != -1)
            {
                _timerCmpList.splice(index, 1);
            }
        }

        public function reset():void
        {
            _timeCnt = 0;
            _time = 0;
            _repeatCnt = 0;
            _passTm = 0;
            _startTm = getTimer();
        }

        public function get running():Boolean
        {
            return _running;
        }

        public function destroy():void
        {
            stop();
            _timeCnt = 0;
            _startTm = 0;
            _repeatCnt = 0;
            _running = false;
            Tick.removeCallback(onTimerTick);
            _onUpdate = null;
            _onComplete = null;
            _onUpdateParams = null;
            _onCompleteParams = null;
        }

        private function onTimerTick(gapTm:uint):void
        {
            var i:int;
            var funTm:int;
            if (gapTm > 10)
            {
            }
            _time = getTimer();
            _passTm = _time - _startTm;
            var cnt:int = (_passTm - (delay * _timeCnt)) / delay;
            i = 0;
            while (i < cnt)
            {
                funTm = getTimer();
                _repeatCnt++;
                _timeCnt++;
                if (_onUpdate != null)
                {
                    if (_onUpdateParams && _onUpdateParams.length)
                    {
                        _onUpdate.apply(null, _onUpdateParams);
                    }
                    else
                    {
                        _onUpdate();
                    }
                    if (isPrint)
                    {
                        trace("计时器函数执行耗时 : ", FunctionUtil.getFunctionName(_onUpdate), getTimer() - funTm);
                    }
                }
                if (_repeatCnt == _repeat)
                {
                    stop();
                    if (_onComplete != null)
                    {
                        if (_onCompleteParams && _onCompleteParams.length)
                        {
                            _onComplete.apply(null, _onCompleteParams);
                        }
                        else
                        {
                            _onComplete();
                        }
                    }
                    if (_isCmpDestroy)
                    {
                        destroy();
                    }
                    return;
                }
                i++;
            }
        }
    }
}