//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds.sort
{
    import org.client.mainCore.ds.DListNode;

    public function dLinkedMergeSort(node:DListNode, descending:Boolean=false):DListNode
    {
        var p = null;
        var q = null;
        var e = null;
        var tail = null;
        var nmerges:int;
        var psize:int;
        var qsize:int;
        var i:int;
        if (!node)
        {
            return (null);
        };
        var h = node;
        var insize:int = 1;
        if (descending)
        {
            while (true)
            {
                p = h;
                tail = null;
                h = tail;
                nmerges = 0;
                while (p)
                {
                    nmerges++;
                    i = 0;
                    psize = 0;
                    psize;
                    q = p;
                    q;
                    while (i < insize)
                    {
                        psize++;
                        q = q.next;
                        if (!q) break;
                        i++;
                    };
                    qsize = insize;
                    while ((((psize > 0)) || ((((qsize > 0)) && (q)))))
                    {
                        if ((psize == 0))
                        {
                            e = q;
                            q = q.next;
                            qsize--;
                        }
                        else
                        {
                            if ((((qsize == 0)) || (!(q))))
                            {
                                e = p;
                                p = p.next;
                                psize--;
                            }
                            else
                            {
                                if ((p.data - q.data) >= 0)
                                {
                                    e = p;
                                    p = p.next;
                                    psize--;
                                }
                                else
                                {
                                    e = q;
                                    q = q.next;
                                    qsize--;
                                };
                            };
                        };
                        if (tail)
                        {
                            tail.next = e;
                        }
                        else
                        {
                            h = e;
                        };
                        e.prev = tail;
                        tail = e;
                    };
                    p = q;
                };
                tail.next = null;
                if ((nmerges <= 1))
                {
                    return (h);
                };
                insize = (insize << 1);
            };
        };
        while (true)
        {
            p = h;
            tail = null;
            h = tail;
            nmerges = 0;
            while (p)
            {
                nmerges++;
                i = 0;
                psize = 0;
                psize;
                q = p;
                q;
                while (i < insize)
                {
                    psize++;
                    q = q.next;
                    if (!q) break;
                    i++;
                };
                qsize = insize;
                while ((((psize > 0)) || ((((qsize > 0)) && (q)))))
                {
                    if ((psize == 0))
                    {
                        e = q;
                        q = q.next;
                        qsize--;
                    }
                    else
                    {
                        if ((((qsize == 0)) || (!(q))))
                        {
                            e = p;
                            p = p.next;
                            psize--;
                        }
                        else
                        {
                            if ((p.data - q.data) <= 0)
                            {
                                e = p;
                                p = p.next;
                                psize--;
                            }
                            else
                            {
                                e = q;
                                q = q.next;
                                qsize--;
                            };
                        };
                    };
                    if (tail)
                    {
                        tail.next = e;
                    }
                    else
                    {
                        h = e;
                    };
                    e.prev = tail;
                    tail = e;
                };
                p = q;
            };
            tail.next = null;
            if ((nmerges <= 1))
            {
                return (h);
            };
            insize = (insize << 1);
        };
        return (null); //dead code
    }

}//package org.client.mainCore.ds.sort
