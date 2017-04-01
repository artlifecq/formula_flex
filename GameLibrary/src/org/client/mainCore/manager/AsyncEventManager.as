package org.client.mainCore.manager
{
    import org.client.mainCore.ds.HashMap;
    import __AS3__.vec.Vector;
    import flash.events.Event;
    import org.client.mainCore.utils.Tick;
    import flash.utils.getTimer;
    import org.client.mainCore.utils.FunctionUtil;

    public class AsyncEventManager 
    {

        public static var isPrint:Boolean = false;
        private static var _evtMap:HashMap = new HashMap();
        private static var _excuteEventList:Vector.<Object> = new Vector.<Object>();

        public function AsyncEventManager()
        {
            throw (new Event("静态类"));
        }

        public static function dispatchEvent(type:*, ... args):void
        {
            _excuteEventList.push({
                "type":type,
                "args":args
            });
            Tick.addCallback(excuteEvent);
        }

        private static function excuteEvent(gapTm:uint):void
        {
            var excuteObj = null;
            var type:*;
            var args = null;
            var listenerList:*;
            var list:*;
            var fun = null;
            var fArgs = null;
            var funArgs = null;
            var tm:uint = getTimer();
            while (_excuteEventList.length)
            {
                excuteObj = _excuteEventList.shift();
                type = excuteObj.type;
                args = excuteObj.args;
                listenerList = _evtMap.getValue(type);
                if (listenerList)
                {
                    list = new Vector.<Object>();
                    list = list.concat(listenerList);
                    for each (var obj:Object in list)
                    {
                        fun = obj.fun;
                        fArgs = ((obj.args) || ([]));
                        if (!((fun == null)))
                        {
                            funArgs = [];
                            funArgs = funArgs.concat(fArgs).concat(args);
                            fun.apply(null, funArgs);
                            if (isPrint)
                            {
                                (trace(FunctionUtil.getFunctionName(fun)));
                            };
                        };
                    };
                };
                if (((getTimer() - tm) > 3))
                {
                    return;
                };
            };
            if ((_excuteEventList.length == 0))
            {
                Tick.removeCallback(excuteEvent);
            };
        }

        public static function addEvent(type:*, listener:Function, ... args):void
        {
            var listenerList:*;
            if (!(hasEvent(type, listener)))
            {
                listenerList = _evtMap.getValue(type);
                if (!(listenerList))
                {
                    listenerList = new Vector.<Object>();
                    _evtMap.add(type, listenerList);
                };
                listenerList[listenerList.length] = {
                    "fun":listener,
                    "args":args
                };
            }
            else
            {
                (trace((("重复注册相同事件:" + type) + ",返回!")));
            };
        }

        public static function removeEvent(type:*, listener:Function):void
        {
            var len:int;
            var i:int;
            var obj = null;
            var fun = null;
            var listenerList:Vector.<Object> = _evtMap.getValue(type);
            if (listenerList)
            {
                len = listenerList.length;
                i = (len - 1);
                while (i >= 0)
                {
                    obj = listenerList[i];
                    fun = obj.fun;
                    if ((listener == fun))
                    {
                        listenerList.splice(i, 1);
                    };
                    i--;
                };
                if ((listenerList.length == 0))
                {
                    _evtMap.remove(type);
                };
            };
        }

        public static function hasTypeEvent(type:*):Boolean
        {
            return (_evtMap.containsKey(type));
        }

        public static function hasEvent(type:*, listener:Function):Boolean
        {
            var len:int;
            var i:int;
            var obj = null;
            var fun = null;
            var listenerList:Vector.<Object> = _evtMap.getValue(type);
            if (listenerList)
            {
                len = listenerList.length;
                i = (len - 1);
                while (i >= 0)
                {
                    obj = listenerList[i];
                    fun = obj.fun;
                    if ((listener == fun))
                    {
                        return (true);
                    };
                    i--;
                };
            };
            return (false);
        }

        public static function get eventsNum():int
        {
            return (_evtMap.length);
        }

        public static function removeAllEvents():void
        {
            _evtMap.clear();
        }

        public static function getTypeEventList(type:*):Vector.<Function>
        {
            var len:int;
            var i:int;
            var obj = null;
            var fun = null;
            var funList:Vector.<Function> = new Vector.<Function>();
            var listenerList:Vector.<Object> = _evtMap.getValue(type);
            if (listenerList)
            {
                len = listenerList.length;
                i = (len - 1);
                while (i >= 0)
                {
                    obj = listenerList[i];
                    fun = obj.fun;
                    funList.push(fun);
                    i--;
                };
            };
            return (funList);
        }

        public static function getTypeEventsNum(type:*):uint
        {
            var list:Vector.<Object> = _evtMap.getValue(type);
            return (((list) ? (list.length) : 0));
        }


    }
}//package org.client.mainCore.manager
