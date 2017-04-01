package com.game.mainCore.libCore.timer
{
    import flash.utils.Timer;

    public class TimerData 
    {

        private var _timer:Timer;
        private var _destroy:Function;

        public function TimerData($timer:Timer, $destroy:Function)
        {
            _timer = $timer;
            _destroy = $destroy;
        }

        public function get timer():Timer
        {
            return _timer;
        }

        public function get destroy():Function
        {
            return _destroy;
        }
    }
}