package com.rpgGame.coreData.cfg
{
    import org.client.mainCore.ds.HashMap;
    import com.rpgGame.coreData.clientConfig.ClientFunctionOpen;
    import flash.utils.ByteArray;

    public class ClientFunctionOpenCfgData 
    {

        private static var _map:HashMap = new HashMap();
        private static var _mapByKey:HashMap = new HashMap();


        public static function setup(data:ByteArray):void
        {
            var items:Array = data.readObject();
            for each (var item:ClientFunctionOpen in items)
            {
                _map.add(item.id, item);
                if (item.key)
                {
                    _mapByKey.add(item.key, item);
                }
            }
        }

        public static function getData(id:uint):ClientFunctionOpen
        {
            return _map.getValue(id);
        }

        public static function getDataByKey(funcKey:String):ClientFunctionOpen
        {
            return _mapByKey.getValue(funcKey);
        }
    }
}