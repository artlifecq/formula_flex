//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.cache
{
    import org.client.mainCore.cache.interfaces.ICacheInfo;

    public class CacheInfo implements ICacheInfo 
    {

        protected var _vars:Object;

        public function CacheInfo(vars:Object=null)
        {
            var val = null;
            super();
            _vars = {};
            if (!vars)
            {
                return;
            };
            for (var oName:String in vars)
            {
                val = vars[oName];
                _set(oName, val);
            };
        }

        protected function _set(property:String, value:*):CacheInfo
        {
            if ((value == null))
            {
                delete _vars[property];
            }
            else
            {
                _vars[property] = value;
            };
            return (this);
        }

        public function getBody():Object
        {
            return (_vars["body"]);
        }

        public function getCount():int
        {
            return (_vars["count"]);
        }

        public function getExpired():int
        {
            return (_vars["expired"]);
        }

        public function getGroupName():String
        {
            return (_vars["groupName"]);
        }

        public function getKeyName():String
        {
            return (_vars["keyName"]);
        }

        public function getUpdateTime():int
        {
            return (_vars["updateTime"]);
        }

        public function getVersion():String
        {
            return (_vars["version"]);
        }

        public function setBody(value:Object):void
        {
            _set("body", value);
        }

        public function setCount(value:int):void
        {
            _set("count", value);
        }

        public function setExpired(value:int):void
        {
            _set("expired", value);
        }

        public function setGroupName(value:String):void
        {
            _set("groupName", value);
        }

        public function setKeyName(value:String):void
        {
            _set("keyName", value);
        }

        public function setUpdateTime(value:int):void
        {
            _set("updateTime", value);
        }

        public function setVersion(value:String):void
        {
            _set("version", value);
        }

        public function get dyVars():Object
        {
            return (_vars);
        }

        public function get isGSVars():Boolean
        {
            return (true);
        }

        public function dispose():void
        {
            _vars = {};
        }


    }
}//package org.client.mainCore.cache
