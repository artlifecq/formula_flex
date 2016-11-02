//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.manager
{
    import flash.display.DisplayObject;
    import flash.geom.Point;
    import flash.display.DisplayObjectContainer;
    import flash.ui.Mouse;
    import flash.display.InteractiveObject;
    import flash.events.MouseEvent;
    import org.client.mainCore.utils.DisplayUtil;

    public class CursorManager 
    {

        private static var _cursor:DisplayObject;
        private static var _offset:Point;
        private static var _root:DisplayObjectContainer = ProjectManager.stage;

        public function CursorManager():void
        {
            throw (new Error("not constructor"));
        }

        public static function init(root:DisplayObjectContainer):void
        {
            _root = root;
        }

        public static function setCursor(pCursor:DisplayObject, offset:Point=null, isHide:Boolean=true):void
        {
            if (!(_root))
            {
                throw (new Error("not root"));
            };
            if (_cursor)
            {
                removeCursor();
            };
            if (isHide)
            {
                Mouse.hide();
            };
            _cursor = pCursor;
            if ((_cursor is InteractiveObject))
            {
                InteractiveObject(_cursor).mouseEnabled = false;
                if ((_cursor is DisplayObjectContainer))
                {
                    DisplayObjectContainer(_cursor).mouseChildren = false;
                };
            };
            if ((offset == null))
            {
                offset = new Point();
            };
            _offset = offset;
            _cursor.x = (_root.mouseX + _offset.x);
            _cursor.y = (_root.mouseY + _offset.y);
            _root.addChild(_cursor);
            _root.addEventListener("mouseMove", onMouseMove);
        }

        private static function onMouseMove(e:MouseEvent):void
        {
            _cursor.x = (_root.mouseX + _offset.x);
            _cursor.y = (_root.mouseY + _offset.y);
            e.updateAfterEvent();
        }

        public static function bringToFront():void
        {
            if (_cursor)
            {
                _root.addChild(_cursor);
            };
        }

        public static function removeCursor():void
        {
            if (!(_cursor))
            {
                return;
            };
            _root.removeEventListener("mouseMove", onMouseMove);
            DisplayUtil.removeForParent(_cursor);
            _cursor = null;
            Mouse.show();
        }

        public static function destroy():void
        {
            if (_cursor)
            {
                removeCursor();
            };
        }


    }
}//package org.client.mainCore.manager
