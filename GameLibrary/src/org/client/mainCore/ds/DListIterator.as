//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds
{
    public class DListIterator implements IIterator 
    {

        public var node:DListNode;
        public var list:DLinkedList;

        public function DListIterator(list:DLinkedList, node:DListNode=null)
        {
            this.list = list;
            this.node = node;
        }

        public function start():void
        {
            node = list.head;
        }

        public function next()
        {
            var obj:*;
            if (hasNext())
            {
                obj = node.data;
                node = node.next;
                return (obj);
            };
            return (null);
        }

        public function hasNext():Boolean
        {
            return (node);
        }

        public function get data()
        {
            if (node)
            {
                return (node.data);
            };
            return (null);
        }

        public function set data(obj:*):void
        {
            node.data = obj;
        }

        public function end():void
        {
            node = list.tail;
        }

        public function forth():void
        {
            if (node)
            {
                node = node.next;
            };
        }

        public function back():void
        {
            if (node)
            {
                node = node.prev;
            };
        }

        public function valid():Boolean
        {
            return (node);
        }

        public function remove():Boolean
        {
            return (list.remove(this));
        }

        public function toString():String
        {
            return ((("{DListIterator, data=" + ((node) ? node.data : "null")) + "}"));
        }


    }
}//package org.client.mainCore.ds
