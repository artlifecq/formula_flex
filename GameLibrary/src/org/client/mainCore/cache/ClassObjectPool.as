package org.client.mainCore.cache
{
    import flash.display.BitmapData;
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    import flash.utils.getQualifiedClassName;
    import flash.utils.getTimer;
    
    import __AS3__.vec.Vector;
    
    import org.client.mainCore.cache.interfaces.ICacheInfo;
    import org.client.mainCore.cache.interfaces.IRecycle;
    import org.client.mainCore.cache.interfaces.IReset;

    public class ClassObjectPool 
    {

        public static const DEFAULT_CACHE_CAPACITY:int = 500;
        public static const NO_ITEM_CACHE:int = -1;
        public static const AUTO_ITEM_CACHE:int = 0;

        private var cacheMap:Object;
        private var cacheLink:Vector.<ICacheInfo>;
        protected var _clearPeriod:int = 60000;
        protected var _expired:int = 60000;
        private var _capacity:int = 500;
        private var periodTimer:Timer;
        private var objLs:Array;
        public var diposeBitmapDate:Boolean = true;

        public function ClassObjectPool(aCapacity:int=100, periodTime:int=60000, expireTime:int=60000)
        {
            objLs = [];
            super();
            cacheMap = {};
            cacheLink = new Vector.<ICacheInfo>();
            clearPeriod = periodTime;
            expired = expireTime;
            _capacity = aCapacity;
        }

        public function putInPool(obj:Object, key:String=null):void
        {
            var clsName:String = null;
            if (obj == null)
            {
                return;
            }
            if (obj is Class)
            {
                throw new Error("只能放入class创建出来的实例对象,不能放入class");
            }
            if (objLs.indexOf(obj) >= 0)
            {
                return;
            }
            if (key && key.length)
            {
                clsName = key;
            }
            else
            {
                clsName = changeClassName(obj);
            }
            var arr:Array = cacheMap[clsName];
            if (!arr)
            {
                var _local6:Array = [];
                cacheMap[clsName] = _local6;
                arr = _local6;
            }
            if (obj is IRecycle)
            {
                (obj as IRecycle).dispose();
            }
            var poolInf:ICacheInfo = newPoolInf(clsName, obj);
            arr.push(poolInf);
            cacheLink.push(poolInf);
            objLs.push(obj);
            lruRemoveCache();
        }

        protected function newPoolInf(keyName:String, obj:Object):ICacheInfo
        {
            var poolInf:ICacheInfo = new CacheInfo();
            poolInf.setBody(obj);
            poolInf.setKeyName(keyName);
            poolInf.setExpired(expired);
            poolInf.setUpdateTime(getTimer());
            poolInf.setCount(0);
            return poolInf;
        }

        protected function lruRemoveCache():void
        {
            var resObj:ICacheInfo = null;
            while (cacheLink.length > capacity)
            {
                resObj = cacheLink[(cacheLink.length - 1)];
                if (resObj.getBody() is BitmapData && diposeBitmapDate)
                {
                    (resObj.getBody() as BitmapData).dispose();
                }
                removePoolInf(resObj);
            }
        }

        private function removePoolInf(resObj:ICacheInfo):void
        {
            resObj.setBody(null);
            var clsName:String = resObj.getKeyName();
            resObj.dispose();
            var arr:Array = cacheMap[clsName];
            if (!arr && arr.length == 0)
            {
                trace("无此缓存，删除失败");
                return;
            }
            arr.splice(arr.indexOf(resObj), 1)[0];
            objLs.splice(objLs.indexOf(resObj.getBody()), 1)[0];
            var linkId:int = cacheLink.indexOf(resObj);
            cacheLink.splice(linkId, 1)[0];
            if (arr.length == 0)
            {
                cacheMap[clsName] = null;
                delete cacheMap[clsName];
            }
        }

        private function changeClassName(classKey:Object):String
        {
            if (classKey is String || classKey is Number)
            {
                return String(classKey);
            }
            return getQualifiedClassName(classKey);
        }

        public function getObj(claKey:Object, key:String=null)
        {
            var clsName:String = null;
            var resObj = null;
            var res:*;
            if (key == null)
            {
                clsName = changeClassName(claKey);
            }
            else
            {
                clsName = key;
            }
            var arr:Array = cacheMap[clsName];
            if (arr && arr.length > 0)
            {
                resObj = arr[0];
                res = resObj.getBody();
                removePoolInf(resObj);
                return res;
            }
            return null;
        }

        public function getAndCreateObj(claKey:Class, params:Array=null):*
        {
            var res:* = getObj(claKey);
            if (!res)
            {
                return construct(claKey, params);
            }
            if (res is IReset)
            {
                (res as IReset).reset();
            }
            return res;
        }

        public function clearExpired():void
        {
            if (cacheLink.length == 0)
            {
                return;
            };
            var poolInf:ICacheInfo = (cacheLink[(cacheLink.length - 1)] as ICacheInfo);
            var pTime:int = (poolInf.getUpdateTime() + poolInf.getExpired());
            while ((((pTime < getTimer())) && ((cacheLink.length > 0))))
            {
                if ((((poolInf.getBody() is BitmapData)) && (diposeBitmapDate)))
                {
                    (poolInf.getBody() as BitmapData).dispose();
                };
                removePoolInf(poolInf);
                if ((cacheLink.length == 0)) break;
                poolInf = cacheLink[(cacheLink.length - 1)];
                pTime = (poolInf.getUpdateTime() + poolInf.getExpired());
            };
        }

        public function removeAllCache():void
        {
            var resObj = null;
            while (cacheLink.length)
            {
                resObj = cacheLink[(cacheLink.length - 1)];
                if ((((resObj.getBody() is BitmapData)) && (diposeBitmapDate)))
                {
                    (resObj.getBody() as BitmapData).dispose();
                };
                removePoolInf(resObj);
            };
            cacheMap = {};
            objLs = [];
            cacheLink = new Vector.<ICacheInfo>();
        }

        public function removeTimer():void
        {
            if (periodTimer)
            {
                periodTimer.removeEventListener("timer", onClearTime);
            };
            periodTimer = null;
        }

        public function get capacity():int
        {
            return (_capacity);
        }

        public function set capacity(value:int):void
        {
            super.capacity = value;
            lruRemoveCache();
        }

        public function get clearPeriod():int
        {
            return (_clearPeriod);
        }

        public function set clearPeriod(value:int):void
        {
            _clearPeriod = value;
            removeTimer();
            if ((value == 0))
            {
                return;
            };
            periodTimer = new Timer(_clearPeriod);
            periodTimer.addEventListener("timer", onClearTime);
        }

        public function get expired():int
        {
            return (_expired);
        }

        public function set expired(value:int):void
        {
            _expired = value;
        }

        public function dispose():void
        {
            removeAllCache();
            removeTimer();
        }

        public function construct(type:Class, parameters:Array)
        {
            if (!parameters)
            {
                return (new (type)());
            };
            switch (parameters.length)
            {
                case 0:
                    return (new (type)());
                case 1:
                    return (new (type)(parameters[0]));
                case 2:
                    return (new (type)(parameters[0], parameters[1]));
                case 3:
                    return (new (type)(parameters[0], parameters[1], parameters[2]));
                case 4:
                    return (new (type)(parameters[0], parameters[1], parameters[2], parameters[3]));
                case 5:
                    return (new (type)(parameters[0], parameters[1], parameters[2], parameters[3], parameters[4]));
                case 6:
                    return (new (type)(parameters[0], parameters[1], parameters[2], parameters[3], parameters[4], parameters[5]));
                case 7:
                    return (new (type)(parameters[0], parameters[1], parameters[2], parameters[3], parameters[4], parameters[5], parameters[6]));
                case 8:
                    return (new (type)(parameters[0], parameters[1], parameters[2], parameters[3], parameters[4], parameters[5], parameters[6], parameters[7]));
                case 9:
                    return (new (type)(parameters[0], parameters[1], parameters[2], parameters[3], parameters[4], parameters[5], parameters[6], parameters[7], parameters[8]));
                case 10:
                    return (new (type)(parameters[0], parameters[1], parameters[2], parameters[3], parameters[4], parameters[5], parameters[6], parameters[7], parameters[8], parameters[9]));
                default:
                    return (null);
            };
        }

        private function onClearTime(e:TimerEvent):void
        {
            clearExpired();
        }
    }
}