//Created by Action Script Viewer - http://www.buraks.com/asv
package com.rpgGame.app.richText.component
{
    import __AS3__.vec.Vector;
    import feathers.controls.UIAsset;

    public class RichTextUIAssetPool 
    {

        private static var unitPool:Vector.<UIAsset> = new Vector.<UIAsset>();


        public static function getFromPool():UIAsset
        {
            var _local1 = null;
            if (unitPool.length > 0)
            {
                _local1 = unitPool.pop();
            }
            else
            {
                _local1 = new UIAsset();
                _local1.imageScaleMode = 0;
            };
            return (_local1);
        }

        public static function putToPool(value:UIAsset):void
        {
            if (value == null)
            {
                return;
            };
            value.styleName = "";
            unitPool.push(value);
        }


    }
}//package com.rpgGame.app.richText.component
