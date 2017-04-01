//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.cache
{
    import flash.net.SharedObject;
    import org.client.mainCore.cache.interfaces.ICacheInfo;
    import flash.events.Event;
    import flash.events.NetStatusEvent;

    public class DiskCache extends BaseCache 
    {

        public static const DEFAULT_CACHE_DATA_SRC:String = "default_cache_data_src";
        public static const FLUSH_DISK_SIZE:int = 0x600000;
        public static const DEFAULT_FILE_PATH:String = "game/cache-files";

        protected var _so:SharedObject;
        private var _pathSO:SharedObject;
        private var _tempFilePath:String;
        private var _tempFileSize:int = 0x40000000;
        private var hasTip:Boolean = false;
        private var _allowStore:Boolean = true;
        private var _cachePathLs:Array;

        public function DiskCache(tempFileSize:int=0x600000, tempFilePath:String="game/cache-files")
        {
            _cachePathLs = [];
            super();
            _tempFilePath = tempFilePath;
            _tempFileSize = tempFileSize;
        }

        protected function newPoolInf(keyName:String, body:Object):ICacheInfo
        {
            var lCache:ICacheInfo = new CacheInfo();
            lCache.setKeyName(keyName);
            lCache.setBody(body);
            lCache.setUpdateTime((new Date().getTime() / 1000));
            lCache.setCount(0);
            return (lCache);
        }

        override public function putInCache(keyName:String, body:Object)
        {
            var lCache:ICacheInfo = newPoolInf(keyName, body);
            putCacheInfo(lCache);
            return (body);
        }

        override public function putCacheInfo(cacheInf:ICacheInfo):ICacheInfo
        {
            var val = null;
            if (!(allowStore))
            {
                return (cacheInf);
            };
            if (!(cacheInf.getKeyName()))
            {
                (trace("主键不能为空，缓存失败"));
                return (cacheInf);
            };
            try
            {
                _so = SharedObject.getLocal(((_tempFilePath + "/") + cacheInf.getKeyName()), "/");
            }
            catch(e)
            {
            };
            if ((_so == null))
            {
                return (cacheInf);
            };
            _so.data["body"] = cacheInf.getBody();
            if (((cacheInf.isGSVars) && (cacheInf.dyVars)))
            {
                for (var oName:String in cacheInf.dyVars)
                {
                    val = cacheInf.dyVars[oName];
                    _so.data[oName] = val;
                };
            }
            else
            {
                _so.data["body"] = cacheInf.getBody();
                _so.data["count"] = cacheInf.getCount();
                _so.data["expired"] = cacheInf.getExpired();
                _so.data["groupName"] = cacheInf.getGroupName();
                _so.data["keyName"] = cacheInf.getKeyName();
                _so.data["updateTime"] = cacheInf.getUpdateTime();
                _so.data["version"] = cacheInf.getVersion();
            };
            var ls:Array = cachePathLs;
            if ((ls.indexOf(cacheInf.getKeyName()) < 0))
            {
                ls.push(cacheInf.getKeyName());
            };
            var flushStatus:String;
            try
            {
                flushStatus = _so.flush(_tempFileSize);
            }
            catch(error:Error)
            {
                (trace("电脑不支持SharedObject缓存!硬盘缓存失败"));
                allowStore = false;
            };
            if ((((flushStatus == "pending")) && (!(hasTip))))
            {
                allowStore = false;
                hasTip = true;
                _so.addEventListener("netStatus", onFlushStatus);
                dispatchEvent(new Event("select"));
            }
            else
            {
                if (flushStatus == "flushed")
                {
                };
            };
            writePathInf();
            return (cacheInf);
        }

        protected function onFlushStatus(event:NetStatusEvent):void
        {
            var tmpSo:SharedObject = (event.currentTarget as SharedObject);
            switch (event.info.code)
            {
                case "SharedObject.Flush.Success":
                    allowStore = true;
                    break;
                case "SharedObject.Flush.Failed":
                    allowStore = false;
            };
            tmpSo.removeEventListener("netStatus", onFlushStatus);
            dispatchEvent(new Event("complete"));
        }

        override public function getCache(keyName:String)
        {
            var pinf:ICacheInfo = getCacheInfo(keyName);
            if (pinf)
            {
                return (pinf.getBody());
            };
            return (null);
        }

        override public function getCacheInfo(keyName:String):ICacheInfo
        {
            var pathStr = null;
            var pinf = null;
            if (!(allowStore))
            {
                return (null);
            };
            try
            {
                pathStr = ((_tempFilePath + "/") + keyName);
                _so = SharedObject.getLocal(pathStr, "/");
                pinf = new CacheInfo(_so.data);
                var _local5 = pinf;
                return (_local5);
            }
            catch(error:Error)
            {
                (trace(error, keyName, "so创建失败"));
                return (null);
            };
            return (null);
        }

        override public function removeCache(keyName:String):void
        {
            if (!(allowStore))
            {
                return;
            };
            if (!(hasCache(keyName)))
            {
                (trace("缓存对象不存在硬盘里!或者已删除掉了"));
                return;
            };
            try
            {
                _so = SharedObject.getLocal(((_tempFilePath + "/") + keyName), "/");
                _so.data["body"] = null;
                _so.clear();
                _so.flush();
                removePathInf(keyName);
                writePathInf();
            }
            catch(error:Error)
            {
                (trace("电脑不支持SharedObject缓存!"));
            };
        }

        override public function hasCache(keyName:String):Boolean
        {
            var ls:Array = cachePathLs;
            if (!(ls))
            {
                return (false);
            };
            return ((ls.indexOf(keyName) >= 0));
        }

        override public function removeAllCache():void
        {
            var ls:Array = cachePathLs;
            for each (var itm:String in ls)
            {
                removeCache(itm);
            };
            super.removeAllCache();
        }

        override public function clearExpired():void
        {
            var getTime:int = (new Date().getTime() / 1000);
            var arr:Array = [];
            for each (var itm:ICacheInfo in cachePathLs)
            {
                if (((itm.getUpdateTime() + itm.getExpired()) > getTime))
                {
                    arr.push(itm.getKeyName());
                };
            };
            for each (var key:String in arr)
            {
                removeCache(key);
            };
            super.clearExpired();
        }

        public function get allowStore():Boolean
        {
            return (_allowStore);
        }

        public function set allowStore(value:Boolean):void
        {
            _allowStore = value;
        }

        private function removePathInf(keyName:String):void
        {
            var ls:Array = cachePathLs;
            if (!ls)
            {
                return;
            };
            var tid:int = ls.indexOf(keyName);
            if ((tid < 0))
            {
                return;
            };
            ls.splice(tid, 1);
            writePathInf();
        }

        private function writePathInf():void
        {
            var pso:SharedObject = pathSO;
            if (!(pso))
            {
                return;
            };
            var flushStatus:String;
            try
            {
                if (((_cachePathLs) && (_cachePathLs.length)))
                {
                    pso.data["pathLs"] = _cachePathLs;
                    flushStatus = pso.flush();
                }
                else
                {
                    pso.clear();
                    pso.flush();
                };
            }
            catch(error:Error)
            {
                (trace("路径错误", error));
                this.allowStore = false;
            };
            if ((((flushStatus == "pending")) && (!(hasTip))))
            {
                allowStore = false;
                hasTip = true;
                _so.addEventListener("netStatus", onFlushStatus);
                dispatchEvent(new Event("select"));
            }
            else
            {
                if (flushStatus == "flushed")
                {
                };
            };
        }

        protected function get pathSO():SharedObject
        {
            var arr = null;
            if (!(allowStore))
            {
                return (null);
            };
            if (!(_pathSO))
            {
                _pathSO = SharedObject.getLocal("default_cache_data_src");
                try
                {
                    arr = _pathSO.data["pathLs"];
                    for each (var keyItem:String in arr)
                    {
                        if ((_cachePathLs.indexOf(keyItem) < 0))
                        {
                            _cachePathLs.push(keyItem);
                        };
                    };
                }
                catch(error:Error)
                {
                    try
                    {
                        _pathSO.clear();
                        _pathSO.flush();
                    }
                    catch(error:Error)
                    {
                        (trace(error, "读取路径出错"));
                    };
                };
            };
            return (_pathSO);
        }

        public function get cachePathLs():Array
        {
            var so:SharedObject = pathSO;
            return (_cachePathLs);
        }

        override public function dispose():void
        {
            _so = null;
            _pathSO = null;
            super.dispose();
        }


    }
}//package org.client.mainCore.cache
