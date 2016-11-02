//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.cache.interfaces
{
    public /*dynamic*/ interface ICacheInfo extends IRecycle 
    {

        function getBody():Object;
        function setBody(_arg1:Object):void;
        function getUpdateTime():int;
        function setUpdateTime(_arg1:int):void;
        function getCount():int;
        function setCount(_arg1:int):void;
        function getExpired():int;
        function setExpired(_arg1:int):void;
        function getKeyName():String;
        function setKeyName(_arg1:String):void;
        function getVersion():String;
        function setVersion(_arg1:String):void;
        function getGroupName():String;
        function setGroupName(_arg1:String):void;
        function get dyVars():Object;
        function get isGSVars():Boolean;

    }
}//package org.client.mainCore.cache.interfaces
