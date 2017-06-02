//Created by Action Script Viewer - http://www.buraks.com/asv
package com.rpgGame.app.richText.component
{
    import __AS3__.vec.Vector;
    import feathers.controls.Label;

    public class RichTextLabelPool 
    {

        private static var unitPool:Vector.<Label> = new Vector.<Label>();


        public static function getFromPool():Label
        {
            var _local1 = null;
            if (unitPool.length > 0)
            {
                _local1 = unitPool.pop();
            }
            else
            {
                _local1 = new Label();
            };
            return (_local1);
        }

        public static function putToPool(value:Label):void
        {
            if (value == null)
            {
                return;
            };
            var _local2:int;
            value.maxWidth = _local2;
            value.width = _local2;
            value.text = "";
            unitPool.push(value);
        }


    }
}//package com.rpgGame.app.richText.component
