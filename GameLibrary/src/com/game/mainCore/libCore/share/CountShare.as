package com.game.mainCore.libCore.share
{
    import flash.utils.Dictionary;
    import flash.utils.getTimer;
    
    import __AS3__.vec.Vector;
    
    import org.client.mainCore.utils.Tick;

	/**
	 * 计数数据类型 
	 * @author NEIL
	 * 
	 */	
    public class CountShare 
    {

        private var _shareDataDict:Dictionary;
        private var _waitingDestroyShareDataDict:Dictionary;
        private var _destroyDelay:int;
        private var _count:int = 0;
        private var count:int = 0;

        public function CountShare($destroyDelay:int)
        {
            _destroyDelay = $destroyDelay;
            _shareDataDict = new Dictionary();
            _waitingDestroyShareDataDict = new Dictionary();
            Tick.addCallback(checkUninstall);
        }

        public function hasShareData($key:String):Boolean
        {
            return _shareDataDict[$key] != null;
        }

        public function getShareData($key:String):CountShareData
        {
            var csd:CountShareData = (_shareDataDict[$key] as CountShareData);
            return csd;
        }

        public function addShareData($key:String, $csd:CountShareData):void
        {
            var csd:CountShareData = getShareData($key);
            if (csd)
            {
                csd.destroy();
                csd = null;
            }
            _shareDataDict[$key] = $csd;
            _count++;
        }

        public function removeShareData($key:String):void
        {
            var csd:CountShareData = getShareData($key);
            if (csd != null)
            {
                csd.destroy();
                csd = null;
                _count--;
            }
            _shareDataDict[$key] = null;
            delete _shareDataDict[$key];
            _waitingDestroyShareDataDict[$key] = null;
            delete _waitingDestroyShareDataDict[$key];
        }

        public function installShareData($key:String, obj:*):CountShareData
        {
            var csd:CountShareData = (_shareDataDict[$key] as CountShareData);
            csd.addCount(obj);
            if (_waitingDestroyShareDataDict[$key] != null)
            {
                _waitingDestroyShareDataDict[$key] = null;
                delete _waitingDestroyShareDataDict[$key];
            }
            return csd;
        }

        public function uninstallShareData($key:String, obj:*):void
        {
            var csd:CountShareData = (_shareDataDict[$key] as CountShareData);
            if (csd)
            {
                csd.removeCount(obj);
                if (csd.count <= 0)
                {
                    if (_waitingDestroyShareDataDict[$key] == null)
                    {
                        _waitingDestroyShareDataDict[$key] = getTimer();
                    }
                }
            }
        }

        private function checkUninstall(gapTm:uint):void
        {
            var key:String;
            var csd:CountShareData = null;
            if (++count < 700)
            {
                return;
            }
            count = count % 700;
            var nowTime:int = getTimer();
            var cnt:uint;
            for (key in _waitingDestroyShareDataDict)
            {
                cnt++;
                if (nowTime - _waitingDestroyShareDataDict[key] > _destroyDelay)
                {
                    _waitingDestroyShareDataDict[key] = null;
                    delete _waitingDestroyShareDataDict[key];
                    csd = getShareData(key);
                    if (csd)
                    {
                        if (csd.count <= 0)
                        {
                            removeShareData(key);
                        }
                    }
                }
            }
        }

        public function uninstallAll():void
        {
            var key:String;
            for (key in _shareDataDict)
            {
                removeShareData(key);
            }
            _shareDataDict = new Dictionary();
            _waitingDestroyShareDataDict = new Dictionary();
        }

        public function uninstallAllWait():void
        {
            var key:String;
            for (key in _waitingDestroyShareDataDict)
            {
                removeShareData(key);
            }
        }

        public function get cacheCnt():int
        {
            return _count;
        }

        public function getAllCacheKeyList():Vector.<String>
        {
            var list:Vector.<String> = new Vector.<String>();
            for (var key:String in _shareDataDict)
            {
                list.push(key);
            }
            return list;
        }

        public function getAllCacheDataList():Vector.<CountShareData>
        {
            var list:Vector.<CountShareData> = new Vector.<CountShareData>();
            for each (var data:CountShareData in _shareDataDict)
            {
                list.push(data);
            }
            return list;
        }
    }
}