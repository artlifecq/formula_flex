package com.rpgGame.coreData.cfg
{
    import org.client.mainCore.ds.HashMap;

    public class LevelCfgData 
    {
        public static var functionOpenHM:HashMap;
        public static var heroMaxLevel:int;
        public static var newHeroProtectLevel:int;
        public static var mountSlotHM:HashMap;

//        public static function setConfig(cfg:LevelConfig):void
//        {
//            var _local3:int;
//            var _local2 = null;
//            functionOpenHM = new HashMap();
//            mountSlotHM = new HashMap();
//            _local3 = 0;
//            while (_local3 < cfg.data.length)
//            {
//                _local2 = cfg.data[_local3];
//                mountSlotHM.add((_local3 + 1), _local2.mountSlotCount);
//                if (((_local2.functions) && ((_local2.functions.length > 0))))
//                {
//                    for each (var _local4:int in _local2.functions)
//                    {
//                        functionOpenHM.add(_local4, (_local3 + 1));
//                    }
//                }
//                _local3++;
//            }
//            heroMaxLevel = cfg.heroMaxLevel;
//            newHeroProtectLevel = cfg.newHeroProtectLevel;
//        }
    }
}