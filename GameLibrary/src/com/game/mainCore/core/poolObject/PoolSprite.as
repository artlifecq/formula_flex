//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.poolObject
{
    import flash.display.Sprite;
    import com.game.mainCore.libCore.pool.IPoolClass;
    import com.game.mainCore.libCore.pool.Pool;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;

    public class PoolSprite extends Sprite implements IPoolClass 
    {

        private static var _pool:Pool = new Pool("PoolSprite", 0x1000);


        public static function create():PoolSprite
        {
            return ((_pool.createObj(PoolSprite) as PoolSprite));
        }

        public static function recycle($sp:PoolSprite):void
        {
            _pool.disposeObj($sp);
        }

        public static function get cnt():uint
        {
            return (_pool.length);
        }


        public function dispose():void
        {
            while (this.numChildren)
            {
                this.removeChildAt(0);
            };
            var _local1:int;
            this.y = _local1;
            this.x = _local1;
            this.alpha = 1;
            this.filters = null;
            _local1 = 1;
            this.scaleY = _local1;
            this.scaleX = _local1;
            this.blendMode = "normal";
            this.rotation = 0;
            this.visible = true;
            this.mask = null;
            this.name = "";
            if (this.scrollRect)
            {
                this.scrollRect.setEmpty();
            };
            if (!((this.transform.colorTransform == null)))
            {
                this.transform.colorTransform = new ColorTransform();
            };
            if (this.scale9Grid)
            {
                this.scale9Grid.setEmpty();
            };
            if (!((this.transform.matrix == null)))
            {
                this.transform.matrix = new Matrix();
            };
            if (this.parent)
            {
                this.parent.removeChild(this);
            };
            this.graphics.clear();
        }

        public function reSet($parameters:Array):void
        {
        }


    }
}//package com.game.mainCore.core.poolObject
