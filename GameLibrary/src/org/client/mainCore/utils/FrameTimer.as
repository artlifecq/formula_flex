//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import __AS3__.vec.Vector;
    import flash.utils.getTimer;

    public class FrameTimer 
    {

        private static const MAX_LEN:uint = 4095;

        public static var wantedFPS:uint = 60;
        public static var maxDeltaTime:Number = 0.5;
        public static var tmod:Number = 1;
        private static var oldTime:uint = getTimer();
        private static var tmod_factor:Number = 0.95;
        private static var calc_tmod:Number = 1;
        private static var deltaT:Number = 1;
        private static var _lastTimeCheck:uint;
        private static var _fpsVector:Vector.<Number> = new Vector.<Number>();
        private static var _vectorAverage:Number = 0;
        private static var _fpsCnt:uint;
        private static var _frames:Vector.<int> = new Vector.<int>(4095);
        private static var _pos:int = 0;
        private static var _frameNum:int = 0;


        public static function update():void
        {
            var vectorLength:int;
            var i:Number;
            var newTime:uint = getTimer();
            deltaT = ((newTime - oldTime) * 0.001);
            oldTime = newTime;
            if ((deltaT < maxDeltaTime))
            {
                calc_tmod = ((calc_tmod * tmod_factor) + (((1 - tmod_factor) * deltaT) * wantedFPS));
            }
            else
            {
                deltaT = (1 / wantedFPS);
            };
            tmod = calc_tmod;
            var timer:int = getTimer();
            if (((timer - 1000) > _lastTimeCheck))
            {
                vectorLength = _fpsVector.push(_fpsCnt);
                if ((vectorLength > 60))
                {
                    _fpsVector.shift();
                };
                i = 0;
                while (i < _fpsVector.length)
                {
                    _vectorAverage = (_vectorAverage + _fpsVector[i]);
                    i++;
                };
                _vectorAverage = (_vectorAverage / _fpsVector.length);
                _fpsCnt = 0;
                _lastTimeCheck = timer;
            };
            _fpsCnt++;
        }

        public static function get averageMinuteFps():uint
        {
            return (_vectorAverage);
        }

        public static function get fps():Number
        {
            return ((wantedFPS / tmod));
        }

        public static function skip():void
        {
            oldTime = getTimer();
        }

        private static function setTime(idx:int, time:int):void
        {
            _frames[(idx & 4095)] = time;
        }

        private static function getTime(idx:int):int
        {
            return (_frames[(idx & 4095)]);
        }

        private static function getTimeCount(frameCount:int):int
        {
            return ((getTime((_pos - 1)) - getTime(((_pos - frameCount) - 1))));
        }

        private static function updateFrameNum():void
        {
            if ((_frameNum == 0))
            {
                setTime(_pos++, getTimer());
            };
            _frameNum++;
            _frameNum = (_frameNum & 15);
        }

        public static function getFrameRate(frameCount:uint):Number
        {
            if ((_pos <= 1))
            {
                return (0);
            };
            frameCount = (frameCount + 15);
            frameCount = (frameCount >> 4);
            frameCount = Math.min(frameCount, (_pos - 1));
            return ((((frameCount << 4) / getTimeCount(frameCount)) * 1000));
        }


    }
}//package org.client.mainCore.utils
