package org.client.mainCore.data
{
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;

    [Event(name="dataChange", type="fl.events.DataChangeEvent")]
    [Event(name="preDataChange", type="fl.events.DataChangeEvent")]
    public class ArrayProvider extends EventDispatcher 
    {

        private var _data:Array;
        public var autoUpdate:Boolean = true;

        public function ArrayProvider(data:Array=null)
        {
            _data = [];
            super();
            if (data)
            {
                _data = data.concat();
            }
        }

        public function get length():uint
        {
            return _data.length;
        }

        public function refresh():void
        {
            dispatchChangeEvent("reset", _data.concat(), 0, (_data.length - 1));
        }

        public function dispatchSelect(ed:IEventDispatcher, item:*):void
        {
            var index:int = _data.push(item);
            ed.dispatchEvent(new DataChangeEvent("dataChange", "select", [item], index, index));
        }

        public function dispatchSelectMulti(ed:IEventDispatcher, items:Array):void
        {
            var len:int = (_data.length - 1);
            _data.splice(len, 0, items);
            ed.dispatchEvent(new DataChangeEvent("dataChange", "select", items, len, (_data.length - 1)));
        }

        public function add(item:*):void
        {
            var index:int = _data.push(item);
            dispatchChangeEvent("add", [item], index, index);
        }

        public function addAt(item:*, index:uint):void
        {
            checkIndex(index);
            _data.splice(index, 0, item);
            dispatchChangeEvent("add", [item], index, index);
        }

        public function addMulti(items:Array):void
        {
            addMultiAt(items, (_data.length - 1));
        }

        public function addMultiAt(items:Array, index:uint):void
        {
            checkIndex(index);
            _data.splice(index, 0, items);
            dispatchChangeEvent("add", items.concat(), index, ((index + items.length) - 1));
        }

        public function getItemAt(index:uint):*
        {
            checkIndex(index);
            return _data[index];
        }

        public function getItemIndex(item:*):int
        {
            return _data.indexOf(item);
        }

        public function contains(item:*):Boolean
        {
            if (_data.indexOf(item) == -1)
            {
                return false;
            }
            return true;
        }

        public function remove(item:*):*
        {
            var index:int = _data.indexOf(item);
            if (index != -1)
            {
                return removeAt(index)[0];
            }
            return null;
        }

        public function removeAt(index:uint, count:uint=1):Array
        {
            checkIndex(index);
            var arr:Array = _data.splice(index, count);
            dispatchChangeEvent("remove", arr.concat(), index, ((index + arr.length) - 1));
            return arr;
        }

        public function removeAll():void
        {
            var arr:Array = _data.concat();
            _data = [];
            dispatchChangeEvent("removeAll", arr, 0, (arr.length - 1));
        }

        public function removeMulti(items:Array):Array
        {
            items = items;
            var arr:Array = [];
            _data = _data.filter(function (item:*, index:int, array:Array):Boolean
            {
                if (items.indexOf(item) == -1)
                {
                    return true;
                }
                arr.push(item);
                return false;
            }, this);
            if (arr.length > 0)
            {
                dispatchChangeEvent("remove", arr.concat(), 0, (arr.length - 1));
            }
            return arr;
        }

        public function removeMultiIndex(indexs:Array):Array
        {
            indexs = indexs;
            var arr:Array = [];
            _data = _data.filter(function (item:*, index:int, array:Array):Boolean
            {
                if ((indexs.indexOf(index) == -1))
                {
                    return (true);
                };
                arr.push(item);
                return (false);
            }, this);
            if ((arr.length > 0))
            {
                dispatchChangeEvent("remove", arr.concat(), 0, (arr.length - 1));
            }
            return arr;
        }

        public function removeForProperty(p:String, value:*):*
        {
			var _item:*;
			var _index:int;
            var b:Boolean = _data.some(function (item:*, index:int, array:Array):Boolean
            {
                if (item[p] == value)
                {
                    _item = item;
                    _index = index;
                    return true;
                };
                return false;
            }, this);
            if (b)
            {
                dispatchChangeEvent("remove", [_item], _index, _index);
            }
            return _item;
        }

        public function removeMultiForProperty(p:String, value:*):Array
        {
            p = p;
            value = value;
            var arr:Array = [];
            _data = _data.filter(function (item:*, index:int, array:Array):Boolean
            {
                if ((item[p] == value))
                {
                    arr.push(item);
                    return (false);
                };
                return (true);
            }, this);
            if ((arr.length == 0))
            {
                return (arr);
            };
            dispatchChangeEvent("remove", arr, 0, (arr.length - 1));
            return (arr);
        }

        public function upDateItem(oldItem:*, newItem:*)
        {
            var index:int = _data.indexOf(oldItem);
            if (!((index == -1)))
            {
                return (upDateItemAt(index, newItem));
            };
            return (null);
        }

        public function upDateItemAt(index:uint, newItem:*)
        {
            checkIndex(index);
            var oldItem = _data[index];
            dispatchPreChangeEvent("update", [oldItem], index, index);
            _data[index] = newItem;
            dispatchChangeEvent("update", [newItem], index, index);
            return (oldItem);
        }

        public function setItemIndex(item:*, newIndex:int):void
        {
            checkIndex(newIndex);
            var index:int = _data.indexOf(item);
            if ((index == -1))
            {
                return;
            };
            setItemIndexAt(index, newIndex);
        }

        public function setItemIndexAt(index:int, newIndex:int):void
        {
            checkIndex(index);
            checkIndex(newIndex);
            var arr:Array = _data.splice(index, 1);
            _data.splice(newIndex, 0, arr);
            dispatchChangeEvent("move", arr, index, newIndex);
        }

        public function swapItemAt(item1:*, item2:*):void
        {
            var index1:int = _data.indexOf(item1);
            if ((index1 == -1))
            {
                return;
            };
            var index2:int = _data.indexOf(item2);
            if ((index2 == -1))
            {
                return;
            };
            swapIndexAt(index1, index2);
        }

        public function swapIndexAt(index1:int, index2:int):void
        {
            var arr1 = null;
            var arr2 = null;
            if ((index1 == index2))
            {
                return;
            };
            checkIndex(index1);
            checkIndex(index2);
            if ((index1 < index2))
            {
                arr2 = _data.splice(index2, 1);
                arr1 = _data.splice(index1, 1, arr2);
                _data.splice(index2, 1, arr1);
                dispatchChangeEvent("swap", arr2.concat(arr1), index1, index2);
            }
            else
            {
                arr1 = _data.splice(index1, 1);
                arr2 = _data.splice(index2, 1);
                _data.splice(index1, 1, arr2);
                dispatchChangeEvent("swap", arr1.concat(arr2), index2, index1);
            };
        }

        public function sort(... args):Array
        {
            dispatchPreChangeEvent("sort", _data.concat(), 0, (_data.length - 1));
            var arr:Array = _data.sort(args);
            dispatchChangeEvent("sort", _data.concat(), 0, (_data.length - 1));
            return (arr);
        }

        public function sortOn(fieldName:Object, options:Object=null):Array
        {
            dispatchPreChangeEvent("sort", _data.concat(), 0, (_data.length - 1));
            var arr:Array = _data.sortOn(fieldName, options);
            dispatchChangeEvent("sort", _data.concat(), 0, (_data.length - 1));
            return (arr);
        }

        public function pop()
        {
            var item = _data.pop();
            var len:int = _data.length;
            dispatchChangeEvent("remove", [item], len, len);
            return (item);
        }

        public function shift()
        {
            var item = _data.shift();
            dispatchChangeEvent("remove", [item], 0, 0);
            return item;
        }

        public function toArray():Array
        {
            return _data.concat();
        }

        override public function toString():String
        {
            return "ArrayProvider [" + _data.join(" , ") + "]";
        }

        protected function checkIndex(index:int):void
        {
            if (index > (_data.length - 1) || index < 0)
            {
                throw new RangeError("ArrayProvider index (" + index.toString() + ") is not in acceptable range (0 - " + (_data.length - 1).toString() + ")");
            }
        }

        public function forEach(callback:Function, thisObject:*=null):void
        {
            _data.forEach(callback, thisObject);
        }

        public function filter(callback:Function, thisObject:*=null):Array
        {
            return _data.filter(callback, thisObject);
        }

        public function some(callback:Function, thisObject:*=null):Boolean
        {
            return _data.some(callback, thisObject);
        }

        public function every(callback:Function, thisObject:*=null):Boolean
        {
            return _data.every(callback, thisObject);
        }

        public function map(callback:Function, thisObject:*=null):Array
        {
            return _data.map(callback, thisObject);
        }

        protected function dispatchChangeEvent(evtType:String, items:Array, startIndex:int=-1, endIndex:int=-1):void
        {
            if (!autoUpdate)
            {
                return;
            }
            if (hasEventListener("dataChange"))
            {
                dispatchEvent(new DataChangeEvent("dataChange", evtType, items, startIndex, endIndex));
            }
        }

        protected function dispatchPreChangeEvent(evtType:String, items:Array, startIndex:int=-1, endIndex:int=-1):void
        {
            if (!autoUpdate)
            {
                return;
            }
            if (hasEventListener("preDataChange"))
            {
                dispatchEvent(new DataChangeEvent("preDataChange", evtType, items, startIndex, endIndex));
            }
        }
    }
}