//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.utils
{
    import org.client.mainCore.utils.GeomUtil;
    import flash.geom.Point;

    public class Direction 
    {

        public static const RIGHT:String = "right";
        public static const LEFT:String = "left";
        public static const UP:String = "up";
        public static const DOWN:String = "down";
        public static const LEFT_UP:String = "leftup";
        public static const LEFT_DOWN:String = "leftdown";
        public static const RIGHT_UP:String = "rightup";
        public static const RIGHT_DOWN:String = "rightdown";
        public static const strList:Array = ["right", "left", "up", "down", "leftup", "leftdown", "rightup", "rightdown"];
        public static const angleList:Array = [0, 180, 270, 90, 225, 135, 315, 45];


        public static function indexToStr(index:int):String
        {
            return (strList[index]);
        }

        public static function indexToStr2(index:int):String
        {
            switch (index)
            {
                case 0:
                case 2:
                case 6:
                case 7:
                    return ("right");
                case 1:
                case 3:
                case 4:
                case 5:
                    return ("left");
                default:
                    return ("");
            };
        }

        public static function strToIndex(str:String):int
        {
            return (strList.indexOf(str));
        }

        public static function strToIndex2(str:String):int
        {
            switch (str)
            {
                case "right":
                case "rightup":
                case "rightdown":
                case "up":
                    return (0);
                case "left":
                case "leftup":
                case "leftdown":
                case "down":
                    return (1);
            };
            return (0);
        }

        public static function strToAngle2(str:String):Number
        {
            return (indexToAngle(strToIndex2(str)));
        }

        public static function getIndex(p1:Point, p2:Point):int
        {
            return (angleToIndex(GeomUtil.pointAngle(p1, p2)));
        }

        public static function getStr(p1:Point, p2:Point):String
        {
            return (indexToStr(getIndex(p1, p2)));
        }

        public static function getStr2(p1:Point, p2:Point):String
        {
            return (indexToStr2(getIndex(p1, p2)));
        }

        public static function indexToAngle(index:int):Number
        {
            return (angleList[index]);
        }

        public static function angleToIndex(angle:Number):int
        {
            if ((((angle < 22.5)) && ((angle > 337.5))))
            {
                return (0);
            };
            if ((((angle >= 157.5)) && ((angle < 202.5))))
            {
                return (1);
            };
            if ((((angle >= 247.5)) && ((angle < 292.5))))
            {
                return (2);
            };
            if ((((angle >= 67.5)) && ((angle < 112.5))))
            {
                return (3);
            };
            if ((((angle >= 202.5)) && ((angle < 247.5))))
            {
                return (4);
            };
            if ((((angle >= 112.5)) && ((angle < 157.5))))
            {
                return (5);
            };
            if ((((angle >= 292.5)) && ((angle < 337.5))))
            {
                return (6);
            };
            if ((((angle >= 22.5)) && ((angle < 67.5))))
            {
                return (7);
            };
            return (0);
        }

        public static function angleToStr(angle:Number):String
        {
            return (indexToStr(angleToIndex(angle)));
        }

        public static function angleToStr2(angle:Number):String
        {
            return (indexToStr2(angleToIndex(angle)));
        }


    }
}//package com.game.mainCore.core.utils
