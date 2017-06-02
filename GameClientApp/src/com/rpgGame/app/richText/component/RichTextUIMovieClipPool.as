//Created by Action Script Viewer - http://www.buraks.com/asv
package com.rpgGame.app.richText.component
{
    import __AS3__.vec.Vector;
    import feathers.controls.UIMovieClip;

    public class RichTextUIMovieClipPool 
    {

        private static var unitPool:Vector.<UIMovieClip> = new Vector.<UIMovieClip>();


        public static function getFromPool():UIMovieClip
        {
            var _local1 = null;
            if (unitPool.length > 0)
            {
                _local1 = unitPool.pop();
            }
            else
            {
                _local1 = new UIMovieClip();
                _local1.imageScaleMode = 0;
            };
            return (_local1);
        }

        public static function putToPool(value:UIMovieClip):void
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
