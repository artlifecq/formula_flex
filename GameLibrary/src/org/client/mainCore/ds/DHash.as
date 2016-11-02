//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds
{
    import flash.utils.Dictionary;

    public class DHash implements ICollection 
    {

        private var _length:int;
        private var _contentKey:Dictionary;
        private var _contentValue:Dictionary;
        private var _weakKeys:Boolean;

        public function DHash(weakKeys:Boolean=false)
        {
            _weakKeys = weakKeys;
            _length = 0;
            _contentKey = new Dictionary(weakKeys);
            _contentValue = new Dictionary(weakKeys);
        }

        public function get length():int
        {
            return (_length);
        }

        public function isEmpty():Boolean
        {
            return ((_length == 0));
        }

        public function getKeys():Array
        {
            var i:*;
            var temp:Array = new Array(_length);
            var index:int;
            for each (i in _contentValue)
            {
                temp[index] = i;
                index++;
            };
            return (temp);
        }

        public function getValues():Array
        {
            var i:*;
            var temp:Array = new Array(_length);
            var index:int;
            for each (i in _contentKey)
            {
                temp[index] = i;
                index++;
            };
            return (temp);
        }

        public function eachKey(func:Function):void
        {
            var i:*;
            for each (i in _contentValue)
            {
                (func(i));
            };
        }

        public function eachValue(func:Function):void
        {
            var i:*;
            for each (i in _contentKey)
            {
                (func(i));
            };
        }

        public function forEach(func:Function):void
        {
            var i:*;
            for (i in _contentKey)
            {
                (func(i, _contentKey[i]));
            };
        }

        public function containsValue(value:*):Boolean
        {
            return (!((_contentValue[value] === undefined)));
        }

        public function containsKey(key:*):Boolean
        {
            return (!((_contentKey[key] === undefined)));
        }

        public function contains(kv:*):Boolean
        {
            if (!((_contentKey[kv] === undefined)))
            {
                return (true);
            };
            if (!((_contentValue[kv] === undefined)))
            {
                return (true);
            };
            return (false);
        }

        public function getValue(key:*)
        {
            var value = _contentKey[key];
            return ((((value)===undefined) ? null : value));
        }

        public function getKey(value:*)
        {
            var key = _contentValue[value];
            return ((((key)===undefined) ? null : key));
        }

        public function addForKey(key:*, value:*)
        {
            var oldValue:*;
            if ((key == null))
            {
                throw (new ArgumentError("cannot put a value with undefined or null key!"));
            };
            if ((value === undefined))
            {
                return (null);
            };
            if ((_contentKey[key] === undefined))
            {
                _length++;
            };
            oldValue = getValue(key);
            delete _contentValue[oldValue];
            _contentKey[key] = value;
            _contentValue[value] = key;
            return (oldValue);
        }

        public function addForValue(value:*, key:*)
        {
            var oldKey:*;
            if ((value == null))
            {
                throw (new ArgumentError("cannot put a key with undefined or null value!"));
            };
            if ((key === undefined))
            {
                return (null);
            };
            if ((_contentValue[value] === undefined))
            {
                _length++;
            };
            oldKey = getKey(value);
            delete _contentKey[oldKey];
            _contentValue[value] = key;
            _contentKey[key] = value;
            return (oldKey);
        }

        public function removeForKey(key:*)
        {
            var value:*;
            if (!((_contentKey[key] === undefined)))
            {
                value = _contentKey[key];
                delete _contentKey[key];
                delete _contentValue[value];
                _length--;
                return (value);
            };
            return (null);
        }

        public function removeForValue(value:*)
        {
            var key:*;
            if (!((_contentValue[value] === undefined)))
            {
                key = _contentValue[value];
                delete _contentValue[value];
                delete _contentKey[key];
                _length--;
                return (key);
            };
            return (null);
        }

        public function clear():void
        {
            _length = 0;
            _contentKey = new Dictionary(_weakKeys);
            _contentValue = new Dictionary(_weakKeys);
        }

        public function clone():DHash
        {
            var i:*;
            var temp:DHash = new DHash(_weakKeys);
            for (i in _contentKey)
            {
                temp.addForKey(i, _contentKey[i]);
            };
            return (temp);
        }


    }
}//package org.client.mainCore.ds
