//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.geom.Point;

    public class GeomUtil 
    {

        public static const R_T_D:Number = 57.2957795130823;
        public static const D_T_R:Number = 0.0174532925199433;


        public static function radiansToDegrees(radians:Number):Number
        {
            return ((radians * 57.2957795130823));
        }

        public static function degreesToRadians(degrees:Number):Number
        {
            return ((degrees * 0.0174532925199433));
        }

        public static function angleSpeed(p1:Point, p2:Point):Point
        {
            var radians:Number = Math.atan2((p1.y - p2.y), (p1.x - p2.x));
            return (new Point(Math.cos(radians), Math.sin(radians)));
        }

        public static function pointAngle(p1:Point, p2:Point):Number
        {
            return ((Math.atan2((p1.y - p2.y), (p1.x - p2.x)) * 57.2957795130823));
        }

        public static function pointRadians(p1:Point, p2:Point):Number
        {
            return (Math.atan2((p1.y - p2.y), (p1.x - p2.x)));
        }

        public static function angleToSpeed(angle:Number):Point
        {
            var radians:Number = (angle * 0.0174532925199433);
            return (new Point(Math.cos(radians), Math.sin(radians)));
        }

        public static function radiansToSpeed(radians:Number):Point
        {
            return (new Point(Math.cos(radians), Math.sin(radians)));
        }

        public static function getCirclePoint(p:Point, angle:Number, length:Number):Point
        {
            var radians:Number = (angle * 0.0174532925199433);
            return (p.add(new Point((Math.cos(radians) * length), (Math.sin(radians) * length))));
        }


    }
}//package org.client.mainCore.utils
