package com.game.mainCore.core.path.linePath
{
    public class BinaryHeap 
    {

        public var a:Array;
        public var justMinFun:Function;

        public function BinaryHeap(justMinFun:Function=null)
        {
            a = [];
            justMinFun = function (x:Object, y:Object):Boolean
            {
                return x < y;
            }
            super();
            a.push(-1);
            if (justMinFun != null)
            {
                this.justMinFun = justMinFun;
            }
        }

        public function ins(value:Object):void
        {
            var temp = null;
            var p:int = a.length;
            a[p] = value;
            var pp = (p >> 1);
            while ((((p > 1)) && (justMinFun(a[p], a[pp]))))
            {
                temp = a[p];
                a[p] = a[pp];
                a[pp] = temp;
                p = pp;
                pp = (p >> 1);
            };
        }

        public function pop():Object
        {
            var minp:int;
            var temp = null;
            var min:Object = a[1];
            a[1] = a[(a.length - 1)];
            a.pop();
            var p:int = 1;
            var l:int = a.length;
            var sp1 = (p << 1);
            var sp2:int = (sp1 + 1);
            while (sp1 < l)
            {
                if ((sp2 < l))
                {
                    minp = ((justMinFun(a[sp2], a[sp1])) ? sp2 : sp1);
                }
                else
                {
                    minp = sp1;
                }
                if (justMinFun(a[minp], a[p]))
                {
                    temp = a[p];
                    a[p] = a[minp];
                    a[minp] = temp;
                    p = minp;
                    sp1 = (p << 1);
                    sp2 = (sp1 + 1);
                }
                else
                {
                    break;
                }
            }
            return min;
        }
    }
}