package org.client.mainCore.core
{
    import flash.geom.Rectangle;

    public class Bounds 
    {

        private static const max:Function = Math.max;
        private static const min:Function = Math.min;

        public var left:Number;
        public var right:Number;
        public var top:Number;
        public var bottom:Number;

        public function Bounds(left:Number=0, right:Number=0, top:Number=0, bottom:Number=0)
        {
            this.left = left;
            this.right = right;
            this.top = top;
            this.bottom = bottom;
        }

        public static function toRectangle(b:Bounds):Rectangle
        {
            return new Rectangle(b.left, b.top, b.right - b.left, b.bottom - b.top);
        }

        public static function fromRectangle(rect:Rectangle):Bounds
        {
            return new Bounds(rect.left, rect.right, rect.top, rect.bottom);
        }


        public function isLine():Boolean
        {
            return right == left || bottom == top;
        }

        public function isEmpty():Boolean
        {
            return right <= left || bottom <= top;
        }

        public function isPoint():Boolean
        {
            return right == left && bottom == top;
        }

        public function areaSize():Number
        {
            return (right - left + 1) * (bottom - top + 1);
        }

        public function contains(b:Bounds):Boolean
        {
            return b.left >= left && b.right <= right && b.top >= top && b.bottom <= bottom;
        }

        public function equals(b:Bounds):Boolean
        {
            return b.left == left && b.right == right && b.top == top && b.bottom == bottom;
        }

        public function intersects(b:Bounds):Boolean
        {
            var i_left:Number = max(left, b.left);
            var i_right:Number = min(right, b.right);
            var i_top:Number = max(top, b.top);
            var i_bottom:Number = min(bottom, b.bottom);
            if (i_left <= i_right && i_top <= i_bottom)
            {
                return true;
            }
            return false;
        }

        public function intersection(b:Bounds):Bounds
        {
            var i_left:Number = max(left, b.left);
            var i_right:Number = min(right, b.right);
            var i_top:Number = max(top, b.top);
            var i_bottom:Number = min(bottom, b.bottom);
            if (i_left <= i_right && i_top <= i_bottom)
            {
                return new Bounds(i_left, i_right, i_top, i_bottom);
            }
            return null;
        }

        public function union(b:Bounds):Bounds
        {
            var i_left:Number = min(left, b.left);
            var i_right:Number = max(right, b.right);
            var i_top:Number = min(top, b.top);
            var i_bottom:Number = max(bottom, b.bottom);
            return new Bounds(i_left, i_right, i_top, i_bottom);
        }

        public function extend(b:Bounds):void
        {
            left = min(left, b.left);
            right = max(right, b.right);
            top = min(top, b.top);
            bottom = max(bottom, b.bottom);
        }
    }
}