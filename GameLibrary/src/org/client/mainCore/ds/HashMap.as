//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds
{
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;

    public class HashMap implements ICollection 
    {

        private static var _checkMapList:Vector.<HashMap> = new Vector.<HashMap>();

        private var _length:int;
        private var _content:Dictionary;
        private var _weakKeys:Boolean = false;

        public function HashMap(weakKeys:Boolean=false)
        {
            _weakKeys = weakKeys;
            _length = 0;
            _content = new Dictionary(weakKeys);
        }

        public static function getAllMapCntList():Vector.<uint>
        {
            var list:Vector.<uint> = new Vector.<uint>();
            for each (var map:HashMap in _checkMapList)
            {
                list.push(map.length);
            };
            return (list);
        }


        public function get weakKeys():Boolean
        {
            return (_weakKeys);
        }

        public function get length():int
        {
            return (_length);
        }

        public function isEmpty():Boolean
        {
            return ((_length == 0));
        }

        public function keys():Array
        {
            var i:*;
            var temp:Array = new Array(_length);
            var index:int;
            for (i in _content)
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
            for (i in _content)
            {
                temp[index] = _content[i];
                index++;
            };
            return (temp);
        }

        public function eachKey(func:Function):void
        {
            var i:*;
            for (i in _content)
            {
                (func(i));
            };
        }

        public function eachValue(func:Function):void
        {
            var i:*;
            for (i in _content)
            {
                (func(_content[i]));
            };
        }

        public function forEach(func:Function):void
        {
            var i:*;
            for (i in _content)
            {
                (func(i, _content[i]));
            };
        }

        public function containsValue(value:*):Boolean
        {
            var i:*;
            for (i in _content)
            {
                if ((_content[i] === value))
                {
                    return (true);
                };
            };
            return (false);
        }

        public function some(func:Function):Boolean
        {
            var i:*;
            for (i in _content)
            {
                if (func(i, _content[i]))
                {
                    return (true);
                };
            };
            return (false);
        }

        public function filter(func:Function):Array
        {
            var i:*;
            var v:*;
            var arr:Array = [];
            for (i in _content)
            {
                v = _content[i];
                if (func(i, v))
                {
                    arr.push(v);
                };
            };
            return (arr);
        }

        public function containsKey(key:*):Boolean
        {
            if ((_content[key] === undefined))
            {
                return (false);
            };
            return (true);
        }

        public function getValue(key:*)
        {
            var value = _content[key];
            return ((((value)===undefined) ? null : value));
        }

        public function key(value:*)
        {
            var i:*;
            for (i in _content)
            {
                if ((_content[i] == value))
                {
                    return (i);
                };
            };
            return (null);
        }

        public function add(key:*, value:*)
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
            if ((_content[key] === undefined))
            {
                _length++;
            };
            oldValue = getValue(key);
            _content[key] = value;
            return (oldValue);
        }

        public function remove(key:*)
        {
            if ((_content[key] === undefined))
            {
                return (null);
            };
            var temp = _content[key];
            delete _content[key];
            _length--;
            return (temp);
        }

        public function clear():void
        {
            _length = 0;
            _content = new Dictionary(_weakKeys);
        }

        public function clone():HashMap
        {
            var i:*;
            var temp:HashMap = new HashMap(_weakKeys);
            for (i in _content)
            {
                temp.add(i, _content[i]);
            };
            return (temp);
        }

        public function toString():String
        {
            var i:int;
            var ks:Array = keys();
            var vs:Array = getValues();
            var len:int = ks.length;
            var temp:String = "HashMap Content:\n";
            i = 0;
            while (i < len)
            {
                temp = (temp + (((ks[i] + " -> ") + vs[i]) + "\n"));
                i++;
            };
            return (temp);
        }


    }
}//package org.client.mainCore.ds
