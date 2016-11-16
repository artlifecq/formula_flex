package org.client.mainCore.utils
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class BitmapDataUtil 
    {

        private static var _bmp:Bitmap = new Bitmap();


        public static function isAvailable(bmpData:BitmapData):Boolean
        {
            _bmp.bitmapData = bmpData;
            if (_bmp.width && _bmp.height)
            {
                return true;
            }
            return false;
        }

        public static function makeList(data:BitmapData, width:int, height:int, totalFrames:uint, gc:Boolean=false):Array
        {
            var iw:int;
            var ih:int;
            var bm:BitmapData = null;
            var wLen:int = (Math.min(data.width, 2880) / width);
            var hLen:int = (Math.min(data.height, 2880) / height);
            var count:int;
            var arr:Array = [];
            var rect:Rectangle = new Rectangle(0, 0, width, height);
            var pos:Point = new Point();
            ih = 0;
            while (ih < hLen)
            {
                iw = 0;
                while (iw < wLen)
                {
                    if (count >= totalFrames)
                    {
                        return arr;
                    }
                    rect.x = (iw * width);
                    rect.y = (ih * height);
                    bm = new BitmapData(width, height);
                    bm.copyPixels(data, rect, pos);
                    arr[count] = bm;
                    count++;
                    iw++;
                }
                ih++;
            }
            if (gc)
            {
                data.dispose();
            }
            return arr;
        }
    }
}