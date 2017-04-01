//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.cache
{
    import flash.utils.Timer;
    import __AS3__.vec.Vector;
    import flash.events.NetStatusEvent;
    import org.client.mainCore.cache.interfaces.ICacheInfo;
    import flash.events.Event;

    public class QueueDiskCache extends DiskCache 
    {

        private var _isFree:Boolean = true;
        private var storeTimer:Timer;
        private var storeQueue:Vector.<String>;
        private var storeMap:Object;
        private var _storeInterval:int = 50;

        public function QueueDiskCache(tempFileSize:int=0x600000, tempFilePath:String="game/cache-files")
        {
            super(tempFileSize, tempFilePath);
            storeQueue = new Vector.<String>();
            storeMap = {};
            storeTimer = new Timer(_storeInterval);
            storeTimer.addEventListener("timer", onTimerPutInDisk);
        }

        override protected function onFlushStatus(event:NetStatusEvent):void
        {
            super.onFlushStatus(event);
            if (allowStore)
            {
                return;
            };
            stopStoreQueue();
            storeTimer.removeEventListener("timer", onTimerPutInDisk);
        }

        override public function putCacheInfo(cacheInf:ICacheInfo):ICacheInfo
        {
            var resCache = null;
            if (!(allowStore))
            {
                return (cacheInf);
            };
            if ((cacheInf.getKeyName() == null))
            {
                (trace("主键不能为空"));
                return (cacheInf);
            };
            if (((storeQueue) && (storeQueue.length)))
            {
                resCache = (storeMap[cacheInf.getKeyName()] as ICacheInfo);
            };
            if (!(resCache))
            {
                storeQueue.push(cacheInf.getKeyName());
            };
            storeMap[cacheInf.getKeyName()] = cacheInf;
            if (((_isFree) && (!(running))))
            {
                startStoreQueue();
            };
            return (cacheInf);
        }

        override public function getCacheInfo(keyName:String):ICacheInfo
        {
            var resCache = null;
            if (!(allowStore))
            {
                return (null);
            };
            if (((storeQueue) && (storeQueue.length)))
            {
                resCache = (storeMap[keyName] as ICacheInfo);
            };
            if (resCache)
            {
                return (resCache);
            };
            return (super.getCacheInfo(keyName));
        }

        private function onTimerPutInDisk(e:Event):void
        {
            var cacheInf = null;
            if (((!(_isFree)) || (!(allowStore))))
            {
                return;
            };
            if (((storeQueue) && (storeQueue.length)))
            {
                cacheInf = storeMap[storeQueue.shift()];
                storeMap[cacheInf.getKeyName()] = null;
                delete storeMap[cacheInf.getKeyName()];
            };
            if (cacheInf)
            {
                super.putCacheInfo(cacheInf);
            }
            else
            {
                stopStoreQueue();
            };
        }

        public function startStoreQueue():void
        {
            storeTimer.start();
        }

        public function stopStoreQueue():void
        {
            storeTimer.stop();
        }

        public function get running():Boolean
        {
            return (((storeTimer) && (storeTimer.running)));
        }

        public function get isFree():Boolean
        {
            return (_isFree);
        }

        public function set isFree(value:Boolean):void
        {
            _isFree = value;
            if (_isFree)
            {
                startStoreQueue();
            }
            else
            {
                stopStoreQueue();
            };
        }

        override public function removeAllCache():void
        {
            super.removeAllCache();
            pathSO.clear();
            pathSO.flush();
            stopStoreQueue();
            storeQueue.length = 0;
            storeMap = {};
        }

        override public function removeCache(keyName:String):void
        {
            var sid:int = storeQueue.indexOf(keyName);
            if ((sid >= 0))
            {
                storeQueue.splice(sid, 1);
                storeMap[keyName] = null;
                delete storeMap[keyName];
            };
            super.removeCache(keyName);
        }

        override public function dispose():void
        {
            stopStoreQueue();
            storeTimer.removeEventListener("timer", onTimerPutInDisk);
            storeTimer = null;
            storeQueue = null;
            storeMap = null;
            super.dispose();
        }

        public function get storeInterval():int
        {
            return (_storeInterval);
        }

        public function set storeInterval(value:int):void
        {
            _storeInterval = value;
            storeTimer.delay = _storeInterval;
        }


    }
}//package org.client.mainCore.cache
