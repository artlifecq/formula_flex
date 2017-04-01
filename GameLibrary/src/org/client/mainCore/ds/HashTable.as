//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds
{
    import flash.utils.Dictionary;

    public class HashTable implements ICollection 
    {

        private var _length:int;
        private var _weakKeys:Boolean;
        private var _content:Dictionary;

        public function HashTable(weakKeys:Boolean=false)
        {
            _length = 0;
            _weakKeys = weakKeys;
            _content = new Dictionary(weakKeys);
        }

        public function containsKey(key:Object):Boolean
        {
            var arr = null;
            if (!((_content[key] == undefined)))
            {
                arr = _content[key];
                if ((arr.length > 0))
                {
                    return (true);
                };
            };
            return (false);
        }

        public function containsValue(value:Object):Boolean
        {
            var i:int;
            for each (var arr:Array in _content)
            {
                i = 0;
                while (i < arr.length)
                {
                    if ((arr[i] === value))
                    {
                        return (true);
                    };
                    i++;
                };
            };
            return (false);
        }

        public function isEmpty():Boolean
        {
            return ((_length == 0));
        }

        public function clear():void
        {
            _length = 0;
            for each (var arr:Array in _content)
            {
                arr = null;
            };
            _content = new Dictionary(_weakKeys);
        }

        public function clone():HashTable
        {
            var arr = null;
            var arr2 = null;
            var map:HashTable = new HashTable(_weakKeys);
            for (var key in _content)
            {
                arr = _content[key];
                arr2 = [];
                for each (var obj in arr)
                {
                    arr2.push(obj);
                };
                map.add(key, arr2);
            };
            return (map);
        }

        public function eachKey(func:Function):void
        {
            for (var key in _content)
            {
                (func(key));
            };
        }

        public function eachValue(func:Function):void
        {
            for each (var arr:Array in _content)
            {
                for each (var obj in arr)
                {
                    (func(obj));
                };
            };
        }

        public function add(key:Object, value:Object):void
        {
            if (!(containsKey(key)))
            {
                _content[key] = [];
            };
            var arr:Array = _content[key];
            arr.push(value);
            _length++;
        }

        public function remove(key:Object):Object
        {
            if (!(containsKey(key)))
            {
                return (null);
            };
            var arr:Array = _content[key];
            var obj:Object = arr.shift();
            if ((arr.length == 0))
            {
                delete _content[key];
            };
            _length--;
            return (obj);
        }

        public function get length():int
        {
            return (_length);
        }

        public function getKey(value:Object):Object
        {
            var arr = null;
            for (var key in _content)
            {
                arr = _content[key];
                for each (var obj in arr)
                {
                    if ((obj === value))
                    {
                        return (obj);
                    };
                };
            };
            return (null);
        }

        public function getKeys():Array
        {
            var arr:Array = new Array(_length);
            for (var key in _content)
            {
                arr.push(key);
            };
            return (arr);
        }

        public function toString():String
        {
            var str = null;
            for (var key in _content)
            {
                str = (str + (((("key: " + key) + " -> value: ") + _content[key]) + "\r"));
            };
            return (str);
        }

        public function getValue(key:Object):Object
        {
            if ((_content[key] == undefined))
            {
                return (null);
            };
            var arr:Array = _content[key];
            return (arr[0]);
        }

        public function getValueList(key:Object):Array
        {
            if ((_content[key] == undefined))
            {
                return (null);
            };
            return (_content[key]);
        }

        public function getValues():Array
        {
            var arr:Array = new Array(_length);
            for each (var arr2:Array in _content)
            {
                for each (var obj in arr2)
                {
                    arr.push(obj);
                };
            };
            return (arr);
        }


    }
}//package org.client.mainCore.ds
