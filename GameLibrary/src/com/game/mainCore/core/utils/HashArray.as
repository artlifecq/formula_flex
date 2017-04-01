//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.utils
{
    public class HashArray 
    {

        private var _data:Array;
        private var _sortKey:String = "";

        public function HashArray()
        {
            _data = [];
            super();
        }

        public function clear():void
        {
            _data.length = 0;
        }

        public function get length():int
        {
            return (_data.length);
        }

        public function add(key:*, value:*):void
        {
            remove(key);
            _data.push([key, value]);
        }

        public function setValue(key:*, value:*):void
        {
            var arr = null;
            var i:int;
            i = 0;
            while (i < _data.length)
            {
                arr = _data[i];
                if ((arr[0] == key))
                {
                    arr[1] = value;
                    return;
                };
                i++;
            };
        }

        public function remove(key:*)
        {
            var cnt:uint;
            for each (var arr:Array in _data)
            {
                if ((arr[0] == key))
                {
                    arr = _data.splice(cnt, 1);
                    return (arr[0][1]);
                };
                cnt++;
            };
            return (null);
        }

        public function getValue(key:*)
        {
            for each (var arr:Array in _data)
            {
                if ((arr[0] == key))
                {
                    return (arr[1]);
                };
            };
            return (null);
        }

        public function contain(key:*):Boolean
        {
            for each (var arr:Array in _data)
            {
                if ((arr[0] == key))
                {
                    return (true);
                };
            };
            return (false);
        }

        public function getValues():Array
        {
            var result:Array = [];
            for each (var arr:Array in _data)
            {
                result.push(arr[1]);
            };
            return (result);
        }

        public function getKey(value:*)
        {
            for each (var arr:Array in _data)
            {
                if ((arr[1] == value))
                {
                    return (arr[0]);
                };
            };
            return (null);
        }

        public function getKeys():Array
        {
            var result:Array = [];
            for each (var arr:Array in _data)
            {
                result.push(arr[0]);
            };
            return (result);
        }

        public function sort(sortKey:String, type:int=16):void
        {
            _sortKey = sortKey;
            if (!((_sortKey == "")))
            {
                _data.sort(sortFun, type);
            };
        }

        private function sortFun(a:Object, b:Object):Number
        {
            var aParam:Array = (a as Array);
            var bParam:Array = (b as Array);
            var aValue:int = aParam[1][_sortKey];
            var bValue:int = bParam[1][_sortKey];
            if ((aValue > bValue))
            {
                return (1);
            };
            if (aValue < bValue)
            {
                return (-1);
            };
            return (0);
        }


    }
}//package com.game.mainCore.core.utils
