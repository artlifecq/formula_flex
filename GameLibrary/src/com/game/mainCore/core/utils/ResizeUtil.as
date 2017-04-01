//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.utils
{
    import org.client.mainCore.ds.HashMap;
    import com.game.mainCore.core.manager.LayerManager;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import org.client.mainCore.utils.DisplayUtil;
    import flash.geom.Rectangle;

    public class ResizeUtil 
    {

        private static var _map:HashMap = new HashMap();


        public static function align(dis:DisplayObject, align:int=4, offsetX:Number=0, offsetY:Number=0):void
        {
            var info = null;
            if (dis)
            {
                info = new ResizeDisInfo();
                info.dis = dis;
                info.align = align;
                info.offsetX = offsetX;
                info.offsetY = offsetY;
                _map.add(dis, info);
                dis.addEventListener("addedToStage", onAdded);
                dis.addEventListener("removedFromStage", onRemoved);
                alignDis(dis, align, offsetX, offsetY);
                LayerManager.stage.addEventListener("resize", onStgResize);
            };
        }

        private static function onAdded(e:Event):void
        {
            var dis:DisplayObject = (e.currentTarget as DisplayObject);
        }

        private static function onRemoved(e:Event):void
        {
            var dis:DisplayObject = (e.currentTarget as DisplayObject);
            dis.removeEventListener("addedToStage", onAdded);
            dis.removeEventListener("removedFromStage", onRemoved);
            _map.remove(dis);
        }

        private static function onStgResize(e:Event):void
        {
            var arr:Array = _map.getValues();
            for each (var info:ResizeDisInfo in arr)
            {
                alignDis(info.dis, info.align, info.offsetX, info.offsetY);
            };
        }

        private static function alignDis(dis:DisplayObject, align:int=4, offsetX:Number=0, offsetY:Number=0):void
        {
            if (!(dis))
            {
                return;
            };
            if (!((align == -1)))
            {
                DisplayUtil.align(dis, new Rectangle(0, 0, LayerManager.stage.stageWidth, LayerManager.stage.stageHeight), align);
                dis.x = (dis.x + offsetX);
                dis.y = (dis.y + offsetY);
            }
            else
            {
                dis.x = (LayerManager.stage.stageWidth + offsetX);
                dis.y = (LayerManager.stage.stageHeight + offsetY);
            };
        }


    }
}//package com.game.mainCore.core.utils

import flash.display.DisplayObject;

class ResizeDisInfo 
{

    public var dis:DisplayObject;
    public var align:int;
    public var offsetX:Number;
    public var offsetY:Number;


}
