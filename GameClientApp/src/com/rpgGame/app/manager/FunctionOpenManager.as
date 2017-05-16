package com.rpgGame.app.manager
{
    import com.rpgGame.app.manager.chat.NoticeManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.coreData.cfg.ClientFunctionOpenCfgData;
    import com.rpgGame.coreData.cfg.LevelCfgData;
    import com.rpgGame.coreData.clientConfig.ClientFunctionOpen;
    
    import org.client.mainCore.ds.HashMap;

    public class FunctionOpenManager 
    {

        public static var funcBits:Object = null;
        private static var _statusMap:HashMap = new HashMap();


        public static function functionIsOpen(functionType:int, isShowHint:Boolean=false):Boolean
        {
            var _local3:int;
            var _local4:Boolean;
            _local4 = checkOpenInFunctionBits(functionType);
            _local4 = _local4 || _statusMap.getValue(functionType);
            if (!_local4 && isShowHint)
            {
                _local3 = LevelCfgData.functionOpenHM.getValue(functionType);
                if (_local3 > 0)
                {
                    NoticeManager.showHint("FUNCTION_OPEN_HINT", [_local3]);
                }
            }
            return _local4;
        }

        public static function getActivityOpenLevel(functionType:int):int
        {
            return LevelCfgData.functionOpenHM.getValue(functionType);
        }

        public static function checkOpenInFunctionBits(functionType:int):Boolean
        {
            var _local2:int = functionType / 32;
            if (_local2 + 1 > funcBits.funcs.length)
            {
                return false;
            }
            return ((funcBits.funcs[_local2] >> (functionType % 32)) & 1) != 0;
        }

        public static function setFunctionOpen(functionType:int):void
        {
            _statusMap.add(functionType, true);
        }

        public static function clientFunctionIsOpen(funcKey:String):Boolean
        {
            var level:int = MainRoleManager.actorInfo.totalStat.level;
            var item:ClientFunctionOpen = ClientFunctionOpenCfgData.getDataByKey(funcKey);
            if (item)
            {
                return level >= item.openLevel;
            }
            return true;
        }

        public static function getClientFunctionOpenLevel(funcKey:String):int
        {
            var level:int = MainRoleManager.actorInfo.totalStat.level;
            var item:ClientFunctionOpen = ClientFunctionOpenCfgData.getDataByKey(funcKey);
            if (item)
            {
                return item.openLevel;
            }
            return 0;
        }
    }
}