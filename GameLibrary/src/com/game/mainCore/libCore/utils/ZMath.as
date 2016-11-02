//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.utils
{
    import __AS3__.vec.Vector;
    import flash.geom.Point;

    public class ZMath 
    {

        private static var abs:Function = Math.abs;
        private static var sin:Function = Math.sin;
        private static var cos:Function = Math.cos;
        private static var sqrt:Function = Math.sqrt;
        private static var PI:Number = 3.14159265358979;
        public static var toDeg:Number = (180 / PI);
        public static var toRad:Number = (PI / 180);
        public static var mathSinArray:Vector.<Number> = new Vector.<Number>();
        public static var mathCosArray:Vector.<Number> = new Vector.<Number>();

        {
            setupSinCos();
        }


        public static function randomInt($min:int, $max:int):int
        {
            return (Math.round(($min + (Math.random() * ($max - $min)))));
        }

        public static function getDisSquare($x1:Number, $y1:Number, $x2:Number, $y2:Number):Number
        {
            return (((($x1 - $x2) * ($x1 - $x2)) + (($y1 - $y2) * ($y1 - $y2))));
        }

        public static function getRotPoint($p1:Point, $p0:Point, $angle:Number):Point
        {
            $angle = ($angle * ZMath.toRad);
            var p1:Point = new Point();
            p1.x = (((Math.cos($angle) * ($p1.x - $p0.x)) - (Math.sin($angle) * ($p1.y - $p0.y))) + $p0.x);
            p1.y = (((Math.cos($angle) * ($p1.y - $p0.y)) + (Math.sin($angle) * ($p1.x - $p0.x))) + $p0.y);
            return (p1);
        }

        public static function getTowPointsAngle($p0:Point, $p1:Point):Number
        {
            var angle:Number = Math.atan2(($p1.y - $p0.y), ($p1.x - $p0.x));
            if (angle < 0)
            {
                angle = (angle + (2 * 3.14159265358979));
            };
            return (((angle * 180) / 3.14159265358979));
        }

        public static function getNearAngel($angle:Number, $average:int=8):int
        {
            $angle = ((($angle % 360) + 360) % 360);
            var an:Number = (360 / $average);
            var i:int = Math.floor(($angle / an));
            var min:Number = (i * an);
            var max:Number = ((i + 1) * an);
            return (((((($angle - min))<=(max - $angle)) ? min : max) % 360));
        }

        public static function getAnglePos(startPos:Point, angle:Number, dis:Number):Point
        {
            var pos:Point = new Point();
            var radian:Number = ((angle / 180) * 3.14159265358979);
            pos.x = (startPos.x + (dis * Math.cos(radian)));
            pos.y = (startPos.y + (dis * Math.sin(radian)));
            return (pos);
        }

        public static function get2PosDisPos(startPos:Point, endPos:Point, dis:Number):Point
        {
            var angle:Number = ZMath.getTowPointsAngle(startPos, endPos);
            return (getAnglePos(startPos, angle, dis));
        }

        public static function getSin($angle:Number):Number
        {
            $angle = ((($angle % 360) + 360) % 360);
            var index:uint = ($angle * 16);
            return (mathSinArray[index]);
        }

        public static function getCos($angle:Number):Number
        {
            $angle = ((($angle % 360) + 360) % 360);
            var index:uint = ($angle * 16);
            return (mathCosArray[index]);
        }

        private static function setupSinCos():void
        {
            var i:int;
            var angle:Number;
            var index:int;
            var length = 5760;
            i = 0;
            while (i < length)
            {
                angle = (((3.14159265358979 * 2) * i) / length);
                mathSinArray.push(Math.sin(angle));
                mathCosArray.push(Math.cos(angle));
                i++;
            };
        }


    }
}//package com.game.mainCore.libCore.utils
