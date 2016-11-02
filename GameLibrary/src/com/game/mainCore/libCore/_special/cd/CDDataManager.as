//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore._special.cd
{
    import org.client.mainCore.ds.HashMap;
    import org.client.mainCore.manager.EventManager;

    public class CDDataManager 
    {

        private static var _cdCallBackMap:HashMap = new HashMap();
        private static var _map:HashMap = new HashMap();


        public static function getCdLostTm($cdType:*):uint
        {
            var cdData:CDData = _map.getValue($cdType);
            if (cdData)
            {
                return (cdData.lostTm);
            };
            return (0);
        }

        public static function playCD($cdType:*, $cd:Number, $startTm:Number=0, $isReverse:Boolean=false):void
        {
            var cdData:CDData = _map.getValue($cdType);
            cdData = ((cdData) || (new CDData($cdType)));
            cdData.startCallBack = cdStart;
            cdData.updateCallBack = cdUpdata;
            cdData.completeCallBack = cdComplete;
            cdData.play($cd, $startTm);
            _map.add($cdType, cdData);
        }

        public static function clearCD($cdType:*, $complete:Boolean=true):void
        {
            var cdData:CDData = _map.getValue($cdType);
            if (cdData)
            {
                cdData.stop($complete);
                EventManager.dispatchEvent("CDDataEvent.clear", cdData);
            };
            _map.remove($cdType);
        }

        private static function cdStart($cdData:CDData):void
        {
            EventManager.dispatchEvent("CDDataEvent.start", $cdData);
        }

        private static function cdUpdata($cdData:CDData):void
        {
            EventManager.dispatchEvent("CDDataEvent.update", $cdData);
        }

        private static function cdComplete($cdData:CDData):void
        {
            EventManager.dispatchEvent("CDDataEvent.complete", $cdData);
            _map.remove($cdData.id);
        }


    }
}//package com.game.mainCore.libCore._special.cd
