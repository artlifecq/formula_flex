package com.game.mainCore.libCore.pool
{
    import __AS3__.vec.Vector;
    
    import org.client.mainCore.utils.ClassConstruct;

    public class Pool 
    {

        private var _name:String;
        private var _maxSize:int;
        private var _objArr:Vector.<IPoolClass>;

        public function Pool($name:String="", $mSize:int=2147483647)
        {
            if ($mSize < 0)
            {
                throw new Error("Pool:数量不能小于0");
            }
            _name = $name;
            _maxSize = $mSize;
            _objArr = new Vector.<IPoolClass>();
        }

        public function createObj($class:Class, ... str):IPoolClass
        {
            var obj:IPoolClass = null;
            if (_objArr.length == 0)
            {
                obj = ClassConstruct.construct($class, str);
            }
            else
            {
                obj = _objArr.pop();
                obj.reSet(str);
            }
            return obj;
        }

        public function disposeObj($obj:IPoolClass):void
        {
            if ($obj == null)
            {
                return;
            }
            $obj.dispose();
            if (_objArr.indexOf($obj) == -1)
            {
                _objArr[_objArr.length] = $obj;
                resize(_maxSize);
            }
        }

        public function get length():int
        {
            return _objArr.length;
        }

        public function resize($size:int):void
        {
            if ($size < 0)
            {
                return;
            }
            _maxSize = $size;
            while (_objArr.length > _maxSize)
            {
                _objArr.pop();
            }
        }

        public function removeObj($obj:IPoolClass):void
        {
            $obj.dispose();
            var i:int = _objArr.indexOf($obj);
            if (i != -1)
            {
                _objArr.splice(i, 1);
            }
        }

        public function removeAllObjs():void
        {
            var item:IPoolClass = null;
            var len:int = _objArr.length;
            while (len-- > 0)
            {
                if (item)
                {
                    item = _objArr[len];
                    item.dispose();
                }
            }
            _objArr.length = 0;
        }

        public function get name():String
        {
            return _name;
        }
    }
}