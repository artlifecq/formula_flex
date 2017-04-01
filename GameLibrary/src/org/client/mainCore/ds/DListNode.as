//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds
{
    public class DListNode 
    {

        public var data;
        public var next:DListNode;
        public var prev:DListNode;

        public function DListNode(obj:*)
        {
            prev = null;
            next = null;
            data = obj;
        }

        public function insertAfter(node:DListNode):void
        {
            node.next = next;
            node.prev = this;
            if (next)
            {
                next.prev = node;
            };
            next = node;
        }

        public function insertBefore(node:DListNode):void
        {
            node.next = this;
            node.prev = prev;
            if (prev)
            {
                prev.next = node;
            };
            prev = node;
        }

        public function unlink():void
        {
            if (prev)
            {
                prev.next = next;
            };
            if (next)
            {
                next.prev = prev;
            };
            prev = null;
            next = null;
        }

        public function toString():String
        {
            return ((("[DListNode, data=" + data) + "]"));
        }


    }
}//package org.client.mainCore.ds
