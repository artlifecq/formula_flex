//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.effect
{
    import flash.geom.Point;
    import flash.display.DisplayObject;
    import flash.events.Event;

    public class Shock 
    {

        public static const MAP:int = 0;
        public static const SPRITE:int = 1;
        private static const mapPoss:Array = [new Point(0, 3), new Point(3, 2), new Point(-3, -2)];
        private static const spritePoss:Array = [new Point(5, 0), new Point(-5, 0), new Point(5, 0)];

        private var _shockPoss:Array;
        private var _shockLength:int;
        private var _shockCount:int;
        private var _target:DisplayObject;
        private var _rx:Number;
        private var _ry:Number;
        private var _type:int;

        public function Shock(type:int=0)
        {
            _type = type;
            if ((_type == 0))
            {
                _shockPoss = mapPoss.concat();
                _shockLength = _shockPoss.length;
            }
            else
            {
                if (_type == 1)
                {
                    _shockPoss = spritePoss.concat();
                    _shockLength = _shockPoss.length;
                };
            };
        }

        public function destroy():void
        {
            stop();
            _target = null;
        }

        public function set target(t:DisplayObject):void
        {
            _target = t;
        }

        public function get target():DisplayObject
        {
            return (_target);
        }

        public function start():void
        {
            _shockCount = 0;
            if (_target)
            {
                _rx = _target.x;
                _ry = _target.y;
                _target.addEventListener("enterFrame", onShockEnter);
            };
        }

        public function stop():void
        {
            if (_target)
            {
                _target.x = _rx;
                _target.y = _ry;
                _target.removeEventListener("enterFrame", onShockEnter);
            };
        }

        private function onShockEnter(e:Event):void
        {
            if ((_shockCount >= _shockLength))
            {
                stop();
                return;
            };
            var pos:Point = _shockPoss[_shockCount];
            if (_target)
            {
                _target.x = (_rx + pos.x);
                _target.y = (_ry + pos.y);
            };
            _shockCount++;
        }


    }
}//package com.game.mainCore.core.effect
