//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.utils
{
    import com.game.mainCore.core.manager.UIManager;
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.geom.Rectangle;
    import flash.display.BitmapData;

    public class BitmapDisplayUtil 
    {


        public static function bmp9Grid(name:String, x:Number=0, y:Number=0, width:Number=0, height:Number=0, spWidth:Number=1, spHeight:Number=1):Sprite
        {
            var bmp:Bitmap = UIManager.getBitmap(name);
            var sp:Sprite = new Sprite();
            var bs:BitmapScale9Grid = new BitmapScale9Grid(bmp.bitmapData, new Rectangle(x, y, width, height));
            bs.width = spWidth;
            bs.height = spHeight;
            bs.draw(sp.graphics);
            return (sp);
        }

        public static function bmpSplice(bmpData:BitmapData, width:Number=0, height:Number=0, isVertical:Boolean=false):Sprite
        {
            var vBmp = null;
            var hBmp = null;
            var cnt:uint = 1;
            var sp:Sprite = new Sprite();
            var i:uint;
            if (((isVertical) || ((width == 0))))
            {
                cnt = Math.ceil((height / bmpData.height));
                i = 0;
                while (i < cnt)
                {
                    vBmp = new Bitmap(bmpData);
                    vBmp.y = (vBmp.y + (i * bmpData.height));
                    sp.addChild(vBmp);
                    i++;
                };
                return (sp);
            };
            if (((!(isVertical)) || ((height == 0))))
            {
                cnt = Math.ceil((width / bmpData.width));
                i = 0;
                while (i < cnt)
                {
                    hBmp = new Bitmap(bmpData);
                    hBmp.x = (hBmp.x + (i * bmpData.width));
                    sp.addChild(hBmp);
                    i++;
                };
                return (sp);
            };
            return (sp);
        }

        public static function bmpSpliceGap(bmpData:BitmapData, width:Number=0, height:Number=0, isVertical:Boolean=false, gapStart:Number=0, gapLen:Number=0):Sprite
        {
            var vBmp = null;
            var hBmp = null;
            var cntL:uint;
            var cntR:uint;
            var cnt:uint = 1;
            var sp:Sprite = new Sprite();
            var i:uint;
            if (((isVertical) || ((width == 0))))
            {
                cntL = Math.ceil((gapStart / bmpData.height));
                cntR = Math.ceil(((gapStart + gapLen) / bmpData.height));
                cnt = Math.ceil((height / bmpData.height));
                i = 0;
                while (i < cntL)
                {
                    vBmp = new Bitmap(bmpData);
                    vBmp.y = (vBmp.y + (i * bmpData.height));
                    sp.addChild(vBmp);
                    i++;
                };
                i = cntR;
                while (i < cnt)
                {
                    vBmp = new Bitmap(bmpData);
                    vBmp.y = (vBmp.y + (i * bmpData.height));
                    sp.addChild(vBmp);
                    i++;
                };
                return (sp);
            };
            if (((!(isVertical)) || ((height == 0))))
            {
                cntL = Math.ceil((gapStart / bmpData.width));
                cntR = Math.ceil(((gapStart + gapLen) / bmpData.width));
                cnt = Math.ceil((width / bmpData.width));
                i = 0;
                while (i < cntL)
                {
                    hBmp = new Bitmap(bmpData);
                    hBmp.x = (hBmp.x + (i * bmpData.width));
                    sp.addChild(hBmp);
                    i++;
                };
                i = cntR;
                while (i < cnt)
                {
                    hBmp = new Bitmap(bmpData);
                    hBmp.x = (hBmp.x + (i * bmpData.width));
                    sp.addChild(hBmp);
                    i++;
                };
                return (sp);
            };
            return (sp);
        }


    }
}//package com.game.mainCore.core.utils
