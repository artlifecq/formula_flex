//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.cache
{
    import com.game.mainCore.core.info.player.SpngInfo;
    import org.client.load.loader.queue.QueueLoader;
    import flash.display.Loader;
    import org.client.mainCore.utils.Delegate;
    import flash.system.LoaderContext;
    import flash.utils.ByteArray;
    import flash.display.LoaderInfo;
    import flash.display.MovieClip;
    import flash.display.Shape;
    import flash.events.Event;

    public class SpngCache 
    {

        public static var decode:Function;
        protected static var MAX:int = 30;
        private static var _instance:SpngCache = new (SpngCache)();

        private var _cacheList:Array;
        private var _waitList:Array;

        public function SpngCache()
        {
            _cacheList = [];
            _waitList = [];
            super();
        }

        public static function getSpngInfo(url:String, event:Function, error:Function=null, progress:Function=null):void
        {
            _instance.getSpngInfo(url, event, error, progress);
        }

        public static function cancel(url:String, event:Function):void
        {
            _instance.cancel(url, event);
        }

        public static function clearCache():void
        {
            _instance.clearCache();
        }

        public static function dispose(url:String):void
        {
            _instance.dispose(url);
        }


        public function clearCache():void
        {
            var i:int;
            var item = null;
            var len:int = _cacheList.length;
            i = 0;
            while (i < len)
            {
                item = _cacheList[i];
                if (item)
                {
                    (trace(("clearCache : " + item.url)));
                    if ((item.count == 0))
                    {
                        _cacheList.splice(i, 1);
                        i--;
                        item.dispose();
                        item = null;
                    };
                };
                i++;
            };
        }

        public function dispose(url:String):void
        {
            var cacheInfo = null;
            var i:int;
            var index:int;
            var len:uint = _cacheList.length;
            i = (len - 1);
            while (i >= 0)
            {
                cacheInfo = _cacheList[i];
                if ((cacheInfo.url == url))
                {
                    cacheInfo.dispose();
                    index = _cacheList.indexOf(cacheInfo);
                    if (!((index == -1)))
                    {
                        _cacheList.splice(index, 1);
                    };
                };
                i--;
            };
        }

        public function getSpngInfo(url:String, event:Function, error:Function=null, progress:Function=null):void
        {
            for each (var item:SpngInfo in _cacheList)
            {
                if ((item.url == url))
                {
                    (trace("缓存取素材", url));
                    if (!((progress == null)))
                    {
                        (progress(100));
                    };
                    (event(item));
                    return;
                };
            };
            addLoad(url, event, error, progress);
        }

        private function addLoad(url:String, event:Function, error:Function, progress:Function=null):void
        {
            for each (var item:CacheLoaderInfo in _waitList)
            {
                if ((item.url == url))
                {
                    if ((item.event == event))
                    {
                        return;
                    };
                };
            };
            var info:CacheLoaderInfo = new CacheLoaderInfo();
            info.event = event;
            info.error = error;
            info.progress = progress;
            info.url = url;
            _waitList.push(info);
            QueueLoader.instance.load(url, onLoadComplete, onIOError, onProgress, 2);
        }

        public function cancel(url:String, event:Function):void
        {
            var item = null;
            var i:int;
            var b:Boolean;
            var len:int = _waitList.length;
            i = 0;
            while (i < len)
            {
                item = _waitList[i];
                if ((item.url == url))
                {
                    if ((item.event == event))
                    {
                        _waitList.splice(i, 1);
                        b = true;
                        break;
                    };
                };
                i++;
            };
            if (!(b))
            {
                return;
            };
            for each (item in _waitList)
            {
                if ((item.url == url))
                {
                    return;
                };
            };
            QueueLoader.instance.cancel(url, onLoadComplete);
        }

        private function onLoadComplete(url:String, data:ByteArray):void
        {
            if (!((decode == null)))
            {
                data = decode(data);
            };
            var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener("complete", Delegate.create(onLoader, url));
            var loaderContext:LoaderContext = new LoaderContext(false);
            loaderContext.allowCodeImport = true;
            loader.loadBytes(data, loaderContext);
        }

        private function onLoader(e:Event, url:String):void
        {
            var i:int;
            var item = null;
            var spngInfo = null;
            var mc = null;
            var shape = null;
            var xml = null;
            var loaderInfo:LoaderInfo = (e.target as LoaderInfo);
            loaderInfo.removeEventListener("complete", onLoader);
            var len:int = _waitList.length;
            i = 0;
            while (i < len)
            {
                item = _waitList[i];
                if (item)
                {
                    if ((item.url == url))
                    {
                        _waitList.splice(i, 1);
                        i--;
                        for each (var cacheInfo:SpngInfo in _cacheList)
                        {
                            if ((cacheInfo.url == item.url))
                            {
                                spngInfo = cacheInfo;
                                break;
                            };
                        };
                        if ((spngInfo == null))
                        {
                            spngInfo = new SpngInfo();
                            spngInfo.url = item.url;
                            mc = (loaderInfo.content as MovieClip);
                            mc.gotoAndStop(1);
                            shape = (mc.getChildAt(0) as Shape);
                            xml = XML((mc.getChildAt(1) as Object).text);
                            spngInfo.resContent = (loaderInfo.content as MovieClip);
                            addCache(spngInfo);
                        };
                        if (!((item.event == null)))
                        {
                            item.event(spngInfo);
                        };
                        item.event = null;
                        item.error = null;
                    };
                };
                i++;
            };
            loaderInfo.loader.unload();
        }

        private function addCache(info:SpngInfo):void
        {
            var i:int;
            var item = null;
            var len:int = _cacheList.length;
            if ((len > MAX))
            {
                i = 0;
                while (i < len)
                {
                    item = _cacheList[i];
                    if ((item.count == 0))
                    {
                        _cacheList.splice(i, 1);
                        item.dispose();
                        item = null;
                        break;
                    };
                    i++;
                };
            };
            _cacheList.push(info);
        }

        private function onIOError(url:String):void
        {
            var i:int;
            var item = null;
            var len:int = _waitList.length;
            i = 0;
            while (i < len)
            {
                item = _waitList[i];
                if (item)
                {
                    if ((item.url == url))
                    {
                        _waitList.splice(i, 1);
                        i--;
                        if (!((item.error == null)))
                        {
                            item.error(item.id);
                        };
                        item.event = null;
                        item.error = null;
                    };
                };
                i++;
            };
        }

        private function onProgress(url:String, percent:Number):void
        {
            var i:int;
            var item = null;
            var len:int = _waitList.length;
            i = 0;
            while (i < len)
            {
                item = _waitList[i];
                if (item)
                {
                    if ((item.url == url))
                    {
                        if (!((item.progress == null)))
                        {
                            item.progress(percent);
                        };
                    };
                };
                i++;
            };
        }


    }
}//package com.game.mainCore.core.cache
