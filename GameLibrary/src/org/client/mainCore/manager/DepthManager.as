package org.client.mainCore.manager
{
    import flash.utils.Dictionary;
    import flash.display.DisplayObjectContainer;
    import flash.display.DisplayObject;

    public class DepthManager 
    {

        private static var managers:Dictionary;

        private var depths:Dictionary;

        public function DepthManager()
        {
            depths = new Dictionary(true);
        }

        public static function getManager(container:DisplayObjectContainer):DepthManager
        {
            if (!managers)
            {
                managers = new Dictionary(true);
            }
            var m:DepthManager = managers[container];
            if (!m)
            {
                m = new (DepthManager)();
                managers[container] = m;
            }
            return m;
        }

        public static function swapDepth(child:DisplayObject, depth:Number):int
        {
            return getManager(child.parent).swapChildDepth(child, depth);
        }

        public static function swapDepthAll(doc:DisplayObjectContainer):void
        {
            doc = doc;
            var dm:DepthManager = getManager(doc);
            var len:int = doc.numChildren;
            var arr:Array = [];
            var i:int;
            while (i < len)
            {
                var child:DisplayObject = doc.getChildAt(i);
                arr.push(child);
                i++;
            }
            arr.sortOn("y", 16);
            arr.forEach(function (item:DisplayObject, index:int, array:Array):void
            {
                doc.setChildIndex(item, index);
                dm.setDepth(item, item.y);
            });
            arr = null;
        }

        public static function clear(container:DisplayObjectContainer):void
        {
            delete managers[container]; //not popped
        }

        public static function clearAll():void
        {
            managers = null;
        }

        public static function bringToBottom(mc:DisplayObject):void
        {
            var parent:DisplayObjectContainer = mc.parent;
            if (parent == null)
            {
                return;
            }
            if (parent.getChildIndex(mc) != 0)
            {
                parent.setChildIndex(mc, 0);
            }
        }

        public static function bringToTop(mc:DisplayObject):void
        {
            var parent:DisplayObjectContainer = mc.parent;
            if (parent == null)
            {
                return;
            }
            parent.addChild(mc);
        }


        public function getDepth(child:DisplayObject):Number
        {
            if (depths[child] == null)
            {
                return countDepth(child, child.parent.getChildIndex(child), 0);
            }
            return depths[child];
        }

        private function countDepth(child:DisplayObject, index:int, n:Number=0):Number
        {
            if (depths[child] == null)
            {
                if (index == 0)
                {
                    return 0;
                }
                return countDepth(child.parent.getChildAt(index - 1), index - 1, n + 1);
            }
            return depths[child] + n;
        }

        public function setDepth(child:DisplayObject, d:Number):void
        {
            depths[child] = d;
        }

        public function swapChildDepth(child:DisplayObject, depth:Number):int
        {
            var mid:int;
            var midDepth:Number;
            var container:DisplayObjectContainer = child.parent;
            if (container == null)
            {
                throw (new Error("child is not in a container!!"));
            }
            var index:int = container.getChildIndex(child);
            var oldDepth:Number = getDepth(child);
            if (depth == oldDepth)
            {
                setDepth(child, depth);
                return index;
            }
            var n:int = container.numChildren;
            if (n < 2)
            {
                setDepth(child, depth);
                return index;
            }
            if ((depth < getDepth(container.getChildAt(0))))
            {
                container.setChildIndex(child, 0);
                setDepth(child, depth);
                return 0;
            }
            if (depth >= getDepth(container.getChildAt((n - 1))))
            {
                container.setChildIndex(child, (n - 1));
                setDepth(child, depth);
                return n - 1;
            }
            var left:int;
            var right:int = (n - 1);
            if (depth > oldDepth)
            {
                left = index;
                right = (n - 1);
            }
            else
            {
                left = 0;
                right = index;
            }
            while (right > (left + 1))
            {
                mid = (left + ((right - left) / 2));
                midDepth = getDepth(container.getChildAt(mid));
                if ((midDepth > depth))
                {
                    right = mid;
                }
                else if (midDepth < depth)
				{
					left = mid;
				}
				else
				{
					container.setChildIndex(child, mid);
					setDepth(child, depth);
					return (mid);
				}
            }
            var leftDepth:Number = getDepth(container.getChildAt(left));
            var rightDepth:Number = getDepth(container.getChildAt(right));
            var destIndex:int;
            if ((depth >= rightDepth))
            {
                if ((index <= right))
                {
                    destIndex = Math.min(right, (n - 1));
                }
                else
                {
                    destIndex = Math.min((right + 1), (n - 1));
                }
            }
            else
            {
                if (depth < leftDepth)
                {
                    if ((index < left))
                    {
                        destIndex = Math.max((left - 1), 0);
                    }
                    else
                    {
                        destIndex = left;
                    }
                }
                else
                {
                    if ((index <= left))
                    {
                        destIndex = left;
                    }
                    else
                    {
                        destIndex = Math.min((left + 1), (n - 1));
                    }
                }
            }
            container.setChildIndex(child, destIndex);
            setDepth(child, depth);
            return destIndex;
        }
    }
}