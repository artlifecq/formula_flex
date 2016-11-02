//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.dispose
{
    import flash.display.Sprite;
    import flash.events.Event;
    import org.client.mainCore.utils.Tick;
    import flash.utils.getTimer;
    import flash.display.BitmapData;
    import flash.system.System;
    import flash.utils.ByteArray;

    public class DisposeHelper 
    {

        private static var sleepModeRenderTime:int = 83;
        private static var inSleepMode:Boolean = false;
        private static var lastRunTime:int = 0;
        private static var _sprite:Sprite = new Sprite();
        private static var _disposList:Array = [];

        public function DisposeHelper()
        {
            throw (new Event("静态类"));
        }

        public static function get length():int
        {
            return (_disposList.length);
        }

        public static function add($obj:*):void
        {
            if ($obj == null)
            {
                return;
            };
            _disposList.push($obj);
            if (!(Tick.hasCallback(onEnterFrame)))
            {
                lastRunTime = getTimer();
                Tick.addCallback(onEnterFrame);
            };
        }

        private static function onEnterFrame(gapTm:uint):void
        {
            var time:int = getTimer();
            inSleepMode = ((time - lastRunTime) > sleepModeRenderTime);
            lastRunTime = time;
            if (inSleepMode)
            {
                while (_disposList.length > 0)
                {
                    disposeObj(_disposList.shift());
                };
            }
            else
            {
                while (_disposList.length > 0)
                {
                    disposeObj(_disposList.shift());
                    if ((getTimer() - time) >= 3) break;
                };
            };
            if ((_disposList.length == 0))
            {
                Tick.removeCallback(onEnterFrame);
            };
        }

        private static function disposeObj($obj:*):void
        {
            if (($obj is BitmapData))
            {
                ($obj as BitmapData).dispose();
                $obj = null;
            }
            else
            {
                if (($obj is XML))
                {
                    System.disposeXML(($obj as XML));
                }
                else
                {
                    if (($obj is ByteArray))
                    {
                        ($obj as ByteArray).clear();
                    };
                };
            };
        }


    }
}//package com.game.mainCore.libCore.dispose
