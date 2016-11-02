//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.cache
{
    import com.game.mainCore.libCore.vo.LNode;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.display.Loader;
    import com.game.mainCore.libCore.utils.Fun;
    import flash.display.Bitmap;
    import flash.display.*;

    public class CacheUnit extends LNode 
    {

        public function CacheUnit($data:Object, $id:String)
        {
            super($data, $id);
        }

        public function dispose():void
        {
            if ((data is BitmapData))
            {
                (data as BitmapData).dispose();
            }
            else
            {
                if ((data is DisplayObject))
                {
                    if (((data.parent) && (!((data.parent is Loader)))))
                    {
                        data.parent.removeChild(data);
                    };
                    Fun.clearChildren((data as DisplayObject), true);
                    if ((data is Bitmap))
                    {
                        (data as Bitmap).bitmapData.dispose();
                    };
                };
            };
            data = null;
            pre = null;
            next = null;
        }


    }
}//package com.game.mainCore.libCore.cache
