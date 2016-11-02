//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.effect
{
    import flash.display.InteractiveObject;
    import flash.utils.Timer;
    import flash.events.MouseEvent;
    import flash.filters.GlowFilter;
    import flash.events.TimerEvent;
    import flash.events.Event;

    public class GlowTween 
    {

        private var _target:InteractiveObject;
        private var _color:uint;
        private var _toggle:Boolean;
        private var _blur:Number;
        private var _timer:Timer;
        private var _delay:uint;

        public function GlowTween(target:InteractiveObject, color:uint=0xFFFFFF, delay:uint=100, openMouseEvent:Boolean=false)
        {
            if ((target == null))
            {
                return;
            };
            _target = target;
            _color = color;
            _toggle = true;
            _blur = 2;
            _delay = delay;
            _timer = new Timer(delay);
            _timer.addEventListener("timer", onTimer);
            if (openMouseEvent)
            {
                target.addEventListener("rollOver", start);
                target.addEventListener("rollOut", stop);
            }
            else
            {
                start();
            };
        }

        public function remove():void
        {
            if (_target)
            {
                _target.removeEventListener("rollOver", start);
                _target.removeEventListener("rollOut", stop);
                _timer.removeEventListener("timer", onTimer);
                _target.removeEventListener("removedFromStage", onRemoveFromStg);
                _target.filters = null;
            };
        }

        public function start(e:MouseEvent=null):void
        {
            _target.addEventListener("removedFromStage", onRemoveFromStg);
            _timer.start();
        }

        public function stop(e:MouseEvent=null):void
        {
            _timer.removeEventListener("timer", onTimer);
            _target.filters = null;
        }

        private function onTimer(evt:TimerEvent):void
        {
            if ((_blur >= 15))
            {
                _toggle = false;
            }
            else
            {
                if (_blur <= 2)
                {
                    _toggle = true;
                };
            };
            ((_toggle) ? (_blur++) : _blur--);
            var glow:GlowFilter = new GlowFilter(_color, 1, _blur, _blur, 3, 2);
            _target.filters = [glow];
        }

        private function onRemoveFromStg(e:Event):void
        {
            remove();
        }


    }
}//package com.game.mainCore.core.effect
