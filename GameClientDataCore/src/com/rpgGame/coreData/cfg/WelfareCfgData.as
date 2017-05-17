package com.rpgGame.coreData.cfg
{
    import app.message.WelfareConfig;

    public class WelfareCfgData 
    {
        public static var firstRechargeCount:int;
        public static var loginPrizeCount:int;

        public static function setConfig(cfg:WelfareConfig):void
        {
            if (!cfg)
            {
                return;
            }
            firstRechargeCount = cfg.firstRechargeCount;
            loginPrizeCount = cfg.loginPrizeCount;
        }
    }
}