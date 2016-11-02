//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.display.MovieClip;
    import flash.display.DisplayObjectContainer;
    import flash.display.Bitmap;
    import flash.display.DisplayObject;
    import flash.text.TextField;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import org.client.mainCore.manager.ProjectManager;
    import __AS3__.vec.Vector;
    import flash.geom.ColorTransform;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.display.InteractiveObject;

    public class DisplayUtil 
    {

        private static const MOUSE_EVENT_LIST:Array = ["click", "doubleClick", "mouseDown", "mouseMove", "mouseOut", "mouseOver", "mouseUp", "mouseWheel", "rollOut", "rollOver"];


        public static function stopAllMovieClip(dis:DisplayObjectContainer, frame:uint=0):void
        {
            var child = null;
            var i:int;
            var mc:MovieClip = (dis as MovieClip);
            if (!((mc == null)))
            {
                if (!((frame == 0)))
                {
                    mc.gotoAndStop(frame);
                }
                else
                {
                    mc.gotoAndStop(1);
                };
                mc = null;
            };
            var num:int = (dis.numChildren - 1);
            if ((num < 0))
            {
                return;
            };
            i = num;
            while (i >= 0)
            {
                child = (dis.getChildAt(i) as DisplayObjectContainer);
                if (!((child == null)))
                {
                    stopAllMovieClip(child, frame);
                };
                i--;
            };
        }

        public static function playAllMovieClip(dis:DisplayObjectContainer):void
        {
            var child = null;
            var i:int;
            var mc:MovieClip = (dis as MovieClip);
            if (!((mc == null)))
            {
                mc.gotoAndPlay(1);
                mc = null;
            };
            var num:int = (dis.numChildren - 1);
            if ((num < 0))
            {
                return;
            };
            i = num;
            while (i >= 0)
            {
                child = (dis.getChildAt(i) as DisplayObjectContainer);
                if (!((child == null)))
                {
                    playAllMovieClip(child);
                };
                i--;
            };
        }

        public static function removeAllChild(dis:DisplayObjectContainer, gc:Boolean=false):void
        {
            var child = null;
            if (dis)
            {
                while (dis.numChildren > 0)
                {
                    child = dis.removeChildAt((dis.numChildren - 1));
                    if ((child is DisplayObjectContainer))
                    {
                        stopAllMovieClip((child as DisplayObjectContainer));
                    };
                    if (gc)
                    {
                        if ((child is Bitmap))
                        {
                            (child as Bitmap).bitmapData.dispose();
                        };
                        child = null;
                    };
                };
            };
        }

        public static function removeForParent(dis:DisplayObject, gc:Boolean=false):void
        {
            if ((dis == null))
            {
                return;
            };
            if ((dis.parent == null))
            {
                return;
            };
            if (!(dis.parent.contains(dis)))
            {
                return;
            };
            dis.parent.removeChild(dis);
            if (gc)
            {
                if ((dis is DisplayObjectContainer))
                {
                    stopAllMovieClip((dis as DisplayObjectContainer), 1);
                    removeAllChild((dis as DisplayObjectContainer), gc);
                }
                else
                {
                    if ((dis is Bitmap))
                    {
                        (dis as Bitmap).bitmapData.dispose();
                    };
                };
                clearTextFields(dis);
                dis = null;
            };
        }

        public static function clearTextFields(o:DisplayObject):void
        {
            var tf = null;
            var container = null;
            var i:int;
            if ((o is TextField))
            {
                tf = (o as TextField);
                var _local5 = "";
                tf.htmlText = _local5;
                tf.text = _local5;
            }
            else
            {
                if ((o is DisplayObjectContainer))
                {
                    container = (o as DisplayObjectContainer);
                    i = 0;
                    while (i < container.numChildren)
                    {
                        if ((container.getChildAt(i) is TextField))
                        {
                            tf = (container.getChildAt(i) as TextField);
                            _local5 = "";
                            tf.htmlText = _local5;
                            tf.text = _local5;
                        };
                        i++;
                    };
                };
            };
        }

        public static function hasParent(target:DisplayObject):Boolean
        {
            if ((target.parent == null))
            {
                return (false);
            };
            return (target.parent.contains(target));
        }

        public static function localToLocal(from:DisplayObject, _to:DisplayObject, p:Point=null):Point
        {
            if ((p == null))
            {
                p = new Point(0, 0);
            };
            p = from.localToGlobal(p);
            p = _to.globalToLocal(p);
            return (p);
        }

        public static function align(target:DisplayObject, bounds:Rectangle=null, align:int=0, offset:Point=null):void
        {
            if ((bounds == null))
            {
                bounds = new Rectangle(0, 0, ProjectManager.stage.stageWidth, ProjectManager.stage.stageHeight);
            };
            if (offset)
            {
                bounds.offsetPoint(offset);
            };
            var targetRect:Rectangle = target.getRect(target);
            var _hd:Number = (bounds.width - target.width);
            var _vd:Number = (bounds.height - target.height);
            switch (align)
            {
                case 0:
                    target.x = bounds.x;
                    target.y = bounds.y;
                    return;
                case 1:
                    target.x = ((bounds.x + (_hd / 2)) - targetRect.x);
                    target.y = bounds.y;
                    return;
                case 2:
                    target.x = ((bounds.x + _hd) - targetRect.x);
                    target.y = bounds.y;
                    return;
                case 3:
                    target.x = bounds.x;
                    target.y = ((bounds.y + (_vd / 2)) - targetRect.x);
                    return;
                case 4:
                    target.x = ((bounds.x + (_hd / 2)) - targetRect.x);
                    target.y = ((bounds.y + (_vd / 2)) - targetRect.y);
                    return;
                case 5:
                    target.x = ((bounds.x + _hd) - targetRect.x);
                    target.y = ((bounds.y + (_vd / 2)) - targetRect.y);
                    return;
                case 6:
                    target.x = bounds.x;
                    target.y = ((bounds.y + _vd) - targetRect.y);
                    return;
                case 7:
                    target.x = ((bounds.x + (_hd / 2)) - targetRect.x);
                    target.y = ((bounds.y + _vd) - targetRect.y);
                    return;
                case 8:
                    target.x = ((bounds.x + _hd) - targetRect.x);
                    target.y = ((bounds.y + _vd) - targetRect.y);
                default:
                    return;
            };
        }

        public static function multiAlign(targetList:Vector.<DisplayObject>, bounds:Rectangle=null, align:int=0, multiAlign:int=0, offset:Point=null):void
        {
            targetList = targetList;
            bounds = bounds;
            align = align;
            multiAlign = multiAlign;
            offset = offset;
            onCompareWidth = function (disA:DisplayObject, disB:DisplayObject):int
            {
                if ((_arg1.width > _arg2.width))
                {
                    return (-1);
                };
                return (1);
            };
            onCompareHeight = function (disA:DisplayObject, disB:DisplayObject):int
            {
                if ((_arg1.height > _arg2.height))
                {
                    return (-1);
                };
                return (1);
            };
            showDisList = function (offsetX:Number, offsetY:Number):void
            {
                switch (multiAlign)
                {
                    case 0:
                        for each (tDis in disList)
                        {
                            tDis.x = ((bounds.x + curtShowWidth) + _arg1);
                            tDis.y = (bounds.y + _arg2);
                            curtShowWidth = (curtShowWidth + tDis.width);
                            curtShowHeight = (curtShowHeight + tDis.height);
                        };
                        return;
                    case 1:
                        for each (tDis in disList)
                        {
                            tDis.x = (bounds.x + _arg1);
                            tDis.y = ((bounds.y + curtShowHeight) + _arg2);
                            curtShowWidth = (curtShowWidth + tDis.width);
                            curtShowHeight = (curtShowHeight + tDis.height);
                        };
                    default:
                        return;
                };
            };
            var disList:Vector.<DisplayObject> = new Vector.<DisplayObject>();
            if ((bounds == null))
            {
                var bounds:Rectangle = new Rectangle(0, 0, ProjectManager.stage.stageWidth, ProjectManager.stage.stageHeight);
            };
            if (offset)
            {
                bounds.offsetPoint(offset);
            };
            var totalWidth:Number = 0;
            var totalHeight:Number = 0;
            for each (var dis:DisplayObject in targetList)
            {
                totalWidth = (totalWidth + dis.width);
                totalHeight = (totalHeight + dis.height);
                disList.push(dis);
            };
            switch (multiAlign)
            {
                case 0:
                    targetList.sort(onCompareHeight);
                    totalHeight = targetList[0].height;
                    break;
                case 1:
                    targetList.sort(onCompareWidth);
                    totalWidth = targetList[0].width;
                default:
            };
            var _hd:Number = (bounds.width - totalWidth);
            var _vd:Number = (bounds.height - totalHeight);
            var curtShowWidth:Number = 0;
            var curtShowHeight:Number = 0;
            switch (align)
            {
                case 0:
                    (showDisList(bounds.x, bounds.y));
                    return;
                case 1:
                    (showDisList((bounds.x + (_hd / 2)), bounds.y));
                    return;
                case 2:
                    (showDisList((bounds.x + _hd), bounds.y));
                    return;
                case 3:
                    (showDisList(bounds.x, (bounds.y + (_vd / 2))));
                    return;
                case 4:
                    (showDisList((bounds.x + (_hd / 2)), (bounds.y + (_vd / 2))));
                    return;
                case 5:
                    (showDisList((bounds.x + _hd), (bounds.y + (_vd / 2))));
                    return;
                case 6:
                    (showDisList(bounds.x, (bounds.y + _vd)));
                    return;
                case 7:
                    (showDisList((bounds.x + (_hd / 2)), (bounds.y + _vd)));
                    return;
                case 8:
                    (showDisList((bounds.x + _hd), (bounds.y + _vd)));
                default:
                    return;
            };
        }

        public static function fillColor(target:DisplayObject, c:uint):void
        {
            var ctf:ColorTransform = new ColorTransform();
            ctf.color = c;
            target.transform.colorTransform = ctf;
        }

        public static function getColor(target:DisplayObject, x:uint=0, y:uint=0, getAlpha:Boolean=false):uint
        {
            var bmp:BitmapData = new BitmapData(target.width, target.height);
            bmp.draw(target);
            var color:uint = ((getAlpha) ? bmp.getPixel32(x, y) : bmp.getPixel(x, y));
            bmp.dispose();
            return (color);
        }

        public static function uniformScale(target:DisplayObject, num:Number):void
        {
            if ((target.width >= target.height))
            {
                target.width = num;
                target.scaleY = target.scaleX;
            }
            else
            {
                target.height = num;
                target.scaleX = target.scaleY;
            };
        }

        public static function copyDisplayAsBmp(dis:DisplayObject, smoothing:Boolean=true):Bitmap
        {
            var oldX:Number;
            var oldY:Number;
            oldY = dis.scaleY;
            oldX = dis.scaleX;
            var bmpdata:BitmapData = new BitmapData(dis.width, dis.height, true, 0);
            var rect:Rectangle = dis.getRect(dis);
            var matrix:Matrix = new Matrix();
            if ((oldX < 0))
            {
                dis.scaleX = -(dis.scaleX);
            };
            if ((oldY < 0))
            {
                dis.scaleY = -(dis.scaleY);
            };
            matrix.createBox(dis.scaleX, dis.scaleY, 0, (-(rect.x) * dis.scaleX), (-(rect.y) * dis.scaleY));
            bmpdata.draw(dis, matrix);
            dis.scaleX = oldX;
            dis.scaleY = oldY;
            var bmp:Bitmap = new Bitmap(bmpdata, "auto", smoothing);
            if ((oldX < 0))
            {
                bmp.scaleX = -1;
            };
            if ((oldY < 0))
            {
                bmp.scaleY = -1;
            };
            bmp.x = (rect.x * dis.scaleX);
            bmp.y = (rect.y * dis.scaleY);
            return (bmp);
        }

        public static function mouseEnabledAll(target:InteractiveObject, isAll:Boolean=false):void
        {
            target = target;
            isAll = isAll;
            if (target == null)
            {
                return;
            };
            var b:Boolean = MOUSE_EVENT_LIST.some(function (item:String, index:int, array:Array):Boolean
            {
                if (target.hasEventListener(_arg1))
                {
                    return (true);
                };
                return (false);
            });
            if (!(b))
            {
                if (!((target.name.indexOf("instance") == -1)))
                {
                    target.mouseEnabled = false;
                };
            };
            var container:DisplayObjectContainer = (target as DisplayObjectContainer);
            if (container)
            {
                var i:int = (container.numChildren - 1);
                i;
                while (i >= 0)
                {
                    var child:InteractiveObject = (container.getChildAt(i) as InteractiveObject);
                    if (child)
                    {
                        mouseEnabledAll(child);
                    };
                    i--;
                };
            };
        }

        public static function getFullBounds(displayObject:DisplayObject):Rectangle
        {
            var bounds = null;
            var transform = null;
            var toGlobalMatrix = null;
            var currentMatrix = null;
            transform = displayObject.transform;
            currentMatrix = transform.matrix;
            toGlobalMatrix = transform.concatenatedMatrix;
            toGlobalMatrix.invert();
            transform.matrix = toGlobalMatrix;
            bounds = transform.pixelBounds.clone();
            transform.matrix = currentMatrix;
            return (bounds);
        }


    }
}//package org.client.mainCore.utils
