//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds
{
    import org.client.mainCore.ds.sort.dLinkedInsertionSortCmp;
    import org.client.mainCore.ds.sort.dLinkedMergeSortCmp;
    import org.client.mainCore.ds.sort.compare.compareStringCaseSensitiveDesc;
    import org.client.mainCore.ds.sort.compare.compareStringCaseInSensitive;
    import org.client.mainCore.ds.sort.compare.compareStringCaseInSensitiveDesc;
    import org.client.mainCore.ds.sort.compare.compareStringCaseSensitive;
    import org.client.mainCore.ds.sort.dLinkedInsertionSort;
    import org.client.mainCore.ds.sort.dLinkedMergeSort;

    public class DLinkedList implements ICollection 
    {

        private var _count:int;
        public var head:DListNode;
        public var tail:DListNode;

        public function DLinkedList(... args)
        {
            tail = null;
            head = null;
            _count = 0;
            if (args.length > 0)
            {
                append.apply(this, args);
            };
        }

        public function append(... args):DListNode
        {
            var t = null;
            var i:int;
            var k:int = args.length;
            var node:DListNode = new DListNode(args[0]);
            if (head)
            {
                tail.insertAfter(node);
                tail = tail.next;
            }
            else
            {
                tail = node;
                head = node;
            };
            if ((k > 1))
            {
                t = node;
                i = 1;
                while (i < k)
                {
                    node = new DListNode(args[i]);
                    tail.insertAfter(node);
                    tail = tail.next;
                    i++;
                };
                _count = (_count + k);
                return (t);
            };
            _count++;
            return (node);
        }

        public function prepend(... args):DListNode
        {
            var t = null;
            var i:int;
            var k:int = args.length;
            var node:DListNode = new DListNode(args[(k - 1)]);
            if (head)
            {
                head.insertBefore(node);
                head = head.prev;
            }
            else
            {
                tail = node;
                head = node;
            };
            if ((k > 1))
            {
                t = node;
                i = (k - 2);
                while (i >= 0)
                {
                    node = new DListNode(args[i]);
                    head.insertBefore(node);
                    head = head.prev;
                    i--;
                };
                _count = (_count + k);
                return (t);
            };
            _count++;
            return (node);
        }

        public function insertAfter(itr:DListIterator, obj:*):DListNode
        {
            var node = null;
            if (itr.list != this)
            {
                return (null);
            };
            if (itr.node)
            {
                node = new DListNode(obj);
                itr.node.insertAfter(node);
                if ((itr.node == tail))
                {
                    tail = itr.node.next;
                };
                _count++;
                return (node);
            };
            return (append(obj));
        }

        public function insertBefore(itr:DListIterator, obj:*):DListNode
        {
            var node = null;
            if (itr.list != this)
            {
                return (null);
            };
            if (itr.node)
            {
                node = new DListNode(obj);
                itr.node.insertBefore(node);
                if ((itr.node == head))
                {
                    head = head.prev;
                };
                _count++;
                return (node);
            };
            return (prepend(obj));
        }

        public function remove(itr:DListIterator):Boolean
        {
            if (((!((itr.list == this))) || (!(itr.node))))
            {
                return (false);
            };
            var node:DListNode = itr.node;
            if ((node == head))
            {
                head = head.next;
            }
            else
            {
                if (node == tail)
                {
                    tail = tail.prev;
                };
            };
            if (itr.node)
            {
                itr.node = itr.node.next;
            };
            if (node.prev)
            {
                node.prev.next = node.next;
            };
            if (node.next)
            {
                node.next.prev = node.prev;
            };
            var _local3 = null;
            node.prev = _local3;
            node.next = _local3;
            if (head == null)
            {
                tail = null;
            };
            _count--;
            return (true);
        }

        public function removeHead()
        {
            var obj:*;
            if (head)
            {
                obj = head.data;
                head = head.next;
                if (head)
                {
                    head.prev = null;
                }
                else
                {
                    tail = null;
                };
                _count--;
                return (obj);
            };
            return (null);
        }

        public function removeTail()
        {
            var obj:*;
            if (tail)
            {
                obj = tail.data;
                tail = tail.prev;
                if (tail)
                {
                    tail.next = null;
                }
                else
                {
                    head = null;
                };
                _count--;
                return (obj);
            };
            return (null);
        }

        public function merge(... args):void
        {
            var a = null;
            var i:int;
            a = args[0];
            if (a.head)
            {
                if (head)
                {
                    tail.next = a.head;
                    a.head.prev = tail;
                    tail = a.tail;
                }
                else
                {
                    head = a.head;
                    tail = a.tail;
                };
                _count = (_count + a.length);
            };
            var k:int = args.length;
            i = 1;
            while (i < k)
            {
                a = args[i];
                if (a.head)
                {
                    tail.next = a.head;
                    a.head.prev = tail;
                    tail = a.tail;
                    _count = (_count + a.length);
                };
                i++;
            };
        }

        public function concat(... args):DLinkedList
        {
            var n = null;
            var a = null;
            var i:int;
            var c:DLinkedList = new DLinkedList();
            n = head;
            while (n)
            {
                c.append(n.data);
                n = n.next;
            };
            var k:int = args.length;
            i = 0;
            while (i < k)
            {
                a = args[i];
                n = a.head;
                while (n)
                {
                    c.append(n.data);
                    n = n.next;
                };
                i++;
            };
            return (c);
        }

        public function sort(... sortOptions):void
        {
            var b:int;
            var cmp = null;
            var o:*;
            if (_count <= 1)
            {
                return;
            };
            if ((sortOptions.length > 0))
            {
                b = 0;
                cmp = null;
                o = sortOptions[0];
                if ((o is Function))
                {
                    cmp = o;
                    if ((sortOptions.length > 1))
                    {
                        o = sortOptions[1];
                        if ((o is int))
                        {
                            b = o;
                        };
                    };
                }
                else
                {
                    if ((o is int))
                    {
                        b = o;
                    };
                };
                if (cmp)
                {
                    if ((b & 2))
                    {
                        head = dLinkedInsertionSortCmp(head, cmp, (b == 18));
                    }
                    else
                    {
                        head = dLinkedMergeSortCmp(head, cmp, (b == 16));
                    };
                }
                else
                {
                    if ((b & 2))
                    {
                        if ((b & 4))
                        {
                            if ((b == 22))
                            {
                                head = dLinkedInsertionSortCmp(head, compareStringCaseSensitiveDesc);
                            }
                            else
                            {
                                if (b == 14)
                                {
                                    head = dLinkedInsertionSortCmp(head, compareStringCaseInSensitive);
                                }
                                else
                                {
                                    if (b == 30)
                                    {
                                        head = dLinkedInsertionSortCmp(head, compareStringCaseInSensitiveDesc);
                                    }
                                    else
                                    {
                                        head = dLinkedInsertionSortCmp(head, compareStringCaseSensitive);
                                    };
                                };
                            };
                        }
                        else
                        {
                            head = dLinkedInsertionSort(head, (b == 18));
                        };
                    }
                    else
                    {
                        if ((b & 4))
                        {
                            if ((b == 20))
                            {
                                head = dLinkedMergeSortCmp(head, compareStringCaseSensitiveDesc);
                            }
                            else
                            {
                                if (b == 12)
                                {
                                    head = dLinkedMergeSortCmp(head, compareStringCaseInSensitive);
                                }
                                else
                                {
                                    if (b == 28)
                                    {
                                        head = dLinkedMergeSortCmp(head, compareStringCaseInSensitiveDesc);
                                    }
                                    else
                                    {
                                        head = dLinkedMergeSortCmp(head, compareStringCaseSensitive);
                                    };
                                };
                            };
                        }
                        else
                        {
                            if ((b & 16))
                            {
                                head = dLinkedMergeSort(head, true);
                            };
                        };
                    };
                };
            }
            else
            {
                head = dLinkedMergeSort(head);
            };
        }

        public function nodeOf(obj:*, from:DListIterator=null):DListIterator
        {
            if (!((from == null)))
            {
                if (!((from.list == this)))
                {
                    return (null);
                };
            };
            var node:DListNode = (((from)==null) ? head : from.node);
            while (node)
            {
                if ((node.data === obj))
                {
                    return (new DListIterator(this, node));
                };
                node = node.next;
            };
            return (null);
        }

        public function lastNodeOf(obj:*, from:DListIterator=null):DListIterator
        {
            if (!((from == null)))
            {
                if (!((from.list == this)))
                {
                    return (null);
                };
            };
            var node:DListNode = (((from)==null) ? tail : from.node);
            while (node)
            {
                if ((node.data === obj))
                {
                    return (new DListIterator(this, node));
                };
                node = node.prev;
            };
            return (null);
        }

        public function splice(start:DListIterator, deleteCount:uint=0xFFFFFFFF, ... args):DLinkedList
        {
            var s = null;
            var t = null;
            var c = null;
            var k:int;
            var i:int;
            var n = null;
            if (start)
            {
                if (start.list != this)
                {
                    return (null);
                };
            };
            if (start.node)
            {
                s = start.node;
                t = start.node.prev;
                c = new DLinkedList();
                if ((deleteCount == 0xFFFFFFFF))
                {
                    if (start.node == tail)
                    {
                        return (c);
                    };
                    while (start.node)
                    {
                        c.append(start.node.data);
                        start.remove();
                    };
                    start.list = c;
                    start.node = s;
                    return (c);
                };
                i = 0;
                while (i < deleteCount)
                {
                    if (start.node)
                    {
                        c.append(start.node.data);
                        start.remove();
                    }
                    else
                    {
                        break;
                    };
                    i++;
                };
                k = args.length;
                if ((k > 0))
                {
                    if ((_count == 0))
                    {
                        i = 0;
                        while (i < k)
                        {
                            append(args[i]);
                            i++;
                        };
                    }
                    else
                    {
                        if ((t == null))
                        {
                            n = prepend(args[0]);
                            i = 1;
                            while (i < k)
                            {
                                n.insertAfter(new DListNode(args[i]));
                                if (n == tail)
                                {
                                    tail = n.next;
                                };
                                n = n.next;
                                _count++;
                                i++;
                            };
                        }
                        else
                        {
                            n = t;
                            i = 0;
                            while (i < k)
                            {
                                n.insertAfter(new DListNode(args[i]));
                                if (n == tail)
                                {
                                    tail = n.next;
                                };
                                n = n.next;
                                _count++;
                                i++;
                            };
                        };
                    };
                    start.node = n;
                }
                else
                {
                    start.node = s;
                };
                start.list = c;
                return (c);
            };
            return (null);
        }

        public function shiftUp():void
        {
            var t:DListNode = head;
            if ((head.next == tail))
            {
                head = tail;
                head.prev = null;
                tail = t;
                tail.next = null;
                head.next = tail;
                tail.prev = head;
            }
            else
            {
                head = head.next;
                head.prev = null;
                tail.next = t;
                t.next = null;
                t.prev = tail;
                tail = t;
            };
        }

        public function popDown():void
        {
            var t:DListNode = tail;
            if ((tail.prev == head))
            {
                tail = head;
                tail.next = null;
                head = t;
                head.prev = null;
                head.next = tail;
                tail.prev = head;
            }
            else
            {
                tail = tail.prev;
                tail.next = null;
                head.prev = t;
                t.prev = null;
                t.next = head;
                head = t;
            };
        }

        public function reverse():void
        {
            var mark = null;
            var next = null;
            if (_count == 0)
            {
                return;
            };
            var node:DListNode = tail;
            while (node)
            {
                mark = node.prev;
                if (!(node.next))
                {
                    node.next = node.prev;
                    node.prev = null;
                    head = node;
                }
                else
                {
                    if (!node.prev)
                    {
                        node.prev = node.next;
                        node.next = null;
                        tail = node;
                    }
                    else
                    {
                        next = node.next;
                        node.next = node.prev;
                        node.prev = next;
                    };
                };
                node = mark;
            };
        }

        public function join(sep:*):String
        {
            if (_count == 0)
            {
                return ("");
            };
            var s:String = "";
            var node:DListNode = head;
            while (node.next)
            {
                s = (s + (node.data + sep));
                node = node.next;
            };
            s = (s + node.data);
            return (s);
        }

        public function contains(obj:*):Boolean
        {
            var node:DListNode = head;
            while (node)
            {
                if (node.data == obj)
                {
                    return (true);
                };
                node = node.next;
            };
            return (false);
        }

        public function clear():void
        {
            var next = null;
            var node:DListNode = head;
            head = null;
            while (node)
            {
                next = node.next;
                var _local3 = null;
                node.prev = _local3;
                node.next = _local3;
                node = next;
            };
            _count = 0;
        }

        public function getIterator():IIterator
        {
            return (new DListIterator(this, head));
        }

        public function getListIterator():DListIterator
        {
            return (new DListIterator(this, head));
        }

        public function get length():int
        {
            return (_count);
        }

        public function isEmpty():Boolean
        {
            return ((_count == 0));
        }

        public function toArray():Array
        {
            var a:Array = [];
            var node:DListNode = head;
            while (node)
            {
                a.push(node.data);
                node = node.next;
            };
            return (a);
        }

        public function toString():String
        {
            return ((("[DLinkedList > has " + length) + " nodes]"));
        }

        public function dump():String
        {
            if (head == null)
            {
                return ("DLinkedList, empty");
            };
            var s:String = (((("DLinkedList, has " + _count) + " node") + (((_count)==1) ? "" : "s")) + "\n|< Head\n");
            var itr:DListIterator = getListIterator();
            while (itr.valid())
            {
                s = (s + (("\t" + itr.data) + "\n"));
                itr.forth();
            };
            s = (s + "Tail >|");
            return (s);
        }


    }
}//package org.client.mainCore.ds
