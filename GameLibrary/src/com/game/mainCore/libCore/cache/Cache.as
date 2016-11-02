//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.cache
{
    import com.game.mainCore.libCore.vo.LNode;
    import flash.utils.Dictionary;
    import flash.utils.*;

    public class Cache 
    {

        private static var _nextId:int = 0;

        private var _name:String;
        private var _length:int;
        private var _maxSize:int;
        private var _head:LNode;
        private var _dict:Dictionary;

        public function Cache($name:String="", $mSize:int=2147483647)
        {
            if (($mSize < 0))
            {
                throw (new Error("缓存个数必须为非负数"));
            };
            _name = ((($name)!="") ? $name : ("Cache" + _nextId++));
            _maxSize = $mSize;
            _head = null;
            _length = 0;
            _dict = new Dictionary();
        }

        public function has($key:String):Boolean
        {
            return (!((_dict[$key] == null)));
        }

        public function getCache($key:String):Object
        {
            var cu:CacheUnit = _dict[$key];
            promote(cu);
            return (cu.data);
        }

        public function remove($key:String):void
        {
            var cu:CacheUnit = _dict[$key];
            if (cu)
            {
                if ((cu == _head))
                {
                    _head = _head.pre;
                };
                cu.pre.next = cu.next;
                cu.next.pre = cu.pre;
                destroy(cu);
                _length--;
            };
        }

        public function push($data:Object, $key:String):void
        {
            var cu = null;
            if (has($key))
            {
                promote(_dict[$key]);
                return;
            };
            cu = new CacheUnit($data, $key);
            _dict[$key] = cu;
            if ((_length == 0))
            {
                _head = cu;
                _head.pre = cu;
                _head.next = cu;
            }
            else
            {
                cu.pre = _head;
                cu.next = _head.next;
                cu.pre.next = cu;
                cu.next.pre = cu;
                _head = cu;
            };
            _length++;
            if ((_length > _maxSize))
            {
                cu = _head.next;
                cu.pre.next = cu.next;
                cu.next.pre = cu.pre;
                destroy(cu);
                _length--;
            };
        }

        public function resize($size:int):void
        {
            var cu = null;
            if (((($size < 0)) || (($size == _maxSize))))
            {
                return;
            };
            while (_length > $size)
            {
                cu = _head.next;
                cu.pre.next = cu.next;
                cu.next.pre = cu.pre;
                destroy(cu);
                _length--;
            };
            _maxSize = $size;
        }

        public function dispose():void
        {
            var ms:int = _maxSize;
            resize(0);
            _maxSize = ms;
        }

        public function getAllKeys():Array
        {
            var arr:Array = [];
            for (var key:String in _dict)
            {
                arr.push(key);
            };
            return (arr);
        }

        public function getAllValues():Array
        {
            var arr:Array = [];
            for (var key:String in _dict)
            {
                arr.push(_dict[key]);
            };
            return (arr);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get length():int
        {
            return (_length);
        }

        private function promote($cu:CacheUnit):void
        {
            if (((($cu == null)) || (($cu == _head))))
            {
                return;
            };
            if (($cu.pre == _head))
            {
                _head = $cu;
            }
            else
            {
                $cu.next.pre = $cu.pre;
                $cu.pre.next = $cu.next;
                $cu.pre = _head;
                $cu.next = _head.next;
                _head.next.pre = $cu;
                _head.next = $cu;
                _head = $cu;
            };
        }

        private function destroy($cu:LNode):void
        {
            delete _dict[$cu.id];
            ($cu as CacheUnit).dispose();
            $cu = null;
        }


    }
}//package com.game.mainCore.libCore.cache
