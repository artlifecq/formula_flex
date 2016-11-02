//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.timer
{
    import org.client.mainCore.utils.ExactTimer;
    import flash.utils.Dictionary;
    import org.client.mainCore.utils.FunctionUtil;
    import __AS3__.vec.Vector;

    public class GameTimer extends ExactTimer 
    {

        private static var _timerMap:Dictionary = new Dictionary();

        private var _name:String;

        public function GameTimer(name:String, delay:Number=1000, repeat:uint=0, onUpdate:Function=null, onComplete:Function=null, isCmpDestroy:Boolean=false, onUpdateParams:Array=null, onCompleteParams:Array=null)
        {
            super(delay, repeat, onUpdate, onComplete, isCmpDestroy, onUpdateParams, onCompleteParams);
            _name = name;
            if (_timerMap.hasOwnProperty(name))
            {
                (trace((("-----------------------------------------------已经有注册过的同一计时器【" + name) + "】了,赶紧查查吧!----------------------------------------")));
                (trace((("-----------------------------------------------" + FunctionUtil.getFunctionName(onUpdate)) + "----------------------------------------")));
                (trace((("-----------------------------------------------" + FunctionUtil.getFunctionName(onComplete)) + "----------------------------------------")));
            };
            _timerMap[name] = true;
        }

        public static function get timerList():Vector.<String>
        {
            var arr:Vector.<String> = new Vector.<String>();
            for (var key:String in _timerMap)
            {
                arr.push(key);
            };
            return (arr);
        }

        public static function get timerCnt():uint
        {
            return (timerList.length);
        }


        override public function destroy():void
        {
            super.destroy();
            delete _timerMap[_name]; //not popped
        }


    }
}//package com.game.mainCore.core.timer
