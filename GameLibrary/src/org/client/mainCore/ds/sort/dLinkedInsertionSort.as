//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds.sort
{
    import org.client.mainCore.ds.DListNode;

    public function dLinkedInsertionSort(node:DListNode, descending:Boolean=false):DListNode
    {
        var p = null;
        var n = null;
        var m = null;
        var i = null;
        var val:*;
        if (!node)
        {
            return (null);
        };
        var h = node;
        if (descending)
        {
            n = h.next;
            while (n)
            {
                m = n.next;
                p = n.prev;
                if ((p.data < n.data))
                {
                    i = p;
                    while (i.prev)
                    {
                        if ((i.prev.data < n.data))
                        {
                            i = i.prev;
                        }
                        else
                        {
                            break;
                        };
                    };
                    if (m)
                    {
                        p.next = m;
                        m.prev = p;
                    }
                    else
                    {
                        p.next = null;
                    };
                    if ((i == h))
                    {
                        n.prev = null;
                        n.next = i;
                        i.prev = n;
                        h = n;
                    }
                    else
                    {
                        n.prev = i.prev;
                        i.prev.next = n;
                        n.next = i;
                        i.prev = n;
                    };
                };
                n = m;
            };
            return (h);
        };
        n = h.next;
        while (n)
        {
            m = n.next;
            p = n.prev;
            if ((p.data > n.data))
            {
                i = p;
                while (i.prev)
                {
                    if ((i.prev.data > n.data))
                    {
                        i = i.prev;
                    }
                    else
                    {
                        break;
                    };
                };
                if (m)
                {
                    p.next = m;
                    m.prev = p;
                }
                else
                {
                    p.next = null;
                };
                if ((i == h))
                {
                    n.prev = null;
                    n.next = i;
                    i.prev = n;
                    h = n;
                }
                else
                {
                    n.prev = i.prev;
                    i.prev.next = n;
                    n.next = i;
                    i.prev = n;
                };
            };
            n = m;
        };
        return (h);
    }

}//package org.client.mainCore.ds.sort
