//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.data
{
    import flash.events.EventDispatcher;
    import org.client.mainCore.ds.HashMap;
    import flash.events.IEventDispatcher;

    [Event(name="dataChange", type="fl.events.DataChangeEvent")]
    [Event(name="preDataChange", type="fl.events.DataChangeEvent")]
    public class HashMapProvider extends EventDispatcher 
    {

        private var _data:HashMap;
        public var autoUpdate:Boolean = true;

        public function HashMapProvider()
        {
            _data = new HashMap();
            super();
        }

        public function get length():uint
        {
            return (_data.length);
        }

        public function refresh():void
        {
            dispatchChangeEvent("reset", _data.getValues());
        }

        public function dispatchSelect(ed:IEventDispatcher, key:*, value:*):void
        {
            _data.add(key, value);
            ed.dispatchEvent(new DataChangeEvent("dataChange", "select", [value]));
        }

        public function dispatchSelectMulti(ed:IEventDispatcher, keys:Array, values:Array):void
        {
            var i:int;
            var len:int = keys.length;
            i = 0;
            while (i < len)
            {
                _data.add(keys[i], values[i]);
                i++;
            };
            ed.dispatchEvent(new DataChangeEvent("dataChange", "select", values.concat()));
        }

        public function add(key:*, value:*)
        {
            var old = _data.add(key, value);
            dispatchChangeEvent("add", [value]);
            return (old);
        }

        public function addMulti(keys:Array, values:Array):Array
        {
            var i:int;
            var old:*;
            var arr:Array = [];
            var len:int = keys.length;
            i = 0;
            while (i < len)
            {
                old = _data.add(keys[i], values[i]);
                if (old)
                {
                    arr.push(old);
                };
                i++;
            };
            dispatchChangeEvent("add", values.concat());
            return (arr);
        }

        public function remove(key:*)
        {
            var value = _data.remove(key);
            if (value)
            {
                dispatchChangeEvent("remove", [value]);
                return (value);
            };
            return (null);
        }

        public function removeMulti(keys:Array):Array
        {
            var value:*;
            var arr:Array = [];
            for each (var key in keys)
            {
                value = _data.remove(key);
                if (value)
                {
                    arr.push(value);
                };
            };
            if ((arr.length > 0))
            {
                dispatchChangeEvent("remove", arr.concat());
            };
            return (arr);
        }

        public function removeForValue(value:*)
        {
            var v:*;
            var key = _data.key(value);
            if (key)
            {
                v = _data.remove(key);
                if (v)
                {
                    dispatchChangeEvent("remove", [v]);
                    return (v);
                };
            };
            return (null);
        }

        public function removeMultiForValue(values:Array):Array
        {
            var key:*;
            var v:*;
            var arr:Array = [];
            for each (var value in values)
            {
                key = _data.key(value);
                if (key)
                {
                    v = _data.remove(key);
                    if (v)
                    {
                        arr.push(v);
                    };
                };
            };
            if ((arr.length > 0))
            {
                dispatchChangeEvent("remove", arr.concat());
            };
            return (arr);
        }

        public function removeAll():void
        {
            var arr:Array = _data.getValues();
            _data.clear();
            dispatchChangeEvent("removeAll", arr);
        }

        public function upDateForKey(key:*, newV:*):void
        {
            var oldV:*;
            if (_data.containsKey(key))
            {
                oldV = _data.add(key, newV);
                if (oldV)
                {
                    dispatchPreChangeEvent("update", [oldV]);
                };
                dispatchChangeEvent("update", [newV]);
            };
        }

        public function upDateForValue(oldV:*, newV:*):void
        {
            var key = _data.key(oldV);
            if (key)
            {
                _data.add(key, newV);
                dispatchPreChangeEvent("update", [oldV]);
                dispatchChangeEvent("update", [newV]);
            };
        }

        public function toHashMap():HashMap
        {
            return (_data.clone());
        }

        public function containsValue(value:*):Boolean
        {
            return (_data.containsValue(value));
        }

        public function containsKey(key:*):Boolean
        {
            return (_data.containsKey(key));
        }

        public function getValue(key:*)
        {
            return (_data.getValue(key));
        }

        public function getKey(value:*)
        {
            return (_data.key(value));
        }

        public function getValues():Array
        {
            return (_data.getValues());
        }

        public function getKeys():Array
        {
            return (_data.keys());
        }

        protected function dispatchChangeEvent(evtType:String, items:Array):void
        {
            if (!(autoUpdate))
            {
                return;
            };
            if (hasEventListener("dataChange"))
            {
                dispatchEvent(new DataChangeEvent("dataChange", evtType, items));
            };
        }

        protected function dispatchPreChangeEvent(evtType:String, items:Array):void
        {
            if (!(autoUpdate))
            {
                return;
            };
            if (hasEventListener("preDataChange"))
            {
                dispatchEvent(new DataChangeEvent("preDataChange", evtType, items));
            };
        }


    }
}//package org.client.mainCore.data
