package com.game.mainCore.core.info.player
{
    import org.client.mainCore.ds.HashMap;
    import __AS3__.vec.Vector;

    public class SpngStatusListInfo 
    {

        private static var _map:HashMap = new HashMap();


        public static function addStatusAngleInfo(status:String, angle:uint, info:SpngInfo):void
        {
            var key:String = status + "_" + angle;
            _map.add(key, info);
        }

        public static function getStatusInfoList(status:String):Vector.<SpngInfo>
        {
            return null;
        }

        public static function getStatusAngleInfoList(status:String, angle:uint):SpngInfo
        {
            var key:String = status + "_" + angle;
            return _map.getValue(key);
        }

        public static function clear(url:String):void
        {
        }

        public static function destroy():void
        {
        }
    }
}