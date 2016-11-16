package org.client.mainCore.manager
{
    import org.client.mainCore.ds.HashMap;
    import flash.events.Event;
    import __AS3__.vec.Vector;
    import org.client.mainCore.utils.FunctionUtil;

    public class EventManager 
    {

        public static var isPrint:Boolean = false;
        private static var _evtMap:HashMap = new HashMap();

        public function EventManager()
        {
            throw (new Event("静态类"));
        }

        public static function dispatchEvent(type:*, ... args):void
        {
            var list:*;
            var i:int;
            var obj = null;
            var fun = null;
            var fArgs = null;
            var funArgs = null;
            var listenerList:Vector.<Object> = _evtMap.getValue(type);
            if (listenerList)
            {
                list = listenerList.concat();
                i = 0;
                i = 0;
                while (i < list.length)
                {
                    obj = list[i];
                    fun = obj.fun;
                    fArgs = ((obj.args) || ([]));
                    if (!((fun == null)))
                    {
                        funArgs = [];
                        if (((fArgs) && (fArgs.length)))
                        {
                            funArgs = funArgs.concat(fArgs);
                        };
                        if (((args) && (args.length)))
                        {
                            funArgs = funArgs.concat(args);
                        };
                        if (((funArgs) && (funArgs.length)))
                        {
                            fun.apply(null, funArgs);
                        }
                        else
                        {
                            (fun());
                        };
                        if (isPrint)
                        {
                            (trace(FunctionUtil.getFunctionName(fun)));
                        };
                    };
                    i++;
                };
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
                (trace((("重复注册相同事件:" + type) + ",返回!"), FunctionUtil.getFunctionName(listener)));
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

        public static function getAllEventList():Vector.<Function>
        {
            var len:int;
            var i:int;
            var obj = null;
            var fun = null;
            var funList:Vector.<Function> = new Vector.<Function>();
            var arr:Array = _evtMap.getValues();
            for each (var listenerList:Vector.<Object> in arr)
            {
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
