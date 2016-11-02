package com.game.mainCore.libCore.utils
{
    import com.game.mainCore.libCore.timer.TimerHelper;
    import com.game.mainCore.libCore.vo.Rect;
    
    import flash.utils.getTimer;

    public class BoxingHelper 
    {


        public function boxing($rectList:Array, $boxType:int=0, $onUpdate:Function=null, $onComplete:Function=null):void
        {
            $rectList = $rectList;
            $boxType = $boxType;
            $onUpdate = $onUpdate;
            $onComplete = $onComplete;
            function htBox():void
            {
                if ((boxList.length == 0))
                {
                    if (($onComplete is Function))
                    {
                        ($onComplete(saveBoxList));
                    };
                    return;
                };
                var box:Rect = boxList.pop();
                saveBoxList.push(box);
                (doBoxing(box));
                if (($onUpdate is Function))
                {
                    ($onUpdate(box));
                };
                TimerHelper.addDelayCallBack(1, htBox);
            };
            function doBoxing($box:Rect):void
            {
                $box = _arg1;
                function isTooSmallBox($checkFreeBox:Rect):Boolean
                {
                    $checkFreeBox = _arg1;
                    function every(element:*, index:int, arr:Array):Boolean
                    {
                        var testBox:Rect = (_arg1 as Rect);
                        return ((((testBox.width > $checkFreeBox.width)) || ((testBox.height > $checkFreeBox.height))));
                    };
                    return (boxList.every(every));
                };
                function isNotBeIncludedBox($checkFreeBox:Rect):Boolean
                {
                    $checkFreeBox = _arg1;
                    function every(element:*, index:int, arr:Array):Boolean
                    {
                        var testFreeBox:Rect = (_arg1 as Rect);
                        return ((((testFreeBox == $checkFreeBox)) || ((((((((testFreeBox.left > $checkFreeBox.left)) || ((testFreeBox.right < $checkFreeBox.right)))) || ((testFreeBox.top > $checkFreeBox.top)))) || ((testFreeBox.bottom < $checkFreeBox.bottom))))));
                    };
                    return (freeBoxList.every(every));
                };
                var inLen:int = freeBoxList.length;
                var canIncluded:Boolean;
                var inI:int;
                while (inI < inLen)
                {
                    var inFreeBox:Rect = freeBoxList[inI];
                    if ((((inFreeBox.width >= $box.width)) && ((inFreeBox.height >= $box.height))))
                    {
                        $box.x = inFreeBox.x;
                        $box.y = inFreeBox.y;
                        canIncluded = true;
                        break;
                    };
                    inI++;
                };
                if (!canIncluded)
                {
                    throw (new Error("太小无法容纳"));
                };
                var inLen2:int = freeBoxList.length;
                var r:Rect = $box;
                var inI2:int = (inLen2 - 1);
                while (inI2 >= 0)
                {
                    var R:Rect = freeBoxList[inI2];
                    if (R.intersects(r))
                    {
                        freeBoxList.splice(inI2, 1);
                        var rect1:Rect = new Rect(R.left, R.top, (r.left - R.left), R.height);
                        var rect2:Rect = new Rect(R.left, R.top, R.width, (r.top - R.top));
                        var rect3:Rect = new Rect(r.right, R.top, (R.right - r.right), R.height);
                        var rect4:Rect = new Rect(R.left, r.bottom, R.width, (R.bottom - r.bottom));
                        if (!(rect1.isEmpty()))
                        {
                            freeBoxList.push(rect1);
                        };
                        if (!(rect2.isEmpty()))
                        {
                            freeBoxList.push(rect2);
                        };
                        if (!(rect3.isEmpty()))
                        {
                            freeBoxList.push(rect3);
                        };
                        if (!(rect4.isEmpty()))
                        {
                            freeBoxList.push(rect4);
                        };
                    };
                    inI2--;
                };
                var inLen3:int = freeBoxList.length;
                var inI3:int = (inLen3 - 1);
                while (inI3 >= 0)
                {
                    var inFreeBox3:Rect = freeBoxList[inI3];
                    if (((inFreeBox3.isEmpty()) || (isTooSmallBox(inFreeBox3))))
                    {
                        freeBoxList.splice(inI3, 1);
                    };
                    inI3--;
                };
                freeBoxList.sortOn("area", (16 | 2));
                var inLen4:int = freeBoxList.length;
                var inI4:int = (inLen4 - 1);
                while (inI4 >= 0)
                {
                    var inFreeBox4:Rect = freeBoxList[inI4];
                    if (!(isNotBeIncludedBox(inFreeBox4)))
                    {
                        freeBoxList.splice(inI4, 1);
                    };
                    inI4--;
                };
                freeBoxList.sortOn(["y", "x"], [16, 16]);
            };
            var boxList:Array = $rectList;
            var saveBoxList:Array = [];
            var freeBoxList:Array = [];
            if (($boxType == 0))
            {
                boxList.sortOn("area", 16);
            }
            else
            {
                if ($boxType == 1)
                {
                    boxList.sortOn("width", 16);
                }
                else
                {
                    if ($boxType == 2)
                    {
                        boxList.sortOn("height", 16);
                    }
                    else
                    {
                        throw (new Error("装箱模式错误"));
                    };
                };
            };
            var boxH:int = 20000;
            var totalArea:Number = 0;
            var maxWidth:Number = 0;
            for each (var box:Rect in boxList)
            {
                totalArea = (totalArea + box.area);
                maxWidth = (((box.width)>maxWidth) ? box.width : maxWidth);
            };
            var boxW:int = Math.max((Math.sqrt(totalArea) * 1.25), maxWidth);
            freeBoxList.push(new Rect(0, 0, boxW, boxH));
            var time:int = getTimer();
            htBox(); //not popped
        }
    }
}