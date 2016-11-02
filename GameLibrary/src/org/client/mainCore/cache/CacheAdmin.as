//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.cache
{
    import org.client.mainCore.cache.interfaces.ICachePool;
    import flash.utils.Timer;
    import org.client.mainCore.cache.interfaces.ICacheInfo;
    import flash.events.TimerEvent;

    public class CacheAdmin implements ICachePool 
    {

        private var _expired:int;
        private var _cacheType:int;
        private var _capacity:int = 500;
        private var _clearPeriod:int = 60000;
        private var diskCache:ICachePool;
        private var memCache:ICachePool;
        private var periodTimer:Timer;

        public function CacheAdmin(size:int=500, cacheType:int=0, tempFileSize:int=0x600000, tempFilePath:String="game/cache-files")
        {
            _capacity = 500;
            _cacheType = cacheType;
            diskCache = newDiskCache(tempFileSize, tempFilePath);
            memCache = newMemoryCache(size);
        }

        protected function newDiskCache(tempFileSize:int=0x600000, tempFilePath:String="game/cache-files"):ICachePool
        {
            return (new QueueDiskCache(tempFileSize, tempFilePath));
        }

        protected function newMemoryCache(size:int=500):ICachePool
        {
            return (new MemoryCache(size));
        }

        public function setDiskCache(cachePool:ICachePool):void
        {
            diskCache = cachePool;
        }

        public function setMemCache(cachePool:ICachePool):void
        {
            memCache = cachePool;
        }

        protected function newPoolInf(keyName:String, body:Object, version:String=null):ICacheInfo
        {
            var lCache:ICacheInfo = new CacheInfo();
            lCache.setKeyName(keyName);
            lCache.setBody(body);
            lCache.setUpdateTime((new Date().getTime() / 1000));
            lCache.setCount(0);
            lCache.setExpired(expired);
            lCache.setVersion(version);
            return (lCache);
        }

        public function putCacheDoVersion(keyName:String, body:Object, version:String=null):void
        {
            var cacheInf:ICacheInfo = newPoolInf(keyName, body, version);
            putCacheInfo(cacheInf);
        }

        public function getCacheDoVersion(keyName:String, body:Object, version:String=null):Object
        {
            var cacheInf:ICacheInfo = getCacheInfo(keyName);
            if (((cacheInf) && ((cacheInf.getVersion() == version))))
            {
                return (cacheInf.getBody());
            };
            return (null);
        }

        public function putInCache(keyName:String, body:Object)
        {
            if ((((cacheType == 0)) || ((cacheType == 1))))
            {
                memCache.putInCache(keyName, body);
            };
            if ((((cacheType == 0)) || ((cacheType == 2))))
            {
                diskCache.putInCache(keyName, body);
            };
            return (body);
        }

        public function putCacheInfo(cacheInf:ICacheInfo):ICacheInfo
        {
            if ((((cacheType == 0)) || ((cacheType == 1))))
            {
                memCache.putCacheInfo(cacheInf);
            };
            if ((((cacheType == 0)) || ((cacheType == 2))))
            {
                diskCache.putCacheInfo(cacheInf);
            };
            return (cacheInf);
        }

        public function getCache(keyName:String)
        {
            var cacheInf:ICacheInfo = getCacheInfo(keyName);
            if (cacheInf)
            {
                return (cacheInf.getBody());
            };
            return (null);
        }

        public function getCacheInfo(keyName:String):ICacheInfo
        {
            var cacheInf = null;
            if ((((cacheType == 0)) || ((cacheType == 1))))
            {
                cacheInf = memCache.getCacheInfo(keyName);
                if (cacheInf)
                {
                    return (cacheInf);
                };
            };
            if ((((cacheType == 0)) || ((cacheType == 2))))
            {
                return (diskCache.getCacheInfo(keyName));
            };
            return (null);
        }

        public function removeCache(keyName:String):void
        {
            memCache.removeCache(keyName);
            diskCache.removeCache(keyName);
        }

        public function removeAllCache():void
        {
            memCache.removeAllCache();
            diskCache.removeAllCache();
        }

        public function clearExpired():void
        {
            diskCache.clearExpired();
            memCache.clearExpired();
        }

        public function hasCache(keyName:String):Boolean
        {
            var cacheInf = null;
            if ((((cacheType == 0)) || ((cacheType == 1))))
            {
                cacheInf = memCache.getCacheInfo(keyName);
                if (cacheInf)
                {
                    return (true);
                };
            };
            if ((((cacheType == 0)) || ((cacheType == 2))))
            {
                cacheInf = diskCache.getCacheInfo(keyName);
                if (cacheInf)
                {
                    return (true);
                };
            };
            return (false);
        }

        private function onClearTime(e:TimerEvent):void
        {
            memCache.clearExpired();
        }

        public function removeTimer():void
        {
            periodTimer.removeEventListener("timer", onClearTime);
            periodTimer = null;
        }

        public function get cacheType():int
        {
            return (_cacheType);
        }

        public function set cacheType(value:int):void
        {
            _cacheType = value;
        }

        public function get expired():int
        {
            return (_expired);
        }

        public function set expired(value:int):void
        {
            _expired = value;
        }

        public function get capacity():int
        {
            return (_capacity);
        }

        public function set capacity(value:int):void
        {
            _capacity = value;
            if (memCache)
            {
                memCache.capacity = value;
            };
        }

        public function get clearPeriod():int
        {
            return (_clearPeriod);
        }

        public function set clearPeriod(value:int):void
        {
            _clearPeriod = value;
            removeTimer();
            if ((value <= 0))
            {
                return;
            };
            periodTimer = new Timer(_clearPeriod);
            periodTimer.addEventListener("timer", onClearTime);
        }

        public function get size():int
        {
            return (memCache.size);
        }

        public function dispose():void
        {
            removeTimer();
            periodTimer = null;
            memCache.dispose();
            diskCache.dispose();
        }


    }
}//package org.client.mainCore.cache
