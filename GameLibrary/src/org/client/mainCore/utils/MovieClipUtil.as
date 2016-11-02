//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.display.DisplayObjectContainer;

    public class MovieClipUtil 
    {


        public static function playEndAndRemove(mc:MovieClip):void
        {
            mc = mc;
            mc.addFrameScript((mc.totalFrames - 1), function ():void
            {
                mc.addFrameScript((mc.totalFrames - 1), null);
                DisplayUtil.removeForParent(mc);
                mc = null;
            });
        }

        public static function childStop(obj:DisplayObjectContainer, frame:Object, level:uint=0):void
        {
            obj = obj;
            frame = frame;
            level = level;
            var count:int;
            var num:int = obj.numChildren;
            if ((num == 0))
            {
                return;
            };
            if ((level >= num))
            {
                var level:uint = (num - 1);
            };
            obj.addEventListener("enterFrame", function (e:Event):void
            {
                var mc:MovieClip = (obj.getChildAt(level) as MovieClip);
                if (mc)
                {
                    obj.removeEventListener("enterFrame", arguments.callee);
                    mc.gotoAndStop(frame);
                }
                else
                {
                    if ((count > 2))
                    {
                        obj.removeEventListener("enterFrame", arguments.callee);
                    };
                };
                count++;
            });
        }

        public static function childPlay(obj:DisplayObjectContainer, frame:Object, level:uint=0):void
        {
            obj = obj;
            frame = frame;
            level = level;
            var count:int;
            var num:int = obj.numChildren;
            if ((num == 0))
            {
                return;
            };
            if ((level >= num))
            {
                var level:uint = (num - 1);
            };
            obj.addEventListener("enterFrame", function (e:Event):void
            {
                var mc:MovieClip = (obj.getChildAt(level) as MovieClip);
                if (mc)
                {
                    obj.removeEventListener("enterFrame", arguments.callee);
                    mc.gotoAndPlay(frame);
                }
                else
                {
                    if ((count > 2))
                    {
                        obj.removeEventListener("enterFrame", arguments.callee);
                    };
                };
                count++;
            });
        }


    }
}//package org.client.mainCore.utils
