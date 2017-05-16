package com.rpgGame.app.manager
{
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.core.events.WelfareEvent;
    import com.rpgGame.coreData.cfg.WelfareCfgData;
    
    import app.message.WelfareModuleObjProto;
    
    import org.client.mainCore.manager.EventManager;

    public class WelfareManager 
    {

        public static var loginDays:Array = [];


        public static function get loginDay():int
        {
            return Math.min(WelfareCfgData.loginPrizeCount, MainRoleManager.actorInfo.loginDay);
        }

        public static function set loginDay(value:int):void
        {
            MainRoleManager.actorInfo.loginDay = value;
        }

        public static function setData(welfareModuleObj:WelfareModuleObjProto):void
        {
            if (welfareModuleObj.collectedLoginPrizeDay)
            {
                loginDays = welfareModuleObj.collectedLoginPrizeDay;
            }
        }

        public static function isCanGetPrize():Boolean
        {
            for each (var perDay:int in loginDays)
            {
                if (loginDay == perDay)
                {
                    return false;
                }
            }
            return true;
        }

        public static function resetDaily():void
        {
            loginDay++;
            EventManager.dispatchEvent(WelfareEvent.GET_STATUS_CHANGED);
        }
    }
}