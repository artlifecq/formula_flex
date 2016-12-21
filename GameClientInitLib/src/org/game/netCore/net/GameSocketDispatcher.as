package org.game.netCore.net
{
    import flash.utils.Dictionary;

    public class GameSocketDispatcher 
    {

        public static var isPrint:Boolean = false;
        private static var _funDic:Dictionary = new Dictionary();


        public static function addListener(type:int, listener:Function):void
        {
            if (_funDic.hasOwnProperty(type))
            {
                trace("重复注册相同的Socket事件【" + type + "】,返回!");
            }
            else
            {
                _funDic[type] = listener;
            }
        }

        public static function removeListener(type:int, listener:Function):void
        {
            delete _funDic[type];
        }

        public static function excute(type:int, data:Object):void
        {
            var fun:Function = _funDic[type];
            if (fun != null)
            {
				fun.apply(null, [data]);
//                fun(data);
            }
        }

        public static function hasListener(type:int):Boolean
        {
            return _funDic.hasOwnProperty(type);
        }

        public static function willTrigger(type:int, listener:Function):Boolean
        {
            var fun:Function = _funDic[type];
            return fun == listener;
        }
    }
}