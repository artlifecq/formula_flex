//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.display.DisplayObject;
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import flash.geom.Point;

    public class HitTest 
    {


        public static function complexHitTestObject(target1:DisplayObject, target2:DisplayObject, accuracy:Number=1):Boolean
        {
            return (!((complexIntersectionRectangle(target1, target2, accuracy).width == 0)));
        }

        public static function intersectionRectangle(target1:DisplayObject, target2:DisplayObject):Rectangle
        {
            if (((((!(target1.root)) || (!(target2.root)))) || (!(target1.hitTestObject(target2)))))
            {
                return (new Rectangle());
            };
            var bounds1:Rectangle = target1.getBounds(target1.root);
            var bounds2:Rectangle = target2.getBounds(target2.root);
            var intersection:Rectangle = new Rectangle();
            intersection.x = Math.max(bounds1.x, bounds2.x);
            intersection.y = Math.max(bounds1.y, bounds2.y);
            intersection.width = Math.min(((bounds1.x + bounds1.width) - intersection.x), ((bounds2.x + bounds2.width) - intersection.x));
            intersection.height = Math.min(((bounds1.y + bounds1.height) - intersection.y), ((bounds2.y + bounds2.height) - intersection.y));
            return (intersection);
        }

        public static function complexIntersectionRectangle(target1:DisplayObject, target2:DisplayObject, accuracy:Number=1):Rectangle
        {
            if (accuracy <= 0)
            {
                throw (new Error("ArgumentError: Error #5001: Invalid value for accuracy", 5001));
            };
            if (!target1.hitTestObject(target2))
            {
                return (new Rectangle());
            };
            var hitRectangle:Rectangle = intersectionRectangle(target1, target2);
            if (((((hitRectangle.width * accuracy) < 1)) || (((hitRectangle.height * accuracy) < 1))))
            {
                return (new Rectangle());
            };
            var bitmapData:BitmapData = new BitmapData((hitRectangle.width * accuracy), (hitRectangle.height * accuracy), false, 0);
            bitmapData.draw(target1, HitTest.getDrawMatrix(target1, hitRectangle, accuracy), new ColorTransform(1, 1, 1, 1, 0xFF, -255, -255, 0xFF));
            bitmapData.draw(target2, HitTest.getDrawMatrix(target2, hitRectangle, accuracy), new ColorTransform(1, 1, 1, 1, 0xFF, 0xFF, 0xFF, 0xFF), "difference");
            var intersection:Rectangle = bitmapData.getColorBoundsRect(0xFFFFFFFF, 0xFF00FFFF);
            bitmapData.dispose();
            if (!((accuracy == 1)))
            {
                intersection.x = (intersection.x / accuracy);
                intersection.y = (intersection.y / accuracy);
                intersection.width = (intersection.width / accuracy);
                intersection.height = (intersection.height / accuracy);
            };
            intersection.x = (intersection.x + hitRectangle.x);
            intersection.y = (intersection.y + hitRectangle.y);
            return (intersection);
        }

        protected static function getDrawMatrix(target:DisplayObject, hitRectangle:Rectangle, accuracy:Number):Matrix
        {
            var localToGlobal = null;
            var matrix = null;
            var rootConcatenatedMatrix:Matrix = target.root.transform.concatenatedMatrix;
            localToGlobal = target.localToGlobal(new Point());
            matrix = target.transform.concatenatedMatrix;
            matrix.tx = (localToGlobal.x - hitRectangle.x);
            matrix.ty = (localToGlobal.y - hitRectangle.y);
            matrix.a = (matrix.a / rootConcatenatedMatrix.a);
            matrix.d = (matrix.d / rootConcatenatedMatrix.d);
            if (accuracy != 1)
            {
                matrix.scale(accuracy, accuracy);
            };
            return (matrix);
        }


    }
}//package org.client.mainCore.utils
