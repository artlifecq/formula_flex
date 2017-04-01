//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.geom.Point;

    public class MathUtil 
    {

        private static const RADTODEG:Number = 57.2957795130823;
        private static const DEGTORAD:Number = 0.0174532925199433;

        public static var getrandmax:int = 2147483647;
        private static var mr:uint = 0;
        private static var cosTable:Array;
        private static var sinTable:Array;
        private static var coefficient1:Number = 0.785398163397448;


        public static function randomRegion(start:Number, end:Number):Number
        {
            return ((start + (Math.random() * (end - start))));
        }

        public static function randomHalve(v:Number):Number
        {
            return ((v - (Math.random() * (v / 2))));
        }

        public static function randomHalfAdd(v:Number):Number
        {
            return ((v + (Math.random() * (v / 2))));
        }

        public static function atan2(y:Number, x:Number):Number
        {
            var r:Number;
            var angle:Number;
            var absY = y;
            var coefficient2:Number = (3 * coefficient1);
            if ((absY < 0))
            {
                absY = -(absY);
            };
            if ((x >= 0))
            {
                r = ((x - absY) / (x + absY));
                angle = (coefficient1 - (coefficient1 * r));
            }
            else
            {
                r = ((x + absY) / (absY - x));
                angle = (coefficient2 - (coefficient1 * r));
            };
            return ((((y)<0) ? -(angle) : angle));
        }

        public static function powerOf2mod(value:uint, divisor:uint):uint
        {
            return ((value & (divisor - 1)));
        }

        public static function isEven(value:Number):Boolean
        {
            return (((value & 1) == 0));
        }

        public static function abs(value:int):int
        {
            return (((value ^ (value >> 31)) - (value >> 31)));
        }

        public static function sinCosGenerator(length:uint, sinAmplitude:Number=1, cosAmplitude:Number=1, frequency:Number=1):void
        {
            var c:int;
            var sin = sinAmplitude;
            var cos = cosAmplitude;
            var frq:Number = ((frequency * 3.14159265358979) / length);
            cosTable = [];
            sinTable = [];
            c = 0;
            while (c < length)
            {
                cos = (cos - (sin * frq));
                sin = (sin + (cos * frq));
                cosTable.push(cos);
                sinTable.push(sin);
                c++;
            };
        }

        public static function getSinTable():Array
        {
            return (sinTable);
        }

        public static function getCosTable():Array
        {
            return (cosTable);
        }

        public static function sqrt(val:Number):Number
        {
            var a:Number;
            var c:Number;
            if (isNaN(val))
            {
                return (NaN);
            };
            var thresh = 0.002;
            var b:Number = (val * 0.25);
            if ((val == 0))
            {
                return (0);
            };
            do 
            {
                c = (val / b);
                b = ((b + c) * 0.5);
                a = (b - c);
                if (a < 0)
                {
                    a = -(a);
                };
            } while (a > thresh);
            return (b);
        }

        public static function miniRand():int
        {
            var result:uint = mr;
            result++;
            result = (result * 75);
            result = (result % 65537);
            result--;
            mr++;
            if ((mr == 65536))
            {
                mr = 0;
            };
            return (result);
        }

        public static function rand(min:Number=NaN, max:Number=NaN, excludes:Array=null):int
        {
            var result:int;
            if (isNaN(min))
            {
                min = 0;
            };
            if (isNaN(max))
            {
                max = getrandmax;
            };
            if ((min === max))
            {
                return (min);
            };
            if (!((excludes == null)))
            {
                excludes.sort(16);
                do 
                {
                    if ((min < max))
                    {
                        result = (min + (Math.random() * max));
                    }
                    else
                    {
                        result = (max + (Math.random() * min));
                    };
                } while (excludes.indexOf(result) >= 0);
                return (result);
            };
            if ((min < max))
            {
                return ((min + (Math.random() * max)));
            };
            return ((max + (Math.random() * min)));
        }

        public static function randFloat(min:Number=NaN, max:Number=NaN):Number
        {
            if (isNaN(min))
            {
                min = 0;
            };
            if (isNaN(max))
            {
                max = getrandmax;
            };
            if ((min === max))
            {
                return (min);
            };
            if (min < max)
            {
                return ((min + (Math.random() * max)));
            };
            return ((max + (Math.random() * min)));
        }

        public static function chanceRoll(chance:uint=50):Boolean
        {
            if ((chance <= 0))
            {
                return (false);
            };
            if (chance >= 100)
            {
                return (true);
            };
            if (((Math.random() * 100) >= chance))
            {
                return (true);
            };
            return (false);
        }

        public static function maxAdd(value:int, amount:int, max:int):int
        {
            value = (value + amount);
            if ((value > max))
            {
                value = max;
            };
            return (value);
        }

        public static function wrapValue(value:int, amount:int, max:int):int
        {
            var diff:int;
            if (((value + amount) > max))
            {
                diff = ((value + amount) - max);
            }
            else
            {
                diff = (value + amount);
            };
            return (diff);
        }

        public static function asDegrees(radians:Number):Number
        {
            return ((radians * 57.2957795130823));
        }

        public static function asRadians(degrees:Number):Number
        {
            return ((degrees * 0.0174532925199433));
        }

        public static function trimAngle(value:Number):Number
        {
            var a = value;
            while (a < 0)
            {
                a = (a + 360);
            };
            while (a > 360)
            {
                a = (a - 360);
            };
            return (a);
        }

        public static function simplifyAngle(angle:Number):Number
        {
            var rotations:Number = Math.floor((angle / 360));
            return ((((angle)>=0) ? (angle - (360 * rotations)) : (angle + (360 * rotations))));
        }

        public static function rotatePoint(point:Point, centerPoint:Point, angle:Number):Point
        {
            var p:Point = point.clone();
            var radians:Number = asRadians(angle);
            var baseX:Number = (p.x - centerPoint.x);
            var baseY:Number = (p.y - centerPoint.y);
            p.x = (((Math.cos(radians) * baseX) - (Math.sin(radians) * baseY)) + centerPoint.x);
            p.y = (((Math.sin(radians) * baseX) + (Math.cos(radians) * baseY)) + centerPoint.y);
            return (p);
        }


    }
}//package org.client.mainCore.utils
