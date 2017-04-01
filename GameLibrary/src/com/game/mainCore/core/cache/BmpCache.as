package com.game.mainCore.core.cache
{
    import flash.display.Bitmap;
    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import flash.events.Event;
    import flash.utils.ByteArray;
    
    import org.client.load.loader.queue.QueueLoader;
    import org.client.mainCore.utils.Delegate;

    public class BmpCache 
    {

        public static var decode:Function;
        protected static var MAX:int = 400;
        private static var _instance:BmpCache = new BmpCache();

        private var _cacheList:Array;
        private var _waitList:Array;

        public function BmpCache()
        {
            _cacheList = [];
            _waitList = [];
            super();
        }

        public static function getBmpInfo(url:String, event:Function, error:Function=null):void
        {
            _instance.getBmpInfo(url, event, error);
        }

        public static function cancel(url:String, event:Function):void
        {
            _instance.cancel(url, event);
        }

        public static function clearAllCache():void
        {
            _instance.clearAllCache();
        }


        public function clearAllCache():void
        {
            var item:BmpInfo = null;
            var len:int = _cacheList.length;
			var i:int;
            i = 0;
            while (i < len)
            {
                item = _cacheList[/*(_cacheList.length - 1)*/i];
                if (item)
                {
                    if (item.bmp)
                    {
                        item.bmp.bitmapData.dispose();
                    }
                    item = null;
                }
                i++;
            }
        }

        public function getBmpInfo(url:String, event:Function, error:Function=null):void
        {
            for each (var item:BmpInfo in _cacheList)
            {
                if (item.url == url)
                {
                    trace("缓存取素材", url);
                    event(item);
                    return;
                }
            }
            addLoad(url, event, error);
        }

        private function addLoad(url:String, event:Function, error:Function):void
        {
            for each (var item:CacheLoaderInfo in _waitList)
            {
                if (item.url == url)
                {
                    if (item.event == event)
                    {
                        return;
                    }
                }
            }
            var info:CacheLoaderInfo = new CacheLoaderInfo();
            info.event = event;
            info.error = error;
            info.url = url;
            _waitList.push(info);
            QueueLoader.instance.load(url, onLoadComplete, onIOError, null, 2);
        }

        public function cancel(url:String, event:Function):void
        {
            var item:CacheLoaderInfo = null;
            
            var b:Boolean;
            var len:int = _waitList.length;
			
			var i:int;
			i = 0;
            while (i < len)
            {
                item = _waitList[i];
                if (item.url == url)
                {
                    if (item.event == event)
                    {
                        _waitList.splice(i, 1);
                        b = true;
                        break;
                    }
                }
                i++;
            }
            if (!b)
            {
                return;
            }
            for each (item in _waitList)
            {
                if (item.url == url)
                {
                    return;
                }
            }
            QueueLoader.instance.cancel(url, onLoadComplete);
        }

        private function onLoadComplete(url:String, data:ByteArray):void
        {
            if (decode != null)
            {
                data = decode(data);
            }
            var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, Delegate.create(onLoader, url));
            loader.loadBytes(data);
        }

        private function onLoader(e:Event, url:String):void
        {
            var i:int;
            var item:CacheLoaderInfo = null;
            var bmpInfo:BmpInfo = null;
            var loaderInfo:LoaderInfo = e.target as LoaderInfo;
            loaderInfo.removeEventListener(Event.COMPLETE, onLoader);
            var len:int = _waitList.length;
            i = 0;
            while (i < len)
            {
                item = _waitList[i];
                if (item)
                {
                    if (item.url == url)
                    {
                        _waitList.splice(i, 1);
                        i--;
                        for each (var cacheInfo:BmpInfo in _cacheList)
                        {
                            if (cacheInfo.url == item.url)
                            {
                                bmpInfo = cacheInfo;
                                break;
                            }
                        }
                        if (bmpInfo == null)
                        {
                            bmpInfo = new BmpInfo();
                            bmpInfo.url = item.url;
                            bmpInfo.bmp = loaderInfo.content as Bitmap;
                            addCache(bmpInfo);
                        }
                        if (item.event != null)
                        {
                            item.event(bmpInfo);
                        }
                        item.event = null;
                        item.error = null;
                    }
                }
                i++;
            }
            loaderInfo.loader.unload();
        }

        private function addCache(info:BmpInfo):void
        {
            var i:int;
            var item:BmpInfo = null;
            var len:int = _cacheList.length;
            if (len > MAX)
            {
                i = 0;
                while (i < len)
                {
                    item = _cacheList[i];
                    _cacheList.splice(i, 1);
                    if (item && item.bmp)
                    {
                        item.bmp.bitmapData.dispose();
                    }
                    item = null;
                    break;
                }
            }
            _cacheList.push(info);
        }

        private function onIOError(url:String):void
        {
            var i:int;
            var item:CacheLoaderInfo = null;
            var len:int = _waitList.length;
            i = 0;
            while (i < len)
            {
                item = _waitList[i];
                if (item)
                {
                    if (item.url == url)
                    {
                        _waitList.splice(i, 1);
                        i--;
                        if (item.error != null)
                        {
                            item.error(item.id);
                        }
                        item.event = null;
                        item.error = null;
                    }
                }
                i++;
            }
        }
    }
}