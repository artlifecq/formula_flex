//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.manager
{
    import org.client.mainCore.ds.HashMap;
    import flash.display.Sprite;
    import flash.display.InteractiveObject;
    import flash.events.MouseEvent;
    import flash.events.Event;

    public class SimpleDragManager 
    {

        private static var _collectionMap:HashMap = new HashMap();

        public function SimpleDragManager():void
        {
        }

        public static function add(downTarget:InteractiveObject, moveTarget:Sprite):void
        {
            if ((downTarget is Sprite))
            {
                (downTarget as Sprite).buttonMode = true;
            };
            downTarget.addEventListener("mouseDown", onMouseDownHandler);
            downTarget.addEventListener("mouseUp", onMouseUpHandler);
            moveTarget.addEventListener("removedFromStage", onRemoveFromStg);
            _collectionMap.add(downTarget, moveTarget);
        }

        private static function onMouseDownHandler(e:MouseEvent):void
        {
            var sp:Sprite = (_collectionMap.getValue((e.currentTarget as InteractiveObject)) as Sprite);
            if (sp)
            {
                DepthManager.bringToTop(sp);
                sp.startDrag();
            };
        }

        private static function onMouseUpHandler(e:MouseEvent):void
        {
            var sp:Sprite = (_collectionMap.getValue((e.currentTarget as InteractiveObject)) as Sprite);
            if (sp)
            {
                sp.stopDrag();
            };
        }

        private static function onRemoveFromStg(e:Event):void
        {
            var sp:Sprite = ((e.currentTarget as InteractiveObject) as Sprite);
            if (sp)
            {
                sp.stopDrag();
            };
        }

        public static function remove(downTarget:InteractiveObject):void
        {
            downTarget.removeEventListener("mouseDown", onMouseDownHandler);
            downTarget.removeEventListener("mouseUp", onMouseUpHandler);
            var sp:Sprite = (_collectionMap.getValue(downTarget) as Sprite);
            if (sp)
            {
                sp.addEventListener("removedFromStage", onRemoveFromStg);
                _collectionMap.remove(downTarget);
                sp = null;
            };
        }


    }
}//package org.client.mainCore.manager
