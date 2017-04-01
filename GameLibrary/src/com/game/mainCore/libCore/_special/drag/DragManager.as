package com.game.mainCore.libCore._special.drag
{
    import com.game.mainCore.libCore.handle.HandleThread;
    import com.game.mainCore.libCore.utils.Fun;
    import com.game.mainCore.libCore.utils.ZMath;
    import com.greensock.TweenMax;
    
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.Stage;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class DragManager 
    {

        private static var _dragData:DragData;
        private static var _stage:Stage;

        public function DragManager()
        {
            throw (new Event("静态类"));
        }

        public static function addDrag($dragData:DragData):void
        {
            if (!$dragData)
            {
                return;
            };
            if (!$dragData.isValid())
            {
                return;
            };
            if ($dragData.touchRect)
            {
                if (!($dragData.touchRect.containsPoint($dragData.guiderStartPoint)))
                {
                    return;
                };
            };
            if (((!((_dragData == null))) && (_dragData.equal($dragData))))
            {
                return;
            };
            removeDrag();
            _dragData = $dragData;
            _stage = _dragData.stage;
            _stage.addEventListener("enterFrame", update);
            if ((_dragData.mode == 0))
            {
                _stage.addEventListener("mouseUp", mouseUpHandle);
            }
            else
            {
                _stage.addEventListener("mouseDown", mouseUpHandle);
            };
        }

        public static function removeDragByDobj($dobj:DisplayObject):DragData
        {
            if (!$dobj)
            {
                return (null);
            };
            if ((((_dragData == null)) || (!((_dragData.dobj == $dobj)))))
            {
                return (null);
            };
            return (removeDrag());
        }

        public static function removeDrag():DragData
        {
            if (_dragData == null)
            {
                return (null);
            };
            if ((_dragData.type == 2))
            {
                doTween(_dragData);
            };
            _dragData.face.alpha = _dragData.dobjStartAlpha;
            var temp:DragData = _dragData;
            _dragData = null;
            _stage.removeEventListener("enterFrame", update);
            _stage.removeEventListener("mouseUp", mouseUpHandle);
            _stage.removeEventListener("mouseDown", mouseUpHandle);
            return (temp);
        }

        private static function update(e:Event):void
        {
            var point = null;
            if (Fun.isParentChild(_dragData.stage, _dragData.dobj))
            {
                point = new Point(_dragData.dobj.mouseX, _dragData.dobj.mouseY);
                if (point)
                {
                    if ((Point.distance(point, _dragData.guiderStartPoint) >= _dragData.criticalDis))
                    {
                        _stage.addChild(_dragData.face);
                        _dragData.canMove = true;
                    };
                    if (_dragData.canMove)
                    {
                        updatePos(_dragData);
                        _dragData.face.alpha = _dragData.alpha;
                    };
                };
            }
            else
            {
                removeDrag();
            };
        }

        private static function updatePos($dragData:DragData):void
        {
            var xx:Number;
            var yy:Number;
            var leftTop = null;
            var rightBottom = null;
            var rect = null;
            if (!$dragData)
            {
                return;
            };
            var target:DisplayObject = ((($dragData.face.stage)!=null) ? $dragData.face : $dragData.dobj);
            if (target.parent == null)
            {
                return;
            };
            xx = (target.parent.mouseX - $dragData.guiderStartPoint.x);
            yy = (target.parent.mouseY - $dragData.guiderStartPoint.y);
            if ($dragData.xyRect)
            {
                leftTop = target.parent.globalToLocal(new Point($dragData.xyRect.left, $dragData.xyRect.top));
                rightBottom = target.parent.globalToLocal(new Point($dragData.xyRect.right, $dragData.xyRect.bottom));
                rect = new Rectangle();
                if (xx < leftTop.x)
                {
                    xx = leftTop.x;
                };
                if (xx > rightBottom.x)
                {
                    xx = rightBottom.x;
                };
                if (yy < leftTop.y)
                {
                    yy = leftTop.y;
                };
                if (yy > rightBottom.y)
                {
                    yy = rightBottom.y;
                };
            };
            target.x = xx;
            target.y = yy;
        }

        private static function dropIn($target:DisplayObject, $dragData:DragData):Boolean
        {
            var hasDroped:Boolean;
            var dropInTarget = null;
            var i:int;
            var item = null;
            var ok:Boolean;
            var dobjList:Array = Fun.parentList($target);
            dobjList.unshift($target);
            var len:int = dobjList.length;
            i = 0;
            while (i < len)
            {
                item = dobjList[i];
                if ((item is IDropInTarget))
                {
                    dropInTarget = (item as IDropInTarget);
                    ok = dropInTarget.dropIn($dragData.data);
                    if (((ok) && (!(hasDroped))))
                    {
                        hasDroped = true;
                    };
                    if ($dragData.data.breakUp) break;
                };
                i++;
            };
            return (hasDroped);
        }

        private static function mouseUpHandle(e:MouseEvent):void
        {
            var dropInTarget = null;
            var arr = null;
            var selfList = null;
            var index:int;
            var ok:Boolean;
            var dragData:DragData = removeDrag();
            if (!dragData)
            {
                return;
            };
            if (!dragData.canMove)
            {
                return;
            };
            var stageXY:Point = new Point(_stage.mouseX, _stage.mouseY);
            if ((dragData.type == 1))
            {
                if (!((dragData.face == dragData.dobj)))
                {
                    if ((dragData.showMode == 2))
                    {
                        Fun.clearChildren(dragData.face, true);
                    };
                    Fun.removeChild(dragData.face);
                };
                if ((dragData.dobj.parent == _stage))
                {
                    dragData.dobjParent.addChildAt(dragData.dobj, Math.min(dragData.dobjIndex, dragData.dobjParent.numChildren));
                };
                if (dragData.canMove)
                {
                    updatePos(dragData);
                };
            }
            else
            {
                if (dragData.type == 2)
                {
                    arr = dragData.stage.getObjectsUnderPoint(stageXY);
                    if ((arr.length > 0))
                    {
                        selfList = [dragData.dobj, dragData.face];
                        if ((dragData.dobj is DisplayObjectContainer))
                        {
                            selfList = selfList.concat(Fun.childList((dragData.dobj as DisplayObjectContainer)));
                        };
                        if ((dragData.face is DisplayObjectContainer))
                        {
                            selfList = selfList.concat(Fun.childList((dragData.face as DisplayObjectContainer)));
                        };
                        for each (var dobj:DisplayObject in selfList)
                        {
                            index = arr.indexOf(dobj);
                            if (!((index == -1)))
                            {
                                arr.splice(index, 1);
                                if ((arr.length == 0)) break;
                            };
                        };
                        if ((arr.length > 0))
                        {
                            ok = dropIn(arr[(arr.length - 1)], dragData);
                            if (ok)
                            {
                                TweenMax.killTweensOf(dragData.face, true);
                            };
                        };
                    };
                };
            };
            if (!((dragData.onComplete == null)))
            {
                HandleThread.execute(dragData.onComplete, dragData.onCompleteParameters);
            };
        }

        private static function doTween($dragData:DragData):void
        {
            var speed:Number;
            var p = null;
            var duration:Number;
            if (!$dragData)
            {
                return;
            };
            if (!$dragData.isValid())
            {
                return;
            };
            if ($dragData.type != 2)
            {
                return;
            };
            try
            {
                speed = 1450;
                p = $dragData.dobjParent.localToGlobal($dragData.dobjStartPoint);
                duration = (Math.sqrt(ZMath.getDisSquare($dragData.face.x, $dragData.face.y, p.x, p.y)) / speed);
                TweenMax.to($dragData.face, duration, {
                    "x":p.x,
                    "y":p.y,
                    "onComplete":tweenComplete,
                    "onCompleteParams":[$dragData]
                });
            }
            catch(e:Error)
            {
                $dragData.face.x = p.x;
                $dragData.face.y = p.y;
                tweenComplete($dragData);
            };
        }

        private static function tweenComplete($dragData:DragData):void
        {
            if (($dragData.showMode == 2))
            {
                Fun.clearChildren($dragData.face, true);
            };
            Fun.removeChild($dragData.face);
            $dragData.dobj.x = $dragData.dobjStartPoint.x;
            $dragData.dobj.y = $dragData.dobjStartPoint.y;
            $dragData.dobj.alpha = $dragData.dobjStartAlpha;
            if (($dragData.dobj.parent == _stage))
            {
                $dragData.dobjParent.addChildAt($dragData.dobj, Math.min($dragData.dobjIndex, $dragData.dobjParent.numChildren));
            };
        }
    }
}