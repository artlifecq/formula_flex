package com.game.mainCore.libCore.handle
{
    import com.greensock.TweenLite;
    
    import __AS3__.vec.Vector;

    public class HandleThread 
    {

        private var _handleDataArr:Vector.<HandleData>;
        private var _handleDataReadyArr:Vector.<HandleData>;
        private var _isRunning:Boolean;
        private var _canRun:Boolean;
        private var _isQueue:Boolean;
        private var _next:HandleData;
        private var _maxLength:uint;

        public function HandleThread($handlerArr:Vector.<HandleData>=null, $isQueue:Boolean=true, $maxLength:uint=0xFFFFFFFF)
        {
            _handleDataArr = (($handlerArr) || (new Vector.<HandleData>()));
            _handleDataReadyArr = new Vector.<HandleData>();
            _isQueue = $isQueue;
            _isRunning = false;
            _canRun = true;
            _next = null;
            _maxLength = $maxLength;
        }

        public static function execute($handler:Function, $parameters:Array=null):*
        {
            if ($handler == null)
            {
                return null;
            }
            return $handler.apply(null, $parameters);
        }


        public function get isRunning():Boolean
        {
            return _isRunning;
        }

        public function getHandlersNum():int
        {
            return _handleDataArr.length;
        }

        public function push($handler:Function, $parameters:Array=null, $delay:Number=0, $doNext:Boolean=true, $autoStart:Boolean=true, $priority:Boolean=false):void
        {
            if (_handleDataArr.length >= _maxLength)
            {
                _handleDataArr.shift();
            }
            var handleData:HandleData = new HandleData($handler, $parameters, $delay, $doNext);
            if ($priority)
            {
                _handleDataArr.unshift(handleData);
            }
            else
            {
                _handleDataArr.push(handleData);
            }
            if (_canRun && $autoStart && !(_isRunning))
            {
                executeNext();
            }
        }

        public function removeAllHandlers():void
        {
            _handleDataArr.length = 0;
            _handleDataReadyArr.length = 0;
            _isRunning = false;
        }

        public function removeHandler($handler:Function):void
        {
            var hData:HandleData = null;
            if ($handler == null)
            {
                return;
            }
            var len:int = _handleDataArr.length;
            while (len-- > 0)
            {
                hData = _handleDataArr[len];
                if (hData.handler == $handler)
                {
                    _handleDataArr.splice(len, 1);
                }
            }
            len = _handleDataReadyArr.length;
            while (len-- > 0)
            {
                hData = _handleDataReadyArr[len];
                if (hData.handler == $handler)
                {
                    _handleDataReadyArr.splice(len, 1);
                }
            }
            if (_handleDataArr.length == 0 && _handleDataReadyArr.length == 0)
            {
                _isRunning = false;
            }
        }

        public function hasHandler($handler:Function):Boolean
        {
            var hData:HandleData = null;
            for each (hData in _handleDataArr)
            {
                if (hData.handler == $handler)
                {
                    return true;
                }
            }
            for each (hData in _handleDataReadyArr)
            {
                if (hData.handler == $handler)
                {
                    return true;
                }
            }
            return false;
        }

        public function start():void
        {
            _canRun = true;
            if (!(_isRunning))
            {
                executeNext();
            }
        }

        public function stop():void
        {
            _canRun = false;
        }

        private function setNotRunning():void
        {
            _isRunning = false;
        }

        private function executeNext():void
        {
            if (!(_canRun))
            {
                _isRunning = false;
                return;
            }
            if ((_handleDataArr.length == 0))
            {
                _isRunning = false;
                return;
            }
            _isRunning = true;
            _next = _isQueue ? _handleDataArr.shift() : _handleDataArr.pop() as HandleData;
            if ((_next.delay > 0))
            {
                addReadyHD(_next);
                TweenLite.delayedCall((_next.delay * 0.001), newHandler);
            }
            else
            {
                execute(_next.handler, _next.parameters);
                _next.doNext ? executeNext() : setNotRunning();
            }
        }

        private function newHandler():void
        {
            if (removeReadyHD(_next))
            {
                execute(_next.handler, _next.parameters);
            }
            return;
            //not popped:
//            ((_next.doNext) ? executeNext() : setNotRunning())
            
        }

        private function addReadyHD($hd:HandleData):void
        {
            if (_handleDataReadyArr.indexOf($hd) != -1)
            {
                return;
            }
            _handleDataReadyArr.push($hd);
        }

        private function removeReadyHD($hd:HandleData):Boolean
        {
            var index:int = _handleDataReadyArr.indexOf($hd);
            if (index != -1)
            {
                _handleDataReadyArr.splice(index, 1);
                return true;
            }
            return false;
        }
    }
}