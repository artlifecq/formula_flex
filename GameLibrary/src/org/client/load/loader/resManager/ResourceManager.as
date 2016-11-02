//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.load.loader.resManager
{
    import flash.display.BitmapData;
    import flash.display.Bitmap;
    import __AS3__.vec.Vector;
    import flash.display.LoaderInfo;
    import flash.utils.getQualifiedClassName;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;

    public class ResourceManager 
    {

        public static const RESOUCE_ERROR:String = "resourceError";
        public static const RESOUCE_REFLECT_ERROR:String = "resourceReflectError";
        public static const HIGHEST:int = 0;
        public static const HIGH:int = 1;
        public static const STANDARD:int = 2;
        public static const LOW:int = 3;
        public static const LOWEST:int = 4;

        public static var maxLpt:uint = 10;
        public static var maxCache:uint = 800;
        public static var decode:Function;
        private static var _dataList:Array = [];
        private static var _loaderList:Array = [];
        private static var _cacheList:Array = [];
        private static var _cacheMultiList:Array = [];
        private static var _isStop:Boolean = false;


        public static function getResource(url:String, event:Function, name:String="", progressEvent:Function=null, level:int=3, isCache:Boolean=true):void
        {
            url = url;
            event = event;
            name = name;
            progressEvent = progressEvent;
            level = level;
            isCache = isCache;
            if ((_cacheList.length > 0))
            {
                for each (var n:Object in _cacheList)
                {
                    if ((n.url == url))
                    {
                        if ((n.res is BitmapData))
                        {
                            (event(new Bitmap((n.res as BitmapData))));
                        }
                        else
                        {
                            (event(new n.res()));
                        };
                        if (!((progressEvent == null)))
                        {
                            (progressEvent(100));
                        };
                        return;
                    };
                };
            };
            var isHas:Boolean = _dataList.some(function (item:ResInfo, index:int, array:Array):Boolean
            {
                if ((_arg1.url == url))
                {
                    _arg1.eventList.push(event);
                    _arg1.progressEvtList.push(progressEvent);
                    return (true);
                };
                return (false);
            });
            if (!(isHas))
            {
                var resInfo:ResInfo = new ResInfo();
                resInfo.eventList.push(event);
                resInfo.progressEvtList.push(progressEvent);
                resInfo.isCache = isCache;
                resInfo.level = level;
                resInfo.url = url;
                resInfo.name = name;
                _dataList.push(resInfo);
                _dataList.sortOn("level", 16);
                var resLoader:ResLoader = getEmptyLoader(level);
                if (resLoader)
                {
                    resLoader.load(resInfo);
                };
            };
        }

        public static function getResourceList(url:String, event:Function, nameList:Vector.<String>, progressEvent:Function=null, level:int=3, isCache:Boolean=true):void
        {
            var outArr = null;
            var cmap = null;
            var res = null;
            var resInfo = null;
            var resLoader = null;
            if ((_cacheMultiList.length > 0))
            {
                outArr = [];
                for each (var n:Object in _cacheMultiList)
                {
                    if ((n.url == url))
                    {
                        cmap = n.map;
                        for each (var name:String in nameList)
                        {
                            res = cmap[name];
                            if (res)
                            {
                                if ((res is BitmapData))
                                {
                                    outArr.push(new Bitmap((res as BitmapData)));
                                }
                                else
                                {
                                    outArr.push(new (res)());
                                };
                            };
                        };
                        break;
                    };
                };
                if ((outArr.length == nameList.length))
                {
                    (event(outArr));
                    if (!((progressEvent == null)))
                    {
                        (progressEvent(100));
                    };
                    return;
                };
            };
            var isHas:Boolean;
            var dLen:int = _dataList.length;
            if ((dLen > 0))
            {
                for each (var rn:ResInfo in _dataList)
                {
                    if ((rn.url == url))
                    {
                        if ((rn.name == ""))
                        {
                            rn.eventList.push(event);
                            rn.progressEvtList.push(progressEvent);
                            isHas = true;
                        };
                        break;
                    };
                };
            };
            if (!(isHas))
            {
                resInfo = new ResInfo();
                resInfo.eventList.push(event);
                resInfo.progressEvtList.push(progressEvent);
                resInfo.isCache = isCache;
                resInfo.level = level;
                resInfo.url = url;
                resInfo.nameList = nameList;
                _dataList.push(resInfo);
                _dataList.sortOn("level", 16);
                resLoader = getEmptyLoader(level);
                if (resLoader)
                {
                    resLoader.load(resInfo);
                };
            };
        }

        public static function cancel(url:String, event:Function, progressEvent:Function=null):void
        {
            cancelEmpl(url, event);
        }

        public static function cancelURL(url:String):void
        {
            cancelEmpl(url);
        }

        public static function clear(url:String):void
        {
            var cUrl = null;
            var res:*;
            cancelEmpl(url);
            var cnt:uint;
            for each (var obj:Object in _cacheList)
            {
                cUrl = obj["url"];
                res = obj["res"];
                if ((cUrl == url))
                {
                    _cacheList.splice(cnt, 1);
                    if ((res is BitmapData))
                    {
                        (res as BitmapData).dispose();
                    };
                    res = null;
                    return;
                };
                cnt++;
            };
        }

        public static function cancelAll():void
        {
            for each (var o:ResLoader in _loaderList)
            {
                removeLoader(o);
            };
            _loaderList = [];
            _dataList = [];
        }

        public static function addBef(url:String, name:String="item", isCache:Boolean=true):void
        {
            var resInfo = null;
            var isHas:Boolean;
            var dLen:int = _dataList.length;
            if ((dLen > 0))
            {
                for each (var rn:ResInfo in _dataList)
                {
                    if ((rn.url == url))
                    {
                        isHas = true;
                        break;
                    };
                };
            };
            if (!(isHas))
            {
                resInfo = new ResInfo();
                resInfo.isCache = isCache;
                resInfo.level = 4;
                resInfo.url = url;
                resInfo.name = name;
                _dataList.push(resInfo);
            };
        }

        public static function stop():void
        {
            _isStop = true;
            for each (var resLoader:ResLoader in _loaderList)
            {
                if ((resLoader.level == 4))
                {
                    removeLoader(resLoader);
                };
            };
        }

        public static function play():void
        {
            _isStop = false;
            nextLoad();
        }

        private static function cancelEmpl(url:String, event:Function=null, progressEvent:Function=null):void
        {
            var pIndex:int;
            var eindex:int;
            var len:int;
            var i:int;
            for each (var resLoader:ResLoader in _loaderList)
            {
                if ((resLoader.resInfo.url == url))
                {
                    if (!((event == null)))
                    {
                        pIndex = resLoader.resInfo.eventList.indexOf(progressEvent);
                        if (!((pIndex == -1)))
                        {
                            resLoader.resInfo.progressEvtList.splice(pIndex, 1);
                        };
                        eindex = resLoader.resInfo.eventList.indexOf(event);
                        if ((eindex == -1))
                        {
                            return;
                        };
                        resLoader.resInfo.eventList.splice(eindex, 1);
                        if ((resLoader.resInfo.eventList.length > 0))
                        {
                            return;
                        };
                    };
                    removeLoader(resLoader);
                    len = _dataList.length;
                    i = 0;
                    while (i < len)
                    {
                        if ((_dataList[i].url == url))
                        {
                            _dataList.splice(i, 1);
                            break;
                        };
                        i++;
                    };
                    nextLoad();
                    return;
                };
            };
        }

        private static function getEmptyLoader(level:int=3):ResLoader
        {
            var resLoader = null;
            var len:int = _loaderList.length;
            if ((len < maxLpt))
            {
                resLoader = new ResLoader(decode);
                resLoader.addEventListener("complete", onLoadComplete);
                resLoader.addEventListener("progress", onLoadProgress);
                resLoader.addEventListener("ioError", onIOError);
                _loaderList.push(resLoader);
                return (resLoader);
            };
            _loaderList.sortOn("level", (16 | 2));
            resLoader = (_loaderList[0] as ResLoader);
            if ((level == 0))
            {
                resLoader.close();
                return (resLoader);
            };
            if (level != 4)
            {
                if ((resLoader.level == 4))
                {
                    resLoader.close();
                    return (resLoader);
                };
            };
            return (null);
        }

        private static function nextLoad():void
        {
            var k:int;
            var resInfo = null;
            var resLoader = null;
            if (_isStop)
            {
                return;
            };
            var len:int = _dataList.length;
            if ((len > 0))
            {
                k = 0;
                while (k < len)
                {
                    resInfo = (_dataList[k] as ResInfo);
                    if (!(resInfo.isLoading))
                    {
                        resLoader = getEmptyLoader();
                        if (resLoader)
                        {
                            resLoader.load(resInfo);
                        };
                        return;
                    };
                    k++;
                };
            };
        }

        private static function removeLoader(resLosder:ResLoader):void
        {
            removeValueFromArray(_loaderList, resLosder);
            if (resLosder.isLoading)
            {
                resLosder.close();
            };
            resLosder.removeEventListener("complete", onLoadComplete);
            resLosder.removeEventListener("progress", onLoadProgress);
            resLosder.removeEventListener("ioError", onIOError);
            resLosder.destroy();
            resLosder = null;
        }

        private static function onLoadComplete(e:Event):void
        {
            e = e;
            var resLoader:ResLoader = (e.target as ResLoader);
            var loaderInfo:LoaderInfo = resLoader.loaderInfo;
            var resInfo:ResInfo = resLoader.resInfo;
            var eventList:Vector.<Function> = resInfo.eventList;
            if ((loaderInfo.content is Bitmap))
            {
                var bd:BitmapData = (loaderInfo.content as Bitmap).bitmapData;
                if (resInfo.isCache)
                {
                    _cacheList.push({
                        "url":resInfo.url,
                        "res":bd
                    });
                };
                for each (var d:Function in eventList)
                {
                    (d(new Bitmap(bd)));
                };
            }
            else
            {
                if ((resInfo.name == ""))
                {
                    var nlen:int = resInfo.nameList.length;
                    if ((nlen == 0))
                    {
                        var cla:Class = (loaderInfo.applicationDomain.getDefinition(getQualifiedClassName(loaderInfo.content)) as Class);
                        if (resInfo.isCache)
                        {
                            _cacheList.push({
                                "url":resInfo.url,
                                "res":cla
                            });
                        };
                        for each (var dd:Function in eventList)
                        {
                            (dd(new cla()));
                        };
                    }
                    else
                    {
                        var outArr:Array = [];
                        var cacheMap:Object = {};
                        var nameList:Vector.<String> = resInfo.nameList;
                        for each (var resName:String in nameList)
                        {
                            if (loaderInfo.applicationDomain.hasDefinition(resName))
                            {
                                cla = (loaderInfo.applicationDomain.getDefinition(resName) as Class);
                                if (cla)
                                {
                                    cacheMap[resName] = cla;
                                    if ((cla is BitmapData))
                                    {
                                        outArr.push(new Bitmap((cla as BitmapData)));
                                    }
                                    else
                                    {
                                        outArr.push(new cla());
                                    };
                                };
                            };
                        };
                        if (resInfo.isCache)
                        {
                            var hasURL:Boolean = _cacheMultiList.some(function (item:Object, index:int, array:Array):Boolean
                            {
                                var cmap = null;
                                if ((_arg1.url == resInfo.url))
                                {
                                    cmap = _arg1.map;
                                    for (var i in cacheMap)
                                    {
                                        cmap[i] = cacheMap[i];
                                    };
                                    return (true);
                                };
                                return (false);
                            });
                            if (!(hasURL))
                            {
                                _cacheMultiList.push({
                                    "url":resInfo.url,
                                    "map":cacheMap
                                });
                            };
                        }
                        else
                        {
                            cacheMap = null;
                        };
                        if ((outArr.length > 0))
                        {
                            for each (var nl:Function in eventList)
                            {
                                (nl(outArr));
                            };
                        };
                        if ((_cacheMultiList.length > maxCache))
                        {
                            _cacheMultiList.shift();
                        };
                    };
                }
                else
                {
                    if (loaderInfo.applicationDomain.hasDefinition(resInfo.name))
                    {
                        cla = (loaderInfo.applicationDomain.getDefinition(resInfo.name) as Class);
                    };
                    if (cla)
                    {
                        if (resInfo.isCache)
                        {
                            _cacheList.push({
                                "url":resInfo.url,
                                "res":cla
                            });
                        };
                        for each (var n:Function in eventList)
                        {
                            (n(new cla()));
                        };
                    };
                };
            };
            removeLoader(resLoader);
            if ((_cacheList.length > maxCache))
            {
                var cObj:Object = _cacheList.shift();
                var cRes:* = cObj.res;
                cObj = null;
            };
            removeValueFromArray(_dataList, resInfo);
            nextLoad();
        }

        private static function onIOError(e:IOErrorEvent):void
        {
            var resLoader:ResLoader = (e.target as ResLoader);
            var resInfo:ResInfo = resLoader.resInfo;
            removeLoader(resLoader);
            removeValueFromArray(_dataList, resInfo);
            nextLoad();
            trace(("资源加载路径不正确:" + resInfo.url)); //not popped
        }

        private static function onLoadProgress(e:ProgressEvent):void
        {
            var percent:Number;
            var resLoader:ResLoader = (e.target as ResLoader);
            var resInfo:ResInfo = resLoader.resInfo;
            for each (var pFun:Function in resInfo.progressEvtList)
            {
                if (!((pFun == null)))
                {
                    percent = ((e.bytesLoaded / e.bytesTotal) * 100);
                    (pFun(percent));
                };
            };
        }

        private static function removeValueFromArray(arr:Array, value:Object):void
        {
            var i:int = arr.indexOf(value);
            if (i != -1)
            {
                arr.splice(i, 1);
            };
        }


    }
}//package org.client.load.loader.resManager
