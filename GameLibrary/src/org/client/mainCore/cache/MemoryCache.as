//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.cache
{
    import __AS3__.vec.Vector;
    import org.client.mainCore.cache.interfaces.ICacheInfo;

    public class MemoryCache extends BaseCache 
    {

        public static const EXPIRED_INTERVAL:int = 300000;

        private var cacheMap:Object;
        private var lruLinks:Vector.<String>;
        private var _expired:int = 300000;

        public function MemoryCache(size:int=500)
        {
            cacheMap = {};
            cacheMap = {};
            lruLinks = new Vector.<String>();
            super(size);
        }

        protected function newPoolInf(keyName:String, body:Object):ICacheInfo
        {
            var currTime:int = (new Date().getTime() / 1000);
            var lCache:ICacheInfo = new CacheInfo();
            lCache.setKeyName(keyName);
            lCache.setBody(body);
            lCache.setUpdateTime(currTime);
            lCache.setCount(0);
            lCache.setExpired(300000);
            return (lCache);
        }

        override public function clearExpired():void
        {
            if ((((lruLinks.length == 0)) || ((expired <= 0))))
            {
                return;
            };
            var key:String = lruLinks[(lruLinks.length - 1)];
            var poolInf:ICacheInfo = getCacheInfo(key);
            var pTime:int = (poolInf.getUpdateTime() + expired);
            var getTime:int = (new Date().getTime() / 1000);
            while ((((pTime < getTime)) && ((lruLinks.length > 0))))
            {
                removeCache(poolInf.getKeyName());
                if (lruLinks.length == 0) break;
                key = lruLinks[(lruLinks.length - 1)];
                poolInf = getCacheInfo(key);
                pTime = (poolInf.getUpdateTime() + expired);
            };
        }

        override public function getCache(keyName:String)
        {
            var cacheInf:ICacheInfo = getCacheInfo(keyName);
            if (!cacheInf)
            {
                return (null);
            };
            return (cacheInf.getBody());
        }

        override public function getCacheInfo(keyName:String):ICacheInfo
        {
            var tid:int = lruLinks.indexOf(keyName);
            if (tid < 0)
            {
                return (null);
            };
            if (tid > 0)
            {
                lruLinks.splice(tid, 1);
                lruLinks.unshift(keyName);
            };
            var res:ICacheInfo = (cacheMap[keyName] as ICacheInfo);
            var currTime:int = (new Date().getTime() / 1000);
            res.setUpdateTime(currTime);
            res.setCount((res.getCount() + 1));
            return (res);
        }

        override public function hasCache(keyName:String):Boolean
        {
            return ((lruLinks.indexOf(keyName) >= 0));
        }

        override public function putCacheInfo(cacheInf:ICacheInfo):ICacheInfo
        {
            if ((cacheInf.getKeyName() == null))
            {
                (trace("缓存对象的主键为空!缓存失败"));
                return (cacheInf);
            };
            cacheMap[cacheInf.getKeyName()] = cacheInf;
            if ((lruLinks.indexOf(cacheInf.getKeyName()) < 0))
            {
                lruLinks.unshift(cacheInf.getKeyName());
            };
            lruRemoveCache();
            return (cacheInf);
        }

        override public function putInCache(keyName:String, body:Object)
        {
            var lCache:ICacheInfo = newPoolInf(keyName, body);
            putCacheInfo(lCache);
            return (body);
        }

        override public function removeCache(keyName:String):void
        {
            if (!(hasCache(keyName)))
            {
                return;
            };
            var tid:int = lruLinks.indexOf(keyName);
            lruLinks.splice(tid, 1);
            var res:ICacheInfo = (cacheMap[keyName] as ICacheInfo);
            res.dispose();
            cacheMap[keyName] = null;
            delete cacheMap[keyName]; //not popped
        }

        override public function removeAllCache():void
        {
            for each (var res:ICacheInfo in cacheMap)
            {
                res.dispose();
            };
            cacheMap = {};
            lruLinks = new Vector.<String>();
        }

        private function lruRemoveCache():void
        {
            var keyName = null;
            var res = null;
            while ((((capacity > 0)) && ((lruLinks.length > capacity))))
            {
                keyName = lruLinks.pop();
                res = (cacheMap[keyName] as ICacheInfo);
                res.dispose();
                cacheMap[keyName] = null;
                delete cacheMap[keyName];
            };
        }

        override public function dispose():void
        {
            removeAllCache();
            super.dispose();
        }

        override public function set capacity(value:int):void
        {
            super.capacity = value;
            lruRemoveCache();
        }

        override public function get size():int
        {
            return (((lruLinks) ? (lruLinks.length) : 0));
        }

        public function get expired():int
        {
            return (_expired);
        }

        public function set expired(value:int):void
        {
            _expired = value;
        }


    }
}//package org.client.mainCore.cache
