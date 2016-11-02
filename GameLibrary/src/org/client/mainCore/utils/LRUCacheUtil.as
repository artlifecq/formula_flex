//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.utils.Dictionary;

    public class LRUCacheUtil 
    {

        private var cacheSize:int;
        private var currentSize:int;
        private var nodes:Dictionary;
        private var first:Entry;
        private var last:Entry;

        public function LRUCacheUtil(size:int)
        {
            currentSize = 0;
            cacheSize = size;
            nodes = new Dictionary();
            if ((cacheSize <= 0))
            {
                throw (new Error("靠,缓存数都为0了,你用这个居心何在?"));
            };
        }

        public function getCache(key:Object):Object
        {
            var node:Entry = (nodes[key] as Entry);
            if (!((node == null)))
            {
                moveToHead(node);
                return (node.value);
            };
            return (null);
        }

        private function moveToHead(node:Entry):void
        {
            if ((node == first))
            {
                return;
            };
            node.prev.next = node.next;
            if ((node == last))
            {
                last = node.prev;
            }
            else
            {
                node.next.prev = node.prev;
            };
            node.next = first;
            first.prev = node;
            node.prev = null;
            first = node;
        }

        public function add(key:Object, value:Object, size:int=1):void
        {
            if ((((size <= 0)) || ((size > cacheSize))))
            {
                return;
            };
            var node:Entry = (nodes[key] as Entry);
            if (!((node == null)))
            {
                return;
            };
            while (currentSize >= cacheSize)
            {
                if ((last == null))
                {
                    clear();
                    break;
                };
                delete nodes[last.key];
                removeLast();
            };
            currentSize = (currentSize + size);
            node = new Entry(key, value, size);
            nodes[key] = node;
            addToFirst(node);
        }

        private function addToFirst(node:Entry):void
        {
            if ((first == null))
            {
                first = node;
                last = node;
                return;
            };
            first.prev = node;
            node.next = first;
            first = node;
        }

        private function removeLast():void
        {
            currentSize = (currentSize - last.size);
            if (!((last.prev == null)))
            {
                last.prev.next = null;
                last = last.prev;
            }
            else
            {
                first = null;
                last = null;
            };
        }

        public function clear():void
        {
            first = null;
            last = null;
            currentSize = 0;
            nodes = new Dictionary();
        }


    }
}//package org.client.mainCore.utils

class Entry 
{

    public var prev:Entry;
    public var next:Entry;
    public var key:Object;
    public var value:Object;
    public var size:int = 1;

    public function Entry($key:Object, $value:Object, $size:int):void
    {
        key = $key;
        value = $value;
        size = $size;
    }

}
