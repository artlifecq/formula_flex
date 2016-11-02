//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader.loading
{
    import flash.text.TextField;
    import flash.utils.Timer;
    import __AS3__.vec.Vector;
    import flash.display.Shape;
    import flash.display.DisplayObjectContainer;
    import flash.events.TimerEvent;

    public class TitlePercentLoading extends TitleOnlyLoading implements ILoading 
    {

        private static const KEY:String = "titlePercentLoading";

        protected var _barWidth:Number;
        protected var _tipTxt:TextField;
        protected var _timer:Timer;
        protected var _tips:Vector.<String>;
        protected var _maskSp:Shape;

        public function TitlePercentLoading(parent:DisplayObjectContainer, title:String="Loading...", showCloseBtn:Boolean=false, align:uint=4)
        {
            super(parent, title, showCloseBtn, align);
            _tipTxt = loadingBar["tip_txt"];
            _barWidth = _percentBar.width;
            _maskSp = new Shape();
            _maskSp.graphics.beginFill(0xFF0000, 1);
            _maskSp.graphics.drawRoundRect(0, -1, 1, (_percentBar.height + 2), 4, 4);
            _maskSp.graphics.endFill();
            _maskSp.x = _percentBar.x;
            _maskSp.y = _percentBar.y;
            _loadingBar.addChild(_maskSp);
            _maskSp.width = 1;
            _percentBar.mask = _maskSp;
        }

        public function set tips(list:Vector.<String>):void
        {
            _tips = list;
            if (((_tips) && ((_tips.length > 0))))
            {
                onChangeTip(null);
                if (!(_timer))
                {
                    _timer = new Timer(3500);
                };
                _timer.addEventListener("timer", onChangeTip);
                _timer.reset();
                _timer.start();
            };
        }

        public function get tips():Vector.<String>
        {
            return (_tips);
        }

        private function onChangeTip(e:TimerEvent):void
        {
            var num:int;
            if (_tips)
            {
                num = Math.floor((Math.random() * _tips.length));
                _tipTxt.text = _tips[num];
            };
        }

        override public function setPercent(loaded:Number, total:Number):void
        {
            super.setPercent(loaded, total);
            _percentText.text = (_percent.toString() + "%");
            _maskSp.width = (_barWidth * (_percent / 100));
        }

        override public function set title(str:String):void
        {
            super.title = str;
        }

        override public function set text(str:String):void
        {
            _tipTxt.htmlText = str;
        }

        override public function hide():void
        {
            super.hide();
            if (_timer)
            {
                _timer.stop();
                _timer.removeEventListener("timer", onChangeTip);
            };
        }

        override public function destroy():void
        {
            _percentText = null;
            _percentBar = null;
            _tipTxt = null;
            if (_timer)
            {
                _timer.stop();
                _timer.removeEventListener("timer", onChangeTip);
            };
            _timer = null;
            super.destroy();
        }

        override public function get key():String
        {
            return ("titlePercentLoading");
        }


    }
}//package com.game.mainCore.core.loader.loading
