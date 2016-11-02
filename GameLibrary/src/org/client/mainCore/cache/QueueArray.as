//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.cache
{
    import flash.utils.Dictionary;

    public class QueueArray 
    {

        private var firstNode:ArrayNode;
        private var lastNode:ArrayNode;
        private var map:Dictionary;
        private var _length:int = 0;

        public function QueueArray()
        {
            map = new Dictionary();
            super();
        }

        public function get length():int
        {
            return (_length);
        }

        public function push(obj:*):int
        {
            var curNode:ArrayNode = new ArrayNode();
            if (lastNode)
            {
                lastNode.next = curNode;
            };
            curNode.pre = lastNode;
            lastNode = curNode;
            curNode.body = obj;
            map[obj] = curNode;
            _length = (_length + 1);
            return (_length);
        }

        public function shift():void
        {
            remove(firstNode.body);
        }

        public function remove(obj:*)
        {
            var n = null;
            if (((!((obj == null))) && ((obj in map))))
            {
                n = (map[obj] as ArrayNode);
                if (n.pre)
                {
                    n.pre.next = n.next;
                };
                if (n.next)
                {
                    n.next.pre = n.pre;
                };
                if ((lastNode == n))
                {
                    lastNode = n.pre;
                }
                else
                {
                    if (firstNode == n)
                    {
                        firstNode = n.next;
                    };
                };
                n.dispose();
                map[obj] = null;
                delete map[obj];
                _length = (_length - 1);
                if ((_length <= 0))
                {
                    firstNode = null;
                };
            };
            return (obj);
        }

        public function getLastBody()
        {
            if (lastNode)
            {
                return (lastNode.body);
            };
            return (null);
        }

        public function getFirstBody()
        {
            if (firstNode)
            {
                return (firstNode.body);
            };
            return (null);
        }


    }
}//package org.client.mainCore.cache

class ArrayNode 
{

    public var pre:ArrayNode;
    public var next:ArrayNode;
    public var body:Object;


    public function dispose():void
    {
        pre = null;
        next = null;
        body = null;
    }


}
