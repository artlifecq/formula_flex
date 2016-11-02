//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.manager
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.display.BitmapData;
    import flash.display.Bitmap;
    import flash.display.DisplayObject;
    import org.client.mainCore.ds.HashMap;
    import flash.text.TextFormat;
    import flash.display.InteractiveObject;
    import flash.system.Capabilities;
    import flash.events.MouseEvent;
    import org.client.mainCore.utils.DisplayUtil;

    public class ToolTipManager 
    {

        private static var _toolTip:Sprite;
        private static var _txt:TextField;
        private static var _bitmapdata:BitmapData;
        private static var _bitmap:Bitmap;
        private static var _bg:DisplayObject;
        private static var _listMap:HashMap;
        private static var _cx:Number;
        private static var _cy:Number;
        private static var tf:TextFormat;


        public static function setup(bg:DisplayObject, textFormat:TextFormat=null):void
        {
            _bg = bg;
            _listMap = new HashMap();
            _toolTip = new Sprite();
            _toolTip.mouseChildren = false;
            _toolTip.mouseEnabled = false;
            _toolTip.addChild(_bg);
            _txt = new TextField();
            _txt.width = 200;
            _txt.multiline = true;
            _txt.wordWrap = true;
            _txt.autoSize = "left";
            _bitmap = new Bitmap();
            _toolTip.addChild(_bitmap);
            if (!(textFormat))
            {
                tf = new TextFormat();
            }
            else
            {
                tf = textFormat;
            };
        }

        public static function add(obj:InteractiveObject, str:String):void
        {
            obj.addEventListener("rollOver", onOver);
            obj.addEventListener("rollOut", onOut);
            _listMap.add(obj, str);
        }

        public static function remove(obj:InteractiveObject):void
        {
            if (_listMap.containsKey(obj))
            {
                obj.removeEventListener("rollOver", onOver);
                obj.removeEventListener("rollOut", onOut);
                _listMap.remove(obj);
            };
            onFinishTween();
        }

        private static function onOver(e:MouseEvent):void
        {
            var obj:InteractiveObject = (e.currentTarget as InteractiveObject);
            _txt.htmlText = _listMap.getValue(obj);
            _txt.setTextFormat(tf);
            if (_bitmapdata)
            {
                _bitmapdata.dispose();
                _bitmapdata = null;
            };
            var w:Number = (_txt.textWidth + 2);
            var h:Number = _txt.textHeight;
            if ((Capabilities.os == "Windows Vista"))
            {
                h = (h + 2);
            };
            _bitmapdata = new BitmapData(w, h, true, 0);
            _bitmapdata.draw(_txt);
            _bitmap.bitmapData = _bitmapdata;
            _bitmap.x = 2;
            _bitmap.y = 1;
            _bg.width = (_bitmap.width + 8);
            _bg.height = (_bitmap.height + 6);
            PopUpManager.showForMouse(_toolTip, 1, 5, -5);
            _cx = (_toolTip.x - e.stageX);
            _cy = (_toolTip.y - e.stageY);
            ProjectManager.stage.addEventListener("mouseMove", onMove);
        }

        private static function onOut(e:MouseEvent):void
        {
            onFinishTween();
        }

        private static function onMove(e:MouseEvent):void
        {
            _toolTip.x = (_cx + e.stageX);
            _toolTip.y = (_cy + e.stageY);
        }

        private static function onFinishTween():void
        {
            DisplayUtil.removeForParent(_toolTip);
            ProjectManager.stage.removeEventListener("mouseMove", onMove);
        }


    }
}//package org.client.mainCore.manager
