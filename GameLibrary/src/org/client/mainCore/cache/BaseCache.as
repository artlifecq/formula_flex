package org.client.mainCore.cache
{
    import flash.events.EventDispatcher;
    import org.client.mainCore.cache.interfaces.ICachePool;
    import org.client.mainCore.cache.interfaces.ICacheInfo;
    import org.client.mainCore.cache.event.CacheEvent;

    class BaseCache extends EventDispatcher implements ICachePool 
    {

        public static const DEFAULT_CACHE_CAPACITY:int = 500;

        private var _capacity:int = 500;

        public function BaseCache(size:int=500)
        {
            _capacity = size;
        }

        public function getCache(keyName:String)
        {
            return (null);
        }

        public function getCacheInfo(keyName:String):ICacheInfo
        {
            return (null);
        }

        public function hasCache(keyName:String):Boolean
        {
            return (false);
        }

        public function putCacheInfo(cacheInf:ICacheInfo):ICacheInfo
        {
            return (null);
        }

        public function putInCache(keyName:String, body:Object)
        {
            return (null);
        }

        public function removeCache(keyName:String):void
        {
        }

        public function clearExpired():void
        {
            dispatchEvent(new CacheEvent("clear_expired"));
        }

        public function removeAllCache():void
        {
            dispatchEvent(new CacheEvent("remove_all_cache"));
        }

        public function dispose():void
        {
        }

        public function get capacity():int
        {
            return (_capacity);
        }

        public function set capacity(value:int):void
        {
            _capacity = value;
        }

        public function get size():int
        {
            return (0);
        }


    }
}