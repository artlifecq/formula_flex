//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.utils
{
    import flash.display.DisplayObjectContainer;
    import flash.display.Loader;
    import flash.display.Bitmap;
    import flash.display.DisplayObject;
    import flash.display.Stage;
    import flash.utils.ByteArray;

    public class Fun 
    {


        public static function clearChildren($dobj:DisplayObject, $disposeChildren:Boolean=false, $recursion:Boolean=true):void
        {
            var numChildren:int;
            if (($dobj == null))
            {
                return;
            };
            if (($dobj is DisplayObjectContainer))
            {
                numChildren = ($dobj as DisplayObjectContainer).numChildren;
                while (numChildren-- > 0)
                {
                    if ($recursion)
                    {
                        clearChildren(($dobj as DisplayObjectContainer).getChildAt(numChildren), $disposeChildren, $recursion);
                    };
                    if (!($dobj is Loader))
                    {
                        ($dobj as DisplayObjectContainer).removeChildAt(numChildren);
                    };
                };
            }
            else
            {
                if ((((($disposeChildren) && (($dobj is Bitmap)))) && (($dobj as Bitmap).bitmapData)))
                {
                    ($dobj as Bitmap).bitmapData.dispose();
                };
            };
        }

        public static function parentList($dobj:DisplayObject):Array
        {
            var dobjList:Array = [];
            while ($dobj.parent != null)
            {
                dobjList.push($dobj.parent);
                $dobj = $dobj.parent;
            };
            return (dobjList);
        }

        public static function childList($container:DisplayObjectContainer):Array
        {
            var i:int;
            var dobj = null;
            var dobjList:Array = [];
            var childrenCount:int = $container.numChildren;
            i = (childrenCount - 1);
            while (i >= 0)
            {
                dobj = $container.getChildAt(i);
                dobjList.push(dobj);
                if ((dobj is DisplayObjectContainer))
                {
                    dobjList = dobjList.concat(childList((dobj as DisplayObjectContainer)));
                };
                i--;
            };
            return (dobjList);
        }

        public static function removeChild($child:DisplayObject):void
        {
            if (((!(($child == null))) && (!(($child.parent == null)))))
            {
                $child.parent.removeChild($child);
            };
        }

        public static function isParentChild($parent:DisplayObjectContainer, $child:DisplayObject):Boolean
        {
            if (((((($child == null)) || (($parent == null)))) || (($child.parent == null))))
            {
                return (false);
            };
            if ($child.parent == $parent)
            {
                return (true);
            };
            return (isParentChild($parent, $child.parent));
            return (false); //dead code
        }

        public static function isVisible($dobj:DisplayObject):Boolean
        {
            if (((($dobj == null)) || (($dobj.visible == false))))
            {
                return (false);
            };
            if (($dobj is Stage))
            {
                return (true);
            };
            return (isVisible($dobj.parent));
            return (false); //dead code
        }

        public static function copy(value:Object):Object
        {
            var buffer:ByteArray = new ByteArray();
            buffer.writeObject(value);
            buffer.position = 0;
            var result:Object = buffer.readObject();
            return (result);
        }


    }
}//package com.game.mainCore.libCore.utils
