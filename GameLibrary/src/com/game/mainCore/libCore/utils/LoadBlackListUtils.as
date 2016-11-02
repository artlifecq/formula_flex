//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.utils
{
    import org.client.mainCore.ds.HashMap;

    public class LoadBlackListUtils 
    {

        private static var _blackListMap:HashMap = new HashMap();


        public static function getIs404Error($url:String, $checkCnt:uint=3):Boolean
        {
            var cnt:uint = _blackListMap.getValue($url);
            return ((cnt > $checkCnt));
        }

        public static function addLoadUrl($url:String):void
        {
            var cnt:uint = _blackListMap.getValue($url);
            cnt++;
            _blackListMap.add($url, cnt);
        }

        public static function removeLoadUrl($url:String):void
        {
            _blackListMap.remove($url);
        }


    }
}//package com.game.mainCore.libCore.utils
