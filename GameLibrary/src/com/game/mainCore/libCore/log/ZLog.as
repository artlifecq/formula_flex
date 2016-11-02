//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.log
{
    import com.game.mainCore.libCore.handle.HandleThread;
    import flash.text.TextField;

    public class ZLog 
    {

        private static const _logHt:HandleThread = new HandleThread();

        public static var enableLog:Boolean = true;
        public static var enableTrace:Boolean = true;
        public static var enableShowInLogArea:Boolean = false;
        public static var max_log_num:Number;
        private static var _logArea:TextField;
        private static var _logNum:Number;


        public static function init($logArea:TextField=null, $max_log_num:int=1000, $enableTrace:Boolean=true, $enableShowInLogArea:Boolean=false):void
        {
            enableLog = true;
            max_log_num = $max_log_num;
            enableTrace = $enableTrace;
            enableShowInLogArea = $enableShowInLogArea;
            _logArea = $logArea;
            if (_logArea)
            {
                _logArea.text = "";
            };
            _logNum = 0;
        }

        public static function add($str:*):void
        {
            if (!enableLog)
            {
                return;
            };
            var str:String = ((((($str is Array)) && (($str.length > 0)))) ? $str.slice(" ") : $str);
            if (enableTrace)
            {
                (trace(str));
            };
            if (((enableShowInLogArea) && (!((_logArea == null)))))
            {
                _logHt.push(doAdd, [str], 10);
            };
        }

        private static function doAdd($str:*):void
        {
            var index:int;
            if (((enableShowInLogArea) && (!((_logArea == null)))))
            {
                _logArea.appendText(($str + "\n"));
                _logNum++;
                while (_logNum > max_log_num)
                {
                    index = _logArea.text.indexOf("\r");
                    _logArea.replaceText(0, (((index)!=-1) ? (index + 1) : 0), "");
                    _logNum--;
                };
            };
        }


    }
}//package com.game.mainCore.libCore.log
