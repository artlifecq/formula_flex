//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    public class LazyTimer 
    {

        public var time:Number;
        public var loops:uint;
        public var paused:Boolean;
        public var finished:Boolean;
        public var _callback:Function;
        public var _timeCounter:Number;
        public var _loopsCounter:uint;

        public function LazyTimer()
        {
            time = 0;
            loops = 0;
            _callback = null;
            _timeCounter = 0;
            _loopsCounter = 0;
            paused = false;
            finished = false;
        }

        public function destroy():void
        {
            stop();
            _callback = null;
        }

        public function update():void
        {
            _timeCounter = (_timeCounter + 1);
            while ((((((_timeCounter >= time)) && (!(paused)))) && (!(finished))))
            {
                _timeCounter = (_timeCounter - time);
                _loopsCounter++;
                if ((((loops > 0)) && ((_loopsCounter >= loops))))
                {
                    stop();
                };
                if (!((_callback == null)))
                {
                    (_callback(this));
                };
            };
        }

        public function start(time:Number=1, loops:uint=1, callback:Function=null):LazyTimer
        {
            if (paused)
            {
                paused = false;
                return (this);
            };
            paused = false;
            finished = false;
            this.time = time;
            this.loops = loops;
            _callback = callback;
            _timeCounter = 0;
            _loopsCounter = 0;
            return (this);
        }

        public function stop():void
        {
            finished = true;
        }

        public function get timeLeft():Number
        {
            return ((time - _timeCounter));
        }

        public function get loopsLeft():int
        {
            return ((loops - _loopsCounter));
        }

        public function get progress():Number
        {
            if ((time > 0))
            {
                return ((_timeCounter / time));
            };
            return (0);
        }


    }
}//package org.client.mainCore.utils
