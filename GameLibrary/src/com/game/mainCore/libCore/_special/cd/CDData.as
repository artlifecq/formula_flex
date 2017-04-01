package com.game.mainCore.libCore._special.cd
{
    import com.greensock.TweenLite;
    import com.greensock.easing.Linear;

    public class CDData 
    {

        public var id;
        public var now:Number = 0;
        public var cd:Number = 0;
        private var _obj:Object;
        private var _onStart:Function;
        private var _onUpdate:Function;
        private var _onComplete:Function;

        public function CDData($id:*=null, $onStart:Function=null, $onUpdate:Function=null, $onComplete:Function=null)
        {
            _obj = {"angle":0};
            super();
            id = $id;
            _onStart = $onStart;
            _onUpdate = $onUpdate;
            _onComplete = $onComplete;
        }

        public function dispose():void
        {
            now = 0;
            cd = 0;
            _obj = {"angle":0};
            _onUpdate = null;
            _onComplete = null;
        }

        public function set startCallBack(value:Function):void
        {
            _onStart = value;
        }

        public function set updateCallBack(value:Function):void
        {
            _onUpdate = value;
        }

        public function set completeCallBack(value:Function):void
        {
            _onComplete = value;
        }

        public function play($cd:int, $start:int=0):void
        {
            if (((($cd <= 0)) || (($start < 0))))
            {
                throw (new Error(((("CD时间小于0的嘛..,傻XX :　$cd : " + $cd) + "$start : ") + $start)));
            };
            stop(false);
            now = $start;
            cd = $cd;
            if ((lostTm > 0))
            {
                if (!((_onStart == null)))
                {
                    (_onStart(this));
                };
                _obj.angle = (((cd)!=0) ? ((now / cd) * 360) : 360);
                TweenLite.to(_obj, (lostTm * 0.001), {
                    "angle":360,
                    "onUpdate":onUpdate,
                    "onComplete":onComplete,
                    "ease":Linear.easeNone
                });
                onUpdate();
            }
            else
            {
                onComplete();
            };
        }

        private function onUpdate():void
        {
            update(_obj.angle);
            if (!((_onUpdate == null)))
            {
                (_onUpdate(this));
            };
        }

        private function onComplete():void
        {
            update(360);
            if (!((_onComplete == null)))
            {
                (_onComplete(this));
            };
            dispose();
        }

        public function stop($complete:Boolean=true):void
        {
            TweenLite.killTweensOf(_obj, $complete);
        }

        public function get lostTm():Number
        {
            return ((cd - now));
        }

        private function update($angle:Number=0):void
        {
            now = (($angle / 360) * cd);
        }
    }
}