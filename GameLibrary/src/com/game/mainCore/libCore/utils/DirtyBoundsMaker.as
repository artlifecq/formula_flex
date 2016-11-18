package com.game.mainCore.libCore.utils
{
    import com.game.mainCore.libCore.vo.LNode;
    
    import org.client.mainCore.core.Bounds;

    public class DirtyBoundsMaker 
    {

        private var first:LNode;
        private var last:LNode;
        private var beginLN:LNode;


        public function clear():void
        {
            first = null;
            last = null;
            beginLN = null;
        }

        public function addBounds($b:Bounds, $beginFrist:Boolean=false):void
        {
            var b:Bounds = null;
            var ib:Bounds = null;
            var ub:Bounds = null;
            var head:LNode = $beginFrist ? first : (beginLN || first);
            if (head != null)
            {
                while (head != null)
                {
                    b = head.data as Bounds;
                    if (b.bottom <= $b.top)
                    {
                        head = head.next;
                    }
                    else if (b.top >= $b.bottom)
					{
						add(new LNode($b), head.pre);
						return;
					}
					if (b.intersects($b))
					{
						ib = b.intersection($b);
						if (!ib.equals($b))
						{
							if (ib.equals(b))
							{
								remove(head);
								if (beginLN != null)
								{
									addBounds($b);
								}
								else
								{
									add(new LNode($b), last);
								}
							}
							else
							{
								ub = b.union($b);
								remove(head);
								beginLN = first;
								if (beginLN != null)
								{
									addBounds(ub);
								}
								else
								{
									add(new LNode(ub), last);
								}
							}
						}
						return;
					}
					head = head.next;
                }
                if (head == null)
                {
                    add(new LNode($b), last);
                }
            }
            else
            {
                add(new LNode($b), null);
            }
        }

        private function cutTwoIntersectedBounds($b1:Bounds, $b2:Bounds):Array
        {
            var r1:Number;
            var l2:Number;
            var r2:Number;
            var l3:Number;
            var r3:Number;
            var l1:Number;
            var arr:Array = [];
            var vArr:Array = [$b1.top, $b1.bottom, $b2.top, $b2.bottom].sort(16);
            var hArr:Array = [$b1.left, $b1.right, $b2.left, $b2.right].sort(16);
            var bb:Bounds = $b1.top<=$b2.top ? $b1 : $b2;
            l1 = bb.left;
            r1 = bb.right;
            l2 = hArr[0];
            r2 = hArr[3];
            bb = $b1.bottom>=$b2.bottom ? $b1 : $b2;
            l3 = bb.left;
            r3 = bb.right;
            return [new Bounds(l1, r1, vArr[0], vArr[1]), new Bounds(l2, r2, vArr[1], vArr[2]), new Bounds(l3, r3, vArr[2], vArr[3])];
        }

        public function getBoundsArr():Array
        {
            var arr:Array = [];
            var head:LNode = first;
            while (head != null)
            {
                arr.push(head.data);
                head = head.next;
            }
            return arr;
        }

        private function add($ln:LNode, $preLn:LNode=null):void
        {
            if ($preLn == null)
            {
                first = $ln;
                first.pre = null;
                first.next = null;
                last = $ln;
                last.pre = null;
                last.next = null;
            }
            else
            {
                if ($preLn == last)
                {
                    last.next = $ln;
                    $ln.pre = last;
                    last = $ln;
                }
                else
                {
                    $ln.pre = $preLn;
                    $ln.next = $preLn.next;
                    $ln.pre.next = $ln;
                    $ln.next.pre = $ln;
                }
            }
        }

        private function remove($ln:LNode):void
        {
            if ($ln == first)
            {
                if ($ln == last)
                {
                    first = null;
                    last = null;
                }
                else
                {
                    first = $ln.next;
                    first.pre = null;
                }
            }
            else if ($ln == last)
			{
				last = last.pre;
				last.next = null;
			}
			else
			{
				$ln.pre.next = $ln.next;
				$ln.next.pre = $ln.pre;
			}
            beginLN = $ln.next;
        }
    }
}