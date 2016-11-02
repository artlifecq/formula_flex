//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.manager
{
    import org.client.mainCore.ds.HashMap;
    import flash.display.DisplayObject;
    import org.client.mainCore.utils.DisplayUtil;
    import flash.ui.Mouse;
    import flash.events.MouseEvent;
    import flash.events.Event;

    public class DisplayMouseManager 
    {

        private static var _hashMap:HashMap = new HashMap();
        private static var _curtMosDis:DisplayObject;
        private static var _curtMosStatusDis:DisplayObject;


        public static function register(dis:DisplayObject, statusDis:DisplayObject):void
        {
            DisplayUtil.removeForParent(_curtMosStatusDis);
            _curtMosStatusDis = null;
            _hashMap.add(dis, statusDis);
            dis.addEventListener("removedFromStage", onRmoveStg);
            dis.addEventListener("mouseOver", onMosOver);
            dis.addEventListener("mouseOut", onMosOut);
        }

        public static function cancel(dis:DisplayObject):void
        {
            dis.removeEventListener("removedFromStage", onRmoveStg);
            dis.removeEventListener("mouseOver", onMosOver);
            dis.removeEventListener("mouseOut", onMosOut);
            dis.removeEventListener("mouseMove", onMosMove);
            DisplayUtil.removeForParent(_curtMosStatusDis);
            _curtMosStatusDis = null;
            _hashMap.remove(dis);
            Mouse.show();
            if ((_hashMap.length == 0))
            {
                clear();
            };
        }

        public static function clearAll():void
        {
            var keys:Array = _hashMap.keys();
            for each (var dis:DisplayObject in keys)
            {
                cancel(dis);
            };
        }

        private static function onMosOver(e:MouseEvent):void
        {
            _curtMosDis = (e.currentTarget as DisplayObject);
            var statusDis:DisplayObject = _hashMap.getValue(_curtMosDis);
            showMosStatus(statusDis);
            _curtMosDis.addEventListener("mouseMove", onMosMove);
        }

        private static function onMosOut(e:MouseEvent):void
        {
            _curtMosDis = (e.currentTarget as DisplayObject);
            hideDisMosStatus(_curtMosDis);
        }

        private static function onMosMove(e:MouseEvent):void
        {
            _curtMosDis = (e.currentTarget as DisplayObject);
            var statusDis:DisplayObject = _hashMap.getValue(_curtMosDis);
            showMosStatus(statusDis);
        }

        private static function onRmoveStg(e:Event):void
        {
            var dis:DisplayObject = (e.currentTarget as DisplayObject);
            if (dis)
            {
                cancel(dis);
            };
        }

        private static function clear():void
        {
            _hashMap = new HashMap();
        }

        private static function showMosStatus(dis:DisplayObject):void
        {
            if (!((dis == null)))
            {
                Mouse.hide();
                LayerManager.stage.addChild(dis);
                dis.x = LayerManager.stage.mouseX;
                dis.y = LayerManager.stage.mouseY;
                _curtMosStatusDis = dis;
            }
            else
            {
                Mouse.show();
            };
        }

        private static function hideDisMosStatus(dis:DisplayObject):void
        {
            DisplayUtil.removeForParent(_curtMosStatusDis);
            _curtMosStatusDis = null;
            Mouse.show();
            if (dis)
            {
                dis.removeEventListener("mouseMove", onMosMove);
            };
        }


    }
}//package com.game.mainCore.core.manager
