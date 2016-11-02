//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.cache.interfaces
{
    public /*dynamic*/ interface ICachePool extends IRecycle 
    {

        function putInCache(_arg1:String, _arg2:Object);
        function getCache(_arg1:String);
        function removeCache(_arg1:String):void;
        function hasCache(_arg1:String):Boolean;
        function putCacheInfo(_arg1:ICacheInfo):ICacheInfo;
        function getCacheInfo(_arg1:String):ICacheInfo;
        function clearExpired():void;
        function removeAllCache():void;
        function set capacity(_arg1:int):void;
        function get capacity():int;
        function get size():int;

    }
}//package org.client.mainCore.cache.interfaces
