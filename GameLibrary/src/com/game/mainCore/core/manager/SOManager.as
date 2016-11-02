//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.manager
{
    import org.client.mainCore.utils.SOFlushPool;
    import flash.net.SharedObject;

    public class SOManager 
    {

        public static const INFO:String = "info";
        public static const LOGIN:String = "login";
        public static const RELATION:String = "relation";
        public static const DAILY_REAP:String = "dailyReap";
        public static const DAILY_POINT:String = "dailyPoint";

        private static var _flushPool:SOFlushPool;


        public static function getCommonSO(name:String):SharedObject
        {
            return (null);
        }

        public static function getUserSO(name:String):SharedObject
        {
            return (null);
        }

        private static function getFlushPool():SOFlushPool
        {
            if ((_flushPool == null))
            {
                _flushPool = new SOFlushPool();
            };
            return (_flushPool);
        }

        public static function flush(shareObject:SharedObject):Boolean
        {
            if (!((shareObject == null)))
            {
                getFlushPool().addFlush(shareObject);
                return (true);
            };
            return (false);
        }


    }
}//package com.game.mainCore.core.manager
